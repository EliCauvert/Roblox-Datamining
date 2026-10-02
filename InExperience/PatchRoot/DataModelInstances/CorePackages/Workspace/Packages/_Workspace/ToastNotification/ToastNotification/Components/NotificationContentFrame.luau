local parent = script.Parent
local parent_1 = parent.Parent
local context = parent_1.context
local dependenciesModule = require(parent_1.dependencies)
local notificationStyledTextModule = require(parent.NotificationStyledText)
local notificationThumbnailModule = require(parent.NotificationThumbnail)
local toastHoldButtonModule = require(parent.ToastHoldButton)
local typeModule = require(parent_1.type)
local UIBlox = dependenciesModule.UIBlox
local useStyle = UIBlox.Core.Style.useStyle
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local interactable = UIBlox.Core.Control.Interactable
local constantsModule = require(parent_1.constants)
local useNotificationCardStateModule = require(context.useNotificationCardState)
local useNotificationCardDataModule = require(context.useNotificationCardData)
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local foundationModule = require(parent_2.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local defaultContentPadding = constantsModule.DefaultContentPadding
local defaultTextContentPadding = constantsModule.DefaultTextContentPadding
local vector2 = Vector2.new(36, 36)
local isUserThumbnail = require(parent_1.utils.toastNotificationHelper).isUserThumbnail

return function(p1)
	-- upvalues: useStyle (ref), foundationFontFaceMigration (ref), useTokens (ref), useNotificationCardDataModule (ref), isUserThumbnail (ref), useNotificationCardStateModule (ref), reactModule (ref), constantsModule (ref), normalizeFontFace (ref), defaultContentPadding (ref), vector2 (ref), notificationThumbnailModule (ref), defaultTextContentPadding (ref), notificationStyledTextModule (ref), toastHoldButtonModule (ref), interactable (ref), imageSetLabel (ref), typeModule (ref)
	local var1
	local var2 = useStyle()
	local var3 = if foundationFontFaceMigration then useTokens() else nil
	local var4 = if foundationFontFaceMigration then var3.Typography.CaptionLarge.FontSize else var2.Font.BaseSize * var2.Font.CaptionHeader.RelativeSize
	local var5 = if foundationFontFaceMigration then var3.Typography.BodySmall.FontSize else var2.Font.BaseSize * var2.Font.CaptionBody.RelativeSize
	local cardSize = useNotificationCardDataModule().cardSize
	local _ = nil
	
	if isUserThumbnail then
		local var6 = useNotificationCardStateModule("thumbnail")
		var1 = reactModule.useMemo(function()
			-- upvalues: var6 (ref), isUserThumbnail (copy), var2 (ref), cardSize (write), constantsModule (copy)
			local var7 = false
			
			if var6 then
				for i, v in var6 do
					if not isUserThumbnail(v) then
						var7 = true
						break
					end
				end
			end
			return if var7 then if cardSize then cardSize.thumbnail else constantsModule.CardSizeDefault.thumbnail else var2.Tokens.Size.Size_1000
		end, { var6, var2.Tokens.Size.Size_1000, cardSize })
	else
		var1 = if cardSize then cardSize.thumbnail else constantsModule.CardSizeDefault.thumbnail
	end
	local size700 = var2.Tokens.Size.Size_700
	local var7 = useNotificationCardStateModule("textBody")
	local var8 = var7 and var7[1]
	local var9 = var8 and (var8.title and {
		LayoutOrder = 1,
		Text = var8.title,
		MaxSize = Vector2.new(1e999, var4 * 2),
		Size = UDim2.new(1, 0, 0, 0),
		TextSize = var4,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = if foundationFontFaceMigration then nil else var2.Font.CaptionHeader.Font,
		FontFace = if foundationFontFaceMigration then normalizeFontFace(var3.Typography.CaptionLarge.Font) else nil,
		TextColor3 = var2.Theme.TextEmphasis.Color
	})
	local var10 = var8 and (var8.label and {
		LayoutOrder = 2,
		Text = var8.label,
		MaxSize = Vector2.new(1e999, var5 * 2),
		Size = UDim2.new(1, 0, 0, 0),
		TextSize = var5,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = if foundationFontFaceMigration then nil else var2.Font.CaptionBody.Font,
		FontFace = if foundationFontFaceMigration then normalizeFontFace(var3.Typography.BodySmall.Font) else nil
	})
	local var11 = useNotificationCardDataModule()
	cardSize = var11.cardSize
	local handleActions = var11.handleActions
	local var12 = useNotificationCardStateModule("singleMetaAction")
	local var13 = var12 and var12[1]
	
	return reactModule.createElement("Frame", {
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, defaultContentPadding)
		}),
		ThumbnailTextContainer = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = if var13 then UDim2.new(1, -(defaultContentPadding + vector2.X), 0, 0) else UDim2.new(1, 0, 0, 0)
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, defaultContentPadding)
			}),
			NotificationThumbnailFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(0, var1, 0, var1)
			}, {
				NotificationThumbnail = reactModule.createElement(notificationThumbnailModule)
			}),
			ToastTextFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = if p1.showHoldButton then UDim2.new(1, -(var1 + defaultContentPadding * 2 + size700), 0, 0) else UDim2.new(1, -(var1 + defaultContentPadding), 0, 0)
			}, {
				UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 2) }),
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, defaultTextContentPadding)
				}),
				ToastTitle = var9 and reactModule.createElement(notificationStyledTextModule, var9),
				ToastSubtitle = var10 and reactModule.createElement(notificationStyledTextModule, var10)
			}),
			ToastHoldButton = reactModule.createElement(toastHoldButtonModule, {
				layoutOrder = 3,
				iconSize = size700,
				visible = p1.showHoldButton,
				iconTransparency = if p1.shouldAutoFocus then 0.5 else 0,
				progress = p1.holdProgress
			})
		}),
		SingleMetaAction = if var13 then reactModule.createElement(interactable, {
			AutoButtonColor = false,
			BackgroundColor3 = var2.Theme.UIMuted.Color,
			BackgroundTransparency = 0.9,
			LayoutOrder = 2,
			onStateChanged = function() end,
			[reactModule.Event.Activated] = function()
				-- upvalues: handleActions (ref), var13 (ref)
				if handleActions then
					handleActions(var13)
				end
			end,
			Size = UDim2.fromOffset(vector2.X, vector2.Y)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			Icon = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = typeModule.MetaActionIcons[var13.actionIcon],
				ImageColor3 = var2.Theme.IconEmphasis.Color,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(28, 28)
			})
		}) else nil
	})
end