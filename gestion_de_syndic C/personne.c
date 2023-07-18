#include<stdio.h>
#include<stdlib.h>
#include"personne.h"





int CherchePersonne(int a){
  FILE *F;
  personne c;
  int i=0;
 F=fopen("personne.txt", "r");

 while(!feof(F)){
 fscanf(F,"%d : %s : %s : ",&c.IdPersonne, c.cin,c.NomPersonne );
 fscanf(F,"%s : %d\n",c.PrenomPersonne, &c.N_Telephone);
 if(c.IdPersonne==a)
 {
 	i=1;
	 break;
 }
 }

 fclose(F);

 return i;}

void AffichePersonne(){
 FILE *F;
personne c;

 F=fopen("personne.txt","r");

 printf("idpersonne\t cin   \t\t NomPersonne  \tPrenomPersonne \t N_telephone\n");

 while(!feof(F)){
 fscanf(F,"%d : %s : %s : ",&c.IdPersonne, c.cin, c.NomPersonne);
 fscanf(F,"%s : %d\n",c.PrenomPersonne,&c.N_Telephone);
 printf("%4d\t\t%s\t\t%s",c.IdPersonne, c.cin, c.NomPersonne);
 printf("\t\t%s\t\t%d\n",c.PrenomPersonne,  c.N_Telephone);
}

fclose(F);
}

void CherchePersonne1()
{
 int x;

 printf("saisir le id du personne pour le chercher: ");
 scanf("%d", &x);
 fflush(stdin);

 if(CherchePersonne(x)){

 FILE *F;
 personne c;

 F=fopen("personne.txt", "r");

 while(!feof(F)){
       fscanf(F,"%d : %s : %s : ",&c.IdPersonne, c.cin, c.NomPersonne);
     fscanf(F,"%s : %d\n",c.PrenomPersonne,&c.N_Telephone);
	if(x==c.IdPersonne)
	{
           printf("%d : %s : %s : ", c.IdPersonne, c.cin, c.NomPersonne);
           printf("%s : %d\n", c.PrenomPersonne, c.N_Telephone);
    }
    }

 fclose(F);


 }
 else
 printf("Ce personne n existe pas !\n");

}

personne InfoPersonne(){
 personne x;
 printf("saisir le cin: "); scanf("%s", x.cin);
 printf("saisir le nom: "); scanf("%s", x.NomPersonne);
 printf("saisir le prenom: "); scanf("%s", x.PrenomPersonne);
 printf("saisir le telephone: "); scanf("%d", &x.N_Telephone);
 fflush(stdin);
return x;}

void SupprimerPersonne(){
 int x;

 printf("saisir le id du personne pour le supprimer: ");
 scanf("%d", &x);
 fflush(stdin);

 if(CherchePersonne(x)){

 FILE *F,*F1;
 personne c;

 F=fopen("personne.txt", "r");
 F1=fopen("file.txt", "w");

 while(!feof(F)){
       fscanf(F,"%d : %s : %s : ",&c.IdPersonne, c.cin, c.NomPersonne);
       fscanf(F,"%s : %d\n",c.PrenomPersonne,&c.N_Telephone);

      if(x!=c.IdPersonne){
           fprintf(F1,"%d : %s : %s : ", c.IdPersonne, c.cin, c.NomPersonne);
           fprintf(F1,"%s : %d\n", c.PrenomPersonne, c.N_Telephone);
                           }
    }

 fclose(F);
 fclose(F1);

 remove("personne.txt");
 rename("file.txt", "personne.txt");

 printf("la supprition est bien fait\n");

 }

 else{
 printf("ce personne n'existe pas !\n");
 }

}

void ModifierPersonne(){
  FILE *F,*F1;
 personne c;
  int x;

  printf("saisir le Idpersonne pour modifier: ");
  scanf("%d", &x);
  fflush(stdin);

  if(CherchePersonne(x)){
             F = fopen("personne.txt", "r");
             F1= fopen("file.txt", "w");

             while(!feof(F)){
                       fscanf(F,"%d : %s : %s : ",&c.IdPersonne, c.cin, c.NomPersonne);
                        fscanf(F,"%s : %d\n",c.PrenomPersonne,&c.N_Telephone);

                        if(c.IdPersonne==x){
                        printf("pour modifier ce personne\n");
                        c = InfoPersonne();
                        c.IdPersonne=x;

                        }

                         fprintf(F1,"%d : %s : %s : ", c.IdPersonne, c.cin, c.NomPersonne);
                         fprintf(F1,"%s : %d\n", c.PrenomPersonne, c.N_Telephone);
             }

             fclose(F);
             fclose(F1);

             remove("personne.txt");
             rename("file.txt", "personne.txt");

             printf("la modufication est bien fait\n");

 }

 else{
      printf("ce personne n'existe pas !\n");

      }
 }

void AjouterPersonne(){
       FILE *F;
       personne c;
        int  a;

       F=fopen("personne.txt","a");

       printf("saisir le id du personne pour l'ajoute: ");
       scanf("%d", &a);
       fflush(stdin);

       if(CherchePersonne(a)){
          printf("ce personne dejat existe !\n");

       }

       else{
        c = InfoPersonne();
        c.IdPersonne=a;
        fprintf(F,"%d : %s : %s : ", c.IdPersonne, c.cin, c.NomPersonne);
        fprintf(F,"%s : %d\n", c.PrenomPersonne, c.N_Telephone);
        fclose(F);
        printf("le personne est bien ajouter\n");
        }

 }



