# R Violin Plots — Depth Distributions Across Trench Profiles

R scripts that draw violin plots to compare the statistical distribution of a
variable across categories. A violin plot is a mirrored kernel-density estimate
(a smoothed probability density) hybridised with a box plot: the width of each
"violin" at a given value is proportional to the estimated density there, while
overlaid quantile lines or an inner box summarise the median and interquartile
range. The primary script analyses bathymetric depth distributions along the
profiles of the Mariana Trench; a second script demonstrates the same idiom on
an agricultural production index.

## Related publication

The Mariana Trench script (violin_plot_ggplot2_mariana_trench.R) produced
figures in:

Lemenkova, P. Factor Analysis by R Programming to Assess Variability Among
Environmental Determinants of the Mariana Trench. Turkish Journal of Maritime
and Marine Sciences 2018, 4(2), 146-155.

- arXiv:      https://arxiv.org/abs/1812.00989v1 (physics.geo-ph)
- arXiv DOI:  https://doi.org/10.48550/arXiv.1812.00989
- EarthArXiv: https://eartharxiv.org/es9ka/
- HAL:        https://hal.archives-ouvertes.fr/hal-01948977
- Zenodo:     https://zenodo.org/record/2094101
- SSRN:       https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3296819
- figshare:   https://doi.org/10.6084/m9.figshare.7358207
- Journal:    http://edergi.odu.edu.tr/ojs/index.php/JMMS/article/view/426 (ISSN 2564-7016)

## Scripts

### violin_plot_ggplot2_mariana_trench.R
- Reads a table of per-profile depths (Depths.csv) and removes incomplete
  records (na.omit with a per-row missing-value check).
- Reshapes the data from wide to long with data.table::melt (setDT), collapsing
  the profile columns (matched by the pattern "^profile") into a single depth
  variable keyed by profile.
- Draws the depth distribution two ways: (1) a compact violin via
  violinmplot::violinmplot (a box-plot / rotated kernel-density hybrid with the
  median), and (2) a fully controlled ggplot2 violin (geom_violin) with quantile
  lines at 0.25, 0.5 and 0.75, count-proportional width scaling (scale = "count"),
  untrimmed tails (trim = FALSE) and per-profile fill.
- Applies detailed theme customisation with bilingual English and Chinese
  titling via CJK font families (Kai, Hei).

### violin_boxplot_ggplot2_faostat_india.R
An independent example overlaying geom_violin and geom_boxplot to show the
distribution of a Gross per Capita Production index by product, read with readr
and handled with the tidyverse.

## Methods and algorithms

- Kernel density estimation (KDE) as the basis of the violin shape.
- Violin plot as a box-plot / density hybrid, with quantile (0.25, 0.5, 0.75)
  annotation and count-based width scaling.
- Wide-to-long reshaping with data.table::melt for grouped distribution plots.
- Missing-data handling by listwise deletion (na.omit).
- Grammar of graphics (ggplot2) with box-plot overlay for a second view.

## Data

- Depths.csv: bathymetric depths sampled along 25 cross-profiles of the Mariana
  Trench (profile columns, observations in rows).
- FAOSTAT_GPI.csv (external): Gross per Capita Production index by product and
  year.

## Requirements

- R (>= 3.5)
- Packages: ggplot2, data.table, violinmplot, tidyverse (readr, dplyr, forcats)

Install with:

    install.packages(c("ggplot2", "data.table", "violinmplot", "tidyverse"))

## Usage

Place the required CSV in the working directory and run, e.g.:

    Rscript violin_plot_ggplot2_mariana_trench.R

## Author and citation

Polina Lemenkova
ORCID: https://orcid.org/0000-0002-5759-1089

If you use the Mariana Trench script, please cite:

Lemenkova, P. Factor Analysis by R Programming to Assess Variability Among
Environmental Determinants of the Mariana Trench. Turkish Journal of Maritime
and Marine Sciences 2018, 4(2), 146-155. arXiv:1812.00989.
https://doi.org/10.48550/arXiv.1812.00989
