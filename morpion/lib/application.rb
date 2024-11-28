require_relative 'partie'

# Classe pour gérer tout l'appli
class Application
  def perform
    loop do
      # On lance une nouvelle partie
      partie = Partie.new
      partie.jouer_partie

      # On demande si les gars veulent refaire une partie
      puts "Wsh, tu veux refaire une partie ? (o/n)"
      reponse = gets.chomp.downcase
      break unless reponse == 'o'
    end
    puts "Tchao les gars, à la prochaine !"
  end
end
