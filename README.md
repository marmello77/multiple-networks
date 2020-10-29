# multiple-networks

An R script to help analyze the structure of multiple networks at the same time.

[Ecological Synthesis Lab](https://marcomellolab.wordpress.com) (SintECO).

Author: Marco Mello.

E-mail: marmello@usp.br.

First published on October 29th, 2020 (English version).

Run in R version 4.0.2 (2020-06-22) -- "Taking Off Again".

Disclaimer: You may use this software freely for any purposes at your own risk. We assume no responsibility or liability for the use of this software, convey no license or title under any patent, copyright, or mask work right to the product. We reserve the right to make changes in the software without notification. We also make no representation or warranty that such application will be suitable for the specified use without further testing or modification. If this software helps you produce any academic work (paper, book, chapter, dissertation, report, talk, lecture or similar), please acknowledge the authors and cite the source, using this repo's DOI or URL.


## Functionality and origin

You can use this script to automatize the topological analysis of multiple networks. It saves a lot of time and effort, compared to analyzing all networks one at a time. This script was written to be used in an ongoing study about the topology of interaction networks. See details about our research programm [here](https://marcomellolab.wordpress.com/home/projects/).


## Instructions

Follow the instructions provided in the script "multiple-networks.R".


## List of folders and files

1. data (folder) -> contains the example networks used to test this script.

    a. bezerra2009.txt -> a network of pollination interactions between oil-collecting bees and oil flowers.

    b. genrich2017.txt -> a network of seed dispersal interactions between rodents, marsupials, and plants.

    c. gorchov1995.txt -> a network of frugivory interactions between bats, birds, and plants.

    d. queiroz2020.txt -> a network of pollination interactions between bats, hawkmoths, and plants.

    e. sarmento2014.txt -> a network of frugivory interactions between bats, birds, and plants.


2. figures (folder)

    a. distributions.png -> plot contrasting the observed score of the chosen network-level metric and the distribution of randomized scores for each network.


3. results (folder)

    a. p_values.txt -> p-values and z-scores of the chosen network-level metric estimated for each network.
    

4. multiple-networks.R -> R script to run the analysis of multiple networks at the same time.


5. multiple-networks.Rproj -> R project file.


## Original sources

The codes used in this repo have borrowed solutions from another repo developed by our lab:

* [network-significance](https://github.com/marmello77/network-significance)


## Data sources

* bezerra2009 -> Bezerra, E. L. S., Machado, I. C., & Mello, M. A. R. (2009). [Pollination networks of oil-flowers: a tiny world within the smallest of all worlds](https://doi.org/10.1111/j.1365-2656.2009.01567.x). Journal of Animal Ecology, 78(5), 1096–1101. 

* genrich2017 -> Genrich, C. M., Mello, M. A. R., Silveira, F. A. O., Bronstein, J. L., & Paglia, A. P. (2017). [Duality of interaction outcomes in a plant-frugivore multilayer network](https://doi.org/10.1111/oik.03825). Oikos, 126(3), 361–368. doi: 10.1111/oik.03825

* gorchov1995.txt -> Gorchov, D. L., Cornejo, F., Ascorra, C. F., & Jaramillo, M. (1995). [Dietary overlap between frugivorous birds and bats in the Peruvian Amazon](http://dx.doi.org/10.2307/3545653). Oikos, 74, 235–250. 

* queiroz2020 -> Queiroz, J. A., Diniz, U. M., Vázquez, D. P., Quirino, Z. M., Santos, F. A. R., Mello, M. A. R., & Machado, I. C. (2020). Bats and hawkmoths form mixed modules with flowering plants in a nocturnal interaction network. Biotropica, *accepted*. See also this [repo](https://github.com/marmello77/queiroz-et-al-2020).

* sarmento2014 -> Sarmento, R., Alves-Costa, C. P., Ayub, A., & Mello, M. A. R. (2014). [Partitioning of seed dispersal services between birds and bats in a fragment of the Brazilian Atlantic Forest](https://doi.org/10.1590/S1984-46702014000300006). Zoologia, 31(3), 245–255.


## Feedback

If you have any questions, corrections, or suggestions, please feel free to open and [issue](https://github.com/marmello77/multiple-networks/issues) or make a [pull request](https://github.com/marmello77/multiple-networks/pulls).


## Acknowledgments

We thank our labmates and our sponsors, especially the Alexander von Humboldt-Stiftung, CNPq, CAPES, and FAPESP, who gave us grants, fellowships, and scholarships. Pedro Jordano and Carsten Dormann helped us take our first steps in analyzing and drawing networks in R. Last, but not least, we thank the [Stack Overflow Community](https://stackoverflow.com), where we solve most of our coding dilemmas. Dilemmas related to making our code faster, shorter, and more generalized were solved [here](https://stackoverflow.com/questions/64555275/how-to-create-a-vector-with-sequential-filenames-and-numbers-in-r) and [here](https://stackoverflow.com/questions/64571948/a-general-solution-to-analyze-and-plot-two-data-frames-with-varying-lengths).


## Suggested readings

If you want to understand the theory behind this script, read the following works:

* Barabasi, A.L. (2016) [Network Science](http://barabasi.com/networksciencebook/), 1st ed. Cambridge University Press, Cambridge.

* Bascompte, J. & Jordano, P. (2014) [Mutualistic Networks](https://amzn.to/2FLwhto), 1st ed. Princeton University Press, Princeton.

* Dormann, C. F., Gruber, B., & Fründ, J. (2008). [Introducing the bipartite package: analyzing ecological networks](https://www.uni-goettingen.de/de/document/download/96729eb9d30a6f2dc4403df15854305c.pdf/Rnews2008,8_8-11_open.pdf). R News, 8(2), 8–11.

* Manly, B. F. J. (2007). [Randomization, bootstrap and Monte Carlo methods in biology](https://amzn.to/3ksSGv3). (3rd ed.). Boca Raton: Chapman & Hall/CRC.

* Mello MAR, Muylaert RL, Pinheiro RBP & Félix GMF. 2016. [Guia para análise de redes ecológicas](https://marcomellolab.wordpress.com/software/). Edição dos autores, Belo Horizonte. 112 p. ISBN-13: 978-85-921757-0-2.
