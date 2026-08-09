local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseCategoryModule = require(genericAbuseReporting.Enums.AbuseCategory)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local fFlagFixNotificationReportsMobile = require(parent.SharedFlags).FFlagFixNotificationReportsMobile
local fFlagLuaAppEnableSponsoredReportAd = require(parent.SharedFlags).FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppEnableReportBadge = require(parent.SharedFlags).FFlagLuaAppEnableReportBadge
local fFlagEnableReportingFlowForDevSubs = require(parent.SharedFlags).FFlagEnableReportingFlowForDevSubs
local fFlagEnableReportingFlowForExperienceShop = require(parent.SharedFlags).FFlagEnableReportingFlowForExperienceShop

local _ = function(p0) --[[ line: 38 ]]
	-- upvalues: abuseCategoryModule (ref)
	return {
		ENTRY_POINT = "in-app",
		SUBMITTER_USER_ID = p0.localPlayerUserId,
		REPORTED_ABUSE_CATEGORY = p0.formData.abuse_category or abuseCategoryModule.ABUSE_CATEGORY_INVALID,
		REPORTER_COMMENT = p0.formData.free_comment or ""
	}
end

local var4 = function(p1) --[[ line: 55 ]]
	-- upvalues: dashModule (ref), abuseVectorModule (ref), fFlagEnableReportingFlowForDevSubs (ref), fFlagEnableReportingFlowForExperienceShop (ref), fFlagFixNotificationReportsMobile (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppEnableReportBadge (ref)
	local var5 = dashModule.copy(p1.tags)
	local targetId = p1.targetId
	
	if p1.abuseVector == abuseVectorModule.Looks or p1.abuseVector == abuseVectorModule.CommunityLooks then
		local targetId_1 = p1.targetId
		var5.REPORT_TARGET_LOOK_ID = targetId_1.lookId
		var5.REPORT_TARGET_LOOK_INCLUDED_ASSET_IDS = targetId_1.lookAssetsIds
	elseif p1.abuseVector == abuseVectorModule.UgcBundle then
		var5.UGC_BUNDLE_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.ContentPostScreenshot then
		var5.CONTENT_POST_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.UserProfile then
		var5.REPORT_TARGET_USER_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.Accessory then
		var5.REPORT_TARGET_ASSET_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.Place then
		var5.REPORT_TARGET_ASSET_ID = targetId
	elseif fFlagEnableReportingFlowForDevSubs and p1.abuseVector == abuseVectorModule.Subscription then
		local targetId_1 = p1.targetId
		var5.REPORT_TARGET_SUBSCRIPTION_TARGET_KEY = targetId_1.subscriptionTargetKey
		var5.REPORT_TARGET_ASSET_ID = targetId_1.imageAssetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.DeveloperProduct then
		var5.REPORT_TARGET_DEVELOPER_PRODUCT_ID = targetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.GamePass then
		var5.REPORT_TARGET_GAME_PASS_ID = targetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.InExperienceShop then
		var5.PLACE_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.Group then
		var5.REPORT_TARGET_GROUP_ID = targetId
	elseif fFlagFixNotificationReportsMobile and p1.abuseVector == abuseVectorModule.Notifications then
		var5.NOTIFICATION_ID = targetId
	elseif fFlagLuaAppEnableSponsoredReportAd and p1.abuseVector == abuseVectorModule.AdV2 then
		var5.AD_ID = targetId
	elseif fFlagLuaAppEnableReportBadge and p1.abuseVector == abuseVectorModule.Badge then
		var5.REPORT_TARGET_BADGE_ID = targetId
	end
	if p1.abuseVector == abuseVectorModule.Accessory then
		var5.REPORTED_ABUSE_VECTOR = if p1.custom then p1.custom.assetTypeName else abuseVectorModule.Accessory
		
		if var5.REPORTED_ABUSE_VECTOR == "EmoteAnimation" then
			var5.REPORTED_ABUSE_VECTOR = abuseVectorModule.Accessory
			
			return var5
		end
	else
		var5.REPORTED_ABUSE_VECTOR = p1.abuseVector
	end
	return var5
end

return function(p2) --[[ line: 115 ]]
	-- upvalues: abuseCategoryModule (ref), var4 (ref), dashModule (ref)
	local t = {
		formData = p2.formData,
		localPlayerUserId = p2.localPlayerUserId
	}
	local var7 = var4({
		abuseVector = p2.abuseVector,
		custom = p2.custom,
		targetId = p2.targetId,
		tags = {
			ENTRY_POINT = "in-app",
			SUBMITTER_USER_ID = t.localPlayerUserId,
			REPORTED_ABUSE_CATEGORY = t.formData.abuse_category or abuseCategoryModule.ABUSE_CATEGORY_INVALID,
			REPORTER_COMMENT = t.formData.free_comment or ""
		}
	})
	dashModule.forEach(p2.additionalReportTags or {}, function(p3) --[[ line: 129 ]]
		-- upvalues: var7 (write)
		if not p3.tagKey or p3.tagKey == "" or (not p3.tagValue or p3.tagValue == "") then return end
		if var7[p3.tagKey] == nil then
			var7[p3.tagKey] = p3.tagValue
			
			return
		end
		var7[p3.tagKey] ..= "," .. p3.tagValue
	end)
	
	return var7
end