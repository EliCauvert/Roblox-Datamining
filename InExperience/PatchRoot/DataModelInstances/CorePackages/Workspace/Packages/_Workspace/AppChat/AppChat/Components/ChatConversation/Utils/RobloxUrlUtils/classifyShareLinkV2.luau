local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local HttpService = game:GetService("HttpService")
local MomentsTypesModule = require(Parent.MomentsTypes)
local _ = require(Parent.ShareLinksNetworking)
local ShareLinkClassificationModule = require(script.Parent.ShareLinkClassification)
local ShareLinkV2EnumsModule = require(script.Parent.ShareLinkV2Enums)
local FFlagAppChatPlusReferralAssetCardModule = require(AppChat.Flags.FFlagAppChatPlusReferralAssetCard)
local FFlagAppChatGenericShareLinkCardModule = require(AppChat.Flags.FFlagAppChatGenericShareLinkCard)
local FFlagAppChatGenericShareLinkPreviewModule = require(AppChat.Flags.FFlagAppChatGenericShareLinkPreview)
local ShareLinkTargetIdType = MomentsTypesModule.Enums.ShareLinkTargetIdType

local function _(p1)
	-- upvalues: HttpService (copy), ShareLinkTargetIdType (copy)
	if p1 == "" then
		return nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1)
		
		return if Success and type(Result) == "table" and Result.targetIdType == ShareLinkTargetIdType.FeedItemId then ShareLinkTargetIdType.FeedItemId else nil
	end
end

local _ = function(p1)
	return if type(p1) == "string" and p1 ~= "" then p1 else nil
end

local _ = function(Value: number)
	return if type(Value) == "number" and Value > 0 and math.floor(Value) == Value then Value else nil
end

local function readLinkPreview(LinkPreview)
	if type(LinkPreview) ~= "table" then
		return nil
	end
	local Title = LinkPreview.title
	local Title1 = if type(Title) == "string" and Title ~= "" then Title else nil
	local Description = LinkPreview.description
	local Description1 = if type(Description) == "string" and Description ~= "" then Description else nil
	
	if Title1 == nil and Description1 == nil then
		return nil
	else
		local AssetId: number = LinkPreview.assetId
		
		return {
			title = Title1,
			description = Description1,
			assetId = if type(AssetId) == "number" and AssetId > 0 and math.floor(AssetId) == AssetId then AssetId else nil
		}
	end
end

return function(p1)
	-- upvalues: ShareLinkV2EnumsModule (copy), ShareLinkClassificationModule (copy), FFlagAppChatGenericShareLinkCardModule (copy), HttpService (copy), ShareLinkTargetIdType (copy), FFlagAppChatPlusReferralAssetCardModule (copy), FFlagAppChatGenericShareLinkPreviewModule (copy), readLinkPreview (copy)
	if p1.status ~= ShareLinkV2EnumsModule.Status.Valid then
		return {
			type = ShareLinkClassificationModule.Invalid,
			linkType = if FFlagAppChatGenericShareLinkCardModule then p1.linkType else nil,
			status = if FFlagAppChatGenericShareLinkCardModule then p1.status else nil
		}
	end
	if p1.linkType ~= ShareLinkV2EnumsModule.LinkType.Moments then
		return if FFlagAppChatPlusReferralAssetCardModule and p1.linkType == ShareLinkV2EnumsModule.LinkType.Referral then {
			type = ShareLinkClassificationModule.PlusReferral,
			referrerId = p1.targetId
		} else {
			type = ShareLinkClassificationModule.Unhandled,
			linkType = if FFlagAppChatGenericShareLinkCardModule then p1.linkType else nil,
			preview = if FFlagAppChatGenericShareLinkPreviewModule then readLinkPreview(p1.linkPreview) else nil
		}
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