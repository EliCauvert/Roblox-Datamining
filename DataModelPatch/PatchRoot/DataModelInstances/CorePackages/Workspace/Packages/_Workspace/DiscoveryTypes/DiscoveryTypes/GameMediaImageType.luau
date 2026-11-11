return {
	Image = 1,
	YouTubeVideo = 33,
	GamePreviewVideo = 86,
	Video = if require(script:FindFirstAncestor("DiscoveryTypes").Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview then 62 else nil
}