local parent = script:FindFirstAncestor("PlayerFeedback").Parent
local getFStringEdpPlayerFeedbackServiceRoute = require(parent.SharedFlags).GetFStringEdpPlayerFeedbackServiceRoute
local url = require(parent.Http).Url

return function(p1, p2, p3)
	-- upvalues: url (ref), getFStringEdpPlayerFeedbackServiceRoute (ref)
	assert(type(p2) == "string", "GamesGetPlayerFeedbackMetadata request expects channelId to be a string")
	assert(type(p3) == "string", "GamesGetPlayerFeedbackMetadata request expects assetId to be a string")
	
	return p1(string.format("%s%s/v1/channels/%s/assets/%s", url.APIS_URL, getFStringEdpPlayerFeedbackServiceRoute(), p2, p3), "GET")
end