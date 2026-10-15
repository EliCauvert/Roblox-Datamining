local httpService = game:GetService("HttpService")
local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local parent = avatarExperienceAnalytics.Parent
local _ = require(parent.Signals)
local signalsUtilsModule = require(parent.SignalsUtils)
local fFlagSplitPaneAvatarMetrics = require(parent.SharedFlags).FFlagSplitPaneAvatarMetrics
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local sendUnifiedEventLogModule = require(avatarExperienceAnalytics.sendUnifiedEventLog)
local sendAXCounterV2Module = require(avatarExperienceAnalytics.sendAXCounterV2)
local constantsModule = require(avatarExperienceAnalytics.Constants)
local unifiedLoggingElementNameEnumsModule = require(avatarExperienceAnalytics.Enums.UnifiedLoggingElementNameEnums)
local marketplaceUnifiedAction = require(avatarExperienceAnalytics.UnifiedEventLogEnums).MarketplaceUnifiedAction
local var1 = nil
local var2 = nil

if fFlagSplitPaneAvatarMetrics then
	local var3, var4 = signalsUtilsModule.createSessionScopedSignal(false)
	var1 = var3
	var2 = var4
end
local t = {
	UnsavedChanges = "unsaved_changes",
	NoAdditionalAvatars = "no_additional_avatars"
}
local t_1 = {
	unsaved_changes = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_UNSAVED_DIALOG,
	no_additional_avatars = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_NO_ADDITIONAL_AVATARS_DIALOG
}
local t_2 = {
	previous = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_PREVIOUS_AVATAR_BUTTON,
	next = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_NEXT_AVATAR_BUTTON
}
local t_3 = {
	save = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_UNSAVED_DIALOG_SAVE_BUTTON,
	switch_anyway = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_UNSAVED_DIALOG_SWITCH_ANYWAY_BUTTON,
	close = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_UNSAVED_DIALOG_CLOSE_BUTTON
}
local t_4 = {
	create_avatar = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_NO_ADDITIONAL_AVATARS_DIALOG_CREATE_BUTTON,
	cancel = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_NO_ADDITIONAL_AVATARS_DIALOG_CANCEL_BUTTON
}

local function sendUnifiedClick(p1, p2)
	-- upvalues: sendUnifiedEventLogModule (ref), marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref), httpService (ref), fFlagSplitPaneAvatarMetrics (ref), sendAXCounterV2Module (ref), constantsModule (ref)
	sendUnifiedEventLogModule({
		action = marketplaceUnifiedAction.UI_ELEMENT_CLICK,
		surface = unifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
		elementName = p1,
		elementMetadata = if p2 then httpService:JSONEncode(p2) else nil
	})
	
	if fFlagSplitPaneAvatarMetrics then
		sendAXCounterV2Module(constantsModule.AVATAR_EVENT_COUNTER_NAME.SupportRegionAvatarOverlayControlPressed, { control = p1 })
	end
end

return {
	Dialog = t,
	logDialogShown = function(p1)
		-- upvalues: t_1 (ref), sendUnifiedEventLogModule (ref), marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref), sendAXCounterV2Module (ref), constantsModule (ref)
		local var5 = t_1[p1]
		local t = { dialog = var5 }
		sendUnifiedEventLogModule({
			action = marketplaceUnifiedAction.UI_ELEMENT_IMPRESSION,
			surface = unifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
			elementName = var5
		})
		sendAXCounterV2Module(constantsModule.AVATAR_EVENT_COUNTER_NAME.SupportRegionAvatarOverlayDialogShown, t)
	end,
	logPageView = function()
		-- upvalues: fFlagSplitPaneAvatarMetrics (ref), var1 (write), var2 (write), sendAXCounterV2Module (ref), constantsModule (ref), sendUnifiedEventLogModule (ref), marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref), unifiedLoggingElementNameEnumsModule (ref)
		if fFlagSplitPaneAvatarMetrics then
			if var1(false) then return end
			var2(true)
			sendAXCounterV2Module(constantsModule.AVATAR_EVENT_COUNTER_NAME.SupportRegionAvatarOverlayPageView)
		end
		sendUnifiedEventLogModule({
			action = marketplaceUnifiedAction.PAGE_VIEW,
			surface = unifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
			elementName = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_AVATAR_OVERLAY
		})
	end,
	logProfileChipClick = function()
		-- upvalues: sendUnifiedClick (ref), unifiedLoggingElementNameEnumsModule (ref)
		sendUnifiedClick(unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_PROFILE_CHIP)
	end,
	logEditAvatarClick = function()
		-- upvalues: sendUnifiedClick (ref), unifiedLoggingElementNameEnumsModule (ref)
		sendUnifiedClick(unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_EDIT_AVATAR_BUTTON)
	end,
	logChevronClick = function(p1, p2)
		-- upvalues: sendUnifiedClick (ref), t_2 (ref)
		sendUnifiedClick(t_2[p1], { direction = p1, target_data_ready = p2 })
	end,
	logUnsavedDialogClick = function(p1)
		-- upvalues: sendUnifiedClick (ref), t_3 (ref)
		sendUnifiedClick(t_3[p1])
	end,
	logNoAdditionalAvatarsDialogClick = function(p1)
		-- upvalues: sendUnifiedClick (ref), t_4 (ref)
		sendUnifiedClick(t_4[p1])
	end
}