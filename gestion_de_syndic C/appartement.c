#include<stdio.h>
#include<stdlib.h>
#include"appartement.h"






int Chercheapp(int a)
{
	FILE *F;
	appartement c;
	int i=0;
	
	F=fopen("appartements.txt", "r");
	
	while(!feof(F))
	{
		fscanf(F,"%d : %d : %d : ",&c.idappartement,&c.N_appartement,&c.idimmeuble);
		fscanf(F,"%d : %f \n",&c.N_etage,&c.surface);
		if(c.idappartement==a)
			i=1;
	}
	
	fclose(F);
	
	return i;
}

void Afficheapp()
{
	FILE *F;
	appartement c;
	
	F=fopen("appartements.txt","r");
	
	printf("Idappartement  N_appartement  idimmeuble  N_etage  surface\n");
	
	while(!feof(F)){
	fscanf(F,"%d : %d : %d : ",&c.idappartement,&c.N_appartement,&c.idimmeuble);
	fscanf(F,"%d : %f \n",&c.N_etage,&c.surface);
	printf("%7d\t\t%7d\t\t%4d",c.idappartement,c.N_appartement,c.idimmeuble);
	printf("\t%5d \t    %.2f\n",c.N_etage,c.surface);
	}
	
	fclose(F);
}

void Chercheapp1()
{
	int x;
	
	printf("saisir le id d'appartement pour le chercher: ");
	scanf("%d", &x);
	fflush(stdin);
	
	if(Chercheapp(x))
	{
		FILE *F;
		appartement c;
		
		F=fopen("appartements.txt", "r");
		
		while(!feof(F))
		{
			fscanf(F,"%d : %d : %d : ",&c.idappartement,&c.N_appartement,&c.idimmeuble);
			fscanf(F,"%d : %f \n",&c.N_etage,&c.surface);

			if(x==c.idappartement)
			{
				printf("Idappartement  N_appartement  idimmeuble  N_etage  surface\n");
				printf("%7d\t\t%7d\t\t%4d",c.idappartement,c.N_appartement,c.idimmeuble);
				printf("\t\t%4d\t\t%.2f\n",c.N_etage,c.surface);
			}
		}
		fclose(F);
	}
	else
	printf("Ce appartement n existe pas !\n");
}		


appartement Infoapp()
{
	appartement x;
	printf("saisir le Numero d'appartement: "); scanf("%d",&x.N_appartement);
	printf("saisir le idimmeuble: "); scanf("%d",&x.idimmeuble);
	printf("saisir le Numero etage: "); scanf("%d",&x.N_etage);
	printf("saisir la surface: ");scanf("%f",&x.surface);
	fflush(stdin);
	return x;
}

void Supprimerapp()
{
	 int x;
	
	 printf("saisir le id d'appartement pour le supprimer: ");
	 scanf("%d", &x);
	 fflush(stdin);
	
	 if(Chercheapp(x))
	 {
		 FILE *F,*F1;
		 appartement c;
		
		 F=fopen("appartements.txt", "r");
		 F1=fopen("file.txt", "w");
		
		 while(!feof(F))
		 {
			fscanf(F,"%d : %d : %d : ",&c.idappartement,&c.N_appartement,&c.idimmeuble);
			fscanf(F,"%d : %f \n",&c.N_etage,&c.surface);
			
			
			if(x!=c.idappartement)
			{
				fprintf(F1,"%d : %d : %d : ",c.idappartement,c.N_appartement,c.idimmeuble);
				fprintf(F1,"%d : %.2f \n",c.N_etage,c.surface);
			}
		 }
		
		 fclose(F);
		 fclose(F1);
		
		 remove("appartements.txt");
		 
		 rename("file.txt","appartements.txt");
		
		 printf("la supprition est bien fait\n");
	 
	 }
	
	 else
	 {
		printf("cette appartement n'existe pas !\n");
	 }
}

void Modifierapp()
{
	  FILE *F,*F1;
	  appartement c;
	  int x;
	
	  printf("saisir le idappartement: ");
	  scanf("%d", &x);
	  fflush(stdin);
	
	  if(Chercheapp(x))
	  {
		F = fopen("appartements.txt","r");
		F1= fopen("file.txt","w");
			
		while(!feof(F))
		{
			fscanf(F,"%d : %d : %d : ",&c.idappartement,&c.N_appartement,&c.idimmeuble);
			fscanf(F,"%d : %f \n",&c.N_etage,&c.surface);
			if(c.idappartement==x)
			{
				printf("pour modifier les donnees d'appartement\n");
				c = Infoapp();
				c.idappartement=x;
			}
				fprintf(F1,"%d : %d : %d : ",c.idappartement,c.N_appartement,c.idimmeuble);
				fprintf(F1,"%d : %.2f \n",c.N_etage,c.surface);
		}
			
		fclose(F);
		fclose(F1);
			
		remove("appartements.txt");
		rename("file.txt","appartements.txt");
			
		printf("la modification est bien fait\n");
	             
	  }
	
		else
		{
			printf("cette appartement n'existe pas !\n");
		}
}

void Ajouterapp()
{
	FILE *F;
	appartement c;
	int  a;
	
	F=fopen("appartements.txt","a");
	
	printf("saisir le id du appartement pour l'ajoute: ");
	scanf("%d", &a);
	fflush(stdin);
	
	if(Chercheapp(a))
	{
		printf("ce appartement dejat existe !\n");      
	}
	
	else
	{
		c = Infoapp();
		c.idappartement=a;
		fprintf(F,"%d : %d : %d : ",c.idappartement,c.N_appartement,c.idimmeuble);
		fprintf(F,"%d : %.2f \n",c.N_etage,c.surface);
		fclose(F);
		printf("l'appartement est bien ajouter\n");
	}

}




