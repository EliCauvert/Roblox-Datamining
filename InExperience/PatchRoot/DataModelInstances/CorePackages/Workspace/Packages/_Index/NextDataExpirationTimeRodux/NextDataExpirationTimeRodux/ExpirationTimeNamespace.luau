return {
	GameDetailPage = "GameDetailPage",
	GameDetailPlayability = "GameDetailPlayability",
	GameSortGroup = "GameSortGroup",
	SongDetailPage = if require(script:FindFirstAncestor("NextDataExpirationTimeRodux").Parent.SharedFlags).FFlagEnableTopSongsSort then "SongDetailPage" else nil
}