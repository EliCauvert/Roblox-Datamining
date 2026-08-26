local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local UIBloxModule = require(parent.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local t = { bodyText = "" }

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), reactModule (ref), imageSetLabel (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local style = var1.style or useStyle()
	local size100 = style.Tokens.Size.Size_100
	local size300 = style.Tokens.Size.Size_300
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = var1.backgroundColor3 or style.Theme.BackgroundDefault.Color,
		BackgroundTransparency = var1.backgroundTransparency or style.Theme.BackgroundDefault.Transparency,
		Size = UDim2.new(0, 0, 0, style.Tokens.Size.Size_500),
		LayoutOrder = var1.layoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, size100)
		}),
		ContentPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, size100),
			PaddingRight = UDim.new(0, style.Tokens.Size.Size_150),
			PaddingBottom = UDim.new(0, size100),
			PaddingTop = UDim.new(0, size100)
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, style.Tokens.Radius.Small) }),
		IconImage = if var1.iconImage then reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, size300, 0, size300),
			Image = var1.iconImage,
			ImageColor3 = var1.imageColor3 or style.Theme.IconEmphasis.Color,
			ImageTransparency = var1.imageTransparency or style.Theme.IconEmphasis.Transparency
		}) else nil,
		BodyText = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.X,
			Font = style.Font.Body.Font,
			Size = UDim2.new(0, 0, 1, 0),
			Text = var1.bodyText,
			TextColor3 = var1.bodyTextColor3 or style.Theme.TextEmphasis.Color,
			TextSize = style.Tokens.FontSize.FontSize_250,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end)