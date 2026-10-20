local Parent = script:FindFirstAncestor("NotApprovedPage").Parent
local HttpService = game:GetService("HttpService")
local Url = require(Parent.Http).Url
local COMMUTATIONCATEGORIES = require(Parent.NotApprovedPageShared).Constants.COMMUTATION_CATEGORIES

return function(Callback)
	-- upvalues: Url (copy), HttpService (copy), COMMUTATIONCATEGORIES (copy)
	return Callback(Url.APIS_URL .. "moderation-appeal-service/v2/consequence-commutation", "POST", {
		postBody = HttpService:JSONEncode({ type = COMMUTATIONCATEGORIES.Educational })
	})
end