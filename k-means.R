#referencias

#https://bookdown.org/wevsena/curso_r_tce/curso_r_tce.html
#encurtador.com.br/FHJQ7
#https://www.youtube.com/watch?v=0ImwDt2s_Sw   (ver v�deo em 5.47)
#https://www.youtube.com/watch?v=6qleqPsrBqI


#Chamar os pacotes
#Fazer analise de cluster usando o k-means
library(FactoMineR)
#Plotar gr�fico
library(factoextra)
#clara e pam
library(cluster)
#Pacote para importar dados em .csv(ver v�deo em 5.47)
library(readr)
#	Manipula��o e transforma��o de dados (str)
library(dplyr)



#saber o caminho do seu arquivo em R para colar os arquivos .csv e assim usar a funcao read.csv2("file.csv")
getwd()


#Gera testes pseudos rand�micos
set.seed(123)


#Importar os dados .csv
dados_brutos <- read.csv2("caixas.csv",header = T)


#Transformar em data frame

df <- data.frame(dados_brutos)



#Vizualizar os dados ou simplesmente ir em global enviromment
View(df)

#Visualizar a estrutura de dados(aqui verificar se os dados est�o ok)
str(df)

#Boxplot
boxplot(df$Altura)
boxplot(df$Profundidade)
boxplot(df$Largura)

#Transformar em escala(Padroniza��o dos dados)
dados <- scale(df)




#Definir quantidade �tima de cluster
fviz_nbclust(dados, kmeans,method = "gap_stat")

#Gerar o K-means com k=3
dados_kmeans <- kmeans(dados,3, nstart = 10)

#Visualizar o kmeans no gr�fico
fviz_cluster(dados_kmeans, data = dados, main = "Agrupamento de Caixas        1 = M�dia, 2 = Pequena e 3 = Grande",show.clust.cent=T, palette = "Set2", ggtheme = theme_minimal(),ellipse.type = "euclid",geom = "point")

#Criando uma lista com os clusters
Lista_dos_clusters <- dados_kmeans$cluster
View(Lista_dos_clusters)

#Agrupando os dados em uma tabela
dados_gerais <- cbind(dados_brutos, Lista_dos_clusters)











