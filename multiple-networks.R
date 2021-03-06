################################################################################
##### SCRIPT FOR ANALYZING MULTIPLE NETWORKS AT THE SAME TIME
################################################################################


##### Ecological Synthesis Lab (SintECO)
##### https://marcomellolab.wordpress.com
##### Author: Marco Mello
##### E-mail: marmello@usp.br
##### See README for further info:
##### https://github.com/marmello77/multiple-networks/blob/main/README.md


################################################################################
##### Summary
################################################################################


#1. Get ready
#2. Read the matrices to be analyzed
#3. Calculate a metric for the original networks
#4. Create randomized version of the original network
#5. Calculate the same metric for the randomized networks
#6. Pool the observed and randomized scores
#7. Synthesize the results


################################################################################
##### 1. Get ready
################################################################################


#Set the working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Remove all previous objects 
rm(list= ls())

#Load the required packages 
library(bipartite)
library(tidyverse)


################################################################################
##### 2. Read the matrices to be analyzed
################################################################################


#Create a list of the files stored in your "data" directory. These files should
#be all in TXT format. They should be formatted as incidence matrices (AxB),
#which have one class of nodes in the rows, and another class of nodes in the
#columns. See the examples provided to organize your data properly.
files <- list.files("data/", pattern = "*.txt")

#Check the list
files

#Read the files into R and convert them to matrix class
network_list <- files %>%
    map(~ read.delim(file.path("data/", .), row.names = 1)) %>%
    lapply(as.matrix)

#Check the data
class(network_list)
class(network_list[[1]])
head(network_list)


################################################################################
##### 3. Calculate a metric for the original networks
################################################################################


#Select the name of a network-level metric from the package bipartite
metric <- "NODF"

#Calculate the selected metric for all matrices in the list
observed <- lapply(network_list, 
                   bipartite::networklevel,
                   index = metric)

#Check the observed scores
class(observed)
head(observed)

#Create an informative data frame with the observed scores of the metric
observed_df <- observed %>% 
    unlist() %>%
    as.data.frame() %>%
    `colnames<-`("observed") %>%
    mutate(network = paste(files)) %>%
    select(network, observed)

#Check the observed scores
class(observed_df)
head(observed_df)


################################################################################
##### 4. Create randomized versions of the original network
################################################################################


#Set the number of permutations to be used in all analyses. Attention:
#permutation analysis can be quite resource-consuming. Therefore, pay attention
#to your computer's power and memory, before setting this number. Just to
#experiment with the code, 10 permutations are ok. But a real analysis for a
#paper requires at least 1,000 permutations.
permutations <- 10

#Create randomized versions of the original networks
nulls <- lapply(network_list, 
                bipartite::nullmodel, 
                N = permutations, 
                method = "vaznull") #Select a null model

#Check the randomized matrices
class(nulls)
head(nulls)


################################################################################
##### 5. Calculate the same metric for all randomized networks
################################################################################


#Calculate the same network-level metric for all randomized matrices
randomized <- rapply(nulls,
                     bipartite::networklevel,
                     index = metric,
                     how = "list")

#Check the randomized scores
class(randomized)
head(randomized)

#Create an informative data frame with the randomized scores of the metric
randomized_df <- randomized %>%
    unlist() %>%
    as.data.frame() %>%
    `colnames<-`("randomized") %>%
    mutate(network = paste(sort(rep(files, permutations)))) %>%
    mutate(randomization = paste(rep(paste(
        rep("randomization", permutations),
        seq(1:permutations), sep = "_"),
        length(network_list))))
    
#Check the data frame with randomized scores
head(randomized_df)


################################################################################
##### 6. Pool the observed and randomized scores
################################################################################


#Merge the data frames with observed and randomized scores
results <- merge(randomized_df, observed_df, by = "network")

#Check the final data frame
class(results)
head(results)


################################################################################
##### 7. Synthesize the results
################################################################################


#Estimate the p-values and z-scores of the metric by simple count
p_values <- results %>%
    group_by(network) %>%
    summarize(p_sup = mean(observed >= randomized),
              p_inf = mean(observed <= randomized),
              rand_mean = mean(randomized),
              rand_sd = sd(randomized),
              obs = mean(observed)) %>%
    mutate(z_sco = (obs-rand_mean)/rand_sd)

#Check the p-values and z-scores
p_values

#Export the final results as a TXT file
write_delim(p_values, "results/p_values.txt")

#Now plot the observed score against the distribution of randomized scores for
#each network
p1 <- ggplot(results) +
    geom_density(aes(randomized)) + #distribution of randomized scores
    facet_grid(network~.) + #a panel showing each network
    geom_vline(aes(xintercept = observed), col = "red") #observed score

#Visualize the plot
p1

#Export the plot as a PNG file
png("figures/distributions.png", 
    res = 300, units = "px", 
    height = 3000, width = 3000)
p1
dev.off()


################################### END ########################################

