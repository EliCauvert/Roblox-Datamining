local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SettingsFieldsModule = require(script.Parent.Parent.SettingsFields)

return function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy), SettingsFieldsModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-large size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		About = ReactModule.createElement(FoundationModule.List.Root, {
			isContained = true,
			LayoutOrder = 1,
			hasDivider = { hasDivider = true, isInset = false }
		}, {
			Name = ReactModule.createElement(SettingsFieldsModule.SettingsFieldBase, {
				LayoutOrder = 1,
				title = Frame.localized.channelName,
				description = Frame.name,
				onClick = Frame.onEditName,
				testId = `{Frame.testId}--name`
			}),
			CreatedBy = if Frame.createdBy then ReactModule.createElement(SettingsFieldsModule.SettingsFieldBase, {
				LayoutOrder = 2,
				title = Frame.localized.createdBy,
				description = Frame.createdBy
			}) else nil,
			CreatedAt = if Frame.createdAt then ReactModule.createElement(SettingsFieldsModule.SettingsFieldBase, {
				LayoutOrder = 3,
				title = Frame.localized.createdAt,
				description = Frame.createdAt
			}) else nil
		}),
		Settings = if Frame.onNotificationsChanged then ReactModule.createElement(FoundationModule.List.Root, {
			isContained = true,
			LayoutOrder = 2,
			hasDivider = { hasDivider = true, isInset = false }
		}, {
			Notifications = ReactModule.createElement(SettingsFieldsModule.SettingsToggleField, {
				LayoutOrder = 1,
				title = Frame.localized.notifications,
				description = Frame.localized.notificationsDescription,
				value = Frame.notificationsEnabled,
				onChange = Frame.onNotificationsChanged,
				testId = `{Frame.testId}--notifications`
			})
		}) else nil,
		Actions = if Frame.onLeave or Frame.onDelete then ReactModule.createElement(FoundationModule.List.Root, {
			isContained = true,
			LayoutOrder = 3,
			hasDivider = { hasDivider = true, isInset = false }
		}, {
			Leave = if Frame.onLeave then ReactModule.createElement(SettingsFieldsModule.SettingsButtonField, {
				LayoutOrder = 1,
				title = Frame.localized.leaveTitle,
				description = Frame.localized.leaveDescription,
				buttonText = Frame.localized.leaveButtonText,
				buttonVariant = FoundationModule.Enums.ButtonVariant.Standard,
				onClick = Frame.onLeave,
				testId = `{Frame.testId}--leave`
			}) else nil,
			Delete = if Frame.onDelete then ReactModule.createElement(SettingsFieldsModule.SettingsButtonField, {
				LayoutOrder = 2,
				title = Frame.localized.deleteTitle,
				description = Frame.localized.deleteDescription,
				buttonText = Frame.localized.deleteButtonText,
				buttonVariant = FoundationModule.Enums.ButtonVariant.Alert,
				onClick = Frame.onDelete,
				testId = `{Frame.testId}--delete`
			}) else nil
		}) else nil
	})
end