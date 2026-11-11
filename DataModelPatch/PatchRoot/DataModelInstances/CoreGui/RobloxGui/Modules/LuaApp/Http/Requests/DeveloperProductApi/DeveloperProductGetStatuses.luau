local Url = require(game:GetService("CorePackages").Workspace.Packages.Http).Url

return function(Callback, PlayerId, PlaceId)
	-- upvalues: Url (copy)
	return Callback(string.format("%sdeveloper-products/v1/game-transactions?%s", Url.APIS_URL, (Url:makeQueryString({
		status = "pending",
		locationType = "ExperienceDetailPage",
		playerId = PlayerId,
		placeId = PlaceId
	}))), "GET")
end