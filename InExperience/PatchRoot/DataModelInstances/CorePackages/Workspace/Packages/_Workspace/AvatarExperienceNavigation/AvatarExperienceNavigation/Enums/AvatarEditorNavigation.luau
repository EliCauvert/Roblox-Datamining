local t = {
	Characters = 1,
	HeadAndBody = 2,
	Clothing = 3,
	Accessories = 4,
	Emotes = 5,
	Animation = 6
}

return {
	Categories = t,
	Subcategories = {
		[t.Characters] = { Creations = 1, Purchased = 2 },
		[t.HeadAndBody] = {
			Style = 1,
			Hair = 2,
			Skin = 3,
			ClassicHeads = 4,
			ClassicFaces = 5,
			Torsos = 6,
			LeftArms = 7,
			RightArms = 8,
			LeftLegs = 9,
			RightLegs = 10,
			Build = 11
		},
		[t.Clothing] = {
			Tops = 1,
			Outerwear = 2,
			Bottoms = 3,
			LeftShoes = 4,
			RightShoes = 5,
			ClassicShirts = 6,
			ClassicTShirts = 7,
			ClassicPants = 8
		},
		[t.Accessories] = {
			Hats = 1,
			Face = 2,
			Neck = 3,
			Shoulder = 4,
			Front = 5,
			Back = 6,
			Waist = 7,
			Gear = 8
		},
		[t.Emotes] = {},
		[t.Animation] = {
			Idle = 1,
			Walk = 2,
			Run = 3,
			Jump = 4,
			Fall = 5,
			Climb = 6,
			Swim = 7
		}
	}
}