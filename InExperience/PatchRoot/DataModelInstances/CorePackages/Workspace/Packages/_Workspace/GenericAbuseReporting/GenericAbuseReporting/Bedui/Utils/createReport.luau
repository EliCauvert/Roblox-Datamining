local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local updateAbuseReportRevampItemAbuseVector = game:DefineFastFlag("UpdateAbuseReportRevampItemAbuseVector", false)
local fFlagLuaAppEnableReportBadge = require(parent.SharedFlags).FFlagLuaAppEnableReportBadge
local fFlagEnableReportingFlowForDevSubs = require(parent.SharedFlags).FFlagEnableReportingFlowForDevSubs
local fFlagEnableReportingFlowForExperienceShop = require(parent.SharedFlags).FFlagEnableReportingFlowForExperienceShop

return function(p0) --[[ line: 29 ]]
	-- upvalues: abuseVectorModule (ref), fFlagEnableReportingFlowForDevSubs (ref), fFlagEnableReportingFlowForExperienceShop (ref), fFlagLuaAppEnableReportBadge (ref), updateAbuseReportRevampItemAbuseVector (ref)
	local t = {}
	
	if p0.abuseVector == abuseVectorModule.Looks then
		local targetId = p0.targetId
		t.REPORT_TARGET_LOOK_ID = targetId.lookId
		t.REPORT_TARGET_LOOK_INCLUDED_ASSET_IDS = targetId.lookAssetsIds
	elseif p0.abuseVector == abuseVectorModule.UgcBundle then
		t.UGC_BUNDLE_ID = p0.targetId
	elseif p0.abuseVector == abuseVectorModule.ContentPostScreenshot then
		t.CONTENT_POST_ID = p0.targetId
	elseif p0.abuseVector == abuseVectorModule.UserProfile then
		t.REPORT_TARGET_USER_ID = p0.targetId
	elseif p0.abuseVector == abuseVectorModule.Accessory then
		t.REPORT_TARGET_ASSET_ID = p0.targetId
	elseif p0.abuseVector == abuseVectorModule.Place then
		t.REPORT_TARGET_ASSET_ID = p0.targetId
	elseif fFlagEnableReportingFlowForDevSubs and p0.abuseVector == abuseVectorModule.Subscription then
		local targetId = p0.targetId
		t.REPORT_TARGET_SUBSCRIPTION_TARGET_KEY = targetId.subscriptionTargetKey
		t.REPORT_TARGET_ASSET_ID = targetId.imageAssetId
	elseif fFlagEnableReportingFlowForExperienceShop and p0.abuseVector == abuseVectorModule.DeveloperProduct then
		t.REPORT_TARGET_DEVELOPER_PRODUCT_ID = p0.targetId
	elseif fFlagEnableReportingFlowForExperienceShop and p0.abuseVector == abuseVectorModule.GamePass then
		t.REPORT_TARGET_GAME_PASS_ID = p0.targetId
	elseif fFlagEnableReportingFlowForExperienceShop and p0.abuseVector == abuseVectorModule.InExperienceShop then
		t.PLACE_ID = p0.targetId
	elseif p0.abuseVector == abuseVectorModule.Group then
		t.REPORT_TARGET_GROUP_ID = p0.targetId
	elseif p0.abuseVector == abuseVectorModule.Notifications then
		t.NOTIFICATION_ID = p0.targetId
	elseif fFlagLuaAppEnableReportBadge and p0.abuseVector == abuseVectorModule.Badge then
		t.REPORT_TARGET_BADGE_ID = p0.targetId
	end
	t.ENTRY_POINT = "in-app"
	t.SUBMITTER_USER_ID = p0.submitterId
	t.REPORTED_ABUSE_CATEGORY = p0.abuseCategory
	t.REPORTER_COMMENT = p0.comment or ""
	
	if updateAbuseReportRevampItemAbuseVector and p0.abuseVector == abuseVectorModule.Accessory then
		t.REPORTED_ABUSE_VECTOR = if p0.custom then p0.custom.assetTypeName else abuseVectorModule.Accessory
		
		if t.REPORTED_ABUSE_VECTOR == "EmoteAnimation" then
			t.REPORTED_ABUSE_VECTOR = abuseVectorModule.Accessory
			
			return t
		end
	else
		t.REPORTED_ABUSE_VECTOR = p0.abuseVector
	end
	return t
end