local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local t = {
	addTopPadding = false,
	addBottomPadding = false,
	backgroundTransparency = 0.4,
	heightFactor = 1,
	isIncoming = false,
	showAvatarCircle = false,
	widthPercentage = 0.5
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useChatPagePaddingModule (ref), reactModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local style = var1.style or useStyle()
	local var2 = if var1.addBottomPadding then style.Tokens.Size.Size_600 else style.Tokens.Size.Size_100
	local size900 = style.Tokens.Size.Size_900
	local color = style.Theme.UIDefault.Color
	local var3 = useChatPagePaddingModule()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = if var1.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, style.Tokens.Size.Size_100)
		}),
		ContentPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var3.left),
			PaddingRight = UDim.new(0, var3.right),
			PaddingBottom = UDim.new(0, var2),
			PaddingTop = if var1.addTopPadding then UDim.new(0, style.Tokens.Size.Size_600) else nil
		}),
		IncomingFrame = if var1.isIncoming then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(0, size900, 0, size900)
		}, {
			AvatarCircleShimmer = if var1.showAvatarCircle then reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 1,
				BackgroundTransparency = var1.backgroundTransparency,
				BackgroundColor3 = color,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, style.Tokens.Radius.Circle) })
			}) else nil
		}) else nil,
		ShimmerBubble = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 2,
			BackgroundTransparency = var1.backgroundTransparency,
			BackgroundColor3 = color,
			Size = UDim2.new(var1.widthPercentage, 0, 0, var1.heightFactor * style.Tokens.Size.Size_500 + style.Tokens.Size.Size_400)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, style.Tokens.Size.Size_300) }),
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(800 * var1.widthPercentage, 1000) })
		})
	})
end