# Classe pour chaque case du plateau
class CasePlateau
    attr_reader :symbole
  
    def initialize
      # On initialise une case vide
      @symbole = " "
    end
  
    def remplir(symbole)
      # Remplit la case avec "X" ou "O"
      @symbole = symbole
    end
  
    def vide?
      # Vérifie si la case est vide
      @symbole == " "
    end
  
    def to_s
      # Pour afficher la case
      @symbole
    end
  end
  