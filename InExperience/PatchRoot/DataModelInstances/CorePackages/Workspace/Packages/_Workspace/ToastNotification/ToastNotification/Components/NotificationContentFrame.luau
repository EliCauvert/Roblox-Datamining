local Parent = script.Parent
local Parent1 = Parent.Parent
local Context = Parent1.context
local NotificationStyledTextModule = require(Parent.NotificationStyledText)
local NotificationThumbnailModule = require(Parent.NotificationThumbnail)
local ToastHoldButtonModule = require(Parent.ToastHoldButton)
local TypeModule = require(Parent1.type)
local UIBlox = require(Parent1.dependencies).UIBlox
local UseStyleFunction = UIBlox.Core.Style.useStyle
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Interactable = UIBlox.Core.Control.Interactable
local ConstantsModule = require(Parent1.constants)
local UseNotificationCardStateModule = require(Context.useNotificationCardState)
local UseNotificationCardDataModule = require(Context.useNotificationCardData)
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local FoundationModule = require(Parent2.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local DefaultContentPadding = ConstantsModule.DefaultContentPadding
local DefaultTextContentPadding = ConstantsModule.DefaultTextContentPadding
local _Vector2 = Vector2.new(36, 36)
local IsUserThumbnailFunction = require(Parent1.utils.toastNotificationHelper).isUserThumbnail

return function(p1) --[[ Line: 39 ]]
	-- upvalues: UseStyleFunction (copy), FoundationFontFaceMigration (copy), UseTokensFunction (copy), UseNotificationCardDataModule (copy), IsUserThumbnailFunction (copy), UseNotificationCardStateModule (copy), ReactModule (copy), ConstantsModule (copy), NormalizeFontFaceFunction (copy), DefaultContentPadding (copy), _Vector2 (copy), NotificationThumbnailModule (copy), DefaultTextContentPadding (copy), NotificationStyledTextModule (copy), ToastHoldButtonModule (copy), Interactable (copy), ImageSetLabel (copy), TypeModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseTokensResult = if FoundationFontFaceMigration then UseTokensFunction() else nil
	local FontSize = if FoundationFontFaceMigration then UseTokensResult.Typography.CaptionLarge.FontSize else UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionHeader.RelativeSize
	local FontSize1 = if FoundationFontFaceMigration then UseTokensResult.Typography.BodySmall.FontSize else UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize
	local CardSize = UseNotificationCardDataModule().cardSize
	local UseMemoResult = nil
	
	if IsUserThumbnailFunction then
		local Thumbnail = UseNotificationCardStateModule("thumbnail")
		UseMemoResult = ReactModule.useMemo(function() --[[ Line: 55 ]]
			-- upvalues: Thumbnail (copy), IsUserThumbnailFunction (upval), UseStyleResult (copy), CardSize (ref), ConstantsModule (upval)
			local Flag = false
			
			if Thumbnail then
				for _, value in Thumbnail do
					if not IsUserThumbnailFunction(value) then
						Flag = true
						break
					end
				end
			end
			return if Flag then CardSize and CardSize.thumbnail or ConstantsModule.CardSizeDefault.thumbnail else UseStyleResult.Tokens.Size.Size_1000
		end, {
			Thumbnail,
			UseStyleResult.Tokens.Size.Size_1000,
			CardSize
		})
	else
		UseMemoResult = CardSize and CardSize.thumbnail or ConstantsModule.CardSizeDefault.thumbnail
	end
	local Size700 = UseStyleResult.Tokens.Size.Size_700
	local TextBody = UseNotificationCardStateModule("textBody")
	local TextBodyEntry = TextBody and TextBody[1]
	local Config = TextBodyEntry and (TextBodyEntry.title and {
		LayoutOrder = 1,
		Text = TextBodyEntry.title,
		MaxSize = Vector2.new(1e999, FontSize * 2),
		Size = UDim2.new(1, 0, 0, 0),
		TextSize = FontSize,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.CaptionHeader.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.CaptionLarge.Font) else nil,
		TextColor3 = UseStyleResult.Theme.TextEmphasis.Color
	})
	local Config1 = TextBodyEntry and (TextBodyEntry.label and {
		LayoutOrder = 2,
		Text = TextBodyEntry.label,
		MaxSize = Vector2.new(1e999, FontSize1 * 2),
		Size = UDim2.new(1, 0, 0, 0),
		TextSize = FontSize1,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.CaptionBody.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodySmall.Font) else nil
	})
	local UseNotificationCardDataModuleResult = UseNotificationCardDataModule()
	CardSize = UseNotificationCardDataModuleResult.cardSize
	local HandleActionsFunction = UseNotificationCardDataModuleResult.handleActions
	local SingleMetaAction = UseNotificationCardStateModule("singleMetaAction")
	local SingleMetaActionEntry = SingleMetaAction and SingleMetaAction[1]
	
	return ReactModule.createElement("Frame", {
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, DefaultContentPadding)
		}),
		ThumbnailTextContainer = ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = if SingleMetaActionEntry then UDim2.new(1, -(DefaultContentPadding + _Vector2.X), 0, 0) else UDim2.new(1, 0, 0, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, DefaultContentPadding)
			}),
			NotificationThumbnailFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(0, UseMemoResult, 0, UseMemoResult)
			}, {
				NotificationThumbnail = ReactModule.createElement(NotificationThumbnailModule)
			}),
			ToastTextFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = if p1.showHoldButton then UDim2.new(1, -(UseMemoResult + DefaultContentPadding * 2 + Size700), 0, 0) else UDim2.new(1, -(UseMemoResult + DefaultContentPadding), 0, 0)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 2) }),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, DefaultTextContentPadding)
				}),
				ToastTitle = Config and ReactModule.createElement(NotificationStyledTextModule, Config),
				ToastSubtitle = Config1 and ReactModule.createElement(NotificationStyledTextModule, Config1)
			}),
			ToastHoldButton = ReactModule.createElement(ToastHoldButtonModule, {
				layoutOrder = 3,
				iconSize = Size700,
				visible = p1.showHoldButton,
				iconTransparency = if p1.shouldAutoFocus then 0.5 else 0,
				progress = p1.holdProgress
			})
		}),
		SingleMetaAction = if SingleMetaActionEntry then ReactModule.createElement(Interactable, {
			AutoButtonColor = false,
			BackgroundColor3 = UseStyleResult.Theme.UIMuted.Color,
			BackgroundTransparency = 0.9,
			LayoutOrder = 2,
			onStateChanged = function() --[[ Line: 186 ]] end,
			[ReactModule.Event.Activated] = function() --[[ Line: 187 ]]
				-- upvalues: HandleActionsFunction (copy), SingleMetaActionEntry (copy)
				if HandleActionsFunction then
					HandleActionsFunction(SingleMetaActionEntry)
				end
			end,
			Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y)
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			Icon = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = TypeModule.MetaActionIcons[SingleMetaActionEntry.actionIcon],
				ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(28, 28)
			})
		}) else nil
	})
end