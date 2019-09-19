library("DESeq2")

group1="m1"
group2="m3"

#this DESeq object is a combination of  
# 1) a count-matrix
#             treated1 treated2 treated3 untreated1 untreated2 untreated3
# FBgn0000003        0        0        1          0          0          0
# FBgn0000008      140       88       70         92        161         76


#condition
#type
#treated1	treated	single-read
#treated2	treated	paired-end
#treated3	treated	paired-end
#untreated1	untreated	single-read
#untreated2	untreated	single-read
#untreated3	untreated	paired-end
#untreated4	untreated

# 2) a matrix which assigns each of the headers in the count matrix to a group

df = read.table('~/Desktop/matrix_all_matrix_m1-m3.tsv', row.names=1)

condition=c(group1,group1,group1,group1,group2,group2,group2,group2)

Oocyte_ID=c("m1_1","m1_2","m1_3","m1_4","m3_1","m3_2","m3_3","m3_4")
coldata=data.frame(condition,row.names=Oocyte_ID)

dds=DESeqDataSetFromMatrix(countData=df,colData=coldata,design= ~ condition)

dds=DESeq(dds)

res=results(dds)

1+1

write.csv(res,"/Users/grasp2/Desktop/matrix_all_m1vsm3.csv",row.names=TRUE)
