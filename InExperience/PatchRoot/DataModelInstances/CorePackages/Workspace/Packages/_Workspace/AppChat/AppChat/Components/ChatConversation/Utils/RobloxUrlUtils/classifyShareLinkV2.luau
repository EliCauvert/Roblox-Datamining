local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local HttpService = game:GetService("HttpService")
local _ = require(Parent.ShareLinksNetworking)
local ShareLinkClassificationModule = require(script.Parent.ShareLinkClassification)
local FFlagAppChatPlusReferralAssetCardModule = require(AppChat.Flags.FFlagAppChatPlusReferralAssetCard)
local ShareLinkTargetIdType = require(Parent.MomentsTypes).Enums.ShareLinkTargetIdType

local function _(p1)
	-- upvalues: HttpService (copy), ShareLinkTargetIdType (copy)
	if p1 == "" then
		return nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1)
		
		return if Success and type(Result) == "table" and Result.targetIdType == ShareLinkTargetIdType.FeedItemId then ShareLinkTargetIdType.FeedItemId else nil
	end
end

return function(p1)
	-- upvalues: ShareLinkClassificationModule (copy), HttpService (copy), ShareLinkTargetIdType (copy), FFlagAppChatPlusReferralAssetCardModule (copy)
	if p1.status ~= "Valid" then
		return { type = ShareLinkClassificationModule.Invalid }
	end
	if p1.linkType ~= "Moments" then
		return if FFlagAppChatPlusReferralAssetCardModule and p1.linkType == "Referral" then {
			type = ShareLinkClassificationModule.PlusReferral,
			referrerId = p1.targetId
		} else { type = ShareLinkClassificationModule.Unhandled }
	end
	local config = {
		type = ShareLinkClassificationModule.Moment,
		momentId = p1.targetId
	}
	local CustomData = p1.customData
	local FeedItemId = nil
	
	if CustomData == "" then
		FeedItemId = nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, CustomData)
		FeedItemId = if Success and type(Result) == "table" and Result.targetIdType == ShareLinkTargetIdType.FeedItemId then ShareLinkTargetIdType.FeedItemId else nil
	end
	config.targetIdType = FeedItemId
	
	return config
end