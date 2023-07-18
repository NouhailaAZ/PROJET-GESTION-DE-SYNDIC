#include<stdio.h>
#include<stdlib.h>
#include"immeuble.h"
#include"appartement.h"
#include"facture.h"
#include"syndic.h"
#include"personne_app.h"
#include"personne.h"
#include"localisation.h"
#include"consommation.h"
#include"questions.h"

void personne_jamais_etre_syndic()
{
	FILE *S;
	FILE *P;
	syndic s;
	personne p;
	int j,i;
	
	P=fopen("personne.txt","r");
	while(!feof(P))
	{
		j=0;
		fscanf(P,"%d : %s : %s : ",&p.IdPersonne,p.cin,p.NomPersonne );
 		fscanf(P,"%s : %d \n",p.PrenomPersonne,&p.N_Telephone);
 		S=fopen("syndic.txt","r");
		while(!feof(S))
		{
			fscanf(S,"%d : %d : %d \n",&s.IdSyndic,&s.IdPersonne,&s.AnneeSyndic);
 			if(s.IdPersonne==p.IdPersonne)
 				j=1;
 		}		
		if(j==0)
		{
			printf("%d : %s ",p.IdPersonne,p.NomPersonne);
 			printf("%s \n",p.PrenomPersonne);
		}	
	}
	fclose(S);
	fclose(P);
}


void appartement_pas_facture()
{    
	FILE *A,*F;
	facture f;
	appartement a;
	A=fopen("appartements.txt","r");
	int j=0;
	printf("idappartement\t idimmeuble \tN_appartement\n");
	while(!feof(A))
	{   	
			j=0;
			fscanf(A,"%d : %d : %d : %d : %f \n",&a.idappartement,&a.N_appartement,&a.idimmeuble,&a.N_etage,&a.surface);
			F=fopen("FACTURES.txt","r");
			while(!feof(F))
			{
				fscanf(F,"%d : %d : %d : %f : %d \n",&f.Idfacture,&f.IdAppartement,&f.IdSyndic,&f.Cotisation,&f.IdConsomation);
				if(a.idappartement==f.IdAppartement)
				{  
					j=1;
				}
			}
			if(j==0)
				printf("%6d \t\t %6d \t%8d \n",a.idappartement,a.idimmeuble,a.N_appartement);
	}
		fclose(A);
		fclose(F);
}



void cotisation_app_annee()
{
	FILE *F;
	FILE *C;
	FILE *I,*A;
	immeuble i;
	consommation c;
	appartement a;
	facture f;
	int id,ann,j=0,k=0,z=0;
	printf("Donner l'idappartement : ");
	scanf("%d",&id);
	printf("Donner l'annee : ");
	scanf("%d",&ann);
	A=fopen("appartements.txt","r");
	while(!feof(A))
	{
			fscanf(A,"%d : %d : %d : ",&a.idappartement,&a.N_appartement,&a.idimmeuble);
			fscanf(A,"%d : %f \n",&a.N_etage,&a.surface);
			if(a.idappartement==id)
				z=1;
	}
	fclose(A);
	if(z==1)
	{
	
		F=fopen("FACTURES.txt","r");
		while(!feof(F))
		{
			fscanf(F,"%d : %d : %d : %f : %d \n",&f.Idfacture, &f.IdAppartement, &f.IdSyndic,&f.Cotisation,&f.IdConsomation);
	 		if(f.IdAppartement==id)
	 		{
	 			j=1;
			 	C=fopen("consommation.txt","r");
				while(!feof(C))
				{
					fscanf(C,"%d : %d : %f : ",&c.IdConsommation, &c.IdImmeuble, &c.Electricite);
					fscanf(C,"%f : %f : %f : %d\n",&c.Eau,&c.Menage, &c.Autres,&c.Annee);
					if(c.Annee==ann)
					{
						k=1;
						I=fopen("immeubles.txt","r");
			 			while(!feof(I))
			 			{
							fscanf(I,"%d : %d : ",&i.idimmeuble,&i.idlocalisation);
							fscanf(I,"%d : %d \n",&i.nombreetages,&i.nombreappartements); 				
							if((c.IdConsommation==f.IdConsomation)&&(c.IdImmeuble==i.idimmeuble))
							{
								f.Cotisation=(c.Electricite+c.Eau+c.Menage+c.Autres)/i.nombreappartements;
								printf("\n idfacture  idappartement  cotisation   annee \n");
								printf(" %5d\t\t%d\t   %.4f\t%d \n",f.Idfacture,f.IdAppartement,f.Cotisation,c.Annee);
								return ;
							}
						}
					}
		 		}
			}	
		}
	}
	else
	{
		printf("\nCette appartement n'existe pas dans la table appartement ");return;
	}
	
	
	
	if(j==0)
	{
		printf("\nCette appartement n'a pas une facture !");
		return;
	}
	if(k==0)
		{
			printf("\n Cette annee n'existe pas ");
			return;
		}
	else if((j==1)||(k==0))
		printf("\nCette appartement n'a pas une facture dans cette annee !\n");
	
	fclose(C);
	fclose(F);
	fclose(I);
}

void consommation_imm_ann()
{
	FILE *C;
	consommation c;
	float con;
	printf("Idconsommation  Idimmeuble     Consommation     Annee\n");
	C = fopen("consommation.txt","r");
	while(!feof(C))
	{
		fscanf(C,"%d : %d : %f : ",&c.IdConsommation, &c.IdImmeuble, &c.Electricite);
		fscanf(C,"%f : %f : %f :%d\n",&c.Eau,&c.Menage, &c.Autres,&c.Annee);
		con=c.Electricite+c.Eau+c.Menage+c.Autres;
		printf("%6d\t\t %4d \t\t%.4f \t%d \n",c.IdConsommation,c.IdImmeuble,con,c.Annee);
	}
	fclose(C);

}


