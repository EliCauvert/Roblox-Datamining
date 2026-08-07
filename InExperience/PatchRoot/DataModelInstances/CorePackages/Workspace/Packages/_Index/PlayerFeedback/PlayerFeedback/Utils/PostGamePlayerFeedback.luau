local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("PlayerFeedback").Parent
local getFStringEdpPlayerFeedbackServiceRoute = require(parent.SharedFlags).GetFStringEdpPlayerFeedbackServiceRoute
local url = require(parent.Http).Url

return function(p0, p1, p2, p3, p4, p5) --[[ line: 16 ]]
	-- upvalues: url (ref), getFStringEdpPlayerFeedbackServiceRoute (ref), httpService (ref)
	assert(type(p1) == "string", "PostGamePlayerFeedback request expects channelId to be a string")
	assert(type(p2) == "string", "PostGamePlayerFeedback request expects assetId to be a string")
	assert(type(p3) == "string", "PostGamePlayerFeedback request expects a valid category type")
	
	return p0(string.format("%s%s/v1/channels/%s/assets/%s/reviews", url.APIS_URL, getFStringEdpPlayerFeedbackServiceRoute(), p1, p2), "POST", {
		postBody = httpService:JSONEncode({
			category_type = p3,
			category_option_ids = p4,
			comment = p5
		})
	})
end