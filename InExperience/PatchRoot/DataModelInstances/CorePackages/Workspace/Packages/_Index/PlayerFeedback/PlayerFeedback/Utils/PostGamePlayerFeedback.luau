local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("PlayerFeedback").Parent
local GetFStringEdpPlayerFeedbackServiceRouteFunction = require(Parent.SharedFlags).GetFStringEdpPlayerFeedbackServiceRoute
local Url = require(Parent.Http).Url

return function(Callback, p1, p2, Category_type, Category_option_ids, Comment) --[[ Line: 16 ]]
	-- upvalues: Url (copy), GetFStringEdpPlayerFeedbackServiceRouteFunction (copy), HttpService (copy)
	assert(type(p1) == "string", "PostGamePlayerFeedback request expects channelId to be a string")
	assert(type(p2) == "string", "PostGamePlayerFeedback request expects assetId to be a string")
	assert(type(Category_type) == "string", "PostGamePlayerFeedback request expects a valid category type")
	
	return Callback(string.format("%s%s/v1/channels/%s/assets/%s/reviews", Url.APIS_URL, GetFStringEdpPlayerFeedbackServiceRouteFunction(), p1, p2), "POST", {
		postBody = HttpService:JSONEncode({
			category_type = Category_type,
			category_option_ids = Category_option_ids,
			comment = Comment
		})
	})
end