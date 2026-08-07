return {
	mock = function(p0) --[[ line: 41 ]]
		return {
			rootPlaceId = -2,
			name = "Experience name",
			description = "Experience description",
			sourceName = "Source name",
			sourceDescription = "Source description",
			price = 0,
			isGenreEnforced = false,
			copyingAllowed = false,
			playing = 0,
			visits = 0,
			maxPlayers = 10,
			studioAccessToApisAllowed = false,
			universeAvatarType = "MorphR6",
			genre = "",
			isAllGenre = false,
			isFavoritedByUser = false,
			favoritedCount = 0,
			id = p0 or -1,
			creator = {
				id = -3,
				name = "CreatorName",
				type = "User",
				isRNVAccount = false,
				hasVerifiedBadge = false
			},
			allowedGearGenres = {},
			allowedGearCategories = {},
			created = DateTime.now():ToIsoDate(),
			updated = DateTime.now():ToIsoDate()
		}
	end
}