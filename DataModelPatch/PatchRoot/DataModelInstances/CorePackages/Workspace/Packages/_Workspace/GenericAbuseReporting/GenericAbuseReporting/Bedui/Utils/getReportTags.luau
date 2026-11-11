local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local AbuseCategoryModule = require(GenericAbuseReporting.Enums.AbuseCategory)
local AbuseVectorModule = require(GenericAbuseReporting.Enums.AbuseVector)
local FFlagFixNotificationReportsMobile = require(Parent.SharedFlags).FFlagFixNotificationReportsMobile
local FFlagLuaAppEnableSponsoredReportAd = require(Parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local FFlagLuaAppEnableReportBadge = require(Parent.SharedFlags).FFlagLuaAppEnableReportBadge
local FFlagEnableReportingFlowForDevSubs = require(Parent.SharedFlags).FFlagEnableReportingFlowForDevSubs
local FFlagEnableReportingFlowForExperienceShop = require(Parent.SharedFlags).FFlagEnableReportingFlowForExperienceShop

local function _(p1)
	-- upvalues: AbuseCategoryModule (copy)
	return {
		ENTRY_POINT = "in-app",
		SUBMITTER_USER_ID = p1.localPlayerUserId,
		REPORTED_ABUSE_CATEGORY = p1.formData.abuse_category or AbuseCategoryModule.ABUSE_CATEGORY_INVALID,
		REPORTER_COMMENT = p1.formData.free_comment or ""
	}
end

local function v12(p1)
	-- upvalues: DashModule (copy), AbuseVectorModule (copy), FFlagEnableReportingFlowForDevSubs (copy), FFlagEnableReportingFlowForExperienceShop (copy), FFlagFixNotificationReportsMobile (copy), FFlagLuaAppEnableSponsoredReportAd (copy), FFlagLuaAppEnableReportBadge (copy)
	local CopyResult = DashModule.copy(p1.tags)
	local TargetId = p1.targetId
	
	if p1.abuseVector == AbuseVectorModule.Looks or p1.abuseVector == AbuseVectorModule.CommunityLooks then
		local TargetId1 = p1.targetId
		CopyResult.REPORT_TARGET_LOOK_ID = TargetId1.lookId
		CopyResult.REPORT_TARGET_LOOK_INCLUDED_ASSET_IDS = TargetId1.lookAssetsIds
	elseif p1.abuseVector == AbuseVectorModule.UgcBundle then
		CopyResult.UGC_BUNDLE_ID = TargetId
	elseif p1.abuseVector == AbuseVectorModule.ContentPostScreenshot then
		CopyResult.CONTENT_POST_ID = TargetId
	elseif p1.abuseVector == AbuseVectorModule.UserProfile then
		CopyResult.REPORT_TARGET_USER_ID = TargetId
	elseif p1.abuseVector == AbuseVectorModule.Accessory then
		CopyResult.REPORT_TARGET_ASSET_ID = TargetId
	elseif p1.abuseVector == AbuseVectorModule.Place then
		CopyResult.REPORT_TARGET_ASSET_ID = TargetId
	elseif FFlagEnableReportingFlowForDevSubs and p1.abuseVector == AbuseVectorModule.Subscription then
		local TargetId2 = p1.targetId
		CopyResult.REPORT_TARGET_SUBSCRIPTION_TARGET_KEY = TargetId2.subscriptionTargetKey
		CopyResult.REPORT_TARGET_ASSET_ID = TargetId2.imageAssetId
	elseif FFlagEnableReportingFlowForExperienceShop and p1.abuseVector == AbuseVectorModule.DeveloperProduct then
		CopyResult.REPORT_TARGET_DEVELOPER_PRODUCT_ID = TargetId
	elseif FFlagEnableReportingFlowForExperienceShop and p1.abuseVector == AbuseVectorModule.GamePass then
		CopyResult.REPORT_TARGET_GAME_PASS_ID = TargetId
	elseif FFlagEnableReportingFlowForExperienceShop and p1.abuseVector == AbuseVectorModule.InExperienceShop then
		CopyResult.PLACE_ID = TargetId
	elseif p1.abuseVector == AbuseVectorModule.Group then
		CopyResult.REPORT_TARGET_GROUP_ID = TargetId
	elseif FFlagFixNotificationReportsMobile and p1.abuseVector == AbuseVectorModule.Notifications then
		CopyResult.NOTIFICATION_ID = TargetId
	elseif FFlagLuaAppEnableSponsoredReportAd and p1.abuseVector == AbuseVectorModule.AdV2 then
		CopyResult.AD_ID = TargetId
	elseif FFlagLuaAppEnableReportBadge and p1.abuseVector == AbuseVectorModule.Badge then
		CopyResult.REPORT_TARGET_BADGE_ID = TargetId
	end
	if p1.abuseVector == AbuseVectorModule.Accessory then
		CopyResult.REPORTED_ABUSE_VECTOR = p1.custom and p1.custom.assetTypeName or AbuseVectorModule.Accessory
		
		if CopyResult.REPORTED_ABUSE_VECTOR == "EmoteAnimation" then
			CopyResult.REPORTED_ABUSE_VECTOR = AbuseVectorModule.Accessory
			
			return CopyResult
		end
	else
		CopyResult.REPORTED_ABUSE_VECTOR = p1.abuseVector
	end
	return CopyResult
end

return function(p1)
	-- upvalues: AbuseCategoryModule (copy), v12 (copy), DashModule (copy)
	local config = {
		formData = p1.formData,
		localPlayerUserId = p1.localPlayerUserId
	}
	local TagValues = v12({
		abuseVector = p1.abuseVector,
		custom = p1.custom,
		targetId = p1.targetId,
		tags = {
			ENTRY_POINT = "in-app",
			SUBMITTER_USER_ID = config.localPlayerUserId,
			REPORTED_ABUSE_CATEGORY = config.formData.abuse_category or AbuseCategoryModule.ABUSE_CATEGORY_INVALID,
			REPORTER_COMMENT = config.formData.free_comment or ""
		}
	})
	DashModule.forEach(p1.additionalReportTags or {}, function(p2)
		-- upvalues: TagValues (ref)
		if not p2.tagKey or p2.tagKey == "" or not p2.tagValue or p2.tagValue == "" then return end
		if TagValues[p2.tagKey] == nil then
			TagValues[p2.tagKey] = p2.tagValue
			
			return
		else
			TagValues[p2.tagKey] ..= "," .. p2.tagValue
		end
	end)
	
	return TagValues
end