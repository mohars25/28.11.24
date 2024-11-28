# Classe pour gérer les joueurs
class Joueur
    attr_reader :nom, :symbole
  
    def initialize(nom, symbole)
      # On set le blaze et le symbole (X ou O)
      @nom = nom
      @symbole = symbole
    end
  end
  