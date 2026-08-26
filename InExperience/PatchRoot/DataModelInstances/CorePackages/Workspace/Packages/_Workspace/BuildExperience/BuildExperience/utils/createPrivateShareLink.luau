local parent = script:FindFirstAncestor("BuildExperience").Parent
local httpService = game:GetService("HttpService")
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise
local text = urlBase.APIS .. "/sharelinks/v1/get-or-create-link"

local function decodeShareLink(p1)
	return if type(p1) == "table" and type(p1.shortUrl) == "string" then p1.shortUrl else nil
end

return function(p1)
	-- upvalues: fetch (ref), text (ref), httpService (ref), decodeShareLink (ref), asPromise (ref)
	return asPromise(fetch({
		method = "POST",
		analyticsKey = "build-experience.create-private-share-link",
		url = text,
		body = {
			linkType = "ExperienceDetails",
			data = httpService:JSONEncode({ universeId = tostring(p1) })
		},
		decode = decodeShareLink
	}))
end