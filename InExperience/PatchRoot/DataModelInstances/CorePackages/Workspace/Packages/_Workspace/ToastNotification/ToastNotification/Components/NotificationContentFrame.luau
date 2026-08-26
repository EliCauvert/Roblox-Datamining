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
local reactModule = require(parent_1.Parent.React)
local defaultContentPadding = constantsModule.DefaultContentPadding
local defaultTextContentPadding = constantsModule.DefaultTextContentPadding
local vector2 = Vector2.new(36, 36)
local isUserThumbnail = require(parent_1.utils.toastNotificationHelper).isUserThumbnail

return function(p1)
	-- upvalues: useStyle (ref), useNotificationCardDataModule (ref), isUserThumbnail (ref), useNotificationCardStateModule (ref), reactModule (ref), constantsModule (ref), defaultContentPadding (ref), vector2 (ref), notificationThumbnailModule (ref), defaultTextContentPadding (ref), notificationStyledTextModule (ref), toastHoldButtonModule (ref), interactable (ref), imageSetLabel (ref), typeModule (ref)
	local var1
	local var2 = useStyle()
	local var3 = var2.Font.BaseSize * var2.Font.CaptionHeader.RelativeSize
	local var4 = var2.Font.BaseSize * var2.Font.CaptionBody.RelativeSize
	local cardSize = useNotificationCardDataModule().cardSize
	local _ = nil
	
	if isUserThumbnail then
		local var5 = useNotificationCardStateModule("thumbnail")
		var1 = reactModule.useMemo(function()
			-- upvalues: var5 (ref), isUserThumbnail (copy), var2 (ref), cardSize (write), constantsModule (copy)
			local var6 = false
			
			if var5 then
				for i, v in var5 do
					if not isUserThumbnail(v) then
						var6 = true
						break
					end
				end
			end
			return if var6 then if cardSize then cardSize.thumbnail else constantsModule.CardSizeDefault.thumbnail else var2.Tokens.Size.Size_1000
		end, { var5, var2.Tokens.Size.Size_1000, cardSize })
	else
		var1 = if cardSize then cardSize.thumbnail else constantsModule.CardSizeDefault.thumbnail
	end
	local size700 = var2.Tokens.Size.Size_700
	local var6 = useNotificationCardStateModule("textBody")
	local var7 = var6 and var6[1]
	local var8 = var7 and (var7.title and {
		LayoutOrder = 1,
		Text = var7.title,
		MaxSize = Vector2.new(1e999, var3 * 2),
		Size = UDim2.new(1, 0, 0, 0),
		TextSize = var3,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = var2.Font.CaptionHeader.Font,
		TextColor3 = var2.Theme.TextEmphasis.Color
	})
	local var9 = var7 and (var7.label and {
		LayoutOrder = 2,
		Text = var7.label,
		MaxSize = Vector2.new(1e999, var4 * 2),
		Size = UDim2.new(1, 0, 0, 0),
		TextSize = var4,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = var2.Font.CaptionBody.Font
	})
	local var10 = useNotificationCardDataModule()
	cardSize = var10.cardSize
	local handleActions = var10.handleActions
	local var11 = useNotificationCardStateModule("singleMetaAction")
	local var12 = var11 and var11[1]
	
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
			Size = if var12 then UDim2.new(1, -(defaultContentPadding + vector2.X), 0, 0) else UDim2.new(1, 0, 0, 0)
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
				ToastTitle = var8 and reactModule.createElement(notificationStyledTextModule, var8),
				ToastSubtitle = var9 and reactModule.createElement(notificationStyledTextModule, var9)
			}),
			ToastHoldButton = reactModule.createElement(toastHoldButtonModule, {
				layoutOrder = 3,
				iconSize = size700,
				visible = p1.showHoldButton,
				iconTransparency = if p1.shouldAutoFocus then 0.5 else 0,
				progress = p1.holdProgress
			})
		}),
		SingleMetaAction = if var12 then reactModule.createElement(interactable, {
			AutoButtonColor = false,
			BackgroundColor3 = var2.Theme.UIMuted.Color,
			BackgroundTransparency = 0.9,
			LayoutOrder = 2,
			onStateChanged = function() end,
			[reactModule.Event.Activated] = function()
				-- upvalues: handleActions (ref), var12 (ref)
				if handleActions then
					handleActions(var12)
				end
			end,
			Size = UDim2.fromOffset(vector2.X, vector2.Y)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			Icon = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = typeModule.MetaActionIcons[var12.actionIcon],
				ImageColor3 = var2.Theme.IconEmphasis.Color,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(28, 28)
			})
		}) else nil
	})
end