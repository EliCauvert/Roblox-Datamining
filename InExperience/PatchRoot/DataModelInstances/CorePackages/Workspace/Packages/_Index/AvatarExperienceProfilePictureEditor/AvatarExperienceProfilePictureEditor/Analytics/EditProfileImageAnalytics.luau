local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local sendUnifiedEventLog = avatarExperienceAnalyticsModule.sendUnifiedEventLog
local sendAXCounterV2 = avatarExperienceAnalyticsModule.sendAXCounterV2
local reportAvatarEventCounterV1 = avatarExperienceAnalyticsModule.reportAvatarEventCounterV1
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local unifiedLoggingSurface = avatarExperienceNavigationModule.Enums.UnifiedLoggingSurface
local constants = avatarExperienceAnalyticsModule.Constants
local fFlagEditProfileImageV2Telemetry = sharedFlagsModule.FFlagEditProfileImageV2Telemetry
local t = {
	logPageView = function(p0) --[[ line: 99 ]]
		-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), httpService (ref), sendAXCounterV2 (ref)
		if fFlagEditProfileImageV2Telemetry then
			sendUnifiedEventLog({
				action = unifiedEventLogEnums.MarketplaceUnifiedAction.PAGE_VIEW,
				surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE,
				elementMetadata = httpService:JSONEncode({ mode = p0.mode })
			})
			sendAXCounterV2("EditProfileImagePageView", { mode = p0.mode })
			
			return
		end
	end
}

local function buildSaveElementMetadata(p1) --[[ line: 68 ]]
	-- upvalues: httpService (ref)
	local t = { mode = p1.mode, is_plus_subscriber = p1.isPlusSubscriber }
	
	if p1.emoteAssetId ~= nil then
		t.emote_asset_id = p1.emoteAssetId
	end
	if p1.frameAssetId ~= nil then
		t.frame_asset_id = p1.frameAssetId
	end
	return httpService:JSONEncode(t)
end

local function _(p2) --[[ line: 85 | named "buildSubscribeElementMetadata" ]]
	-- upvalues: httpService (ref)
	local t = {
		mode = p2.mode,
		purchase_flow_uuid = p2.purchaseFlowUuid,
		source = p2.source
	}
	
	if p2.frameAssetId ~= nil then
		t.frame_asset_id = p2.frameAssetId
	end
	return httpService:JSONEncode(t)
end

function t.logSave(p3) --[[ line: 117 ]]
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendAXCounterV2 (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), buildSaveElementMetadata (ref), reportAvatarEventCounterV1 (ref), constants (ref)
	if not fFlagEditProfileImageV2Telemetry then return end
	sendAXCounterV2("EditProfileImageSave", {
		mode = p3.mode,
		is_plus_subscriber = if p3.isPlusSubscriber then "true" else "false",
		result = tostring(p3.result)
	})
	
	if p3.result == "success" then
		sendUnifiedEventLog({
			elementName = "SAVE",
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE,
			elementMetadata = buildSaveElementMetadata(p3)
		})
		reportAvatarEventCounterV1(constants.AVATAR_EVENT_COUNTER_NAME.AXUpdateProfilePicture)
		
		return
	end
end

function t.logSubscribe(p4) --[[ line: 142 ]]
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), httpService (ref), sendAXCounterV2 (ref)
	if not fFlagEditProfileImageV2Telemetry then return end
	local t = {
		elementName = "SUBSCRIBE",
		action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
		surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE
	}
	local t_1 = {
		mode = p4.mode,
		purchase_flow_uuid = p4.purchaseFlowUuid,
		source = p4.source
	}
	
	if p4.frameAssetId ~= nil then
		t_1.frame_asset_id = p4.frameAssetId
	end
	t.elementMetadata = httpService:JSONEncode(t_1)
	sendUnifiedEventLog(t)
	sendAXCounterV2("EditProfileImageSubscribe", { mode = p4.mode, source = tostring(p4.source) })
end

function t.logClose(p5) --[[ line: 160 ]]
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), httpService (ref), sendAXCounterV2 (ref)
	if fFlagEditProfileImageV2Telemetry then
		sendUnifiedEventLog({
			elementName = "CLOSE",
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE,
			elementMetadata = httpService:JSONEncode({ mode = p5.mode, active_view = p5.activeView })
		})
		sendAXCounterV2("EditProfileImageClose", { mode = p5.mode })
		
		return
	end
end

function t.logBack(p6) --[[ line: 180 ]]
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), httpService (ref), sendAXCounterV2 (ref)
	if fFlagEditProfileImageV2Telemetry then
		sendUnifiedEventLog({
			elementName = "BACK",
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE,
			elementMetadata = httpService:JSONEncode({
				mode = p6.mode,
				active_view = p6.activeView,
				outcome = p6.outcome
			})
		})
		sendAXCounterV2("EditProfileImageBack", { mode = p6.mode, outcome = tostring(p6.outcome) })
		
		return
	end
end

function t.logFetchFailure(p7) --[[ line: 202 ]]
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendAXCounterV2 (ref)
	if fFlagEditProfileImageV2Telemetry then
		sendAXCounterV2("EditProfileImageFetchFailure", { asset_type = tostring(p7.assetType) })
		
		return
	end
end

function t.logRetry(p8) --[[ line: 212 ]]
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendAXCounterV2 (ref)
	if fFlagEditProfileImageV2Telemetry then
		sendAXCounterV2("EditProfileImageRetry", { mode = p8.mode, asset_type = tostring(p8.assetType) })
		
		return
	end
end

return t