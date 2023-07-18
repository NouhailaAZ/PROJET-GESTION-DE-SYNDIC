typedef struct personnes
{
 int IdPersonne;
 char cin[10];
 char NomPersonne[20];
 char PrenomPersonne[20];
 int N_Telephone;
}personne;

void ModifierPersonne();
void AjouterPersonne();
void AffichePersonne();
void SupprimerPersonne();
void CherchePersonne1();
