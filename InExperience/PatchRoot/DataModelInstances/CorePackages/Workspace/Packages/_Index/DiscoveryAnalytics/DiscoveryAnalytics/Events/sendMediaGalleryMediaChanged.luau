local playersService = game:GetService("Players")

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	p1:setRBXEventStream(p2, "mediaGalleryMediaChanged", {
		uid = if localPlayer then tostring(localPlayer.UserId) else "",
		placeId = p7,
		universeId = p4,
		imageAssetId = p3.imageId,
		videoAssetId = p3.videoId,
		isYouTubeVideo = p6,
		autoAdvance = p5
	})
end