local playersService = game:GetService("Players")

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 7 | named "sendMediaGalleryFullscreenEvent" ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	p0:setRBXEventStream(p1, p2, {
		uid = if localPlayer then tostring(localPlayer.UserId) else "",
		placeId = p3,
		universeId = p4,
		selectedIndex = p5,
		isVideo = p6
	})
end