#include<stdio.h>
#include<stdlib.h>
#include"personne_app.h"




int Chercheapp_p(int a)
{
	FILE *F;
	per_app c;
	int i=0;
	
	F=fopen("personnes_app.txt", "r");
	
	while(!feof(F))
	{
		fscanf(F,"%d : %d \n",&c.idpersonne,&c.idappartement);
		if(a==c.idappartement)
			i=1;
	}
	
	fclose(F);
	
	return i;
}







int Chercheper_app(int a,int b)
{
	FILE *F;
	per_app c;
	int j=0;
	
	F=fopen("personnes_app.txt", "r");
	
	while(!feof(F))
	{
		fscanf(F,"%d : %d \n",&c.idpersonne,&c.idappartement);
		if((c.idappartement==a)&&(c.idpersonne==b))
			j=1;
	}
	
	fclose(F);
	
	return j;
}

void Afficheper_app()
{
	FILE *F;
	per_app c;
	
	F=fopen("personnes_app.txt","r");
	
	printf("Idpersonne   Idappartement  \n");
	
	while(!feof(F)){
	fscanf(F,"%d : %d \n",&c.idpersonne,&c.idappartement);
	printf("%5d\t\t%7d\n",c.idpersonne,c.idappartement);
	}
	
	fclose(F);
}

void Chercheapp_per1()
{
	int x;
	
	printf("saisir le id d'appartement pour chercher a ses proprietaires: \n");
	scanf("%d", &x);
	fflush(stdin);
	
	if(Chercheapp_p(x))
	{
		FILE *F;
		per_app c;
		
		F=fopen("personnes_app.txt", "r");
		
		while(!feof(F))
		{
			fscanf(F,"%d : %d \n",&c.idpersonne,&c.idappartement);

			if(x==c.idappartement)
			{
				printf("Idpersonne   Idappartement  \n");
				printf("%4d\t\t%4d\n",c.idpersonne,c.idappartement);
			}
		}
		fclose(F);
	}
	else
	printf("Cette appartement n existe pas !\n");
}		




void Supprimerper_app()
{
	 int x,y;
	 
	 printf("\n saisir le id de personne pour le supprimer: ");
	 scanf("%d", &y);
	 printf("saisir le id de son appartement : ");
	 scanf("%d", &x);
	 
	 
	 fflush(stdin);
	 if(Chercheper_app(x,y))
	 {
		 FILE *F,*F1;
		 per_app c;
		
		 F=fopen("personnes_app.txt", "r");
		 F1=fopen("file.txt", "w");
		
		 while(!feof(F))
		 {
			fscanf(F,"%d : %d \n",&c.idpersonne,&c.idappartement);
			
			
			if((x!=c.idappartement)||(y!=c.idpersonne))
			{
				fprintf(F1,"%d : %d \n",c.idpersonne,c.idappartement);
			}
		 }
		
		 fclose(F);
		 fclose(F1);
		
		 remove("personnes_app.txt");
		 rename("file.txt","personnes_app.txt");
		
		 printf("la supprition est bien fait\n");
		 
	 	 printf("N'oubliez pas d'AJOUER le id d'appartement et sa nouvelle PROPRIETAIRE \n");
	 
	 }
	
	 else
	 {
		printf("ce personne et sa appartement n'existent pas !\n");
	 }
} 





void ModifierProprietaire_app()
{
	  FILE *F,*F1;
	  per_app c;
	  int x,y,z;
	
	  printf("saisir le idappartement: ");
	  scanf("%d",&x);
	  fflush(stdin);
	  if(Chercheapp_p(x))
	  {
	  	  printf("Donnez id personne de l'ancien Proprietaire de l'appartement\n");
		  scanf("%d",&z);
		  if(Chercheper_app(x,z))
		  {
			  printf("Donnez id personne pour modifier le Proprietaire de l'appartement\n");
			  scanf("%d",&y);
			  
			  if(Chercheper_app(x,y))
		      {
		      	printf("Deja EXIST  !\n");
			  }
			  else
		  	  {
					F = fopen("personnes_app.txt","r");
					F1= fopen("file.txt","w");
						
					while(!feof(F))
					{
						fscanf(F,"%d : %d \n",&c.idpersonne,&c.idappartement);
						if((c.idappartement==x)&&(c.idpersonne==z))
						{
							c.idpersonne=y;
							c.idappartement=x;
						}
							fprintf(F1,"%d : %d \n",c.idpersonne,c.idappartement);
					}
						
					fclose(F);
					fclose(F1);
						
					remove("personnes_app.txt");
					rename("file.txt","personnes_app.txt");
						
					printf("la modification est bien fait\n");
			    }
			  	
		  }
		  else
		  printf("cette appartement n'a pas un proprietaire qui a ce id personne \n");
		
		  
	  }
	  else
	  printf("Cette appartement n'existe pas !\n");
}

void Ajouterper_app()
{
	FILE *F;
	per_app c;
	int  a,b;
	
	F=fopen("personnes_app.txt","a");
	
	printf("id du personne : ");
	scanf("%d",&b);
	printf("\n id de s'appartement pour ajouter: ");
	scanf("%d",&a);
	fflush(stdin);
	
	if(Chercheper_app(a,b))
	{
		printf("ce personne et sa appartement sont dejat existe !\n");      
	}
	
	else
	{
		c.idpersonne=b;
		c.idappartement=a;
		fprintf(F,"%d : %d \n",c.idpersonne,c.idappartement);
		fclose(F);
		printf("ils sont bien ajouter\n");
	}

}



