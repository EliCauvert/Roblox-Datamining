local playersService = game:GetService("Players")

return function(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	p0:setRBXEventStream(p1, "mediaGalleryMediaChanged", {
		uid = if localPlayer then tostring(localPlayer.UserId) else "",
		placeId = p6,
		universeId = p3,
		imageAssetId = p2.imageId,
		videoAssetId = p2.videoId,
		isYouTubeVideo = p5,
		autoAdvance = p4
	})
end