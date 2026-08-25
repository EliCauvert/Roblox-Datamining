local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local parent = streamNotifications.Parent
local constantsModule = require(streamNotifications.constants)
local reactModule = require(parent.React)
local notificationsCommonModule = require(parent.NotificationsCommon)
local notificationCardProvider = notificationsCommonModule.NotificationCardProvider
local notificationCard = notificationsCommonModule.NotificationCard
local notificationHelper = notificationsCommonModule.NotificationHelper
local constants = notificationsCommonModule.constants
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local _ = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local marshalStreamNotificationData = notificationHelper.marshalStreamNotificationData
local enumStreamNotificationsDisplayStateModule = require(streamNotifications.EnumStreamNotificationsDisplayState)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local baseMenu = UIBloxModule.App.Menu.BaseMenu
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel

return function(p0)
	-- upvalues: useStyle (ref), reactModule (ref), enumStreamNotificationsDisplayStateModule (ref), marshalStreamNotificationData (ref), constantsModule (ref), notificationCardProvider (ref), notificationCard (ref), constants (ref), imageSetLabel (ref), iconButton (ref), iconSize (ref), baseMenu (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref)
	local var8 = useStyle()
	local activeNotification = p0.activeNotification
	local displayState = p0.displayState
	local isSmallScreen = p0.isSmallScreen
	local handleActions = p0.handleActions
	local closeNotificationDisplay = p0.closeNotificationDisplay
	local var9 = reactModule.useRef(nil)
	
	if displayState ~= enumStreamNotificationsDisplayStateModule.MetaActions then
		return nil
	end
	local var10 = marshalStreamNotificationData(activeNotification)
	local t = {}
	
	if var10 then
		for i, v in ipairs(var10.state.visualItems.metaAction) do
			table.insert(t, {
				icon = constantsModule.MetaActions.ActionIcons[v.actionIcon] or constantsModule.MetaActions.ActionIcons.default,
				text = v.label.text,
				onActivated = function()
					-- upvalues: handleActions (ref), v (ref), activeNotification (ref)
					if handleActions then
						handleActions(v, activeNotification)
					end
				end
			})
		end
	end
	return reactModule.createElement(focusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ContextualMenu,
		frameProps = { ref = var9 },
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = inputHandlersModule.onRelease(function(p1)
					-- upvalues: closeNotificationDisplay (ref)
					closeNotificationDisplay()
					p1:cancel()
				end)
			}
		}
	}, {
		UICorner = reactModule.createElement("UICorner", {
			CornerRadius = if not isSmallScreen then UDim.new(0, constantsModule.Modal.CornerRadius) else UDim.new(0, 0)
		}),
		MetaActions = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ref = var9,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, constantsModule.Modal.Padding),
				PaddingLeft = UDim.new(0, constantsModule.Modal.Padding),
				PaddingRight = UDim.new(0, constantsModule.Modal.Padding),
				PaddingBottom = UDim.new(0, constantsModule.Modal.Padding)
			}),
			reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, constantsModule.DefaultPadding)
			}),
			CardAndClose = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				ActiveCard = reactModule.createElement(notificationCardProvider, {
					isCompact = false,
					readOnly = false,
					openMetaActions = nil,
					notificationPayload = activeNotification,
					state = var10 and var10.state,
					handleActions = handleActions
				}, {
					NotificationCard = reactModule.createElement(notificationCard, { isHover = false, layoutOrder = 1 })
				}),
				CloseButtonFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(constantsModule.MetaActions.CloseButtonFrameSize, constantsModule.MetaActions.CloseButtonFrameSize),
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -constants.Padding.DefaultCardPadding, 0, constants.Padding.DefaultCardPadding)
				}, {
					CloseIcon = reactModule.createElement(imageSetLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						Size = UDim2.fromOffset(constantsModule.MetaActions.CloseIconSize, constantsModule.MetaActions.CloseIconSize),
						Image = constantsModule.Modal.CloseIcon,
						ImageColor3 = var8.Theme.UIEmphasis.Color
					}),
					CloseButton = reactModule.createElement(iconButton, {
						layoutOrder = 1,
						iconSize = iconSize.Small,
						size = UDim2.fromOffset(constantsModule.MetaActions.CloseButtonSize, constantsModule.MetaActions.CloseButtonSize),
						anchorPoint = Vector2.new(0.5, 0.5),
						position = UDim2.new(0.5, 0, 0.5, 0),
						onActivated = closeNotificationDisplay
					})
				})
			}),
			Menu = reactModule.createElement(baseMenu, { layoutOrder = 2, buttonProps = t, width = UDim.new(1, 0) })
		})
	})
end