local NotificationsCommon = script:FindFirstAncestor("NotificationsCommon")
local Components = NotificationsCommon.components
local Context = NotificationsCommon.context
local DependenciesModule = require(NotificationsCommon.dependencies)
local NotificationStyledTextModule = require(Components.NotificationStyledText)
local NotificationThumbnailModule = require(Components.NotificationThumbnail)
local _ = require(NotificationsCommon.type)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local FoundationModule = require(NotificationsCommon.Parent.Foundation)
local UseStyleFunction = UIBlox.Core.Style.useStyle
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ConstantsModule = require(NotificationsCommon.constants)
local UseNotificationCardStateModule = require(Context.useNotificationCardState)
local UseNotificationCardDataModule = require(Context.useNotificationCardData)
local NotificationActionsFrameModule = require(Components.NotificationActionsFrame)
local IconButton = UIBlox.App.Button.IconButton
local IconSize = UIBlox.App.ImageSet.Enum.IconSize
local IconsCommonOverflow = UIBlox.App.ImageSet.Images["icons/common/overflow"]
local DefaultContentPadding = ConstantsModule.DefaultContentPadding
local DefaultTextContentPadding = ConstantsModule.DefaultTextContentPadding
local MetaActionsWidth = ConstantsModule.MetaActionsWidth
local TimestampWidth = ConstantsModule.TimestampWidth
local TimestampHeight = ConstantsModule.TimestampHeight

return function()
	-- upvalues: UseStyleFunction (copy), FoundationFontFaceMigration (copy), UseTokensFunction (copy), UseNotificationCardDataModule (copy), ConstantsModule (copy), UseNotificationCardStateModule (copy), NormalizeFontFaceFunction (copy), DefaultTextContentPadding (copy), MetaActionsWidth (copy), TimestampWidth (copy), TimestampHeight (copy), React (copy), DefaultContentPadding (copy), NotificationThumbnailModule (copy), NotificationStyledTextModule (copy), IconButton (copy), IconSize (copy), IconsCommonOverflow (copy), NotificationActionsFrameModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = if FoundationFontFaceMigration then UseTokensFunction() else nil
	local FontSize = if FoundationFontFaceMigration then UseTokensResult.Typography.CaptionLarge.FontSize else UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionHeader.RelativeSize
	local FontSize1 = if FoundationFontFaceMigration then UseTokensResult.Typography.BodySmall.FontSize else UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize
	local UseNotificationCardDataModuleResult = UseNotificationCardDataModule()
	local CardSize = UseNotificationCardDataModuleResult.cardSize
	local ReadOnly = UseNotificationCardDataModuleResult.readOnly
	local Thumbnail = CardSize and CardSize.thumbnail or ConstantsModule.CardSizeDefault.thumbnail
	local OpenMetaActionsFunction = UseNotificationCardDataModuleResult.openMetaActions
	local NotificationPayload = UseNotificationCardDataModuleResult.notificationPayload
	local HandleActionsFunction = UseNotificationCardDataModuleResult.handleActions
	local TextBody = UseNotificationCardStateModule("textBody")
	local TextBodyEntry = TextBody and TextBody[1]
	local Config = TextBodyEntry and (TextBodyEntry.title and {
		LayoutOrder = 1,
		Text = TextBodyEntry.title,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextSize = FontSize,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.CaptionHeader.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.CaptionLarge.Font) else nil,
		TextColor3 = UseStyleResult.Theme.TextEmphasis.Color
	})
	local Config1 = TextBodyEntry and (TextBodyEntry.label and {
		LayoutOrder = 2,
		Text = TextBodyEntry.label,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextSize = FontSize1,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.CaptionBody.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodySmall.Font) else nil,
		TextColor3 = UseStyleResult.Theme.TextEmphasis.Color
	})
	local Config2 = NotificationPayload and (NotificationPayload.timestamp and {
		LayoutOrder = 2,
		TextTransparency = 0,
		Text = { text = NotificationPayload.timestamp },
		Size = UDim2.new(0, TimestampWidth + DefaultTextContentPadding, 0, TimestampHeight),
		TextSize = FontSize,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Right,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, if ReadOnly then -DefaultTextContentPadding else -(MetaActionsWidth + DefaultTextContentPadding), 0, 0),
		Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.CaptionHeader.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.CaptionLarge.Font) else nil,
		TextColor3 = UseStyleResult.Theme.TextEmphasis.Color
	})
	
	return React.createElement("TextButton", {
		Selectable = false,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		Text = "",
		AutoButtonColor = false,
		BorderSizePixel = 0,
		[React.Event.Activated] = function()
			-- upvalues: HandleActionsFunction (copy), TextBodyEntry (copy), NotificationPayload (copy)
			if HandleActionsFunction and TextBodyEntry and NotificationPayload then
				HandleActionsFunction(TextBodyEntry, NotificationPayload)
			end
		end
	}, {
		UIListLayout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, DefaultContentPadding)
		}),
		NotificationThumbnailFrame = React.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(0, Thumbnail, 0, Thumbnail)
		}, {
			NotificationThumbnail = React.createElement(NotificationThumbnailModule)
		}),
		ContentFrame = React.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -(Thumbnail + DefaultContentPadding), 0, 0)
		}, {
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, DefaultTextContentPadding)
			}),
			NotificationsBody = React.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, ConstantsModule.MetaActionsHeight),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				NotificationsText = React.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, if ReadOnly then -(TimestampWidth + DefaultTextContentPadding) else -(MetaActionsWidth + TimestampWidth + DefaultTextContentPadding * 2), 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					UIPadding = React.createElement("UIPadding", { PaddingTop = UDim.new(0, DefaultTextContentPadding) }),
					UIListLayout = React.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						Padding = UDim.new(0, DefaultTextContentPadding)
					}),
					Title = if Config then React.createElement(NotificationStyledTextModule, Config) else nil,
					Subtitle = if Config1 then React.createElement(NotificationStyledTextModule, Config1) else nil
				}),
				Timestamp = if Config2 then React.createElement(NotificationStyledTextModule, Config2) else nil,
				MetaActionsButton = if OpenMetaActionsFunction and not ReadOnly then React.createElement(IconButton, {
					layoutOrder = 3,
					anchorPoint = Vector2.new(1, 0),
					position = UDim2.new(1, 0, 0, 0),
					size = UDim2.fromOffset(0, 0),
					iconSize = IconSize.Medium,
					icon = IconsCommonOverflow,
					onActivated = function()
						-- upvalues: OpenMetaActionsFunction (copy), NotificationPayload (copy)
						OpenMetaActionsFunction(NotificationPayload)
					end
				}) else nil
			}),
			NotificationActionsFrame = if ReadOnly then nil else React.createElement(NotificationActionsFrameModule)
		})
	})
end