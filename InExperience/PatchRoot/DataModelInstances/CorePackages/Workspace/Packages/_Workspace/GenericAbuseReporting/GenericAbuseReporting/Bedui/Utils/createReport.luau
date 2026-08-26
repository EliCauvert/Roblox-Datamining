local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local updateAbuseReportRevampItemAbuseVector = game:DefineFastFlag("UpdateAbuseReportRevampItemAbuseVector", false)
local fFlagLuaAppEnableReportBadge = require(parent.SharedFlags).FFlagLuaAppEnableReportBadge
local fFlagEnableReportingFlowForDevSubs = require(parent.SharedFlags).FFlagEnableReportingFlowForDevSubs
local fFlagEnableReportingFlowForExperienceShop = require(parent.SharedFlags).FFlagEnableReportingFlowForExperienceShop

return function(p1)
	-- upvalues: abuseVectorModule (ref), fFlagEnableReportingFlowForDevSubs (ref), fFlagEnableReportingFlowForExperienceShop (ref), fFlagLuaAppEnableReportBadge (ref), updateAbuseReportRevampItemAbuseVector (ref)
	local t = {}
	
	if p1.abuseVector == abuseVectorModule.Looks then
		local targetId = p1.targetId
		t.REPORT_TARGET_LOOK_ID = targetId.lookId
		t.REPORT_TARGET_LOOK_INCLUDED_ASSET_IDS = targetId.lookAssetsIds
	elseif p1.abuseVector == abuseVectorModule.UgcBundle then
		t.UGC_BUNDLE_ID = p1.targetId
	elseif p1.abuseVector == abuseVectorModule.ContentPostScreenshot then
		t.CONTENT_POST_ID = p1.targetId
	elseif p1.abuseVector == abuseVectorModule.UserProfile then
		t.REPORT_TARGET_USER_ID = p1.targetId
	elseif p1.abuseVector == abuseVectorModule.Accessory then
		t.REPORT_TARGET_ASSET_ID = p1.targetId
	elseif p1.abuseVector == abuseVectorModule.Place then
		t.REPORT_TARGET_ASSET_ID = p1.targetId
	elseif fFlagEnableReportingFlowForDevSubs and p1.abuseVector == abuseVectorModule.Subscription then
		local targetId = p1.targetId
		t.REPORT_TARGET_SUBSCRIPTION_TARGET_KEY = targetId.subscriptionTargetKey
		t.REPORT_TARGET_ASSET_ID = targetId.imageAssetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.DeveloperProduct then
		t.REPORT_TARGET_DEVELOPER_PRODUCT_ID = p1.targetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.GamePass then
		t.REPORT_TARGET_GAME_PASS_ID = p1.targetId
	elseif fFlagEnableReportingFlowForExperienceShop and p1.abuseVector == abuseVectorModule.InExperienceShop then
		t.PLACE_ID = p1.targetId
	elseif p1.abuseVector == abuseVectorModule.Group then
		t.REPORT_TARGET_GROUP_ID = p1.targetId
	elseif p1.abuseVector == abuseVectorModule.Notifications then
		t.NOTIFICATION_ID = p1.targetId
	elseif fFlagLuaAppEnableReportBadge and p1.abuseVector == abuseVectorModule.Badge then
		t.REPORT_TARGET_BADGE_ID = p1.targetId
	end
	t.ENTRY_POINT = "in-app"
	t.SUBMITTER_USER_ID = p1.submitterId
	t.REPORTED_ABUSE_CATEGORY = p1.abuseCategory
	t.REPORTER_COMMENT = p1.comment or ""
	
	if updateAbuseReportRevampItemAbuseVector and p1.abuseVector == abuseVectorModule.Accessory then
		t.REPORTED_ABUSE_VECTOR = if p1.custom then p1.custom.assetTypeName else abuseVectorModule.Accessory
		
		if t.REPORTED_ABUSE_VECTOR == "EmoteAnimation" then
			t.REPORTED_ABUSE_VECTOR = abuseVectorModule.Accessory
			
			return t
		end
	else
		t.REPORTED_ABUSE_VECTOR = p1.abuseVector
	end
	return t
end