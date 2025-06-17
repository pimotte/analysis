
theorem test : True := by
  have : ∃ x : {x : Nat // x > 0}, x.1 = 1 := by
    sorry
  obtain ⟨⟨x, hx⟩, hx1⟩ := this
  sorry
