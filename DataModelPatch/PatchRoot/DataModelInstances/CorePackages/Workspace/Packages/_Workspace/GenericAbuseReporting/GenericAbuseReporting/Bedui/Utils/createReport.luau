local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local AbuseVectorModule = require(GenericAbuseReporting.Enums.AbuseVector)
local UpdateAbuseReportRevampItemAbuseVector = game:DefineFastFlag("UpdateAbuseReportRevampItemAbuseVector", false)
local FFlagFixNotificationReportsMobile = require(Parent.SharedFlags).FFlagFixNotificationReportsMobile
local FFlagLuaAppEnableReportBadge = require(Parent.SharedFlags).FFlagLuaAppEnableReportBadge
local FFlagEnableReportingFlowForDevSubs = require(Parent.SharedFlags).FFlagEnableReportingFlowForDevSubs
local FFlagEnableReportingFlowForExperienceShop = require(Parent.SharedFlags).FFlagEnableReportingFlowForExperienceShop

return function(p1)
	-- upvalues: AbuseVectorModule (copy), FFlagEnableReportingFlowForDevSubs (copy), FFlagEnableReportingFlowForExperienceShop (copy), FFlagFixNotificationReportsMobile (copy), FFlagLuaAppEnableReportBadge (copy), UpdateAbuseReportRevampItemAbuseVector (copy)
	local t = {}
	
	if p1.abuseVector == AbuseVectorModule.Looks then
		local TargetId = p1.targetId
		t.REPORT_TARGET_LOOK_ID = TargetId.lookId
		t.REPORT_TARGET_LOOK_INCLUDED_ASSET_IDS = TargetId.lookAssetsIds
	elseif p1.abuseVector == AbuseVectorModule.UgcBundle then
		t.UGC_BUNDLE_ID = p1.targetId
	elseif p1.abuseVector == AbuseVectorModule.ContentPostScreenshot then
		t.CONTENT_POST_ID = p1.targetId
	elseif p1.abuseVector == AbuseVectorModule.UserProfile then
		t.REPORT_TARGET_USER_ID = p1.targetId
	elseif p1.abuseVector == AbuseVectorModule.Accessory then
		t.REPORT_TARGET_ASSET_ID = p1.targetId
	elseif p1.abuseVector == AbuseVectorModule.Place then
		t.REPORT_TARGET_ASSET_ID = p1.targetId
	elseif FFlagEnableReportingFlowForDevSubs and p1.abuseVector == AbuseVectorModule.Subscription then
		local TargetId = p1.targetId
		t.REPORT_TARGET_SUBSCRIPTION_TARGET_KEY = TargetId.subscriptionTargetKey
		t.REPORT_TARGET_ASSET_ID = TargetId.imageAssetId
	elseif FFlagEnableReportingFlowForExperienceShop and p1.abuseVector == AbuseVectorModule.DeveloperProduct then
		t.REPORT_TARGET_DEVELOPER_PRODUCT_ID = p1.targetId
	elseif FFlagEnableReportingFlowForExperienceShop and p1.abuseVector == AbuseVectorModule.GamePass then
		t.REPORT_TARGET_GAME_PASS_ID = p1.targetId
	elseif FFlagEnableReportingFlowForExperienceShop and p1.abuseVector == AbuseVectorModule.InExperienceShop then
		t.PLACE_ID = p1.targetId
	elseif p1.abuseVector == AbuseVectorModule.Group then
		t.REPORT_TARGET_GROUP_ID = p1.targetId
	elseif FFlagFixNotificationReportsMobile and p1.abuseVector == AbuseVectorModule.Notifications then
		t.NOTIFICATION_ID = p1.targetId
	elseif FFlagLuaAppEnableReportBadge and p1.abuseVector == AbuseVectorModule.Badge then
		t.REPORT_TARGET_BADGE_ID = p1.targetId
	end
	t.ENTRY_POINT = "in-app"
	t.SUBMITTER_USER_ID = p1.submitterId
	t.REPORTED_ABUSE_CATEGORY = p1.abuseCategory
	t.REPORTER_COMMENT = p1.comment or ""
	
	if UpdateAbuseReportRevampItemAbuseVector and p1.abuseVector == AbuseVectorModule.Accessory then
		t.REPORTED_ABUSE_VECTOR = p1.custom and p1.custom.assetTypeName or AbuseVectorModule.Accessory
		
		if t.REPORTED_ABUSE_VECTOR == "EmoteAnimation" then
			t.REPORTED_ABUSE_VECTOR = AbuseVectorModule.Accessory
			
			return t
		end
	else
		t.REPORTED_ABUSE_VECTOR = p1.abuseVector
	end
	return t
end