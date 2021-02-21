library(tidyverse)

#3.2.1 mpg as a data frame
ggplot2::mpg
?mpg

#3.2.2 Creating a ggplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#3.2.3 A graphing template
ggplot(data = <Data>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
#Not sure if they attended for us to do this on our own 'data,' or another dataset, but it is the same templace as 3.2.2. The rest of the chapter will be spent building on this.

#3.2.4 Exercises
#1. Run ggplot(data = mpg). What do you see?
ggplot(data = mpg)
#You just see a blank image. A gray square.

#2. How many rows are in mpg? How many columns?
str(mpg)
#You can use this function is see that it is 234 X 11, which refers to 234 rows and 11 columns
summary(mpg)
#this further shows that there are 234 rows 
#It also tells you this on the help page

#3, What does the drv variable describe? Read the help for ?mpg to find out.
?mpg
#drv stands for "the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd"

#4 Make a scatterplot of hwy vs cyl.
hwy.cyl <- mpg[c("hwy", "cyl")]
plot (x = hwy.cyl$hwy, y = hwy.cyl$cyl,
      xlab = "Highway MPG",
      ylab = "Number of Cylindes",
      xlim = c(0, 50),
      ylim = c(0, 10),
      main = "Clinders according to Highwar MPG")

#5. What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
class.drv <- mpg[c("class", "drv")]
plot (x = class.drv$class, y = class.drv$drv,
      xlab = "Class",
      ylab = "DRV",
      xlim = c(0, 5),
      ylim = c(0, 5),
      main = "Class of car to drive train")
?mpg
#What happens is that nothing appears on the scatterplot. This is a useless comparison on the scatterplot because there are no numerical comparisons between the two. It is just one type of car compared to the next, this is not the best methodology for this comparison.

#3.3
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#3.3.1 Exercises
#1. ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
#The issue was how the code was set up, the aesthetic function was bracketed to include the color = blue. Because color = blue wan't seperated, we never fully told the plot what color to make the points. Thus, it decided that red was a better color.

#2. Which variables in mpg are categorical? Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). How can you see this information when you run mpg?
mpg?  
str(mpg)
# categorical: manufacturer, model, , fl (fuel type), class
# continuous: displ, cty, hwy, year, cyl
# This one I am not so sure about 

#3
ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy, color = year))
ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy, size = year))
ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy, shape = year))
#What intially happens is that a continuous variable can not be mapped according to shape. Color is probably the best for mapping continuos variables beacuse it simply just shows a different color for each year.
#When it comes to size it doesn't necessarily make sense aesthetically, since the larger points go to the higher year rather than a higher valued variable. 

#4
#When you map the same variable according to multiple aesthetics you basically find yourself in a scenario where you can see the same data in different manipulations. Each manipulation can bias your enventual interepretations/presentation of the data. 
ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy, color = year, size= year))
#When you literally do it you get two different indexs, but it is a confusing presentation of data.

#5
?geom_point
ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy, color = year, stroke= year))
#So stroke doesn't work with the ggplot the way the previous functions did.
ggplot(data = mpg)+
  geom_point(mapping = aes (x = displ, y = hwy), 
             color = "pink", shape = 5, stroke = 2)

ggplot(data = mpg)+
  geom_point(mapping = aes (x = displ, y = hwy), 
             color = "pink", shape = 5, stroke = 6)
#as you can see, the stroke function changes the size of the of the point's border. 

#6
ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy, color = displ < 5))
#Ultimately, it maps it much like variable names. The plot takes what you put in and generates an outcome, and in this case it colos 1 through 4.99 as blue and 5 and up as red. 

#3.5.1 Exercises

#1 ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(~ cty)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(~ class)

#There is a column for every single value, thus making 10+ columns to lot at for one graph. Not at all pleasing to the eye.

#2
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))
# It means that the plot interepreted the data as not containing data in those particular rows. You can see it more clearly with the second plot. Where it shows 7 as not containing any information, no 4's in the r row, and as the only 5 data points coming from f.

#3
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(~drv)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(cyl ~ .)

#I believe that it contains the facet so that it is being "compared to something else." On the outset, it flips the plot around so that it all follows one grid rather than there being three seperate grids. 

