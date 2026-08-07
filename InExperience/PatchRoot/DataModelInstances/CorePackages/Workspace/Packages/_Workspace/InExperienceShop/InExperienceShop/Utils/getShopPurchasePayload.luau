local var0 = game:GetService("HttpService"):JSONEncode({
	surface = {
		scopeType = "inExperience",
		universeId = game.GameId,
		placeId = game.PlaceId,
		location = { locationType = "personalizedShop" }
	}
})

return function() --[[ line: 21 | named "getShopPurchasePayload" ]]
	-- upvalues: var0 (ref)
	return var0
end