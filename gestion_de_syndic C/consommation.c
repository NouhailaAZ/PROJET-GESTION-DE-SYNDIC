#include<stdio.h>
#include<stdlib.h>
#include"consommation.h"






int ChercheConsommation(int a){
  FILE *F;
  consommation c;
  int i=0;

 F=fopen("consommation.txt", "r");

 while(!feof(F)){
 fscanf(F,"%d : %d : %f : ",&c.IdConsommation, &c.IdImmeuble, &c.Electricite);
 fscanf(F,"%f : %f : %f : %d\n",&c.Eau,&c.Menage, &c.Autres,&c.Annee);
 if(c.IdConsommation==a){i=1;break;}
 }

 fclose(F);

 return i;}

void AfficheConsommation(){
 FILE *F;
 consommation c;

 F=fopen("consommation.txt","r");

 printf("IdConsommation\t IdImmeuble \t Electricite \tEau  \t\t Menage  \t\t Autres   \tAnnee \n");

 while(!feof(F)){
fscanf(F,"%d : %d : %f : ",&c.IdConsommation, &c.IdImmeuble, &c.Electricite);
 fscanf(F,"%f : %f : %f : %d\n",&c.Eau,&c.Menage, &c.Autres,&c.Annee);
 printf("%d\t\t%d\t\t%.2f",c.IdConsommation, c.IdImmeuble, c.Electricite);
 printf("\t\t%.2f\t\t%.2f\t\t%.2f\t\t%d\n",c.Eau, c.Menage, c.Autres,c.Annee);
}

fclose(F);
}

void ChercheConsommation1()
{
 int x;

 printf("saisir le id du consommation pour le chercher: ");
 scanf("%d", &x);
 fflush(stdin);

 if(ChercheConsommation(x)){

 FILE *F;
 consommation c;

 F=fopen("consommation.txt", "r");

 while(!feof(F)){
    fscanf(F,"%d : %d : %f : ",&c.IdConsommation, &c.IdImmeuble, &c.Electricite);
    fscanf(F,"%f : %f : %f : %d\n",&c.Eau,&c.Menage, &c.Autres,&c.Annee);
	if(x==c.IdConsommation)
	{
           printf("%d : %d : %.2f : ", c.IdConsommation, c.IdImmeuble, c.Electricite);
           printf("%.2f : %.2f : %.2f : %d \n", c.Eau, c.Menage, c.Autres,c.Annee);
    }
    }

 fclose(F);


 }
 else
 printf("Ce Consommation n existe pas !\n");

}

consommation InfoConsommation(){
 consommation x;
 printf("saisir IdImmeuble: "); scanf("%d", &x.IdImmeuble);
 printf("saisir Electricite: "); scanf("%f", &x.Electricite);
 printf("saisir Eau: "); scanf("%f", &x.Eau);
 printf("saisir Menage: ");
 scanf("%f", &x.Menage);
 printf("saisir les Autres: "); scanf("%f", &x.Autres);
 printf("saisir Annee: "); scanf("%d", &x.Annee);

 fflush(stdin);
return x;}

void SupprimerConsommation(){
 int x;

 printf("saisir le id du consommation pour le supprimer: ");
 scanf("%d", &x);
 fflush(stdin);

 if(ChercheConsommation(x)){

 FILE *F,*F1;
 consommation c;

 F=fopen("consommation.txt", "r");
 F1=fopen("file.txt", "w");

 while(!feof(F)){
      fscanf(F,"%d : %d : %f : ",&c.IdConsommation, &c.IdImmeuble, &c.Electricite);
       fscanf(F,"%f : %f : %f : %d\n",&c.Eau,&c.Menage, &c.Autres,&c.Annee);

      if(x!=c.IdConsommation){
           fprintf(F1,"%d : %d : %.2f : ", c.IdConsommation, c.IdImmeuble, c.Electricite);
           fprintf(F1,"%.2f : %.2f : %.2f : %d\n", c.Eau, c.Menage, c.Autres,c.Annee);
                           }
    }

 fclose(F);
 fclose(F1);

 remove("consommation.txt");
 rename("file.txt", "consommation.txt");

 printf("la supprition est bien fait\n");

 }

 else{
 printf("cette consommation  n'existe pas !\n");
 }

}

void ModifierConsommation(){
  FILE *F,*F1;
  consommation c;
  int x;

  printf("saisir le IdConsommation pour modifier: ");
  scanf("%d", &x);
  fflush(stdin);

  if(ChercheConsommation(x)){
             F = fopen("consommation.txt", "r");
             F1= fopen("file.txt", "w");

             while(!feof(F)){
                       fscanf(F,"%d : %d : %f : ",&c.IdConsommation, &c.IdImmeuble, &c.Electricite);
                        fscanf(F,"%f : %f : %f : %d\n",&c.Eau,&c.Menage, &c.Autres,&c.Annee);


                        if(c.IdConsommation==x){
                        printf("pour modifier cette consommation\n");
                        c = InfoConsommation();
                        c.IdConsommation=x;

                        }

           fprintf(F1,"%d : %d : %.2f : ", c.IdConsommation, c.IdImmeuble, c.Electricite);
           fprintf(F1,"%.2f : %.2f : %.2f : %d\n", c.Eau, c.Menage, c.Autres,c.Annee);
             }

             fclose(F);
             fclose(F1);

             remove("consommation.txt");
             rename("file.txt", "consommation.txt");

             printf("la modufication est bien fait\n");

 }

 else{
      printf("cette consommation n'existe pas !\n");

      }
 }

void AjouterConsommation(){
       FILE *F;
       consommation c;
        int  a;

       F=fopen("consommation.txt","a");

       printf("saisir le id du consommation  pour l'ajoute: ");
       scanf("%d", &a);
       fflush(stdin);

       if(ChercheConsommation(a)){
          printf("ce consommation dejat existe !\n");

       }

       else{
        c = InfoConsommation();
        c.IdConsommation=a;

           fprintf(F,"%d : %d : %.2f : ", c.IdConsommation, c.IdImmeuble, c.Electricite);
           fprintf(F,"%.2f : %.2f : %.2f : %d\n", c.Eau, c.Menage, c.Autres,c.Annee);
           fclose(F);
        printf("la consommation  est bien ajouter\n");
        }

 }



