local Players = game:GetService("Players")

return function(p1, p2, p3, PlaceId, UniverseId, SelectedIndex, IsVideo)
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	p1:setRBXEventStream(p2, p3, {
		uid = if LocalPlayer then tostring(LocalPlayer.UserId) else "",
		placeId = PlaceId,
		universeId = UniverseId,
		selectedIndex = SelectedIndex,
		isVideo = IsVideo
	})
end