local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("PlayerFeedback").Parent
local getFStringEdpPlayerFeedbackServiceRoute = require(parent.SharedFlags).GetFStringEdpPlayerFeedbackServiceRoute
local url = require(parent.Http).Url

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: url (ref), getFStringEdpPlayerFeedbackServiceRoute (ref), httpService (ref)
	assert(type(p2) == "string", "PostGamePlayerFeedback request expects channelId to be a string")
	assert(type(p3) == "string", "PostGamePlayerFeedback request expects assetId to be a string")
	assert(type(p4) == "string", "PostGamePlayerFeedback request expects a valid category type")
	
	return p1(string.format("%s%s/v1/channels/%s/assets/%s/reviews", url.APIS_URL, getFStringEdpPlayerFeedbackServiceRoute(), p2, p3), "POST", {
		postBody = httpService:JSONEncode({
			category_type = p4,
			category_option_ids = p5,
			comment = p6
		})
	})
end