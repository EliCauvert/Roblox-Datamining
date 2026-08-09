local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local parent = streamNotifications.Parent
local constantsModule = require(streamNotifications.constants)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local userInputService = game:GetService("UserInputService")
local eventStream = require(streamNotifications.analytics.analyticsService).EventStream
local notificationHelper = require(parent.NotificationsCommon).NotificationHelper
local analyticsConstantsModule = require(streamNotifications.analytics.analyticsConstants)
local streamNotificationDropdownExperimentationModule = require(streamNotifications.StreamNotificationDropdownExperimentation)

return function(p0) --[[ line: 25 ]]
	-- upvalues: useStyle (ref), userInputService (ref), useLocalization (ref), constantsModule (ref), streamNotificationDropdownExperimentationModule (ref), reactModule (ref), iconButton (ref), iconSize (ref), notificationHelper (ref), eventStream (ref), analyticsConstantsModule (ref)
	local var7 = useStyle()
	local font = var7.Font
	local font_1 = font.Header1.Font
	local var8 = font.BaseSize * font.Header1.RelativeSize
	local var9 = useLocalization({ headerText = constantsModule.Text.HeaderKey })
	
	return if streamNotificationDropdownExperimentationModule.getDropdownEnabled() then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, constantsModule.Dropdown.HeaderMinHeight)
	}, {
		HeaderText = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Text = var9 and var9.headerText,
			Font = font_1,
			TextSize = var8,
			TextColor3 = var7.Theme.TextEmphasis.Color,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Size = UDim2.new(1, 0, 1, 0)
		})
	}) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constantsModule.Modal.HeaderHeight + (if userInputService.StatusBarSize and p0.isSmallScreen then userInputService.StatusBarSize.Y else 0))
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
				icon = if p0.isSmallScreen then constantsModule.Modal.BackIcon else constantsModule.Modal.CloseIcon,
				size = UDim2.new(0, constantsModule.Modal.HeaderHeight - constantsModule.Modal.Padding * 2, 0, constantsModule.Modal.HeaderHeight - constantsModule.Modal.Padding * 2),
				position = UDim2.fromOffset(constantsModule.Modal.Padding, constantsModule.Modal.Padding),
				onActivated = function() --[[ line: 81 ]]
					-- upvalues: p0 (ref), notificationHelper (copy), eventStream (copy), analyticsConstantsModule (copy)
					p0.displayStream(false)
					notificationHelper.fireEvent(eventStream, analyticsConstantsModule.Context.click, analyticsConstantsModule.EventNames.closeContent, {
						closeMethod = analyticsConstantsModule.CloseMethod.closeIcon
					})
				end
			}),
			HeaderText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = var9 and var9.headerText,
				Font = font_1,
				TextSize = var8,
				TextColor3 = var7.Theme.TextEmphasis.Color,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(1, 0, 0, constantsModule.Modal.HeaderHeight)
			})
		})
	})
end