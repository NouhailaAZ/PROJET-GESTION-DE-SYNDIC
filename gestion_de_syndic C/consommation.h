typedef struct Consommations
{
 int IdConsommation;
int IdImmeuble;
 float Electricite;
float Eau;
float Menage;
float Autres;
 int Annee;
}consommation;

void AjouterConsommation();
void AfficheConsommation();
void SupprimerConsommation();
void ChercheConsommation1();
void ModifierConsommation();
