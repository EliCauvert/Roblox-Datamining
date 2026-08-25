local parent = script:FindFirstAncestor("AppBlox").Parent
local UIBloxModule = require(parent.UIBlox)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local responsiveModule = require(parent.Responsive)
local core = UIBloxModule.Core
local app = UIBloxModule.App
local useStyle = core.Style.useStyle
local button = UIBloxModule.App.Button.Button
local images = app.ImageSet.Images
local iconButton = app.Button.IconButton
local iconSize = app.ImageSet.Enum.IconSize
local imageSetLabel = core.ImageSet.ImageSetLabel
local getIconSize = app.ImageSet.getIconSize
local close = images["icons/navigation/close"]

return function(p0)
	-- upvalues: useStyle (ref), getIconSize (ref), iconSize (ref), reactModule (ref), responsiveModule (ref), imageSetLabel (ref), button (ref), cryoModule (ref), iconButton (ref), close (ref)
	local var4 = useStyle()
	local tokens = var4.Tokens
	local var5 = (if p0.iconImage then 36 else 0) + (if p0.onDismiss then getIconSize(iconSize.Small) else 0)
	local var6 = reactModule.useRef(nil)
	local var7 = responsiveModule.useBreakpointXOrSmaller(responsiveModule.Keys.Small)
	local createElement = reactModule.createElement
	createElement = createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UILayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = if var7 then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center
		}),
		Icon = if p0.iconImage then reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			Selectable = false,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(36, 36),
			Image = p0.iconImage,
			ImageColor3 = tokens.Color.Content.Emphasis.Color3,
			ImageTransparency = tokens.Color.Content.Emphasis.Transparency
		}) else nil,
		MiddleFrame = reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -var5, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UILayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
			}),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 12)
			}),
			Text = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
				TextLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				UIPadding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 12) }),
				Title = reactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = true,
					TextScaled = false,
					Text = p0.titleMessage,
					TextColor3 = var4.Tokens.Color.Content.Emphasis.Color3,
					TextTransparency = var4.Tokens.Color.Content.Emphasis.Transparency,
					TextSize = var4.Tokens.Typography.CaptionLarge.FontSize,
					Font = var4.Tokens.Typography.CaptionLarge.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					LineHeight = var4.Tokens.LineHeight.LineHeight_140
				}),
				Subline = if p0.sublineMessage then reactModule.createElement("TextLabel", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					TextWrapped = true,
					TextScaled = false,
					LineHeight = 1,
					Text = p0.sublineMessage,
					TextColor3 = var4.Tokens.Color.Content.Default.Color3,
					TextTransparency = var4.Tokens.Color.Content.Default.Transparency,
					TextSize = var4.Tokens.Typography.BodySmall.FontSize,
					Font = var4.Tokens.Typography.BodySmall.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}) else nil
			}),
			Button = if var7 or not p0.buttonProps then nil else reactModule.createElement(button, cryoModule.Dictionary.join({
				layoutOrder = 2,
				size = UDim2.new(0, 0, 0, 0),
				automaticSize = Enum.AutomaticSize.XY
			}, p0.buttonProps))
		}),
		DismissButtonFrame = if p0.onDismiss then reactModule.createElement(iconButton, {
			backgroundTransparency = 1,
			layoutOrder = 3,
			icon = close,
			iconSize = iconSize.Small,
			size = UDim2.new(0, iconSize.Small, 0, iconSize.Small),
			onActivated = p0.onDismiss
		}) else nil
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = p0.backgroundTransparency or tokens.Color.Surface.Surface_300.Transparency,
		BackgroundColor3 = p0.backgroundColor3 or tokens.Color.Surface.Surface_300.Color3,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		ref = var6
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		ContainerRef = reactModule.createElement(responsiveModule.ContainerRef.Provider, { value = var6 }, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 12),
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12)
			}),
			UILayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 12)
			}),
			HorizontalContent = createElement,
			Button = if var7 and p0.buttonProps then reactModule.createElement(button, cryoModule.Dictionary.join({
				fitContent = false,
				layoutOrder = 2,
				size = UDim2.new(1, 0, 0, 0),
				automaticSize = Enum.AutomaticSize.XY
			}, p0.buttonProps)) else nil
		})
	})
end