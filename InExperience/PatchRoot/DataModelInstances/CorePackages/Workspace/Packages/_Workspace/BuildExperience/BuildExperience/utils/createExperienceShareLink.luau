local Parent = script:FindFirstAncestor("BuildExperience").Parent
local HttpService = game:GetService("HttpService")
local HttpClientModule = require(Parent.HttpClient)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise
local Text = require(Parent.UrlBuilder).UrlBase.APIS .. "/sharelinks/v1/get-or-create-link"

local function decodeShareLink(p1)
	return if type(p1) == "table" and type(p1.shortUrl) == "string" then p1.shortUrl else nil
end

return function(p1, Retry)
	-- upvalues: FetchFunction (copy), Text (copy), HttpService (copy), decodeShareLink (copy), AsPromiseFunction (copy)
	return AsPromiseFunction((FetchFunction({
		method = "POST",
		analyticsKey = "build-experience.create-private-share-link",
		url = Text,
		body = {
			linkType = "ExperienceDetails",
			data = HttpService:JSONEncode({ universeId = tostring(p1) })
		},
		decode = decodeShareLink,
		retry = Retry
	})))
end