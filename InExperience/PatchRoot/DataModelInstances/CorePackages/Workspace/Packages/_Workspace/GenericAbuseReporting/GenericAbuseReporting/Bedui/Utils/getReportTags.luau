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

local var1 = function(p1)
	-- upvalues: fFlagGenericAbuseReportingUnifyReportTagsModule (ref), valueToAbuseCategoryModule (ref), abuseCategoryModule (ref)
	local t = {
		ENTRY_POINT = "in-app",
		SUBMITTER_USER_ID = p1.localPlayerUserId
	}
	
	if fFlagGenericAbuseReportingUnifyReportTagsModule then
		t.REPORTED_ABUSE_CATEGORY = valueToAbuseCategoryModule[p1.formData.legacy_abuse_category] or (p1.formData.abuse_category or abuseCategoryModule.ABUSE_CATEGORY_INVALID)
	else
		t.REPORTED_ABUSE_CATEGORY = p1.formData.abuse_category or abuseCategoryModule.ABUSE_CATEGORY_INVALID
	end
	t.REPORTER_COMMENT = p1.formData.free_comment or ""
	
	return t
end

local var2 = function(p1)
	-- upvalues: dashModule (ref), abuseVectorModule (ref), fFlagEnableReportingFlowForDevSubs (ref), fFlagEnableReportingFlowForExperienceShop (ref), fFlagLuaAppEnableSponsoredReportAd (ref), fFlagLuaAppEnableReportBadge (ref)
	local var3 = dashModule.copy(p1.tags)
	local targetId = p1.targetId
	
	if p1.abuseVector == abuseVectorModule.Looks or p1.abuseVector == abuseVectorModule.CommunityLooks then
		local targetId_1 = p1.targetId
		var3.REPORT_TARGET_LOOK_ID = targetId_1.lookId
		var3.REPORT_TARGET_LOOK_INCLUDED_ASSET_IDS = targetId_1.lookAssetsIds
	elseif p1.abuseVector == abuseVectorModule.UgcBundle then
		var3.UGC_BUNDLE_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.ContentPostScreenshot then
		var3.CONTENT_POST_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.UserProfile then
		var3.REPORT_TARGET_USER_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.Accessory then
		var3.REPORT_TARGET_ASSET_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.Place then
		var3.REPORT_TARGET_ASSET_ID = targetId
	elseif fFlagEnableReportingFlowForDevSubs and p1.abuseVector == abuseVectorModule.Subscription then
		local targetId_1 = p1.targetId
		var3.REPORT_TARGET_SUBSCRIPTION_TARGET_KEY = targetId_1.subscriptionTargetKey
		var3.REPORT_TARGET_ASSET_ID = targetId_1.imageAssetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.DeveloperProduct then
		var3.REPORT_TARGET_DEVELOPER_PRODUCT_ID = targetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.GamePass then
		var3.REPORT_TARGET_GAME_PASS_ID = targetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.InExperienceShop then
		var3.PLACE_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.Group then
		var3.REPORT_TARGET_GROUP_ID = targetId
	elseif p1.abuseVector == abuseVectorModule.Notifications then
		var3.NOTIFICATION_ID = targetId
	elseif fFlagLuaAppEnableSponsoredReportAd and p1.abuseVector == abuseVectorModule.AdV2 then
		var3.AD_ID = targetId
	elseif fFlagLuaAppEnableReportBadge and p1.abuseVector == abuseVectorModule.Badge then
		var3.REPORT_TARGET_BADGE_ID = targetId
	end
	if p1.abuseVector == abuseVectorModule.Accessory then
		var3.REPORTED_ABUSE_VECTOR = if p1.custom then p1.custom.assetTypeName else abuseVectorModule.Accessory
		
		if var3.REPORTED_ABUSE_VECTOR == "EmoteAnimation" then
			var3.REPORTED_ABUSE_VECTOR = abuseVectorModule.Accessory
			
			return var3
		end
	else
		var3.REPORTED_ABUSE_VECTOR = p1.abuseVector
	end
	return var3
end

return function(p1)
	-- upvalues: var1 (ref), var2 (ref), dashModule (ref)
	local var3 = var2({
		abuseVector = p1.abuseVector,
		custom = p1.custom,
		targetId = p1.targetId,
		tags = var1({
			formData = p1.formData,
			localPlayerUserId = p1.localPlayerUserId
		})
	})
	dashModule.forEach(p1.additionalReportTags or {}, function(p2)
		-- upvalues: var3 (write)
		if not p2.tagKey or p2.tagKey == "" or (not p2.tagValue or p2.tagValue == "") then return end
		if var3[p2.tagKey] == nil then
			var3[p2.tagKey] = p2.tagValue
			
			return
		end
		var3[p2.tagKey] ..= "," .. p3.tagValue
	end)
	
	return var3
end