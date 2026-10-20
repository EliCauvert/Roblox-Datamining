local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local HttpClientModule = require(Parent.HttpClient)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local Text = require(Parent.Http).Url.APIS_URL .. "deeplinks/v2/get-or-create-static"
local FFlagMomentsPassFeedItemIdToBackendApis = require(Parent.SharedFlags).FFlagMomentsPassFeedItemIdToBackendApis
local ShareLinkTargetIdType = require(Parent.MomentsTypes).Enums.ShareLinkTargetIdType

local function decodeShareLink(p1)
	return if p1.link and type(p1.link) == "string" then p1.link else nil
end

return function(p1, Network)
	-- upvalues: FFlagMomentsPassFeedItemIdToBackendApis (copy), ShareLinkTargetIdType (copy), HttpClientModule (copy), Text (copy), HttpService (copy), decodeShareLink (copy)
	local MomentId = p1.momentId
	local config = { momentId = p1.momentId }
	
	if FFlagMomentsPassFeedItemIdToBackendApis then
		local FeedItemId = p1.feedItemId
		assert(FeedItemId ~= nil and FeedItemId ~= "", "feedItemId is required to create a Moments share link")
		MomentId = FeedItemId
		config.targetIdType = ShareLinkTargetIdType.FeedItemId
	end
	return HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.get-or-create-static-share-link",
		url = Text,
		body = {
			linkType = 6,
			linkPreviewAssetId = 0,
			targetId = MomentId,
			linkPreviewTitle = p1.title,
			linkPreviewDescription = p1.description or "",
			customData = HttpService:JSONEncode(config)
		},
		network = Network,
		decode = decodeShareLink
	})
end