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

return function(p0) --[[ line: 35 ]]
	-- upvalues: useStyle (ref), useNotificationCardDataModule (ref), isUserThumbnail (ref), useNotificationCardStateModule (ref), reactModule (ref), constantsModule (ref), defaultContentPadding (ref), vector2 (ref), notificationThumbnailModule (ref), defaultTextContentPadding (ref), notificationStyledTextModule (ref), toastHoldButtonModule (ref), interactable (ref), imageSetLabel (ref), typeModule (ref)
	local var14
	local var10 = useStyle()
	local var11 = var10.Font.BaseSize * var10.Font.CaptionHeader.RelativeSize
	local var12 = var10.Font.BaseSize * var10.Font.CaptionBody.RelativeSize
	local cardSize = useNotificationCardDataModule().cardSize
	local _ = nil
	
	if isUserThumbnail then
		local var13 = useNotificationCardStateModule("thumbnail")
		var14 = reactModule.useMemo(function() --[[ line: 46 ]]
			-- upvalues: var13 (ref), isUserThumbnail (copy), var10 (ref), cardSize (write), constantsModule (copy)
			local var22 = false
			
			if var13 then
				for i, v in var13 do
					if not isUserThumbnail(v) then
						var22 = true
						break
					end
				end
			end
			return if var22 then if cardSize then cardSize.thumbnail else constantsModule.CardSizeDefault.thumbnail else var10.Tokens.Size.Size_1000
		end, { var13, var10.Tokens.Size.Size_1000, cardSize })
	else
		var14 = if cardSize then cardSize.thumbnail else constantsModule.CardSizeDefault.thumbnail
	end
	local size700 = var10.Tokens.Size.Size_700
	local var15 = useNotificationCardStateModule("textBody")
	local var16 = var15 and var15[1]
	local var17 = var16 and (var16.title and {
		LayoutOrder = 1,
		Text = var16.title,
		MaxSize = Vector2.new(1e999, var11 * 2),
		Size = UDim2.new(1, 0, 0, 0),
		TextSize = var11,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = var10.Font.CaptionHeader.Font,
		TextColor3 = var10.Theme.TextEmphasis.Color
	})
	local var18 = var16 and (var16.label and {
		LayoutOrder = 2,
		Text = var16.label,
		MaxSize = Vector2.new(1e999, var12 * 2),
		Size = UDim2.new(1, 0, 0, 0),
		TextSize = var12,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		Font = var10.Font.CaptionBody.Font
	})
	local var19 = useNotificationCardDataModule()
	cardSize = var19.cardSize
	local handleActions = var19.handleActions
	local var20 = useNotificationCardStateModule("singleMetaAction")
	local var21 = var20 and var20[1]
	
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
			Size = if var21 then UDim2.new(1, -(defaultContentPadding + vector2.X), 0, 0) else UDim2.new(1, 0, 0, 0)
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
				Size = UDim2.new(0, var14, 0, var14)
			}, {
				NotificationThumbnail = reactModule.createElement(notificationThumbnailModule)
			}),
			ToastTextFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = if p0.showHoldButton then UDim2.new(1, -(var14 + defaultContentPadding * 2 + size700), 0, 0) else UDim2.new(1, -(var14 + defaultContentPadding), 0, 0)
			}, {
				UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 2) }),
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					Padding = UDim.new(0, defaultTextContentPadding)
				}),
				ToastTitle = var17 and reactModule.createElement(notificationStyledTextModule, var17),
				ToastSubtitle = var18 and reactModule.createElement(notificationStyledTextModule, var18)
			}),
			ToastHoldButton = reactModule.createElement(toastHoldButtonModule, {
				layoutOrder = 3,
				iconSize = size700,
				visible = p0.showHoldButton,
				iconTransparency = if p0.shouldAutoFocus then 0.5 else 0,
				progress = p0.holdProgress
			})
		}),
		SingleMetaAction = if var21 then reactModule.createElement(interactable, {
			AutoButtonColor = false,
			BackgroundColor3 = var10.Theme.UIMuted.Color,
			BackgroundTransparency = 0.9,
			LayoutOrder = 2,
			onStateChanged = function() --[[ line: 171 ]] end,
			[reactModule.Event.Activated] = function() --[[ line: 172 ]]
				-- upvalues: handleActions (ref), var21 (ref)
				if handleActions then
					handleActions(var21)
				end
			end,
			Size = UDim2.fromOffset(vector2.X, vector2.Y)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			Icon = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = typeModule.MetaActionIcons[var21.actionIcon],
				ImageColor3 = var10.Theme.IconEmphasis.Color,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(28, 28)
			})
		}) else nil
	})
end