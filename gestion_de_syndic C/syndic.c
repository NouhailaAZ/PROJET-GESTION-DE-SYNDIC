#include<stdio.h>
#include<stdlib.h>
#include"syndic.h"

int Cherchesyndic(int a){
  FILE *F;
  syndic c;
  int i=0;

 F=fopen("syndic.txt", "r");

 while(!feof(F)){
 fscanf(F,"%d : %d : %d \n",&c.IdSyndic, &c.IdPersonne, &c.AnneeSyndic);
 if(c.IdSyndic==a){i=1;break;}
 }

 fclose(F);

 return i;}

void Affichesyndic(){
 FILE *F;
 syndic c;

 F=fopen("syndic.txt","r");

 printf("\n Idsyndic\t IdPersonne\t AnneeSyndic \n");

 while(!feof(F)){
 fscanf(F,"%d : %d : %d \n",&c.IdSyndic, &c.IdPersonne, &c.AnneeSyndic);
 printf("\n %4d \t\t %4d \t\t %5d\n",c.IdSyndic, c.IdPersonne, c.AnneeSyndic);
}

fclose(F);
}

void Cherchesyndic1()
{
 int x;

 printf("saisir le id du syndic pour le chercher: ");
 scanf("%d", &x);
 fflush(stdin);

 if(Cherchesyndic(x)){

 FILE *F;
 syndic c;

 F=fopen("syndic.txt", "r");

 while(!feof(F)){
      fscanf(F,"%d : %d : %d \n",&c.IdSyndic, &c.IdPersonne, &c.AnneeSyndic);
	if(x==c.IdSyndic)
	{
           printf("%d : %d : %d \n", c.IdSyndic, c.IdPersonne, c.AnneeSyndic);
    }
    }

 fclose(F);
 }
 else
 printf("Ce syndic n existe pas !\n");

}

syndic Infosyndic(){
 syndic x;
 printf("saisir le IdPersonne: "); scanf("%d", &x.IdPersonne);
 printf("saisir l AnneeSyndic: "); scanf("%d", &x.AnneeSyndic);
 fflush(stdin);
return x;}

void Supprimersyndic(){
 int x;

 printf("saisir le id du syndic pour le supprimer: ");
 scanf("%d", &x);
 fflush(stdin);

 if(Cherchesyndic(x)){

 FILE *F,*F1;
 syndic c;

 F=fopen("syndic.txt", "r");
 F1=fopen("file.txt", "w");

 while(!feof(F)){
      fscanf(F,"%d : %d : %d \n",&c.IdSyndic, &c.IdPersonne,&c.AnneeSyndic);


      if(x!=c.IdSyndic){
           fprintf(F1,"%d : %d : %d \n",c.IdSyndic, c.IdPersonne,c.AnneeSyndic);
                           }
    }

 fclose(F);
 fclose(F1);

 remove("syndic.txt");
 rename("file.txt","syndic.txt");

 printf("la supprition est bien fait\n");

 }

 else{
 printf("ce syndic n'existe pas !\n");
 }

}

void Modifiersyndic(){
  FILE *F,*F1;
  syndic c;
  int x;

  printf("saisir le Idsyndic: ");
  scanf("%d", &x);
  fflush(stdin);

  if(Cherchesyndic(x)){
             F = fopen("syndic.txt", "r");
             F1= fopen("file.txt", "w");


             while(!feof(F)){
                        fscanf(F,"%d : %d : %d \n",&c.IdSyndic, &c.IdPersonne,&c.AnneeSyndic);

                        if(c.IdSyndic==x){
                        printf("pour modifier ce syndic n");
                        c = Infosyndic();
                        c.IdSyndic=x;

                        }

                        fprintf(F1,"%d : %d : %d \n",c.IdSyndic, c.IdPersonne,c.AnneeSyndic);
             }

             fclose(F);
             fclose(F1);

             remove("syndic.txt");
             rename("file.txt","syndic.txt");

             printf("la modufication est bien fait\n");

 }

 else{
      printf("ce syndic n'existe pas !\n");

      }
 }

void Ajoutersyndic(){
       FILE *F;
       syndic c;
        int  a;

       F=fopen("syndic.txt","a");

       printf("saisir le id du syndic pour l'ajoute: ");
       scanf("%d", &a);
       fflush(stdin);

       if(Cherchesyndic(a)){
          printf("ce syndic dejat existe !\n");

       }

       else{
        c = Infosyndic();
        c.IdSyndic=a;
        fprintf(F, "%d : %d : %d \n" ,c.IdSyndic, c.IdPersonne, c.AnneeSyndic);
        fclose(F);
        printf("le syndic est bien ajouter\n");
        }

 }



