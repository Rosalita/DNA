# Link to study https://synapse.koreamed.org/DOIx.php?id=10.4306/pi.2014.11.4.345

getwd()
setwd("~/Downloads")
genome <- read.table("genome_v4_Full_20170111084212.txt")

#add dataframe column names 
colnames(genome) <- c("rsid", "chromosome", "position", "genotype")

genome$rsid <- as.character(genome$rsid)

# Find rs908078 (BHLHE40)
index <- which(genome$rsid == "rs908078")
genome[index,]

# Find rs2482705 (NFIL3) 
index <- which(genome$rsid == "rs2482705")
genome[index,]

# Find rs3828057 (RORC) 
index <- which(genome$rsid == "rs3828057")
genome[index,]


# Contingency table taken from
# https://synapse.koreamed.org/ViewImage.php?Type=T&aid=476754&id=T2&afn=162_PI_11_4_345&fn=pi-11-345-i002_0162PI

## Non-24-hour components associated with BHLHE40 rs908078 alleles
#-----------------------------------------------------------------
# Non 24h component | rs908078 number of C alleles | Total
#                   |     0    |    1    |    2    | 
#-----------------------------------------------------------------
#     None          | 30 (77%) | 9 (23%) | 0(0%)   | 39 (100%)
#     Possible      |  7 (47%) | 8 (53%) | 0(0%)   | 15 (100%)
#     Probable      |  4 (100%)| 0 (0%)  | 0(0%)   |  4 (100%)
#     Definite      |  1 (25%) | 1 (25%) | 2(50%)  |  4 (100%)
#     Total         | 42 (68%) | 18(29%) | 2(3%)   | 62 (100%)

# Data shows rs908078 (BHLHE40) =  TT 
# TT is homozygous normal, therefore not indicative of anything

#---
# Contingency tables taken from 
# https://synapse.koreamed.org/ViewImage.php?Type=T&aid=476754&id=T4&afn=162_PI_11_4_345&fn=pi-11-345-i004_0162PI


## Alleles for rs2482705 (NFIL3) 
#------------------------------------------------------------------
# Group   |   GG  Allele  | AG Allele   | AA Allele  | Total
# DSPS    |   227 (78.5%) | 68 (19.3%)  | 8 (2.3%)   | 353 (100%)
# Control |   222 (68.7%) | 91 (27.9%)  | 13 (4%)    | 326 (100%)
# Total   |   499 (73.5%) | 159 (23.4%) | 21 (3.1%)  | 679 (100%)


## Alleles for rs3828057 (RORC) 
#------------------------------------------------------------------
# Group   |   GG  Allele  | AG Allele   | AA Allele  | Total
# DSPS    |   49 (44.5%)  | 40 (36.4%)  | 21 (19.1%) |  110(100%)
# Control |   182 (29.9%) | 317 (50.6%) | 128 (20.4%)|  627(100%)
# Total   |   231 (33.3%) | 357 (48.4%) | 149 (20.2%)|  737(100%)

# Study concludes that minor (A) alleles were more common among controls than DSPS cases. 

# Data shows rs2482705 (NFIL3) = GG  this is homozyus normal too, so no mutation here.

# Data shows rs3828057 (RORC) =  CT (Referance genotype is CC, to heterozygus
# mutation to T here, which would appear to be quite common in Europeans)

# RORC 
# http://grch37.ensembl.org/Homo_sapiens/Gene/Summary?db=core;g=ENSG00000143365;r=1:151778547-151804348
# Chromosome 1: 151,778,547-151,804,348
head(genome)
RORC <- genome[genome$position %in% 151804348:151778547 & genome$chromosome == 1, ]

# Results in ensembl account only one variant here which is the intron variant
# which is unlikely to do anything.

# BHLHE40
# http://grch37.ensembl.org/Homo_sapiens/Gene/Summary?db=core;g=ENSG00000134107;r=3:5020801-5027008
# chr 3 5020801 5027008
BHLHE40 <- genome[genome$position %in% 5020801:5027008 & genome$chromosome == 3, ]
BHLHE40
# Only 1 SNP probe here we've already figured out this was homozygous referance
# so nothing to analyse.

# NFIL3
# http://grch37.ensembl.org/Homo_sapiens/Gene/Summary?db=core;g=ENSG00000165030;r=9:94171327-94186144;t=ENST00000297689
# chr 9 94171327 94186144
NFIL3 <- genome[genome$position %in% 94171327:94186144 & genome$chromosome == 9,]
NFIL3

# Both alternative AG and GT heterozygous genotypes here are intron
# variants so unlikley to have any effect on coding protein, both have quite
# high frequency in european population. 

# looked at all variants in study and only mutations present were intron which are common in population
# No exon mutations present in these variants
