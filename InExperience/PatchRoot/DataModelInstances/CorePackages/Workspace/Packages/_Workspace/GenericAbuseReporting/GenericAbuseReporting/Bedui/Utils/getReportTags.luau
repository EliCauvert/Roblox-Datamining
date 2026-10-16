local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local AbuseCategoryModule = require(GenericAbuseReporting.Enums.AbuseCategory)
local AbuseVectorModule = require(GenericAbuseReporting.Enums.AbuseVector)
local ValueToAbuseCategoryModule = require(GenericAbuseReporting.Enums.ValueToAbuseCategory)
local FFlagLuaAppEnableReportBadge = SharedFlagsModule.FFlagLuaAppEnableReportBadge
local FFlagEnableReportingFlowForDevSubs = SharedFlagsModule.FFlagEnableReportingFlowForDevSubs
local FFlagEnableReportingFlowForExperienceShop = SharedFlagsModule.FFlagEnableReportingFlowForExperienceShop
local FFlagGenericAbuseReportingUnifyReportTagsModule = require(GenericAbuseReporting.Flags.FFlagGenericAbuseReportingUnifyReportTags)

local function v12(p1) --[[ Line: 37 ]]
	-- upvalues: FFlagGenericAbuseReportingUnifyReportTagsModule (copy), ValueToAbuseCategoryModule (copy), AbuseCategoryModule (copy)
	local config = {
		ENTRY_POINT = "in-app",
		SUBMITTER_USER_ID = p1.localPlayerUserId
	}
	
	if FFlagGenericAbuseReportingUnifyReportTagsModule then
		config.REPORTED_ABUSE_CATEGORY = ValueToAbuseCategoryModule[p1.formData.legacy_abuse_category] or (p1.formData.abuse_category or AbuseCategoryModule.ABUSE_CATEGORY_INVALID)
	else
		config.REPORTED_ABUSE_CATEGORY = p1.formData.abuse_category or AbuseCategoryModule.ABUSE_CATEGORY_INVALID
	end
	config.REPORTER_COMMENT = p1.formData.free_comment or ""
	
	return config
end

local function v13(p1) --[[ Line: 60 ]]
	-- upvalues: DashModule (copy), AbuseVectorModule (copy), FFlagEnableReportingFlowForDevSubs (copy), FFlagEnableReportingFlowForExperienceShop (copy), FFlagLuaAppEnableReportBadge (copy)
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
	elseif p1.abuseVector == AbuseVectorModule.Notifications then
		CopyResult.NOTIFICATION_ID = TargetId
	elseif p1.abuseVector == AbuseVectorModule.AdV2 then
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

return function(p1) --[[ Line: 120 ]]
	-- upvalues: v12 (copy), v13 (copy), DashModule (copy)
	local TagValues = v13({
		abuseVector = p1.abuseVector,
		custom = p1.custom,
		targetId = p1.targetId,
		tags = v12({
			formData = p1.formData,
			localPlayerUserId = p1.localPlayerUserId
		})
	})
	DashModule.forEach(p1.additionalReportTags or {}, function(p2) --[[ Line: 134 ]]
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