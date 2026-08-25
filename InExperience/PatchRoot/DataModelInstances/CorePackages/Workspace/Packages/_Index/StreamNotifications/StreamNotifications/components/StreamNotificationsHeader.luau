local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local parent = streamNotifications.Parent
local constantsModule = require(streamNotifications.constants)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local userInputService = game:GetService("UserInputService")
local eventStream = require(streamNotifications.analytics.analyticsService).EventStream
local notificationHelper = require(parent.NotificationsCommon).NotificationHelper
local analyticsConstantsModule = require(streamNotifications.analytics.analyticsConstants)
local streamNotificationDropdownExperimentationModule = require(streamNotifications.StreamNotificationDropdownExperimentation)
local streamNotificationSettingsExperimentationModule = require(streamNotifications.StreamNotificationSettingsExperimentation)
local streamNotificationSettingsActivationModule = require(streamNotifications.StreamNotificationSettingsActivation)
local fFlagStreamNotificationUXSettingsHeader = require(parent.SharedFlags).FFlagStreamNotificationUXSettingsHeader

local function _(value, p0)
	return value - p0 * 2
end

return function(p1)
	-- upvalues: useStyle (ref), userInputService (ref), useLocalization (ref), constantsModule (ref), streamNotificationDropdownExperimentationModule (ref), fFlagStreamNotificationUXSettingsHeader (ref), useDispatch (ref), streamNotificationSettingsExperimentationModule (ref), streamNotificationSettingsActivationModule (ref), reactModule (ref), iconButton (ref), iconSize (ref), notificationHelper (ref), eventStream (ref), analyticsConstantsModule (ref)
	local var9 = useStyle()
	local font = var9.Font
	local font_1 = font.Header1.Font
	local var10 = font.BaseSize * font.Header1.RelativeSize
	local var11 = if userInputService.StatusBarSize and p1.isSmallScreen then userInputService.StatusBarSize.Y else 0
	local var12 = useLocalization({ headerText = constantsModule.Text.HeaderKey })
	local dropdownEnabled = streamNotificationDropdownExperimentationModule.getDropdownEnabled()
	local _ = nil
	local settingsGearEnabled = false
	
	local var15 = function() end
	
	if fFlagStreamNotificationUXSettingsHeader then
		settingsGearEnabled = streamNotificationSettingsExperimentationModule.getSettingsGearEnabled()
		var15 = streamNotificationSettingsActivationModule.createOnSettingsActivated(settingsGearEnabled, dropdownEnabled, p1.displayStream, useDispatch())
	end
	if dropdownEnabled then
		local headerMinHeight = constantsModule.Dropdown.HeaderMinHeight
		local var16 = headerMinHeight - constantsModule.DefaultPadding * 2
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, headerMinHeight)
		}, {
			HeaderText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = var12 and var12.headerText,
				Font = font_1,
				TextSize = var10,
				TextColor3 = var9.Theme.TextEmphasis.Color,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, -(if settingsGearEnabled then var16 else 0), 1, 0)
			}),
			SettingsButton = if fFlagStreamNotificationUXSettingsHeader and settingsGearEnabled then reactModule.createElement(iconButton, {
				anchorPoint = Vector2.new(1, 0.5),
				iconSize = iconSize.Medium,
				icon = constantsModule.Modal.SettingsIcon,
				position = UDim2.new(1, 0, 0.5, 0),
				size = UDim2.fromOffset(var16, var16),
				onActivated = var15
			}) else nil
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constantsModule.Modal.HeaderHeight + var11)
	}, {
		HeaderFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, constantsModule.Modal.HeaderHeight),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1)
		}, {
			CloseModal = reactModule.createElement(iconButton, {
				layoutOrder = 1,
				anchorPoint = Vector2.new(0, 0),
				iconSize = iconSize.Medium,
				icon = if p1.isSmallScreen then constantsModule.Modal.BackIcon else constantsModule.Modal.CloseIcon,
				size = UDim2.new(0, constantsModule.Modal.HeaderHeight - constantsModule.Modal.Padding * 2, 0, constantsModule.Modal.HeaderHeight - constantsModule.Modal.Padding * 2),
				position = UDim2.fromOffset(constantsModule.Modal.Padding, constantsModule.Modal.Padding),
				onActivated = function()
					-- upvalues: p1 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy)
					p1.displayStream(false)
					notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.closeContent, {
						closeMethod = analyticsConstantsModule.CloseMethod.closeIcon
					})
				end
			}),
			HeaderText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = var12 and var12.headerText,
				Font = font_1,
				TextSize = var10,
				TextColor3 = var9.Theme.TextEmphasis.Color,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(1, 0, 0, constantsModule.Modal.HeaderHeight)
			}),
			SettingsButton = if fFlagStreamNotificationUXSettingsHeader and settingsGearEnabled then reactModule.createElement(iconButton, {
				anchorPoint = Vector2.new(1, 0),
				iconSize = iconSize.Medium,
				icon = constantsModule.Modal.SettingsIcon,
				position = UDim2.new(1, -constantsModule.Modal.Padding, 0, constantsModule.Modal.Padding),
				size = UDim2.fromOffset(constantsModule.Modal.HeaderHeight - constantsModule.Modal.Padding * 2, constantsModule.Modal.HeaderHeight - constantsModule.Modal.Padding * 2),
				onActivated = var15
			}) else nil
		})
	})
end