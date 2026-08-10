local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local momentsTypesModule = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local text = httpModule.Url.APIS_URL .. "deeplinks/v2/get-or-create-static"
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local shareLinkTargetIdType = momentsTypesModule.Enums.ShareLinkTargetIdType

local function decodeShareLink(p0) --[[ line: 33 ]]
	return if p0.link and type(p0.link) == "string" then p0.link else nil
end

return function(p1, p2) --[[ line: 41 | named "fetchShareLink" ]]
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), shareLinkTargetIdType (ref), httpClientModule (ref), text (ref), httpService (ref), decodeShareLink (ref)
	local momentId = p1.momentId
	local t = { momentId = p1.momentId }
	
	if fFlagMomentsPassFeedItemIdToBackendApis then
		local feedItemId = p1.feedItemId
		assert(feedItemId ~= nil and feedItemId ~= "", "feedItemId is required to create a Moments share link")
		momentId = feedItemId
		t.targetIdType = shareLinkTargetIdType.FeedItemId
	end
	return httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.get-or-create-static-share-link",
		url = text,
		body = {
			linkType = 6,
			linkPreviewAssetId = 0,
			targetId = momentId,
			linkPreviewTitle = p1.title,
			linkPreviewDescription = p1.description or "",
			customData = httpService:JSONEncode(t)
		},
		network = p2,
		decode = decodeShareLink
	})
end