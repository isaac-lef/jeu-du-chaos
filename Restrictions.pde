int restriction;

final int aucune = 0;
final int pas2fois = 1;
final int pasSuivant = 2;
final int pasACotePrec = 3;
final int pasOppose = 4;

void choisirCible() {
// On choisit un sommet au hasard
    int[] choix = new int[nbSommets];
    int nbChoix = 0;
    for (int i = 0; i < nbSommets; i++) {

      if ( !(restriction == pas2fois && i == idCible) &&
           !(restriction == pasSuivant && i == (idCible + 1) % nbSommets) &&
           !(restriction == pasACotePrec && (i == (idCible+1) % nbSommets || i == (idCible + nbSommets - 1) % nbSommets) ) &&
           !(restriction == pasOppose && i == (idCible + nbSommets/2) % nbSommets)
          ) {
        choix[nbChoix] = i;
        nbChoix++;
      }
    }
    idCible = choix[ randInt(nbChoix-1) ];
}

String strRestriction() {
  if (restriction == pas2fois) {
    return ", pas2fois";
  }
  if (restriction == pasSuivant) {
    return ", pasSuivant";
  }
  if (restriction == pasACotePrec) {
    return ", pasACotePrec";
  }
  if (restriction == pasOppose) {
    return ", pasOppose";
  }
  return "";
}
