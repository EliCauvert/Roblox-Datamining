local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local SendUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLog
local SendAXCounterV2Function = AvatarExperienceAnalyticsModule.sendAXCounterV2
local ReportAvatarEventCounterV1Function = AvatarExperienceAnalyticsModule.reportAvatarEventCounterV1
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local Constants = AvatarExperienceAnalyticsModule.Constants
local FFlagEditProfileImageV2Telemetry = require(Parent.SharedFlags).FFlagEditProfileImageV2Telemetry
local config = {
	confirm = "R15_UPGRADE_CONFIRM",
	cancel = "R15_UPGRADE_CANCEL"
}

local function buildSaveElementMetadata(p1)
	-- upvalues: HttpService (copy)
	local config = {
		mode = p1.mode,
		is_plus_subscriber = tostring(p1.isPlusSubscriber)
	}
	
	if p1.emoteAssetId ~= nil then
		config.emote_asset_id = p1.emoteAssetId
	end
	if p1.frameAssetId ~= nil then
		config.frame_asset_id = tostring(p1.frameAssetId)
	end
	return HttpService:JSONEncode(config)
end

local function buildSubscribeElementMetadata(Input)
	-- upvalues: HttpService (copy)
	local config = {
		mode = Input.mode,
		purchase_flow_uuid = Input.purchaseFlowUuid,
		source = Input.source
	}
	
	if Input.frameAssetId ~= nil then
		config.frame_asset_id = tostring(Input.frameAssetId)
	end
	return HttpService:JSONEncode(config)
end

return {
	logPageView = function(p1)
		-- upvalues: FFlagEditProfileImageV2Telemetry (copy), SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), HttpService (copy), SendAXCounterV2Function (copy)
		if FFlagEditProfileImageV2Telemetry then
			SendUnifiedEventLogFunction({
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PAGE_VIEW,
				surface = UnifiedLoggingSurface.EDIT_PROFILE_IMAGE,
				elementMetadata = HttpService:JSONEncode({ mode = p1.mode })
			})
			SendAXCounterV2Function("EditProfileImagePageView", { mode = p1.mode })
			
			return
		end
	end,
	logSave = function(p1)
		-- upvalues: FFlagEditProfileImageV2Telemetry (copy), SendAXCounterV2Function (copy), SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), buildSaveElementMetadata (copy), ReportAvatarEventCounterV1Function (copy), Constants (copy)
		if not FFlagEditProfileImageV2Telemetry then return end
		SendAXCounterV2Function("EditProfileImageSave", {
			mode = p1.mode,
			is_plus_subscriber = if p1.isPlusSubscriber then "true" else "false",
			result = tostring(p1.result)
		})
		
		if p1.result == "success" then
			SendUnifiedEventLogFunction({
				elementName = "SAVE",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = UnifiedLoggingSurface.EDIT_PROFILE_IMAGE,
				elementMetadata = buildSaveElementMetadata(p1)
			})
			ReportAvatarEventCounterV1Function(Constants.AVATAR_EVENT_COUNTER_NAME.AXUpdateProfilePicture)
			
			return
		end
	end,
	logSubscribe = function(Input)
		-- upvalues: FFlagEditProfileImageV2Telemetry (copy), SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), buildSubscribeElementMetadata (copy), SendAXCounterV2Function (copy)
		if FFlagEditProfileImageV2Telemetry then
			SendUnifiedEventLogFunction({
				elementName = "SUBSCRIBE",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = UnifiedLoggingSurface.EDIT_PROFILE_IMAGE,
				elementMetadata = buildSubscribeElementMetadata(Input)
			})
			SendAXCounterV2Function("EditProfileImageSubscribe", { mode = Input.mode, source = tostring(Input.source) })
			
			return
		end
	end,
	logClose = function(p1)
		-- upvalues: FFlagEditProfileImageV2Telemetry (copy), SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), HttpService (copy), SendAXCounterV2Function (copy)
		if FFlagEditProfileImageV2Telemetry then
			SendUnifiedEventLogFunction({
				elementName = "CLOSE",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = UnifiedLoggingSurface.EDIT_PROFILE_IMAGE,
				elementMetadata = HttpService:JSONEncode({ mode = p1.mode, active_view = p1.activeView })
			})
			SendAXCounterV2Function("EditProfileImageClose", { mode = p1.mode })
			
			return
		end
	end,
	logBack = function(p1)
		-- upvalues: FFlagEditProfileImageV2Telemetry (copy), SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), HttpService (copy), SendAXCounterV2Function (copy)
		if FFlagEditProfileImageV2Telemetry then
			SendUnifiedEventLogFunction({
				elementName = "BACK",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = UnifiedLoggingSurface.EDIT_PROFILE_IMAGE,
				elementMetadata = HttpService:JSONEncode({
					mode = p1.mode,
					active_view = p1.activeView,
					outcome = p1.outcome
				})
			})
			SendAXCounterV2Function("EditProfileImageBack", { mode = p1.mode, outcome = tostring(p1.outcome) })
			
			return
		end
	end,
	logFetchFailure = function(p1)
		-- upvalues: FFlagEditProfileImageV2Telemetry (copy), SendAXCounterV2Function (copy)
		if FFlagEditProfileImageV2Telemetry then
			SendAXCounterV2Function("EditProfileImageFetchFailure", { asset_type = tostring(p1.assetType) })
			
			return
		end
	end,
	logRetry = function(p1)
		-- upvalues: FFlagEditProfileImageV2Telemetry (copy), SendAXCounterV2Function (copy)
		if FFlagEditProfileImageV2Telemetry then
			SendAXCounterV2Function("EditProfileImageRetry", { mode = p1.mode, asset_type = tostring(p1.assetType) })
			
			return
		end
	end,
	logR15UpgradePromptShown = function()
		-- upvalues: SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), SendAXCounterV2Function (copy)
		SendUnifiedEventLogFunction({
			elementName = "R15_UPGRADE_PROMPT",
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION,
			surface = UnifiedLoggingSurface.EDIT_PROFILE_IMAGE
		})
		SendAXCounterV2Function("EditProfileImageR15UpgradePromptShown")
	end,
	logR15UpgradePromptInteraction = function(p1)
		-- upvalues: SendUnifiedEventLogFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), config (copy), SendAXCounterV2Function (copy)
		SendUnifiedEventLogFunction({
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = UnifiedLoggingSurface.EDIT_PROFILE_IMAGE,
			elementName = config[p1]
		})
		SendAXCounterV2Function("EditProfileImageR15UpgradePromptInteraction", { action = tostring(p1) })
	end
}