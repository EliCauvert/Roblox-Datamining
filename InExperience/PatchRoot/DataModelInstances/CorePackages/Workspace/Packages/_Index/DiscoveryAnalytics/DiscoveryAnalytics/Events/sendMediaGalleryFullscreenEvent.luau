local playersService = game:GetService("Players")

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	p1:setRBXEventStream(p2, p3, {
		uid = if localPlayer then tostring(localPlayer.UserId) else "",
		placeId = p4,
		universeId = p5,
		selectedIndex = p6,
		isVideo = p7
	})
end