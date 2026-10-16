local parent = script:FindFirstAncestor("AppChat").Parent
local httpService = game:GetService("HttpService")
local momentsTypesModule = require(parent.MomentsTypes)
local _ = require(parent.ShareLinksNetworking)
local shareLinkClassificationModule = require(script.Parent.ShareLinkClassification)
local fFlagMomentsPassFeedItemIdToBackendApis = require(parent.SharedFlags).FFlagMomentsPassFeedItemIdToBackendApis
local shareLinkTargetIdType = momentsTypesModule.Enums.ShareLinkTargetIdType

local function _(p1)
	-- upvalues: fFlagMomentsPassFeedItemIdToBackendApis (ref), httpService (ref), shareLinkTargetIdType (ref)
	if not fFlagMomentsPassFeedItemIdToBackendApis or p1 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, p1)
	
	return if ok and type(status) == "table" and status.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil
end

return function(p1)
	-- upvalues: shareLinkClassificationModule (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), httpService (ref), shareLinkTargetIdType (ref)
	if p1.status ~= "Valid" then
		return { type = shareLinkClassificationModule.Invalid }
	elseif p1.linkType ~= "Moments" then
		return { type = shareLinkClassificationModule.Unhandled }
	end
	local var1
	local t = {
		type = shareLinkClassificationModule.Moment,
		momentId = p1.targetId
	}
	local customData = p1.customData
	
	if fFlagMomentsPassFeedItemIdToBackendApis and customData ~= "" then
		local ok, status = pcall(httpService.JSONDecode, httpService, customData)
		var1 = if ok and type(status) == "table" and status.targetIdType == shareLinkTargetIdType.FeedItemId then shareLinkTargetIdType.FeedItemId else nil
	else
		var1 = nil
	end
	t.targetIdType = var1
	
	return t
end