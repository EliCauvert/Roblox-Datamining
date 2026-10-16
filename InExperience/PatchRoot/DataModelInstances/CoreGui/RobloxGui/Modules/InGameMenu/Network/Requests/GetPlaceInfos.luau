local UrlModule = require(script.Parent.Parent.Parent.Network.Url)

return function(Callback, PlaceIds) --[[ Line: 4 ]]
	-- upvalues: UrlModule (copy)
	for i, placeId in ipairs(PlaceIds) do
		PlaceIds[i] = tostring(placeId)
	end
	return Callback(string.format("%s/v1/games/multiget-place-details?%s", UrlModule.GAME_URL, (UrlModule:makeQueryString({ placeIds = PlaceIds }))), "GET")
end