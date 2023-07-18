#include<stdio.h>
#include<stdlib.h>
#include"facture.h"

int Cherchefacture(int a){
  FILE *F;
  facture f;
  int i=0;

 F=fopen("FACTURES.txt", "r");

 while(!feof(F)){
 fscanf(F,"%d : %d : %d : %f : %d \n",&f.Idfacture, &f.IdAppartement, &f.IdSyndic,&f.Cotisation,&f.IdConsomation);
 if(f.Idfacture==a){i=1;break;}
 }

 fclose(F);

 return i;}

void Affichefacture(){
 FILE *F;
facture f;

 F=fopen("FACTURES.txt","r");

 printf("\n Idfacture\t IdAppartemet\t IdSyndic\t Cotisation \t  IdConsomation\n");

 while(!feof(F)){
fscanf(F,"%d : %d : %d : %f : %d \n",&f.Idfacture,&f.IdAppartement,&f.IdSyndic,&f.Cotisation,&f.IdConsomation);
 printf("\n%5d\t\t%6d\t\t%4d\t\t %.4f\t\t%7d\n",f.Idfacture,f.IdAppartement,f.IdSyndic,f.Cotisation,f.IdConsomation);
}

fclose(F);
}

void Cherchefacture1()
{
 int x;

 printf("saisir le id du facture pour le chercher: ");
 scanf("%d", &x);
 fflush(stdin);

 if(Cherchefacture(x)){

 FILE *F;
 facture f;

 F=fopen("FACTURES.txt", "r");

 while(!feof(F)){
      fscanf(F,"%d : %d : %d : %f : %d\n",&f.Idfacture, &f.IdAppartement, &f.IdSyndic,&f.Cotisation,&f.IdConsomation);
if(x==f.Idfacture)
{
           printf("%d : %d : %d : %.4f : %d \n",f.Idfacture, f.IdAppartement, f.IdSyndic,f.Cotisation,f.IdConsomation);
    }
    }

 fclose(F);
 }
 else
 printf("Cette facture n'existe pas !\n");

}

facture Infofacture(){
 facture x;
 printf("saisir le IdAparttement: "); scanf("%d", &x.IdAppartement);
 printf("saisir IdSyndic: "); scanf("%d", &x.IdSyndic);
 printf("saisir Cotisation: "); scanf("%f", &x.Cotisation);
 printf("saisir IdConsomation : "); scanf("%d", &x.IdConsomation);
 fflush(stdin);
return x;
}

void Supprimerfacture(){
 int x;

 printf("saisir le idfacture du facture pour le supprimer: ");
 scanf("%d", &x);
 fflush(stdin);

 if(Cherchefacture(x)){

 FILE *F,*F1;
 facture f;

 F=fopen("FACTURES.txt", "r");
 F1=fopen("file.txt", "w");

 while(!feof(F)){
      fscanf(F,"%d : %d : %d : %f : %d \n",&f.Idfacture, &f.IdAppartement, &f.IdSyndic,&f.Cotisation,&f.IdConsomation);


      if(x!=f.Idfacture)
	  {
            fprintf(F1,"%d : %d : %d : %.4f : %d \n",f.Idfacture, f.IdAppartement, f.IdSyndic,f.Cotisation,f.IdConsomation);
      }
    }

 fclose(F);
 fclose(F1);

 remove("FACTURES.txt");
 rename("file.txt", "FACTURES.txt");

 printf("la supprition est bien fait\n");

 }

 else{
 printf("cette facture n'existe pas !\n");
 }

}

void Modifierfacture()
{
  FILE *F,*F1;
  facture f;
  int x;

  printf("saisir le Idfacture: ");
  scanf("%d", &x);
  fflush(stdin);

  if(Cherchefacture(x))
  {
        F = fopen("FACTURES.txt", "r");
        F1= fopen("file.txt", "w");


        while(!feof(F))
		{
                fscanf(F,"%d : %d : %d : %f : %d \n",&f.Idfacture, &f.IdAppartement, &f.IdSyndic,&f.Cotisation,&f.IdConsomation);

                if(f.Idfacture==x)
				{
                        printf("pour modifier cette facture \n");
                        f = Infofacture();
                        f.Idfacture=x;

                }

                fprintf(F1,"%d : %d : %d : %.4f : %d \n",f.Idfacture, f.IdAppartement, f.IdSyndic,f.Cotisation,f.IdConsomation);
        }

        fclose(F);
        fclose(F1);

        remove("FACTURES.txt");
        rename("file.txt", "FACTURES.txt");

        printf("la modufication est bien fait\n");

 }

 else
 {
      printf("cette facteur n'existe pas !\n");
 }
}

void Ajouterfacture()
{
       FILE *F;
       facture f;
        int  a;

    F=fopen("FACTURES.txt","a");

	printf("saisir le id du facture pour l'ajoute: ");
    scanf("%d", &a);
    fflush(stdin);
	
    if(Cherchefacture(a))
	{
    	printf("cette facture dejat existe !\n");
    }

    else 
	{
        f =Infofacture();
        f.Idfacture=a;
        
        fprintf(F,"%d : %d : %d : %.4f : %d \n",f.Idfacture, f.IdAppartement, f.IdSyndic,f.Cotisation, f.IdConsomation);
        fclose(F);
        printf("la facture est bien ajouter\n");
    }

 }
 


