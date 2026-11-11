local Players = game:GetService("Players")

return function(p1, p2, p3, UniverseId, AutoAdvance, IsYouTubeVideo, PlaceId)
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	p1:setRBXEventStream(p2, "mediaGalleryMediaChanged", {
		uid = if LocalPlayer then tostring(LocalPlayer.UserId) else "",
		placeId = PlaceId,
		universeId = UniverseId,
		imageAssetId = p3.imageId,
		videoAssetId = p3.videoId,
		isYouTubeVideo = IsYouTubeVideo,
		autoAdvance = AutoAdvance
	})
end