## The Problem

It seems like we can’t go a single day without hearing or reading that a person in the U.S. was shot and killed by police. More often than not, it seems like the victim is black, male, and unarmed.

This has lead some to suggest that police killings have increased in the U.S. in recent years, particularly among minorities. Others argue that social media and the availability of cell phone footage has made the occurrence seem more frequent than it is. So I decided to empirically test this question.

## The Approach

First, I downloaded data from mappingpoliceviolence.org and then I iterated through a series of models, first a general linear model with fixed effects of race, year, and the interaction of race and year. Next, I ran a linear mixed effects model with the same fixed effects but adding in a random effect of race, effectively allowing the variability vary between the racial groups. Lastly, I ran a mixed effects model with fixed effects of race, year, and the interaction of race and year, as well as the interaction of a year^2 and race, and again the random effect of race.  

## The Results

Next, I plotted police killings between 2013 and 2017 broken down by race. Time in years is on the horizontal axis and number of people killed is on the vertical axis. Minority victims are shown with a solid line and white victims are shown with a dashed line.

A couple of things might stand out to you. 1. The line for minority victims is consistently higher than the line for white victims and 2. The pattern over time is different between racial groups.

This intuition was confirmed by the models. The final model, which included the interaction of year^2 and race was highly significant, indicating that the shapes of the slopes differ between the two racial groups and that they are quadratic in form. These results are apparent in the graph; it is clear that the rate of police killings of minority victims is quadratic and is increasing while the rate of police killings of white victims is also quadratic in form, it is going in the opposite direction.  

## The Takeaway

Trends of police killings of minority and white victims do differ in recent years and killings of minorities by police have increased from 2013.  
