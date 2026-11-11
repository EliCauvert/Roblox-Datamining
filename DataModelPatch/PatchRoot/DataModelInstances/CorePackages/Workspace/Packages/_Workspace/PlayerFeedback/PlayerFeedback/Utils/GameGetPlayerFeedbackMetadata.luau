local Parent = script:FindFirstAncestor("PlayerFeedback").Parent
local GetFStringEdpPlayerFeedbackServiceRouteFunction = require(Parent.SharedFlags).GetFStringEdpPlayerFeedbackServiceRoute
local Url = require(Parent.Http).Url

return function(Callback, p1, p2)
	-- upvalues: Url (copy), GetFStringEdpPlayerFeedbackServiceRouteFunction (copy)
	assert(type(p1) == "string", "GamesGetPlayerFeedbackMetadata request expects channelId to be a string")
	assert(type(p2) == "string", "GamesGetPlayerFeedbackMetadata request expects assetId to be a string")
	
	return Callback(string.format("%s%s/v1/channels/%s/assets/%s", Url.APIS_URL, GetFStringEdpPlayerFeedbackServiceRouteFunction(), p1, p2), "GET")
end