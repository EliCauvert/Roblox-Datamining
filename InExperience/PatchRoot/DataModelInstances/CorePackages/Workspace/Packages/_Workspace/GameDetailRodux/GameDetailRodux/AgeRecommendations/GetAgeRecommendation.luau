local Parent = script:FindFirstAncestor("GameDetailRodux").Parent
local HttpService = game:GetService("HttpService")
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "experience-guidelines-api/experience-guidelines/get-age-recommendation",
	base = require(Parent.Http).Url.APIS_URL
})

return function(Callback, UniverseId)
	-- upvalues: NewResult (copy), HttpService (copy)
	return Callback(NewResult(), "POST", {
		postBody = HttpService:JSONEncode({ universeId = UniverseId })
	})
end