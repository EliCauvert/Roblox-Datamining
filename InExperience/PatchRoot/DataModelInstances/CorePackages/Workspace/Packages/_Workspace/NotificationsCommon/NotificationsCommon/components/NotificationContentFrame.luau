local notificationsCommon = script:FindFirstAncestor("NotificationsCommon")
local components = notificationsCommon.components
local context = notificationsCommon.context
local dependenciesModule = require(notificationsCommon.dependencies)
local notificationStyledTextModule = require(components.NotificationStyledText)
local notificationThumbnailModule = require(components.NotificationThumbnail)
local _ = require(notificationsCommon.type)
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local useStyle = UIBlox.Core.Style.useStyle
local constantsModule = require(notificationsCommon.constants)
local useNotificationCardStateModule = require(context.useNotificationCardState)
local useNotificationCardDataModule = require(context.useNotificationCardData)
local notificationActionsFrameModule = require(components.NotificationActionsFrame)
local iconButton = UIBlox.App.Button.IconButton
local iconSize = UIBlox.App.ImageSet.Enum.IconSize
local overflow = UIBlox.App.ImageSet.Images["icons/common/overflow"]
local defaultContentPadding = constantsModule.DefaultContentPadding
local defaultTextContentPadding = constantsModule.DefaultTextContentPadding
local metaActionsWidth = constantsModule.MetaActionsWidth
local timestampWidth = constantsModule.TimestampWidth
local timestampHeight = constantsModule.TimestampHeight

return function() --[[ line: 27 ]]
	-- upvalues: useStyle (ref), useNotificationCardDataModule (ref), constantsModule (ref), useNotificationCardStateModule (ref), defaultTextContentPadding (ref), metaActionsWidth (ref), timestampWidth (ref), timestampHeight (ref), react (ref), defaultContentPadding (ref), notificationThumbnailModule (ref), notificationStyledTextModule (ref), iconButton (ref), iconSize (ref), overflow (ref), notificationActionsFrameModule (ref)
	local var8 = useStyle()
	local var9 = var8.Font.BaseSize * var8.Font.CaptionHeader.RelativeSize
	local var10 = var8.Font.BaseSize * var8.Font.CaptionBody.RelativeSize
	local var11 = useNotificationCardDataModule()
	local cardSize = var11.cardSize
	local readOnly = var11.readOnly
	local var12 = if cardSize then cardSize.thumbnail else constantsModule.CardSizeDefault.thumbnail
	local openMetaActions = var11.openMetaActions
	local notificationPayload = var11.notificationPayload
	local handleActions = var11.handleActions
	local var13 = useNotificationCardStateModule("textBody")
	local var14 = var13 and var13[1]
	local var15 = var14 and (var14.title and {
		LayoutOrder = 1,
		Text = var14.title,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextSize = var9,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = var8.Font.CaptionHeader.Font,
		TextColor3 = var8.Theme.TextEmphasis.Color
	})
	local var16 = var14 and (var14.label and {
		LayoutOrder = 2,
		Text = var14.label,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextSize = var10,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = var8.Font.CaptionBody.Font,
		TextColor3 = var8.Theme.TextEmphasis.Color
	})
	local var17 = notificationPayload and (notificationPayload.timestamp and {
		LayoutOrder = 2,
		TextTransparency = 0,
		Text = { text = notificationPayload.timestamp },
		Size = UDim2.new(0, timestampWidth + defaultTextContentPadding, 0, timestampHeight),
		TextSize = var9,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Right,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, if readOnly then -defaultTextContentPadding else -(metaActionsWidth + defaultTextContentPadding), 0, 0),
		Font = var8.Font.CaptionHeader.Font,
		TextColor3 = var8.Theme.TextEmphasis.Color
	})
	
	return react.createElement("TextButton", {
		Selectable = false,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		Text = "",
		AutoButtonColor = false,
		BorderSizePixel = 0,
		[react.Event.Activated] = function() --[[ line: 97 ]]
			-- upvalues: handleActions (ref), var14 (ref), notificationPayload (ref)
			if handleActions and var14 and notificationPayload then
				handleActions(var14, notificationPayload)
			end
		end
	}, {
		UIListLayout = react.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, defaultContentPadding)
		}),
		NotificationThumbnailFrame = react.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(0, var12, 0, var12)
		}, {
			NotificationThumbnail = react.createElement(notificationThumbnailModule)
		}),
		ContentFrame = react.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -(var12 + defaultContentPadding), 0, 0)
		}, {
			UIListLayout = react.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, defaultTextContentPadding)
			}),
			NotificationsBody = react.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, constantsModule.MetaActionsHeight),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				NotificationsText = react.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, if readOnly then -(timestampWidth + defaultTextContentPadding) else -(metaActionsWidth + timestampWidth + defaultTextContentPadding * 2), 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIPadding = react.createElement("UIPadding", { PaddingTop = UDim.new(0, defaultTextContentPadding) }),
					UIListLayout = react.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						Padding = UDim.new(0, defaultTextContentPadding)
					}),
					Title = if var15 then react.createElement(notificationStyledTextModule, var15) else nil,
					Subtitle = if var16 then react.createElement(notificationStyledTextModule, var16) else nil
				}),
				Timestamp = if var17 then react.createElement(notificationStyledTextModule, var17) else nil,
				MetaActionsButton = if openMetaActions and not readOnly then react.createElement(iconButton, {
					layoutOrder = 3,
					anchorPoint = Vector2.new(1, 0),
					position = UDim2.new(1, 0, 0, 0),
					size = UDim2.fromOffset(0, 0),
					iconSize = iconSize.Medium,
					icon = overflow,
					onActivated = function() --[[ line: 172 ]]
						-- upvalues: openMetaActions (ref), notificationPayload (ref)
						openMetaActions(notificationPayload)
					end
				}) else nil
			}),
			NotificationActionsFrame = if not readOnly then react.createElement(notificationActionsFrameModule) else nil
		})
	})
end