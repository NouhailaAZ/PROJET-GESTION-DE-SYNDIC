#include<stdio.h>
#include<stdlib.h>
#include"immeuble.h"






int Chercheimm(int a)
{
	FILE *F;
	immeuble c;
	int i=0;
	
	F=fopen("immeubles.txt", "r");
	
	while(!feof(F))
	{
		fscanf(F,"%d : %d : ",&c.idimmeuble,&c.idlocalisation);
		fscanf(F,"%d : %d \n",&c.nombreetages,&c.nombreappartements);
		if(c.idimmeuble==a)
			i=1;
	}
	
	fclose(F);
	
	return i;
}

void Afficheimm()
{
	FILE *F;
	immeuble c;
	
	F=fopen("immeubles.txt","r");
	
	printf("IdImmeuble  IdLocalisation  NombreEtages  NombreAppartements\n");
	
	while(!feof(F)){
	fscanf(F,"%d : %d : ",&c.idimmeuble,&c.idlocalisation);
	fscanf(F,"%d : %d \n",&c.nombreetages,&c.nombreappartements);
	printf("%4d\t\t%d\t",c.idimmeuble,c.idlocalisation);
	printf("\t%d\t\t%d\n",c.nombreetages,c.nombreappartements);
	}
	
	fclose(F);
}

void Chercheimm1()
{
	int x;
	
	printf("saisir le id d'immeuble pour le chercher: ");
	scanf("%d", &x);
	fflush(stdin);
	
	if(Chercheimm(x))
	{
		FILE *F;
		immeuble c;
		
		F=fopen("immeubles.txt", "r");
		
		while(!feof(F))
		{
			fscanf(F,"%d : %d : ",&c.idimmeuble,&c.idlocalisation);
			fscanf(F,"%d : %d \n",&c.nombreetages,&c.nombreappartements);
			if(x==c.idimmeuble)
			{
				printf("IdImmeuble  IdLocalisation  NombreEtages  NombreAppartements\n");
				printf("%d\t\t%d\t\t",c.idimmeuble,c.idlocalisation);
				printf("%d\t\t%d \n",c.nombreetages,c.nombreappartements);
			}
		}
		fclose(F);
	}
	else
	printf("Ce immeuble n existe pas !\n");
}		


immeuble Infoimm()
{
	immeuble x;
	printf("saisir la localisation: "); scanf("%d",&x.idlocalisation);
	printf("saisir le nombre etages: "); scanf("%d",&x.nombreetages);
	printf("saisir le nombreappartements: "); scanf("%d",&x.nombreappartements);
	fflush(stdin);
	return x;
}

void Supprimerimm()
{
	 int x;
	
	 printf("saisir le id d'immeuble pour le supprimer: ");
	 scanf("%d", &x);
	 fflush(stdin);
	
	 if(Chercheimm(x))
	 {
		 FILE *F,*F1;
		 immeuble c;
		
		 F=fopen("immeubles.txt", "r");
		 F1=fopen("file.txt", "w");
		
		 while(!feof(F))
		 {
			fscanf(F,"%d : %d : ",&c.idimmeuble,&c.idlocalisation);
			fscanf(F,"%d : %d \n",&c.nombreetages,&c.nombreappartements);
			
			
			if(x!=c.idimmeuble)
			{
				fprintf(F1,"%d : %d : ",c.idimmeuble,c.idlocalisation);
				fprintf(F1,"%d : %d \n",c.nombreetages,c.nombreappartements);
			}
		 }
		
		 fclose(F);
		 fclose(F1);
		
		 remove("immeubles.txt");
		 rename("file.txt","immeubles.txt");
		
		 printf("la supprition est bien fait\n");
	 
	 }
	
	 else
	 {
		printf("ce immeuble n'existe pas !\n");
	 }
}

void Modifierimm()
{
	  FILE *F,*F1;
	  immeuble c;
	  int x;
	
	  printf("saisir le idimmeuble: ");
	  scanf("%d", &x);
	  fflush(stdin);
	
	  if(Chercheimm(x))
	  {
		F = fopen("immeubles.txt","r");
		F1= fopen("file.txt","w");
			
		while(!feof(F))
		{
			fscanf(F,"%d : %d : ",&c.idimmeuble,&c.idlocalisation);
			fscanf(F,"%d : %d \n",&c.nombreetages,&c.nombreappartements);
			if(c.idimmeuble==x)
			{
				printf("pour modifier ce immeuble\n");
				c = Infoimm();
				c.idimmeuble=x;
			}
			fprintf(F1,"%d : %d : ",c.idimmeuble,c.idlocalisation);
			fprintf(F1,"%d : %d \n",c.nombreetages,c.nombreappartements);
		}
			
		fclose(F);
		fclose(F1);
			
		remove("immeubles.txt");
		rename("file.txt","immeubles.txt");
			
		printf("la modification est bien fait\n");
	             
	  }
	
		else
		{
			printf("ce immeuble n'existe pas !\n");
		}
}

void Ajouterimm()
{
	FILE *F;
	immeuble c;
	int  a;
	
	F=fopen("immeubles.txt","a");
	
	printf("saisir le id du immeuble pour l'ajoute: ");
	scanf("%d", &a);
	fflush(stdin);
	
	if(Chercheimm(a))
	{
		printf("ce immeuble dejat existe !\n");      
	}
	
	else
	{
		c = Infoimm();
		c.idimmeuble=a;
		fprintf(F,"%d : %d : ",c.idimmeuble,c.idlocalisation);
		fprintf(F,"%d : %d \n",c.nombreetages,c.nombreappartements);
		fclose(F);
		printf("l'immeuble' est bien ajouter\n");
	}

}



