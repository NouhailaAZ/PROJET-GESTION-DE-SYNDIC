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
#include"menu.h"

void menu_immeuble()
{
		int x;
        do
		{
              printf("\n");
              printf("------------MENU IMMEUBLE-------------\n\n");
              printf("1) Quitter le menu .\n");
              printf("2) Liste des immeubles .\n");
              printf("3) Ajouter immeuble .\n");
              printf("4) Modifier immeuble .\n");
              printf("5) Chercher immeuble .\n");
              printf("6) Supprimer immeuble .\n\n");
              printf(" ----> Sisir votre choix [1,6]: ");
              scanf("%d",&x);
              fflush(stdin);
              

              switch(x)
			  {
              		case 1 :
					 	printf("\n Sortir") ;
						return ;
                    case 2:
                     	Afficheimm();
                    break;

                    case 3:
                     	Ajouterimm();
                    break;

                    case 4:
                    	Modifierimm();
                    break;
                    
                    case 5:
                    	Chercheimm1();
                    break;

                    case 6:
                     	Supprimerimm();
                    break;

                    default:
                    	printf("\n Option non geree");
                    break;
             }
        }
		while(x!=1);
}


void menu_appartement()
{
		int x;
        do
		{
              printf("\n");
              printf("------------MENU APPARTEMENT-------------\n\n");
              printf("1) Quitter le menu .\n");
              printf("2) Liste des appartements .\n");
              printf("3) Ajouter appartement .\n");
              printf("4) Modifier appartement .\n");
              printf("5) Chercher appartement .\n");
              printf("6) Supprimer appartement .\n\n");
              printf(" ----> Sisir votre choix [1,6]: ");
              scanf("%d",&x);
              fflush(stdin);
              

              switch(x)
			  {
              		case 1 :
					 	printf("\n Sortir") ;
						return ;
                    case 2:
                     	Afficheapp();
                    break;

                    case 3:
                     	Ajouterapp();
                    break;

                    case 4:
                    	Modifierapp();
                    break;
                    
                    case 5:
                    	Chercheapp1();
                    break;

                    case 6:
                     	Supprimerapp();
                    break;

                    default:
                    	printf("\n Option non geree");
                    break;
             }
        }
		while(x!=1);
}


void menu_facture()
{
		int x;
        do
		{
              printf("\n");
              printf("------MENU FACTURE------\n\n");
              printf("1) Quitter le menu .\n");
              printf("2) liste des factures .\n");
              printf("3) Ajouter facture .\n");
              printf("4) Modifier facture .\n");
              printf("5) chercher facture .\n");
              printf("6) Supprimer facture .\n\n");
              printf(" ----> Sisir votre choix [1,6]: ");
              scanf("%d",&x);
              fflush(stdin);


              switch(x)
			  {
              		case 1 :
					 	printf("\n Sortir") ;
						return ;
                    case 2:
                     	Affichefacture();
                    break;

                    case 3:
						Ajouterfacture();
                    break;

                    case 4:
						Modifierfacture();
                    break;

                    case 5:
                    	Cherchefacture1();
                    break;

                    case 6:
                     	Supprimerfacture();
                    break;

                    default:
                    	printf("\n Option non geree");
                    break;
             }
        }
		while(x!=1);
}

void menu_syndic()
{
		int x;
        do
		{
              printf("\n");
              printf("------MENU SYNDIC------\n\n");
              printf("1) Quitter le menu .\n");
              printf("2) Liste des syndics .\n");
              printf("3) Ajouter syndic .\n");
              printf("4) Modifier syndic .\n");
              printf("5) Chercher syndic .\n");
              printf("6) Supprimer syndic .\n\n");
              printf(" ----> Sisir votre choix [1,6]: ");
              scanf("%d",&x);
              fflush(stdin);


              switch(x)
			  {
              		case 1 :
					 	printf("\n Sortir ") ;
						return ;
                    case 2:
                     	Affichesyndic();
                    break;

                    case 3:
                     	Ajoutersyndic();
                    break;

                    case 4:
                    	Modifiersyndic();
                    break;

                    case 5:
                    	Cherchesyndic1();
                    break;

                    case 6:
                     	Supprimersyndic();
                    break;

                    default:
                    	printf("\n Option non geree");
                    break;
             }
        }
		while(x!=1);
}


void menu_personne_app()
{
		int x;
        do
		{
              printf("\n");
              printf("------------MENU PERSONNE_APP-------------\n\n");
              printf("1) Quitter le menu .\n");
              printf("2) Liste des propruetaire des appartements .\n");
              printf("3) Ajouter proprietaire d'un appartement .\n");
              printf("4) Modifier proprietaire de l'appartement .\n");
              printf("5) Chercher a la proprietaire d'un appartement .\n");
              printf("6) Supprimer prs_app .\n\n");
              printf(" ----> Sisir votre choix [1,6]: ");
              scanf("%d",&x);
              fflush(stdin);
              

              switch(x)
			  {
              		case 1 :
					 printf("\n Sortir") ;
					return ;
                    case 2:
                     Afficheper_app();
                    break;

                    case 3:
                     Ajouterper_app();
                    break;

                    case 4:
                    ModifierProprietaire_app();
                    break;
                    
                    case 5:
                    Chercheapp_per1();
                    break;

                    case 6:
                     Supprimerper_app();
                    break;

                    default:
                    printf("\n Option non geree");
                    break;
             }
        }
		while(x!=1);
}

