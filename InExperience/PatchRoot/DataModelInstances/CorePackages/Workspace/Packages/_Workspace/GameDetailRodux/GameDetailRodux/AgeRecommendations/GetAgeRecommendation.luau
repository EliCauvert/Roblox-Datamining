local parent = script:FindFirstAncestor("GameDetailRodux").Parent
local httpService = game:GetService("HttpService")
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "experience-guidelines-api/experience-guidelines/get-age-recommendation",
	base = require(parent.Http).Url.APIS_URL
})

return function(p0, p1) --[[ line: 29 ]]
	-- upvalues: var1 (ref), httpService (ref)
	return p0(var1(), "POST", { postBody = httpService:JSONEncode({ universeId = p1 }) })
end