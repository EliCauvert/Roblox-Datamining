local parent = script:FindFirstAncestor("GameDetailRodux").Parent
local httpService = game:GetService("HttpService")
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "experience-guidelines-api/experience-guidelines/get-age-recommendation",
	base = require(parent.Http).Url.APIS_URL
})

return function(p1, p2)
	-- upvalues: var1 (ref), httpService (ref)
	return p1(var1(), "POST", { postBody = httpService:JSONEncode({ universeId = p2 }) })
end