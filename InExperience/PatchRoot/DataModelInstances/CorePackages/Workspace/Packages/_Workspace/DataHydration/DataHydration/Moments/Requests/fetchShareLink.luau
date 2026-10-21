local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local HttpClientModule = require(Parent.HttpClient)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local Text = require(Parent.Http).Url.APIS_URL .. "deeplinks/v2/get-or-create-static"
local ShareLinkTargetIdType = require(Parent.MomentsTypes).Enums.ShareLinkTargetIdType

local function decodeShareLink(p1)
	return if p1.link and type(p1.link) == "string" then p1.link else nil
end

return function(p1, Network)
	-- upvalues: ShareLinkTargetIdType (copy), HttpClientModule (copy), Text (copy), HttpService (copy), decodeShareLink (copy)
	local config = { momentId = p1.momentId }
	local FeedItemId = p1.feedItemId
	assert(FeedItemId ~= nil and FeedItemId ~= "", "feedItemId is required to create a Moments share link")
	config.targetIdType = ShareLinkTargetIdType.FeedItemId
	
	return HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.get-or-create-static-share-link",
		url = Text,
		body = {
			linkType = 6,
			linkPreviewAssetId = 0,
			targetId = FeedItemId,
			linkPreviewTitle = p1.title,
			linkPreviewDescription = p1.description or "",
			customData = HttpService:JSONEncode(config)
		},
		network = Network,
		decode = decodeShareLink
	})
end