module BoatsHelper
  def boat_stars(boat)
    if !boat.reviews.average(:stars).nil?

        total = (boat.reviews.average(:stars) * 2).round / 2.0

        full = total - (total % 1)
        half = total % 1
        empty = 5 - full - half
      return {
        full: full.round,
        half: half.round,
        empty: empty.round
      }
    else
      return nil
    end
  end
end
