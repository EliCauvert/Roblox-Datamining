local httpService = game:GetService("HttpService")
local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local unifiedLoggingSurface = require(avatarExperienceAnalytics.Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local sendUnifiedEventLogModule = require(avatarExperienceAnalytics.sendUnifiedEventLog)
local unifiedLoggingElementNameEnumsModule = require(avatarExperienceAnalytics.Enums.UnifiedLoggingElementNameEnums)
local marketplaceUnifiedAction = require(avatarExperienceAnalytics.UnifiedEventLogEnums).MarketplaceUnifiedAction
local t = {
	previous = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_PREVIOUS_AVATAR_BUTTON,
	next = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_NEXT_AVATAR_BUTTON
}
local t_1 = {
	save = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_UNSAVED_DIALOG_SAVE_BUTTON,
	switch_anyway = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_UNSAVED_DIALOG_SWITCH_ANYWAY_BUTTON,
	close = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_UNSAVED_DIALOG_CLOSE_BUTTON
}
local t_2 = {
	create_avatar = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_NO_ADDITIONAL_AVATARS_DIALOG_CREATE_BUTTON,
	cancel = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_NO_ADDITIONAL_AVATARS_DIALOG_CANCEL_BUTTON
}

local function _(p1, p2)
	-- upvalues: sendUnifiedEventLogModule (ref), marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref), httpService (ref)
	sendUnifiedEventLogModule({
		action = marketplaceUnifiedAction.UI_ELEMENT_CLICK,
		surface = unifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
		elementName = p1,
		elementMetadata = if p2 then httpService:JSONEncode(p2) else nil
	})
end

return {
	logPageView = function()
		-- upvalues: sendUnifiedEventLogModule (ref), marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref), unifiedLoggingElementNameEnumsModule (ref)
		sendUnifiedEventLogModule({
			action = marketplaceUnifiedAction.PAGE_VIEW,
			surface = unifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
			elementName = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_AVATAR_OVERLAY
		})
	end,
	logEditAvatarClick = function()
		-- upvalues: unifiedLoggingElementNameEnumsModule (ref), sendUnifiedEventLogModule (ref), marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref)
		sendUnifiedEventLogModule({
			elementMetadata = nil,
			action = marketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
			elementName = unifiedLoggingElementNameEnumsModule.SUPPORT_PANE_EDIT_AVATAR_BUTTON
		})
	end,
	logChevronClick = function(p1, p2)
		-- upvalues: t (ref), sendUnifiedEventLogModule (ref), marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref), httpService (ref)
		local t_1 = { direction = p1, target_data_ready = p2 }
		sendUnifiedEventLogModule({
			action = marketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
			elementName = t[p1],
			elementMetadata = if t_1 then httpService:JSONEncode(t_1) else nil
		})
	end,
	logUnsavedDialogClick = function(p1)
		-- upvalues: t_1 (ref), sendUnifiedEventLogModule (ref), marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref)
		sendUnifiedEventLogModule({
			elementMetadata = nil,
			action = marketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
			elementName = t_1[p1]
		})
	end,
	logNoAdditionalAvatarsDialogClick = function(p1)
		-- upvalues: t_2 (ref), sendUnifiedEventLogModule (ref), marketplaceUnifiedAction (ref), unifiedLoggingSurface (ref)
		sendUnifiedEventLogModule({
			elementMetadata = nil,
			action = marketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.SUPPORT_PANE_AVATAR_OVERLAY,
			elementName = t_2[p1]
		})
	end
}