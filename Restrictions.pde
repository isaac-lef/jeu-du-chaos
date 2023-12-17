import java.util.List;
import java.util.LinkedList;

enum Restriction {
  aucune,
  pas2fois,
  pasSuivant,
  pasACotePrec,
  pasOppose
}

void choisirCible() {
  List<Integer> choix = new LinkedList<>();
  for (int i = 0; i < nbSommets; i++) {
    boolean valide;
    switch (restriction) {
      case pas2fois :
        valide = (i != idCible);
        break;
      case pasSuivant :
        valide = (i != (idCible + 1) % nbSommets);
        break;
      case pasACotePrec :
        valide = (i != (idCible+1) % nbSommets && i != (idCible + nbSommets - 1) % nbSommets);
        break;
      case pasOppose :
        valide = (i != (idCible + nbSommets/2) % nbSommets);
        break;
      default :
        valide = true;
        break;
    }
    if (valide) choix.add(i);
  }
  idCible = randElement(choix);
}

// fonction qui retourne un élément au hasard d'une liste donnée
int randElement(List<Integer> list) {
  int size = list.size();
  return list.get(randInt(size-1));
}
