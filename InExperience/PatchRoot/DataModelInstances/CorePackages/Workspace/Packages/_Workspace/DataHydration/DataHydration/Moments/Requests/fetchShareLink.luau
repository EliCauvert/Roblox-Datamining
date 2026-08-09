local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local text = httpModule.Url.APIS_URL .. "deeplinks/v2/get-or-create-static"

local function decodeShareLink(p0) --[[ line: 26 ]]
	return if p0.link and type(p0.link) == "string" then p0.link else nil
end

return function(p1, p2) --[[ line: 34 | named "fetchShareLink" ]]
	-- upvalues: httpClientModule (ref), text (ref), httpService (ref), decodeShareLink (ref)
	return httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.get-or-create-static-share-link",
		url = text,
		body = {
			linkType = 6,
			linkPreviewAssetId = 0,
			targetId = p1.momentId,
			linkPreviewTitle = p1.title,
			linkPreviewDescription = p1.description or "",
			customData = httpService:JSONEncode({ momentId = p1.momentId })
		},
		network = p2,
		decode = decodeShareLink
	})
end