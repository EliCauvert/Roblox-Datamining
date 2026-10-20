local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local ConstantsModule = require(StreamNotifications.constants)
local ReactModule = require(Parent.React)
local NotificationsCommonModule = require(Parent.NotificationsCommon)
local NotificationCardProvider = NotificationsCommonModule.NotificationCardProvider
local NotificationCard = NotificationsCommonModule.NotificationCard
local Constants = NotificationsCommonModule.constants
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local _ = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local MarshalStreamNotificationDataFunction = NotificationsCommonModule.NotificationHelper.marshalStreamNotificationData
local EnumStreamNotificationsDisplayStateModule = require(StreamNotifications.EnumStreamNotificationsDisplayState)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local BaseMenu = UIBloxModule.App.Menu.BaseMenu
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), EnumStreamNotificationsDisplayStateModule (copy), MarshalStreamNotificationDataFunction (copy), ConstantsModule (copy), NotificationCardProvider (copy), NotificationCard (copy), Constants (copy), ImageSetLabel (copy), IconButton (copy), IconSize (copy), BaseMenu (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	local UseStyleResult = UseStyleFunction()
	local ActiveNotification = p1.activeNotification
	local IsSmallScreen = p1.isSmallScreen
	local HandleActionsFunction = p1.handleActions
	local CloseNotificationDisplayFunction = p1.closeNotificationDisplay
	local UseRefResult = ReactModule.useRef(nil)
	
	if p1.displayState ~= EnumStreamNotificationsDisplayStateModule.MetaActions then
		return nil
	end
	local MarshalStreamNotificationDataResult = MarshalStreamNotificationDataFunction(ActiveNotification)
	local ButtonProps = {}
	
	if MarshalStreamNotificationDataResult then
		for _, value in ipairs(MarshalStreamNotificationDataResult.state.visualItems.metaAction) do
			table.insert(ButtonProps, {
				icon = ConstantsModule.MetaActions.ActionIcons[value.actionIcon] or ConstantsModule.MetaActions.ActionIcons.default,
				text = value.label.text,
				onActivated = function()
					-- upvalues: HandleActionsFunction (copy), value (copy), ActiveNotification (copy)
					if HandleActionsFunction then
						HandleActionsFunction(value, ActiveNotification)
					end
				end
			})
		end
	end
	return ReactModule.createElement(FocusNavigableSurfaceWrapper, {
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		frameProps = { ref = UseRefResult },
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: CloseNotificationDisplayFunction (copy)
					CloseNotificationDisplayFunction()
					p2:cancel()
				end)
			}
		}
	}, {
		UICorner = ReactModule.createElement("UICorner", {
			CornerRadius = if IsSmallScreen then UDim.new(0, 0) else UDim.new(0, ConstantsModule.Modal.CornerRadius)
		}),
		MetaActions = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ref = UseRefResult,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, ConstantsModule.Modal.Padding),
				PaddingLeft = UDim.new(0, ConstantsModule.Modal.Padding),
				PaddingRight = UDim.new(0, ConstantsModule.Modal.Padding),
				PaddingBottom = UDim.new(0, ConstantsModule.Modal.Padding)
			}),
			ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, ConstantsModule.DefaultPadding)
			}),
			CardAndClose = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				ActiveCard = ReactModule.createElement(NotificationCardProvider, {
					isCompact = false,
					readOnly = false,
					openMetaActions = nil,
					notificationPayload = ActiveNotification,
					state = MarshalStreamNotificationDataResult and MarshalStreamNotificationDataResult.state,
					handleActions = HandleActionsFunction
				}, {
					NotificationCard = ReactModule.createElement(NotificationCard, { isHover = false, layoutOrder = 1 })
				}),
				CloseButtonFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromOffset(ConstantsModule.MetaActions.CloseButtonFrameSize, ConstantsModule.MetaActions.CloseButtonFrameSize),
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, -Constants.Padding.DefaultCardPadding, 0, Constants.Padding.DefaultCardPadding)
				}, {
					CloseIcon = ReactModule.createElement(ImageSetLabel, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5),
						Size = UDim2.fromOffset(ConstantsModule.MetaActions.CloseIconSize, ConstantsModule.MetaActions.CloseIconSize),
						Image = ConstantsModule.Modal.CloseIcon,
						ImageColor3 = UseStyleResult.Theme.UIEmphasis.Color
					}),
					CloseButton = ReactModule.createElement(IconButton, {
						layoutOrder = 1,
						iconSize = IconSize.Small,
						size = UDim2.fromOffset(ConstantsModule.MetaActions.CloseButtonSize, ConstantsModule.MetaActions.CloseButtonSize),
						anchorPoint = Vector2.new(0.5, 0.5),
						position = UDim2.new(0.5, 0, 0.5, 0),
						onActivated = CloseNotificationDisplayFunction
					})
				})
			}),
			Menu = ReactModule.createElement(BaseMenu, {
				layoutOrder = 2,
				buttonProps = ButtonProps,
				width = UDim.new(1, 0)
			})
		})
	})
end