require_relative 'joueur'
require_relative 'plateau'
require_relative 'affichage'

# Classe pour gérer une partie de A à Z
class Partie
  def initialize
    # On setup les joueurs et le plateau
    puts "Wsh, c'est quoi ton blaze joueur 1 ?"
    @joueur1 = Joueur.new(gets.chomp, "X")
    puts "Et toi joueur 2, c'est quoi ton blase ?"
    @joueur2 = Joueur.new(gets.chomp, "O")
    @plateau = Plateau.new
    @affichage = Affichage.new
    @tour_actuel = @joueur1
  end

  def jouer_partie
    # On boucle jusqu'à ce qu'il y ait un gagnant ou un match nul
    loop do
      @affichage.afficher_plateau(@plateau)
      jouer_tour

      if @plateau.gagnant?(@tour_actuel.symbole)
        @affichage.afficher_plateau(@plateau)
        puts "🏆🏆🏆🏆🏆bravo #{@tour_actuel.nom}, t'as gagné, BG🏆🏆🏆🏆🏆 !"
        puts "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
        puts "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
        puts "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
        puts "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
        puts "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
        puts "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
        puts "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
        puts "🏆🏆🏆🏆🏆🏆🏆 #{@tour_actuel.nom}🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
        puts "🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆🏆"
        break
      elsif @plateau.plein?
        @affichage.afficher_plateau(@plateau)
        puts "Match nul ! Pas de vainqueur, dommage !"
        break
      end

      changer_tour
    end
  end

  private

  def jouer_tour
    puts "#{@tour_actuel.nom}, à toi de jouer, choisis une case genre 'A1' :"
    choix = gets.chomp.upcase
    if @plateau.valider_coup(choix, @tour_actuel.symbole)
      puts "OK, bien joué !"
    else
      puts "Wsh, essaie encore, cette case est pas dispo."
      jouer_tour
    end
  end

  def changer_tour
    # On passe au joueur suivant
    @tour_actuel = @tour_actuel == @joueur1 ? @joueur2 : @joueur1
  end
end

  