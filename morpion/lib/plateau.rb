require_relative 'case_plateau'

# Classe pour gérer le plateau
class Plateau
  def initialize
    # Création des 9 cases du plateau
    @cases = {}
    ("A".."C").each do |ligne|
      (1..3).each do |colonne|
        @cases["#{ligne}#{colonne}"] = CasePlateau.new
      end
    end
  end

  def afficher
    # Retourne en mode text du plateau
    [
      "  1   2   3",
      "A #{@cases['A1']} | #{@cases['A2']} | #{@cases['A3']}",
      "  ---|---|---",
      "B #{@cases['B1']} | #{@cases['B2']} | #{@cases['B3']}",
      "  ---|---|---",
      "C #{@cases['C1']} | #{@cases['C2']} | #{@cases['C3']}"
    ].join("\n")
  end

  def valider_coup(case_id, symbole)
    # Valide et joue le coup si la case est vide
    return false unless @cases.key?(case_id)
    return false unless @cases[case_id].vide?

    @cases[case_id].remplir(symbole)
    true
  end

  def gagnant?(symbole)
    # Vérifie si un joueur a gagné
    lignes_gagnantes = [
      %w[A1 A2 A3], %w[B1 B2 B3], %w[C1 C2 C3], # Lignes
      %w[A1 B1 C1], %w[A2 B2 C2], %w[A3 B3 C3], # Colonnes
      %w[A1 B2 C3], %w[A3 B2 C1]               # Diagonales
    ]
    lignes_gagnantes.any? do |ligne|
      ligne.all? { |case_id| @cases[case_id].symbole == symbole }
    end
  end

  def plein?
    # Vérifie si le plateau est plein
    @cases.values.all? { |c| !c.vide? }
  end
end