#4
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
#Facets allow you to expand the presentation of data to include as many variables, or points of data, as you want. When it comes to colors, you can only present so many points until the plot becomes over barring and crowded visually. You can have as many facets as you want.
#The disadantage comes in the nature of reading the data against one another. It is harder visually to compare the data from one facet to the next, and the dimensions may be out of clear visualization with one another. 
#If the dataset was much larger than I would 100% believe that facets were the proper way to present this data. 

#5 Read ?facet_wrap. What does nrow do? What does ncol do? What other options control the layout of the individual panels? Why doesn’t facet_grid() have nrow and ncol arguments?
?facet_wrap
#nrow, and ncol help you control the amount of rows and columns that you have, respectively. Another option includes dir which controls the direction of the panels on the grid, eith "h" for horizontal and "v" for vertical. While nrow and ncol arguements are additions to facet_wrap, facet_grid has those features as implied variables. Much like if you don't determine the color of the points.
wrap <- ggplot(mpg, aes(displ, hwy)) + geom_point()
wrap + facet_wrap(vars(class))
wrap + facet_wrap(vars(class), nrow = 2)
wrap + facet_wrap(vars(class), nrow = 5)
wrap + facet_wrap(vars(class), nrow = 10)
wrap + facet_wrap(vars(class), ncol = 2)
wrap + facet_wrap(vars(class), ncol = 5)
wrap + facet_wrap(vars(class), ncol = 10)
wrap + facet_wrap(vars(class), nrow = 5, ncol = 5)

#6 When using facet_grid() you should usually put the variable with more unique levels in the columns. Why?
#Because, without any manipulation, grids lean wider. 

#3.6.1

#1 What geom would you use to draw a line chart? A boxplot? A historgram? An area chart?
geom_line()
geom_boxplot()
geom_histogram()
geom_area()

#2 Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions.
?geom_smooth()
#geom_smooth appears to tackle x and y axis, and it turns out that the function can have two different orientations around each axis. 
#A smooth line will be shown though each drv group, with the drv points being highlighted by color. 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)
#TUrns out there were three seperate lines for each row, instead of one clean cut line. 

#3 What does show.legend = FALSE do? What happens if you remove it? Why do you think I used it earlier in the chapter?
?show.legend = FALSE
#By using show.legend = FALSE you hide the legend from your plot, and if you remove it you revert back to the default of there being a legend. These legends are created automatically, so FALSE overturns the preset TRUE
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE)
#If you remove the = FALSE, it returns the legend.
ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv))

#I believe this was done to take away from the crowded nature of the plot? Perhaps there was no explit reason to show which line was wich row? Ultimately, this is a mistake. Any visual showing data should include a legend if data is presented through color or some other symbolism.

#4. What does the se argument to geom_smooth() do?
?se
?geom_smooth
#It controls whether or not the confidance interval is displayed alongside the smooth curve. This function is TRUE by deault, but you can change the level or it to control it or change it to FALSE. 

#5. Will these two graphs look different? Why/Why not?
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
#These two plots will look the exact same, they just rearranged how the geom_point and geom_smooth functions are positioned. 

#6. 
?mpg

#For one, it turns out you dont need to include data =, or mapping =. The size was the trickiest one for me. I had to eye ball how big they made their plot points. 
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(size = 6) +
  geom_smooth(se = FALSE, size = 2)

#This one wants you to show the various drv groups, so we basically can copy the previous smooth line plot. 
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(size = 6) +
  geom_smooth (mapping = aes(group = drv), size = 2, se = FALSE,
  show.legend = FALSE)

#Now we want color, and to include the legend. I think you could add color to our previous smooth line, but then you wouldn't have colo with the points. So you can also just add color at the start of the plot code. 
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point(size = 6) +
  geom_smooth(se = FALSE, size = 2)

ggplot(mpg, aes(x = displ, y = hwy, size = 6)) +
  geom_point(aes(color = drv)) +
  geom_smooth(se = FALSE, size = 2)
#The only issue that arises here is the size on my legend. I tried my best to hide it from the legend, but I couldn't find any answers on the ? function. Any sugestions?

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(size = 6, color = drv)) +
  geom_smooth(aes(linetype = drv), se = FALSE, size = 2)
#Again, I can't take away the size.

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(fill = drv), color = "white", stroke = 2, shape = 21, size = 4)
  
