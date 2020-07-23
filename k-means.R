#referencias

#https://bookdown.org/wevsena/curso_r_tce/curso_r_tce.html
#encurtador.com.br/FHJQ7
#https://www.youtube.com/watch?v=0ImwDt2s_Sw   (ver vídeo em 5.47)
#https://www.youtube.com/watch?v=6qleqPsrBqI


Tempo.de.Inicio <- Sys.time()


#Chamar os pacotes
#Fazer analise de cluster usando o k-means
library(FactoMineR)
#Plotar gráfico
library(factoextra)
#clara e pam
library(cluster)
#Pacote para importar dados em .csv(ver vídeo em 5.47)
library(readr)


#saber o caminho do seu arquivo em R para colar os arquivos .csv e assim usar a funcao read.csv2("file.csv")
getwd()

#Gera testes pseudos randômicos e garante a reprodutibilidade do experimento
#Reprodutibilidade = 1x10^9
set.seed(1000000000)

#Importar os dados .csv
dados_brutos <- read.csv2("caixas.csv",header = T)

#Transformar em data frame

df <- data.frame(dados_brutos)

#Visualizar a estrutura de dados(aqui verificar se os dados estão ok)
str(df)

#Boxplot
boxplot(df$Altura)
boxplot(df$Profundidade)
boxplot(df$Largura)

#Transformar em escala(Padronização dos dados)
dados.padronizados <- scale(df)

#Definir quantidade ótima de cluster
fviz_nbclust(dados.padronizados, kmeans,method = "gap_stat")

#Gerar o K-means com 3 clusters e iniciar as atribuições aleatórias de 
#partida em 1x10^5 até que encontre a menor variação dentro do cluster
dados_kmeans <- kmeans(dados.padronizados,3, nstart = 100000)
View(dados_kmeans)


#Visualizar o kmeans no gráfico
fviz_cluster(dados_kmeans, data = dados.padronizados, main = "Agrupamento",show.clust.cent=T, palette = "Set2", ggtheme = theme_minimal(),ellipse.type = "euclid",geom = "point")

#Criando uma lista com os clusters
Lista_clusters <- dados_kmeans$cluster

#Agrupando os dados em uma tabela
dados_gerais <- cbind(dados_brutos, Lista_clusters)
#Visualizar os dados ou simplemente ir em Environment
View(dados_gerais)

Tempo.de.Finalização <- Sys.time()

#Medir o tempo de Execução do código
Tempo.de.Execucao <- Tempo.de.Finalização - Tempo.de.Inicio
View(Tempo.de.Execucao)











