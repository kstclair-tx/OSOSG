###############################################################
# OSOS-G Workshop, September 2026
# Module 3: Beginner Graphics in R
# Credits to Adekola Owoyemi
###############################################################

# Plotting in R opens up a graphics device, think of it as a canvas
# Plotting is a type of generic function, one which can be applied to
# many different object types



# Where to plot
# Default is plots pane



#Visualizing penguins data

# Plot peng attributes


#Setting graphical parameters


# ---- EXERCISE 1 -------------------------
# Make all four plot types, then show them together in one 2 x 2 figure:
  # bar plot of island
  # box plot of bill_len by species
  # scatter plot of bill_len (x) vs bill_dep (y)
  # scatterplot matrix of bill_len, flipper_len, body_mass




# Customizing the plot


# Adding labels

# Show color palettes

pal <- c("#E69F00", "#CC79A7", "#009E73")



# ---- EXERCISE 2 --------------------
# Scatter of bill_len (x) vs flipper_len (y):
#   colored by species (use pal), solid circles 1.3x the default size,
#   bold title "Penguin bill vs flipper length", axis labels with units.




# ---- Add Legend -------------------------------

# ---- EXERCISE 3 -----------------
# Box plot of body_mass by species:
#   color the boxes with pal, label the axes,
#   add a dashed horizontal line at the overall median body_mass.




# ---- Multiple models -------------------------------


# ---- Save plot ------------------------------
pdf("penguin_scatter.pdf", width = 8, height = 6)
plot(peng$flipper_len, peng$body_mass, col = pal[peng$species], pch = 16)
legend("bottomright", legend = levels(peng$species), col = pal, pch = 16, bty = "n")
dev.off()
getwd()


#----Fine tuning-------------------------------

locator()
adjustcolor()
axis()

boxplot(body_mass ~ species, data = peng)

points(body_mass~jitter(as.numeric(species)), data = peng)

col_lookup <- data.frame(species = c("Adelie", "Chinstrap", "Gentoo"),
                           color = pal)

peng$color <- col_lookup$color[match(peng$species, col_loopkup$species)]

boxplot(body_mass ~ species, data = peng, col = NA)
points(body_mass~jitter(as.numeric(species)), data = peng, col = color, 
       pch = 16)

boxplot(body_mass ~ species, data = peng, 
        col = NA, 
        range = 0, 
        las = 1, 
        ylim = c(2000, 7000), 
        xlab = "", 
        ylab = "Body mass (kg)",
        yaxt = "none")
points(body_mass~jitter(as.numeric(species)), data = peng, 
       col = adjustcolor(color, alpha.f = 0.5), 
       pch = 16)

# Show significance with segments and text
segments(1, 6800, 3, 6800)
text(2, 6950, "**")

segments(2, 6500, 3,6500)
text(2.5, 6650, "**")

axis(2, at = seq(2000, 7000, 1000), las = 1, 
     labels = seq(2, 7, 1))

# set seed for reproducibility

#plot confint from model
# show spatial data example

# ----CAPSTONE EXERCISE ------------
# bill_len (x) vs bill_dep (y):
#   points colored by species using c("darkblue", "firebrick", "darkgreen"),
#     solid circles
#   bold title, 1.4x default size: "Bill dimensions differ by species"
#   axis labels with units
#   one dashed regression line per species, matching colors
#   legend, no box, in a corner off the points
#   bonus: save as capstone.png (800 x 600)




