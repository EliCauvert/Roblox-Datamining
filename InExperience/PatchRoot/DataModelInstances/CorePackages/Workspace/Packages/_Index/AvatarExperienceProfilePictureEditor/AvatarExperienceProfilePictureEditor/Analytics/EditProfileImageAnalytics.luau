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
	logPageView = function(p1)
		-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), httpService (ref), sendAXCounterV2 (ref)
		if fFlagEditProfileImageV2Telemetry then
			sendUnifiedEventLog({
				action = unifiedEventLogEnums.MarketplaceUnifiedAction.PAGE_VIEW,
				surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE,
				elementMetadata = httpService:JSONEncode({ mode = p1.mode })
			})
			sendAXCounterV2("EditProfileImagePageView", { mode = p1.mode })
			
			return
		end
	end
}
local t_1 = {
	confirm = "R15_UPGRADE_CONFIRM",
	cancel = "R15_UPGRADE_CANCEL"
}

local function buildSaveElementMetadata(p1)
	-- upvalues: httpService (ref)
	local t = {
		mode = p1.mode,
		is_plus_subscriber = tostring(p1.isPlusSubscriber)
	}
	
	if p1.emoteAssetId ~= nil then
		t.emote_asset_id = p1.emoteAssetId
	end
	if p1.frameAssetId ~= nil then
		t.frame_asset_id = tostring(p1.frameAssetId)
	end
	return httpService:JSONEncode(t)
end

local function buildSubscribeElementMetadata(p1)
	-- upvalues: httpService (ref)
	local t = {
		mode = p1.mode,
		purchase_flow_uuid = p1.purchaseFlowUuid,
		source = p1.source
	}
	
	if p1.frameAssetId ~= nil then
		t.frame_asset_id = tostring(p1.frameAssetId)
	end
	return httpService:JSONEncode(t)
end

function t.logSave(p1)
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendAXCounterV2 (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), buildSaveElementMetadata (ref), reportAvatarEventCounterV1 (ref), constants (ref)
	if not fFlagEditProfileImageV2Telemetry then return end
	sendAXCounterV2("EditProfileImageSave", {
		mode = p1.mode,
		is_plus_subscriber = if p1.isPlusSubscriber then "true" else "false",
		result = tostring(p1.result)
	})
	
	if p1.result == "success" then
		sendUnifiedEventLog({
			elementName = "SAVE",
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE,
			elementMetadata = buildSaveElementMetadata(p1)
		})
		reportAvatarEventCounterV1(constants.AVATAR_EVENT_COUNTER_NAME.AXUpdateProfilePicture)
		
		return
	end
end

function t.logSubscribe(p1)
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), buildSubscribeElementMetadata (ref), sendAXCounterV2 (ref)
	if fFlagEditProfileImageV2Telemetry then
		sendUnifiedEventLog({
			elementName = "SUBSCRIBE",
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE,
			elementMetadata = buildSubscribeElementMetadata(p1)
		})
		sendAXCounterV2("EditProfileImageSubscribe", { mode = p1.mode, source = tostring(p1.source) })
		
		return
	end
end

function t.logClose(p1)
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), httpService (ref), sendAXCounterV2 (ref)
	if fFlagEditProfileImageV2Telemetry then
		sendUnifiedEventLog({
			elementName = "CLOSE",
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE,
			elementMetadata = httpService:JSONEncode({ mode = p1.mode, active_view = p1.activeView })
		})
		sendAXCounterV2("EditProfileImageClose", { mode = p1.mode })
		
		return
	end
end

function t.logBack(p1)
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), httpService (ref), sendAXCounterV2 (ref)
	if fFlagEditProfileImageV2Telemetry then
		sendUnifiedEventLog({
			elementName = "BACK",
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE,
			elementMetadata = httpService:JSONEncode({
				mode = p1.mode,
				active_view = p1.activeView,
				outcome = p1.outcome
			})
		})
		sendAXCounterV2("EditProfileImageBack", { mode = p1.mode, outcome = tostring(p1.outcome) })
		
		return
	end
end

function t.logFetchFailure(p1)
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendAXCounterV2 (ref)
	if fFlagEditProfileImageV2Telemetry then
		sendAXCounterV2("EditProfileImageFetchFailure", { asset_type = tostring(p1.assetType) })
		
		return
	end
end

function t.logRetry(p1)
	-- upvalues: fFlagEditProfileImageV2Telemetry (ref), sendAXCounterV2 (ref)
	if fFlagEditProfileImageV2Telemetry then
		sendAXCounterV2("EditProfileImageRetry", { mode = p1.mode, asset_type = tostring(p1.assetType) })
		
		return
	end
end

function t.logR15UpgradePromptShown()
	-- upvalues: sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), sendAXCounterV2 (ref)
	sendUnifiedEventLog({
		elementName = "R15_UPGRADE_PROMPT",
		action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION,
		surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE
	})
	sendAXCounterV2("EditProfileImageR15UpgradePromptShown")
end

function t.logR15UpgradePromptInteraction(p1)
	-- upvalues: sendUnifiedEventLog (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), t_1 (ref), sendAXCounterV2 (ref)
	sendUnifiedEventLog({
		action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
		surface = unifiedLoggingSurface.EDIT_PROFILE_IMAGE,
		elementName = t_1[p1]
	})
	sendAXCounterV2("EditProfileImageR15UpgradePromptInteraction", { action = tostring(p1) })
end

return t