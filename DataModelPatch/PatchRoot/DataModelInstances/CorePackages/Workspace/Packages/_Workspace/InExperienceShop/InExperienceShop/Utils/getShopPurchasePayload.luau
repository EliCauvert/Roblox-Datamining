local Json = game:GetService("HttpService"):JSONEncode({
	surface = {
		scopeType = "inExperience",
		universeId = game.GameId,
		placeId = game.PlaceId,
		location = { locationType = "personalizedShop" }
	}
})

return function()
	-- upvalues: Json (copy)
	return Json
end