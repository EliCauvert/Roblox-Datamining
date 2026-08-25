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

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useChatPagePaddingModule (ref), reactModule (ref)
	local var5 = cryoModule.Dictionary.join(t, p0)
	local style = var5.style or useStyle()
	local var7 = if var5.addBottomPadding then style.Tokens.Size.Size_600 else style.Tokens.Size.Size_100
	local size900 = style.Tokens.Size.Size_900
	local color = style.Theme.UIDefault.Color
	local var8 = useChatPagePaddingModule()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = if var5.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, style.Tokens.Size.Size_100)
		}),
		ContentPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var8.left),
			PaddingRight = UDim.new(0, var8.right),
			PaddingBottom = UDim.new(0, var7),
			PaddingTop = if var5.addTopPadding then UDim.new(0, style.Tokens.Size.Size_600) else nil
		}),
		IncomingFrame = if var5.isIncoming then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(0, size900, 0, size900)
		}, {
			AvatarCircleShimmer = if var5.showAvatarCircle then reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 1,
				BackgroundTransparency = var5.backgroundTransparency,
				BackgroundColor3 = color,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, style.Tokens.Radius.Circle) })
			}) else nil
		}) else nil,
		ShimmerBubble = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 2,
			BackgroundTransparency = var5.backgroundTransparency,
			BackgroundColor3 = color,
			Size = UDim2.new(var5.widthPercentage, 0, 0, var5.heightFactor * style.Tokens.Size.Size_500 + style.Tokens.Size.Size_400)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, style.Tokens.Size.Size_300) }),
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(800 * var5.widthPercentage, 1000) })
		})
	})
end