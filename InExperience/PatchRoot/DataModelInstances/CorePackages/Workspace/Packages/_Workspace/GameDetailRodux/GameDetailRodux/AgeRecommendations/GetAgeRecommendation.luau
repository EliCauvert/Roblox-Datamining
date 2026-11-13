local Parent = script:FindFirstAncestor("GameDetailRodux").Parent
local Url = require(Parent.Http).Url
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local HttpService = game:GetService("HttpService")
local NewUrlBuilder = UrlBuilder.new({
	path = "experience-guidelines-api/experience-guidelines/get-age-recommendation",
	base = Url.APIS_URL
})

return function(Callback, UniverseId)
	-- upvalues: NewUrlBuilder (copy), HttpService (copy)
	return Callback(NewUrlBuilder(), "POST", {
		postBody = HttpService:JSONEncode({ universeId = UniverseId })
	})
end