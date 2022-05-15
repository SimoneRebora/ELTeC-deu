# Stylometry on German ElTeC collection

# Install and call the package
install.packages("networkD3")
install.packages("stylo")
library(stylo)

# see the metadata
df <- read.csv("metadata/metadata.txt")
View(df)

# Important note:
# Stylo will work by default with the files in the "corpus" folder

# First analysis (dendrogram with 100 MFW)
stylo(frequencies="table_with_frequencies.txt")
# here files are not actually read from the "corpus" folder
# as word frequencies are already provided in "table_with_frequencies.txt" file

# Second analysis (dendrogram with 200 MFW)
stylo(mfw.min=200, 
      mfw.max=200,
      frequencies="table_with_frequencies.txt")

# Third analysis (Consensus tree with 2000 MFW and Cosine Delta distance)
stylo(mfw.min=200, 
      mfw.max=2000,
      mfw.incr=200,
      distance.measure="dist.wurzburg",
      analysis.type="BCT",
      plot.custom.height=16,
      plot.custom.width=16,
      frequencies="table_with_frequencies.txt")

# Fourth analysis
stylo.network(frequencies="table_with_frequencies.txt")

# Here is an overview of the options to put between the brackets
# (or in the "stylo_config.txt" file)
# 
# # Type of the corpus
# 
# corpus.format = ...
# - you can choose between "plain", "xml", "xml.drama", "html", and many others
# [Example]
# stylo(corpus.format = "plain")
#
# # Language of the corpus
# 
# corpus.lang = ...
# - you can choose between "English", "German", "Italian", "Latin", and many others
# [Example]
# stylo(corpus.format = "plain", corpus.lang = "Italian")
# 
# # Most frequent words
# 
# mfw.min = ...
# - any integer number
# mfw.max = ...
# - any integer number
# mfw.incr = ...
# - any integer number
# 
# [Example]
# stylo(corpus.format = "plain", corpus.lang = "Italian", mfw.min = 100, mfw.max = 1000, mfw.incr = 100)
# - (this will perform 10 analyses with 100, 200, 300, etc. MFW)
# 
# # Distance measures 
# 
# distance.measure = "..."
# - you can choose between the following:
#   - "dist.delta"
#   - "dist.euclidean"
#   - "dist.manhattan"
#   - "dist.argamon"
#   - "dist.eder"
#   - "dist.simple"
#   - "dist.canberra"
#   - "dist.cosine"
#   - "dist.wurzburg"
#   - "dist.minmax"
# 
# [Example]
# stylo(corpus.format = "plain", corpus.lang = "Italian", mfw.min = 100, mfw.max = 1000, mfw.incr = 100, distance.measure = "dist.wurzburg")
# - (this will perform 10 analyses with 100, 200, 300, etc. MFW, using the Wurzburg distance, i.e., Cosine Delta)
# 
# # Analysis type (i.e. visualization)
# 
# analysis.type = 
# - you can choose between the following:
#   - "CA"
#     - (that is cluster analysis, i.e. dendrograms)
#   - "BCT"
#     - (that is bootstrap consensus tree)
# 
# [Example]
# stylo(corpus.format = "plain", corpus.lang = "Italian", mfw.min = 100, mfw.max = 1000, mfw.incr = 100, distance.measure = "dist.wurzburg", analysis.type = "BCT")
# - (this will perform 10 analyses with 100, 200, 300, etc. MFW, using the Wurzburg distance, i.e., Cosine Delta, and will use them to generate a single consensus tree)
# 
# Much more details are available here: https://github.com/computationalstylistics/stylo_howto/blob/master/stylo_howto.pdf
# Note that if you will install Rstudio in your laptop, stylo will also have a graphical interface to set up these features
