Projet push_swap

Rush sur 1 jour.

Implementation d'un algorithme de tri sur liste avec uniquement certaines commandes limitées.

Utilisation: make ; ./pushswap ARG1 ARG2 ARG3 ... où chaque ARG est un nombre entier différent des précédents.

Signification de la sortie:

sa : swap a - intervertit les 2 premiers éléments au sommet de la pile a. Ne fait rien s’il n’y en a qu’un ou aucun.

sb : swap b - intervertit les 2 premiers éléments au sommet de la pile b. Ne fait rien s’il n’y en a qu’un ou aucun.

ss : sa et sb en même temps.

pa : push a - prend le premier élément au sommet de b et le met sur a. Ne fait rien si b est vide.

pb : push b - prend le premier élément au sommet de a et le met sur b. Ne fait rien si a est vide.

ra : rotate a - décale d’une position vers le haut tous les élements de la pile a. Le premier élément devient le dernier.

rb : rotate b - décale d’une position vers le haut tous les élements de la pile b. Le premier élément devient le dernier.

rr : ra et rb en même temps.

rra : reverse rotate a - décale d’une position vers le bas tous les élements de la pile a. Le dernier élément devient le premier.

rb : reverse rotate b - décale d’une position vers le bas tous les élements de la pile b. Le dernier élément devient le premier.

rrr : rra et rrb en même temps.