import pandas as pd
from pandas import ExcelWriter
from pandas import ExcelFile
from matplotlib import pyplot as plt

df = pd.read_excel('examscores.xlsx')
print(type(df))

title = 'Exam scores for Psychological Statistics Fall 2019'
hxlab = 'Exam score'
hylab = 'Number of students'

plt.hist(df.score)
plt.xlabel(hxlab)
plt.ylabel(hylab)
plt.title(title)
plt.show()

#make it fancier

df = pd.read_excel('examscores.xlsx')
print(type(df))

title = 'Exam scores for Psychological Statistics Fall 2019'
hxlab = 'Exam score'
hylab = 'Number of students'

plt.hist(df.score, bins = 8, density = False, color ='purple', alpha = 0.75)
plt.xlabel(hxlab)
plt.ylabel(hylab)
plt.title(title)
plt.show()

df2 = pd.read_excel("quizzes.xlsx", sheet_name ='class1')
df3 = pd.read_excel("quizzes.xlsx", sheet_name = 'class2')

counts2 = df2['score'].value_counts()
print(counts2)

counts3 = df3['score'].value_counts()
print(counts3)

title2 = 'Quiz scores among students in Psychology classes'
hxlab2 = 'Quiz score'
hylab2 = 'Number of students'
ticks = [0,1,2,3,4,5,6,7,8,9,10,11]

plt.hist(df2.score, bins=ticks, label = 'class 1', density = False, color = 'turquoise', alpha = 0.5)
plt.hist(df3.score, bins=ticks, label = 'class 2', density = False, color = 'pink', alpha = 0.5)
plt.xlabel(hxlab2)
plt.ylabel(hylab2)
plt.xticks(ticks)
plt.title(title2)
plt.legend()
plt.style.use('fivethirtyeight')
plt.show()
