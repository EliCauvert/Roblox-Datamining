local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local _ = require(script.Parent.ChatChannelSettingsView)

return function(Frame)
	-- upvalues: LocalizationModule (copy), ReactModule (copy)
	local UseLocalizationResult = LocalizationModule.Hooks.useLocalization({
		channelName = "Feature.ChatChannels.Label.ChannelName",
		createdBy = "Feature.ChatChannels.Label.CreatedBy",
		createdAt = "Feature.ChatChannels.Label.CreatedAt",
		notifications = "Feature.ChatChannels.Label.Notifications",
		notificationsDescription = "Feature.ChatChannels.Description.Notifications",
		leaveTitle = "Feature.ChatChannels.Heading.LeaveChannel",
		leaveDescription = "Feature.ChatChannels.Description.LeaveChannel",
		leaveButtonText = "Feature.ChatChannels.Action.LeaveChannel",
		deleteTitle = "Feature.ChatChannels.Heading.DeleteChannel",
		deleteDescription = "Feature.ChatChannels.Description.DeleteChannel",
		deleteButtonText = "Feature.ChatChannels.Action.DeleteChannel"
	})
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: Frame (copy)
		if Frame.canBeNotified and Frame.notificationPreference ~= nil and Frame.onNotificationPreferenceChanged then
			Frame.onNotificationPreferenceChanged(if p1 then "MentionsOnly" else "None")
		end
	end, {
		Frame.canBeNotified,
		Frame.notificationPreference,
		Frame.onNotificationPreferenceChanged
	})
	
	return {
		localized = UseLocalizationResult,
		name = Frame.name,
		createdBy = if Frame.createdBy then Frame.createdBy.username else nil,
		createdAt = if Frame.createdAt then DateTime.fromUnixTimestamp(Frame.createdAt):FormatLocalTime("LL", UseLocalizationResult[LocalizationModule.RobloxLocaleIdKey]) else nil,
		notificationsEnabled = Frame.notificationPreference == "MentionsOnly",
		onEditName = if Frame.canRename then Frame.onEditName else nil,
		onLeave = if Frame.canLeave then Frame.onLeave else nil,
		onDelete = if Frame.canDelete then Frame.onDelete else nil,
		onNotificationsChanged = if Frame.canBeNotified and Frame.notificationPreference ~= nil and Frame.onNotificationPreferenceChanged then UseResult else nil,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "--chat-channel-settings"
	}
end