void menu_Personne()
{
		int x;
        do
		{
              printf("\n");
              printf("------MENU PERSONNE------\n\n");
              printf("1) Quitter le menu .\n");
              printf("2) Liste des personnes .\n");
              printf("3) Ajouter personne .\n");
              printf("4) Modifier personne .\n");
              printf("5) Chercher personne .\n");
              printf("6) Supprimer personne .\n\n");
              printf(" ----> Sisir votre choix [1,6]: ");
              scanf("%d",&x);
              fflush(stdin);


              switch(x)
			  {
              		case 1 :
						printf("\n Sortir") ;
						return ;
                    case 2:
                 		AffichePersonne();
                    break;

                    case 3:
                     	AjouterPersonne();
                    break;

                    case 4:
                    	ModifierPersonne();
                    break;

                    case 5:
                   		CherchePersonne1();
                    break;

                    case 6:
                     	SupprimerPersonne();
                    break;

                    default:
                    	printf("\n Option non geree");
                    break;
             }
        }
		while(x!=1);
}


void menu_Localisation()
{
		int x;
        do
		{
              printf("\n");
              printf("------MENU Localisation------\n\n");
              printf("1) Quitter le menu .\n");
              printf("2) Liste des Localisations .\n");
              printf("3) Ajouter Localisation .\n");
              printf("4) Modifier Localisation .\n");
              printf("5) Chercher Localisation .\n");
              printf("6) Supprimer Localisation .\n\n");
              printf(" ----> Sisir votre choix [1,6]: ");
              scanf("%d",&x);
              fflush(stdin);


              switch(x)
			  {
              		case 1 :
						printf("\n Sortir") ;
						return ;
                    case 2:
                 		AfficheLocal();
                    break;

                    case 3:
                     	AjouterLocal();
                    break;

                    case 4:
                    	ModifierLocal();
                    break;

                    case 5:
                   		ChercheLocal1();
                    break;

                    case 6:
                     	SupprimerLocal();
                    break;

                    default:
                    	printf("\n Option non geree");
                    break;
             }
        }
		while(x!=1);
}


void menu_Consommation()
{
		int x;
        do
		{
              printf("\n");
              printf("------MENU CONSOMMATION------\n\n");
              printf("1) Quitter le menu .\n");
              printf("2) Liste des consommations .\n");
              printf("3) Ajouter consommation .\n");
              printf("4) Modifier consommation .\n");
              printf("5) Chercher consommation .\n");
              printf("6) Supprimer consommation .\n\n");
              printf(" ----> Sisir votre choix [1,6]: ");
              scanf("%d",&x);
              fflush(stdin);


              switch(x)
			  {
              		case 1 :
					 printf("\n Sortir") ;
					return ;
                    case 2:
                     AfficheConsommation();
                    break;

                    case 3:
                     AjouterConsommation();
                    break;

                    case 4:
                    ModifierConsommation();
                    break;

                    case 5:
                    ChercheConsommation1();
                    break;

                    case 6:
                     SupprimerConsommation();
                    break;

                    default:
                    printf("\n Option non geree");
                    break;
             }
        }
		while(x!=1);
}



void menu_qst()
{
		int x;
        do
		{
              printf("\n");
              printf("------MENU QUESTION------\n\n");
              printf("1) Quitter le menu .\n");
              printf("2) Liste des personnes qui ne sont pas syndic .\n");
              printf("3) Liste des appartements qui n'ont pas une facture .\n");
              printf("4) Cotisation d'un appartement dans une annee .\n");
              printf("5) Consommation des immeubles dans chaque annee .\n");
              printf("6) Liste des personnes qui ont plus d'un appartement .\n");
              printf("7) Liste des appartements qui ont plus d'un proprietaire .\n");
              printf("8) Liste des syndics ont plusieurs immeubles dans l'annee .\n");
              printf("9) La consommation maximale dans une annee .\n");
              printf("10) La consommation minimale dans une annee .\n\n");
              printf(" ----> Sisir votre choix [1,10]: ");
              scanf("%d",&x);
              fflush(stdin);


              switch(x) 
			  {
              		case 1 :
					 printf("\n Sortir") ;
					return ;
                    case 2:
                     printf("Liste des personnes qui ne sont pas syndic\n");
                     personne_jamais_etre_syndic();
                    break;

                    case 3:
                    	printf("Liste des appartements qui n'ont pas une facture .\n");
                     appartement_pas_facture();
                    break;

                    case 4:
                     cotisation_app_annee();
                    break;

                    case 5:
                    	printf("Consommation des immeubles dans chaque annee .\n");
                     consommation_imm_ann();
                    break;

                    case 6:
                    	printf("Liste des personnes qui ont plus d'un appartement .\n");
                     per_a_plus_app();
                    break;

					case 7:
						printf("Liste des appartements qui ont plus d'un proprietaire .\n");
                     app_a_plus_per();
                    break;
                    
                    case 8:
                    	printf("Liste des syndics ont plusieurs immeubles dans l'annee .\n");
                     syndic_de_plusieur_immmoble();
                    break;
                    
                    case 9:
                    	printf("La consommation maximale dans une annee .\n");
                     max_consommation_des_immeuble();
                    break;
                    
                    case 10:
                    	printf("La consommation minimale dans une annee .\n");
                     min_consommation_des_immeuble();
                    break;
                    
                    default:
                    printf("\n Option non geree");
                    break;
             }
        }
		while(x!=1);
}


