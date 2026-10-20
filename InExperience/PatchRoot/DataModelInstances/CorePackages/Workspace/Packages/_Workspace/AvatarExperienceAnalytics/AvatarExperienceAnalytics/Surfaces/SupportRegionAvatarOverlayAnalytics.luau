local HttpService = game:GetService("HttpService")
local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local _ = require(Parent.Signals)
local SignalsUtilsModule = require(Parent.SignalsUtils)
local FFlagSplitPaneAvatarMetrics = require(Parent.SharedFlags).FFlagSplitPaneAvatarMetrics
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local SendUnifiedEventLogModule = require(AvatarExperienceAnalytics.sendUnifiedEventLog)
local SendAXCounterV2Module = require(AvatarExperienceAnalytics.sendAXCounterV2)
local ConstantsModule = require(AvatarExperienceAnalytics.Constants)
local UnifiedLoggingElementNameEnumsModule = require(AvatarExperienceAnalytics.Enums.UnifiedLoggingElementNameEnums)
local MarketplaceUnifiedAction = require(AvatarExperienceAnalytics.UnifiedEventLogEnums).MarketplaceUnifiedAction
local Callback = nil
local Callback1 = nil

if FFlagSplitPaneAvatarMetrics then
	Callback, Callback1 = SignalsUtilsModule.createSessionScopedSignal(false)
end
local config = {
	unsaved_changes = UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_UNSAVED_DIALOG,
	no_additional_avatars = UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_NO_ADDITIONAL_AVATARS_DIALOG
}
local config1 = {
	previous = UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_PREVIOUS_AVATAR_BUTTON,
	next = UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_NEXT_AVATAR_BUTTON
}
local config2 = {
	save = UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_UNSAVED_DIALOG_SAVE_BUTTON,
	switch_anyway = UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_UNSAVED_DIALOG_SWITCH_ANYWAY_BUTTON,
	close = UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_UNSAVED_DIALOG_CLOSE_BUTTON
}
local config3 = {
	create_avatar = UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_NO_ADDITIONAL_AVATARS_DIALOG_CREATE_BUTTON,
	cancel = UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_NO_ADDITIONAL_AVATARS_DIALOG_CANCEL_BUTTON
}

local function sendUnifiedClick(Control, Input)
	-- upvalues: SendUnifiedEventLogModule (copy), MarketplaceUnifiedAction (copy), UnifiedLoggingSurface (copy), HttpService (copy), FFlagSplitPaneAvatarMetrics (copy), SendAXCounterV2Module (copy), ConstantsModule (copy)
	SendUnifiedEventLogModule({
		action = MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
		surface = UnifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
		elementName = Control,
		elementMetadata = if Input then HttpService:JSONEncode(Input) else nil
	})
	
	if FFlagSplitPaneAvatarMetrics then
		SendAXCounterV2Module(ConstantsModule.AVATAR_EVENT_COUNTER_NAME.SupportRegionAvatarOverlayControlPressed, { control = Control })
	end
end

return {
	Dialog = {
		UnsavedChanges = "unsaved_changes",
		NoAdditionalAvatars = "no_additional_avatars"
	},
	logDialogShown = function(p1)
		-- upvalues: config (copy), SendUnifiedEventLogModule (copy), MarketplaceUnifiedAction (copy), UnifiedLoggingSurface (copy), SendAXCounterV2Module (copy), ConstantsModule (copy)
		local Entry = config[p1]
		local config1 = { dialog = Entry }
		SendUnifiedEventLogModule({
			action = MarketplaceUnifiedAction.UI_ELEMENT_IMPRESSION,
			surface = UnifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
			elementName = Entry
		})
		SendAXCounterV2Module(ConstantsModule.AVATAR_EVENT_COUNTER_NAME.SupportRegionAvatarOverlayDialogShown, config1)
	end,
	logPageView = function()
		-- upvalues: FFlagSplitPaneAvatarMetrics (copy), Callback (ref), Callback1 (ref), SendAXCounterV2Module (copy), ConstantsModule (copy), SendUnifiedEventLogModule (copy), MarketplaceUnifiedAction (copy), UnifiedLoggingSurface (copy), UnifiedLoggingElementNameEnumsModule (copy)
		if FFlagSplitPaneAvatarMetrics then
			if Callback(false) then return end
			Callback1(true)
			SendAXCounterV2Module(ConstantsModule.AVATAR_EVENT_COUNTER_NAME.SupportRegionAvatarOverlayPageView)
		end
		SendUnifiedEventLogModule({
			action = MarketplaceUnifiedAction.PAGE_VIEW,
			surface = UnifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
			elementName = UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_AVATAR_OVERLAY
		})
	end,
	logProfileChipClick = function()
		-- upvalues: sendUnifiedClick (copy), UnifiedLoggingElementNameEnumsModule (copy)
		sendUnifiedClick(UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_PROFILE_CHIP)
	end,
	logEditAvatarClick = function()
		-- upvalues: sendUnifiedClick (copy), UnifiedLoggingElementNameEnumsModule (copy)
		sendUnifiedClick(UnifiedLoggingElementNameEnumsModule.SUPPORT_PANE_EDIT_AVATAR_BUTTON)
	end,
	logChevronClick = function(Direction, Target_data_ready)
		-- upvalues: sendUnifiedClick (copy), config1 (copy)
		sendUnifiedClick(config1[Direction], {
			direction = Direction,
			target_data_ready = Target_data_ready
		})
	end,
	logUnsavedDialogClick = function(p1)
		-- upvalues: sendUnifiedClick (copy), config2 (copy)
		sendUnifiedClick(config2[p1])
	end,
	logNoAdditionalAvatarsDialogClick = function(p1)
		-- upvalues: sendUnifiedClick (copy), config3 (copy)
		sendUnifiedClick(config3[p1])
	end
}