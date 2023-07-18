#include<stdio.h> 
#include<stdlib.h>
#include"menu.h"

void MENU()
{
		int x;
        do
		{
              printf("\n");
              printf("---------------MENU----------------\n\n");
              printf("1) Quitter le programme .\n");
              printf("2) Menu des localisations .\n");
              printf("3) Menu des immeubles .\n");
              printf("4) Menu des appartements .\n");
              printf("5) Menu des proprietaires .\n");
              printf("6) Menu des syndics .\n");
              printf("7) Menu des factures .\n");
              printf("8) Menu des consommations .\n");
              printf("9) Menu des appartements_proprietaires .\n");
              printf("10) Menu des questions .\n\n");
              printf(" ----> Sisir votre choix [1,10]: ");
              scanf("%d",&x);
              fflush(stdin);
              

              switch(x)
			  {
              		case 1 :
					 	printf("\n Sortie du programme") ;
						return ;
                    case 2:
                     	menu_Localisation();
                    break;

                    case 3:
                     	menu_immeuble();
                    break;

                    case 4:
                    	menu_appartement();
                    break;
                    
                    case 5:
                    	menu_Personne();
                    break;

                    case 6:
                     	menu_syndic();
                    break;
                    
                    case 7:
                     	menu_facture();
                    break;
                    
                    case 8:
                     	menu_Consommation();
                    break;
                    
                    case 9:
                     	menu_personne_app();
                    break;
                    
                    case 10:
                    	menu_qst();
                    break;

                    default:
                    	printf("\n Option non geree");
                    break; 
             }
        }
		while(x!=1);
}

int main()
{
	MENU();
}
