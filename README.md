# GEO411-Multiple-Regression
R Analysis and Practice of Multiple Regression

**OVERVIEW**
- Altering a preexisting model to predict sale price of a home
- Alterations were based on assumptions of linear regression such as normality, homoscedasticity, and independence
- Alterations were based on multicollinearity and the statistical significance of each independent variable in the model formula

**METHODS**
- Viewed the statistics of the original model (price = # of bedrooms, # of bathrooms, area of living space, year built, proportion of population that only graduated high school, and proportion of population who did some college)
- Viewed the residual plots of the original model (attached to repository as BaseModel)
- Transformed the dependent variable using logarithmic functions to change it to a log-linear model
- Altered the independent variables to lower violations and increase predictive power

**KEY FINDINGS**
- New model (log(price) = # of bedrooms, # of bathrooms, year built, proportion of population that has a bachelor's, and proportion of population who has an advanced degree)
- New model has an adjusted R-squared value of 0.6944, so 69.44% of price can be determined by the model compared to the original model's 64.86%
- New model does not violate the independence assumption
- VIF values of both models are under 10, so neither model has issues with multicollinearity

Slope interpretations for the new model are as follows:
- Assuming all other variables remain constant, an increase in one bedroom increases the price of the house by 5.3%.
- Assuming all other variables remain constant, an increase in one bathroom increases the price of the house by 27.6%.
- Assuming all other variables remain constant, an increase in one unit of the proportion of people who have completed an advanced degree increases the price of the house by 184.3%.
- Assuming all other variables remain constant, an increase in one unit of the proportion of people who have completed a bachelor’s degree increases the price of the house by 162.3%.
- Assuming all other variables remain constant, an increase in one year of build date decreases the price of the house by 0.21%.

**TOOLS**
- RStudio on MacOS
- car library for VIF calculations

**REFLECTIONS**
- During the process of creating the new model, I went through and utilized log-linear, linear-log, log-log, and the similar variations of square rooting the different parts of the model
- There is no such thing as a perfect model
- Different models calculate based on different things, so pay attention to how the data that is available is relevant to the model itself
- Not everything that you would think would cause multicollinearity will cause it (I assumed bathrooms and bedrooms would have high multicollinearity with area of living space, but that was not the case numerically)
