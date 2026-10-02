local notificationsCommon = script:FindFirstAncestor("NotificationsCommon")
local parent = notificationsCommon.Parent
local components = notificationsCommon.components
local context = notificationsCommon.context
local dependenciesModule = require(notificationsCommon.dependencies)
local notificationStyledTextModule = require(components.NotificationStyledText)
local notificationThumbnailModule = require(components.NotificationThumbnail)
local _ = require(notificationsCommon.type)
local react = dependenciesModule.React
local UIBlox = dependenciesModule.UIBlox
local foundationModule = require(parent.Foundation)
local useStyle = UIBlox.Core.Style.useStyle
local useTokens = foundationModule.Hooks.useTokens
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
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

return function()
	-- upvalues: useStyle (ref), foundationFontFaceMigration (ref), useTokens (ref), useNotificationCardDataModule (ref), constantsModule (ref), useNotificationCardStateModule (ref), normalizeFontFace (ref), defaultTextContentPadding (ref), metaActionsWidth (ref), timestampWidth (ref), timestampHeight (ref), react (ref), defaultContentPadding (ref), notificationThumbnailModule (ref), notificationStyledTextModule (ref), iconButton (ref), iconSize (ref), overflow (ref), notificationActionsFrameModule (ref)
	local var1 = useStyle()
	local var2 = if foundationFontFaceMigration then useTokens() else nil
	local var3 = if foundationFontFaceMigration then var2.Typography.CaptionLarge.FontSize else var1.Font.BaseSize * var1.Font.CaptionHeader.RelativeSize
	local var4 = if foundationFontFaceMigration then var2.Typography.BodySmall.FontSize else var1.Font.BaseSize * var1.Font.CaptionBody.RelativeSize
	local var5 = useNotificationCardDataModule()
	local cardSize = var5.cardSize
	local readOnly = var5.readOnly
	local var6 = if cardSize then cardSize.thumbnail else constantsModule.CardSizeDefault.thumbnail
	local openMetaActions = var5.openMetaActions
	local notificationPayload = var5.notificationPayload
	local handleActions = var5.handleActions
	local var7 = useNotificationCardStateModule("textBody")
	local var8 = var7 and var7[1]
	local var9 = var8 and (var8.title and {
		LayoutOrder = 1,
		Text = var8.title,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextSize = var3,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = if foundationFontFaceMigration then nil else var1.Font.CaptionHeader.Font,
		FontFace = if foundationFontFaceMigration then normalizeFontFace(var2.Typography.CaptionLarge.Font) else nil,
		TextColor3 = var1.Theme.TextEmphasis.Color
	})
	local var10 = var8 and (var8.label and {
		LayoutOrder = 2,
		Text = var8.label,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextSize = var4,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = if foundationFontFaceMigration then nil else var1.Font.CaptionBody.Font,
		FontFace = if foundationFontFaceMigration then normalizeFontFace(var2.Typography.BodySmall.Font) else nil,
		TextColor3 = var1.Theme.TextEmphasis.Color
	})
	local var11 = notificationPayload and (notificationPayload.timestamp and {
		LayoutOrder = 2,
		TextTransparency = 0,
		Text = { text = notificationPayload.timestamp },
		Size = UDim2.new(0, timestampWidth + defaultTextContentPadding, 0, timestampHeight),
		TextSize = var3,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Right,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, if readOnly then -defaultTextContentPadding else -(metaActionsWidth + defaultTextContentPadding), 0, 0),
		Font = if foundationFontFaceMigration then nil else var1.Font.CaptionHeader.Font,
		FontFace = if foundationFontFaceMigration then normalizeFontFace(var2.Typography.CaptionLarge.Font) else nil,
		TextColor3 = var1.Theme.TextEmphasis.Color
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
		[react.Event.Activated] = function()
			-- upvalues: handleActions (ref), var8 (ref), notificationPayload (ref)
			if handleActions and var8 and notificationPayload then
				handleActions(var8, notificationPayload)
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
			Size = UDim2.new(0, var6, 0, var6)
		}, {
			NotificationThumbnail = react.createElement(notificationThumbnailModule)
		}),
		ContentFrame = react.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -(var6 + defaultContentPadding), 0, 0)
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
					Title = if var9 then react.createElement(notificationStyledTextModule, var9) else nil,
					Subtitle = if var10 then react.createElement(notificationStyledTextModule, var10) else nil
				}),
				Timestamp = if var11 then react.createElement(notificationStyledTextModule, var11) else nil,
				MetaActionsButton = if openMetaActions and not readOnly then react.createElement(iconButton, {
					layoutOrder = 3,
					anchorPoint = Vector2.new(1, 0),
					position = UDim2.new(1, 0, 0, 0),
					size = UDim2.fromOffset(0, 0),
					iconSize = iconSize.Medium,
					icon = overflow,
					onActivated = function()
						-- upvalues: openMetaActions (ref), notificationPayload (ref)
						openMetaActions(notificationPayload)
					end
				}) else nil
			}),
			NotificationActionsFrame = if not readOnly then react.createElement(notificationActionsFrameModule) else nil
		})
	})
end