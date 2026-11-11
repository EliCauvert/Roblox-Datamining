local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local HttpClientModule = require(Parent.HttpClient)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local Text = require(Parent.Http).Url.APIS_URL .. "deeplinks/v2/get-or-create-static"

local function decodeShareLink(p1)
	return if p1.link and type(p1.link) == "string" then p1.link else nil
end

return function(p1, Network)
	-- upvalues: HttpClientModule (copy), Text (copy), HttpService (copy), decodeShareLink (copy)
	return HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.get-or-create-static-share-link",
		url = Text,
		body = {
			linkType = 6,
			linkPreviewAssetId = 0,
			targetId = p1.momentId,
			linkPreviewTitle = p1.title,
			linkPreviewDescription = p1.description or "",
			customData = HttpService:JSONEncode({ momentId = p1.momentId })
		},
		network = Network,
		decode = decodeShareLink
	})
end