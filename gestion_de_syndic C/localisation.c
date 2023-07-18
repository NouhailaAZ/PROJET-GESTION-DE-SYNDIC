#include<stdio.h>
#include<stdlib.h>
#include"localisation.h"



int Cherchelocal(int a)
{
   FILE *F;
  localisation c;
  int i=0;
 F=fopen("localisation.txt", "r");

 while(!feof(F))
 {
	 fscanf(F,"%d : %s : %s \n",&c.Idlocalisation, c.NomQuarties,c.Adresse);
	
	 if(c.Idlocalisation==a)
	 {
		 i=1;
		 break;
	 }
 }

 fclose(F);

 return i;
}

void AfficheLocal(){
 FILE *F;
localisation c;

 F=fopen("localisation.txt","r");

 printf("Idlocalisation \t NomQuarties  \tAdresse\n");

 while(!feof(F)){
 fscanf(F,"%d : %s : %s \n",&c.Idlocalisation, c.NomQuarties, c.Adresse);
 printf("%6d\t\t %s\t\t%s\n",c.Idlocalisation, c.NomQuarties, c.Adresse);
}

fclose(F);
}

void ChercheLocal1()
{
 int x;

 printf("saisir le id du localisation pour le chercher: ");
 scanf("%d", &x);
 fflush(stdin);

 if(Cherchelocal(x)){

 FILE *F;
 localisation c;

 F=fopen("localisation.txt", "r");

 while(!feof(F)){
       fscanf(F,"%d : %s : %s \n",&c.Idlocalisation, c.NomQuarties, c.Adresse);
	if(x==c.Idlocalisation)
	{
           printf("%d : %s : %s \n", c.Idlocalisation, c.NomQuarties, c.Adresse);

    }
    }

 fclose(F);


 }
 else
 printf("Cette localisation  n'existe pas !\n");

}

localisation InfoLocal(){
localisation x;
 printf("saisir le nomQuartie: "); scanf("%s", x.NomQuarties);
 printf("saisir l'adresse et le séparer avec '_' pas 'espace': "); scanf("%s",x.Adresse);
return x;}

void SupprimerLocal(){
 int x;

 printf("saisir le id du localisation pour le supprimer: ");
 scanf("%d", &x);
 fflush(stdin);

 if(Cherchelocal(x)){

 FILE *F,*F1;
 localisation c;

 F=fopen("localisation.txt", "r");
 F1=fopen("file.txt", "w");

 while(!feof(F)){
       fscanf(F,"%d : %s : %s \n",&c.Idlocalisation, c.NomQuarties, c.Adresse);

      if(x!=c.Idlocalisation){
           fprintf(F1,"%d : %s : %s \n", c.Idlocalisation, c.NomQuarties, c.Adresse);


                           }
    }

 fclose(F);
 fclose(F1);

 remove("localisation.txt");
 rename("file.txt", "localisation.txt");

 printf("la supprition est bien fait\n");

 }

 else{
 printf("Cette localisation n'existe pas !\n");
 }

}

void ModifierLocal(){
  FILE *F,*F1;
 localisation c;
  int x;

  printf("saisir le Idlocalisation: ");
  scanf("%d", &x);
  fflush(stdin);

  if(Cherchelocal(x)){
             F = fopen("localisation.txt", "r");
             F1= fopen("file.txt", "w");

             while(!feof(F)){
                        fscanf(F,"%d : %s : %s \n",&c.Idlocalisation, c.NomQuarties, c.Adresse);

                        if(c.Idlocalisation==x){
                        printf("pour modifier ce personne\n");
                        c = InfoLocal();
                        c.Idlocalisation=x;

                        }

                        fprintf(F1,"%d : %s : %s \n", c.Idlocalisation, c.NomQuarties, c.Adresse);
             }

             fclose(F);
             fclose(F1);

             remove("localisation.txt");
             rename("file.txt", "localisation.txt");

             printf("la modufication est bien fait\n");

 }

 else{
      printf("Cette localisation n'existe pas !\n");

      }
 }

void AjouterLocal(){
       FILE *F;
      localisation c;
        int  a;

       F=fopen("localisation.txt","a");

       printf("saisir le id du locale pour l'ajoute: ");
       scanf("%d", &a);
       fflush(stdin);

       if(Cherchelocal(a)){
          printf("Cette localisation dejat existe !\n");

       }

       else{
        c = InfoLocal();
        c.Idlocalisation=a;
         fprintf(F,"%d : %s : %s \n", c.Idlocalisation, c.NomQuarties, c.Adresse);
        fclose(F);
        printf("la localisation est bien ajouter\n");
        }

 }



