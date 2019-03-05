
## pension project
data_2004 = get_data(2004)
data_2005 = get_data(2005)
data_2006 = get_data(2006)
data_2007 = get_data(2007)

library(plyr)
data = rbind.fill(data_2004,data_2005,data_2006,data_2007)
colnames(data)
data_variable = data %>%
  select("企业匹配唯一标识码","行政区划代码","省（自治区、直辖市）","地（区、市、州、盟）","县（区、市、旗）","开业(成立)时间--年", "全部从业人员年平均人数(人)","固定资产合计(千元)","资产总计(千元)","劳动、失业保险费(千元)","养老保险和医疗保险费(千元)","住房公积金和住房补贴(千元)", 
         "应交所得税(千元)","利润总额(千元)" , "year","补贴收入(千元)","负债合计(千元)","控股情况" )
myvars = colnames(data_variable)
name = c( "firm_id","local_id","province","prefecture","county","found_year","employee_number","fixed_investment","gross_asset","unemployment_insurance","pension_health","housing_fund",
          "income_tax","profit","year","subsidy","debt","stock_holding")
varlist <- cbind(myvars,name)
varlist
setnames(data_variable, old = myvars, new = name)
data_variable = data_variable %>%
  na.omit()
cor(data_variable$income_tax,data_variable$pension_health)
mean(data_variable$pension_health)
mean(data_variable$income_tax)
m1 = lm(pension_health ~ income_tax, data = data_variable)
summary(m1)