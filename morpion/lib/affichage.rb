# Classe pour gérer les affichages stylés
class Affichage
    def afficher_plateau(plateau)
      # On affiche le plateau avec un style propre
      system("clear") || system("cls")
      puts "Morpion à la cool :"
      puts plateau.afficher
    end
  end
  