void per_a_plus_app()
{
	FILE*F,*F1;
	personne c;
	per_app d;
	int k,app;
	printf("Idpersonne    Nompersonne   \tPrenompersonne \n");
	F=fopen("personne.txt","r");
	while(!feof(F))
	{ 
		k=0;
		fscanf(F,"%d : %s : %s : ",&c.IdPersonne, c.cin, c.NomPersonne);
		fscanf(F,"%s :%d \n",c.PrenomPersonne,&c.N_Telephone);
		         
		F1=fopen("personnes_app.txt", "r");
		while (!feof(F1))
		{  
			fscanf(F1,"%d : %d \n",&d.idpersonne,&d.idappartement);
			if(c.IdPersonne==d.idpersonne)
			{
				k++;
			}     
		}
		if(k>1)
		{
			printf(" %5d\t\t%s\t\t  %s \n",c.IdPersonne,c.NomPersonne,c.PrenomPersonne);
		}
	}
			
	fclose(F);
	fclose(F1);	
		
}



void app_a_plus_per()
{
	FILE*F,*F1;
	appartement c;
	per_app d;
	int k;
	printf("Idappartement   Idimmeuble\n");
	F=fopen("appartements.txt","r");
	while(!feof(F))
	{ 
		k=0;
		fscanf(F,"%d : %d : %d :",&c.idappartement,&c.N_appartement,&c.idimmeuble);
		fscanf(F,"%d : %f \n",&c.N_etage,&c.surface);
		F1=	fopen("personnes_app.txt", "r");
		while(!feof(F1))
		{
			fscanf(F1,"%d : %d \n",&d.idpersonne,&d.idappartement);
			if(c.idappartement==d.idappartement)
			{
				k++;
			}  
		}
		if(k==2)
		{
			printf("%5d\t\t%5d \n",c.idappartement,c.idimmeuble);
		}
			
	}
	fclose(F);
	fclose(F1);
}


void syndic_de_plusieur_immmoble()
{
	FILE *F,*F1;
	syndic c;
	int i,k,id,an;
	printf("Idsyndic  Annee\n");
	F=fopen("syndic.txt","r");
	F1=fopen("syndic.txt","r");
	while(!feof(F))
	{
		k=0;
		fscanf(F,"%d : %d : %d \n",&c.IdSyndic, &c.IdPersonne, &c.AnneeSyndic);
		id=c.IdPersonne;
		an=c.AnneeSyndic;
		F1=fopen("syndic.txt","r");
		while(!feof(F1))
		{
			fscanf(F1,"%d : %d : %d \n",&c.IdSyndic, &c.IdPersonne, &c.AnneeSyndic);
			if((c.IdPersonne==id)&&(c.AnneeSyndic==an))
			{
				k++;
			}
		}		   
		if(k>1)
		printf("%4d \t %3d\n",id,an);
		fclose(F1);
	}
	fclose(F);
}



void max_consommation_des_immeuble()
{
	FILE *F;
	float con,*T,max1;
	T=(float*)malloc(1*sizeof(float));
	consommation c;
	int i=0,an,j;
	printf("donner annee : ");
	scanf("%d",&an);
	
	F=fopen("consommation.txt", "r");
	while(!feof(F))      
	{
		fscanf(F,"%d : %d : %f : ",&c.IdConsommation, &c.IdImmeuble, &c.Electricite);
		fscanf(F,"%f : %f : %f : %d\n",&c.Eau,&c.Menage, &c.Autres,&c.Annee);
		if(c.Annee==an)
		{
			con=(c.Electricite+c.Eau+c.Menage+c.Autres);
			T[i]=con;
			T=(float*)realloc(T,(i+1)*sizeof(float));
			i++;
		}
	}
	fclose(F);
	
	max1=T[0];
	for(j=0;j<i;j++)
	{
		if( T[j] >max1)
		max1=T[j];
	
	}
	if(i==0)
		printf("\n Cette annee n'existe pas ");
	else
		printf("la consommation maximale dans cette annee est : %.4f \n",max1);
}


void min_consommation_des_immeuble()
{
	FILE *F;
	float con,*T,min;
	T=(float*)malloc(1*sizeof(float));
	consommation c;
	int i=0,an,j;
	printf("donner annee:");
	scanf("%d",&an);
	F=fopen("consommation.txt", "r");
	while(!feof(F))      
	{
		fscanf(F,"%d : %d : %f : ",&c.IdConsommation, &c.IdImmeuble, &c.Electricite);
		fscanf(F,"%f : %f : %f :%d\n",&c.Eau,&c.Menage, &c.Autres,&c.Annee);
		if(c.Annee==an)
		{
			con=(c.Electricite+c.Eau+c.Menage+c.Autres);
			T[i]=con;
			T=(float*)realloc(T,(i+1)*sizeof(float));
			i++;
		}
	}
	fclose(F);
	min=T[0];
	for(j=0;j<i;j++)
	{
		if( T[j]<min)
			min=T[j];
	}
	if(i==0)
		printf("\n Cette annee n'existe pas ");
	else
		printf("la consommation minimale dans cette annee est: %.4f ",min);	 
}

