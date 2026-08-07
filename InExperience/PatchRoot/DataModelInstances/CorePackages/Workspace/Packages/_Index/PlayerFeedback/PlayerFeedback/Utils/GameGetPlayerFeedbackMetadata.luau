local parent = script:FindFirstAncestor("PlayerFeedback").Parent
local getFStringEdpPlayerFeedbackServiceRoute = require(parent.SharedFlags).GetFStringEdpPlayerFeedbackServiceRoute
local url = require(parent.Http).Url

return function(p0, p1, p2) --[[ line: 10 ]]
	-- upvalues: url (ref), getFStringEdpPlayerFeedbackServiceRoute (ref)
	assert(type(p1) == "string", "GamesGetPlayerFeedbackMetadata request expects channelId to be a string")
	assert(type(p2) == "string", "GamesGetPlayerFeedbackMetadata request expects assetId to be a string")
	
	return p0(string.format("%s%s/v1/channels/%s/assets/%s", url.APIS_URL, getFStringEdpPlayerFeedbackServiceRoute(), p1, p2), "GET")
end