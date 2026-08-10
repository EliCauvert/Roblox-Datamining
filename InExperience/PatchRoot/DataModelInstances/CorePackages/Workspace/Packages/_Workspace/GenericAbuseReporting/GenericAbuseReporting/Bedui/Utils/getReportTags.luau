local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseCategoryModule = require(genericAbuseReporting.Enums.AbuseCategory)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local valueToAbuseCategoryModule = require(genericAbuseReporting.Enums.ValueToAbuseCategory)
local fFlagLuaAppEnableSponsoredReportAd = sharedFlagsModule.FFlagLuaAppEnableSponsoredReportAd
local fFlagLuaAppEnableReportBadge = sharedFlagsModule.FFlagLuaAppEnableReportBadge
local fFlagEnableReportingFlowForDevSubs = sharedFlagsModule.FFlagEnableReportingFlowForDevSubs
local fFlagEnableReportingFlowForExperienceShop = sharedFlagsModule.FFlagEnableReportingFlowForExperienceShop
local fFlagGenericAbuseReportingUnifyReportTagsModule = require(genericAbuseReporting.Flags.FFlagGenericAbuseReportingUnifyReportTags)

local var7 = function(p0) --[[ line: 39 ]]
	-- upvalues: fFlagGenericAbuseReportingUnifyReportTagsModule (ref), valueToAbuseCategoryModule (ref), abuseCategoryModule (ref)
	local t = {
		ENTRY_POINT = "in-app",
		SUBMITTER_USER_ID = p0.localPlayerUserId
	}
	
	if fFlagGenericAbuseReportingUnifyReportTagsModule then
		t.REPORTED_ABUSE_CATEGORY = valueToAbuseCategoryModule[p0.formData.legacy_abuse_category] or (p0.formData.abuse_category or abuseCategoryModule.ABUSE_CATEGORY_INVALID)
	else
		t.REPORTED_ABUSE_CATEGORY = p0.formData.abuse_category or abuseCategoryModule.ABUSE_CATEGORY_INVALID
	end
	t.REPORTER_COMMENT = p0.formData.free_comment or ""
	
	return t
end

local var8 = function(p1) --[[ line: 62 ]]
	-- upvalues: dashModule (ref), abuseVectorModule (ref), fFlagEnableReportingFlowForDevSubs (ref), fFlagEnableReportingFlowForExperienceShop (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppEnableReportBadge (ref)
	local var10 = dashModule.copy(p1.tags)
	local targetId = p1.targetId
	
	if p1.abuseVector == abuseVectorModule.Looks or p1.abuseVector == abuseVectorModule.CommunityLooks then
		local targetId_1 = p1.targetId
		var10.REPORT_TARGET_LOOK_ID = targetId_1.lookId
		var10.REPORT_TARGET_LOOK_INCLUDED_ASSET_IDS = targetId_1.lookAssetsIds
	elseif p1.abuseVector == abuseVectorModule.UgcBundle then
		var10.UGC_BUNDLE_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.ContentPostScreenshot then
		var10.CONTENT_POST_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.UserProfile then
		var10.REPORT_TARGET_USER_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.Accessory then
		var10.REPORT_TARGET_ASSET_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.Place then
		var10.REPORT_TARGET_ASSET_ID = targetId
	elseif fFlagEnableReportingFlowForDevSubs and p1.abuseVector == abuseVectorModule.Subscription then
		local targetId_1 = p1.targetId
		var10.REPORT_TARGET_SUBSCRIPTION_TARGET_KEY = targetId_1.subscriptionTargetKey
		var10.REPORT_TARGET_ASSET_ID = targetId_1.imageAssetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.DeveloperProduct then
		var10.REPORT_TARGET_DEVELOPER_PRODUCT_ID = targetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.GamePass then
		var10.REPORT_TARGET_GAME_PASS_ID = targetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.InExperienceShop then
		var10.PLACE_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.Group then
		var10.REPORT_TARGET_GROUP_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.Notifications then
		var10.NOTIFICATION_ID = targetId
	elseif fFlagLuaAppEnableSponsoredReportAd and p1.abuseVector == abuseVectorModule.AdV2 then
		var10.AD_ID = targetId
	elseif fFlagLuaAppEnableReportBadge and p1.abuseVector == abuseVectorModule.Badge then
		var10.REPORT_TARGET_BADGE_ID = targetId
	end
	if p1.abuseVector == abuseVectorModule.Accessory then
		var10.REPORTED_ABUSE_VECTOR = if p1.custom then p1.custom.assetTypeName else abuseVectorModule.Accessory
		
		if var10.REPORTED_ABUSE_VECTOR == "EmoteAnimation" then
			var10.REPORTED_ABUSE_VECTOR = abuseVectorModule.Accessory
			
			return var10
		end
	else
		var10.REPORTED_ABUSE_VECTOR = p1.abuseVector
	end
	return var10
end

return function(p2) --[[ line: 122 ]]
	-- upvalues: var7 (ref), var8 (ref), dashModule (ref)
	local var11 = var8({
		abuseVector = p2.abuseVector,
		custom = p2.custom,
		targetId = p2.targetId,
		tags = var7({
			formData = p2.formData,
			localPlayerUserId = p2.localPlayerUserId
		})
	})
	dashModule.forEach(p2.additionalReportTags or {}, function(p3) --[[ line: 136 ]]
		-- upvalues: var11 (write)
		if not p3.tagKey or p3.tagKey == "" or (not p3.tagValue or p3.tagValue == "") then return end
		if var11[p3.tagKey] == nil then
			var11[p3.tagKey] = p3.tagValue
			
			return
		end
		var11[p3.tagKey] ..= "," .. p3.tagValue
	end)
	
	return var11
end