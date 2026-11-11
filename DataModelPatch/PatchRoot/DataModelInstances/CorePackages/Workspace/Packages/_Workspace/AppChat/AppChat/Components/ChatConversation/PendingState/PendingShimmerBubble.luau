local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local config = {
	addTopPadding = false,
	addBottomPadding = false,
	backgroundTransparency = 0.4,
	heightFactor = 1,
	isIncoming = false,
	showAvatarCircle = false,
	widthPercentage = 0.5
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseChatPagePaddingModule (copy), ReactModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = JoinResult.style or UseStyleResult
	local Size900 = Style.Tokens.Size.Size_900
	local Color = Style.Theme.UIDefault.Color
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = if JoinResult.isIncoming then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, Style.Tokens.Size.Size_100)
		}),
		ContentPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, UseChatPagePaddingModuleResult.left),
			PaddingRight = UDim.new(0, UseChatPagePaddingModuleResult.right),
			PaddingBottom = UDim.new(0, if JoinResult.addBottomPadding then Style.Tokens.Size.Size_600 else Style.Tokens.Size.Size_100),
			PaddingTop = if JoinResult.addTopPadding then UDim.new(0, Style.Tokens.Size.Size_600) else nil
		}),
		IncomingFrame = if JoinResult.isIncoming then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(0, Size900, 0, Size900)
		}, {
			AvatarCircleShimmer = if JoinResult.showAvatarCircle then ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 1,
				BackgroundTransparency = JoinResult.backgroundTransparency,
				BackgroundColor3 = Color,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, Style.Tokens.Radius.Circle) })
			}) else nil
		}) else nil,
		ShimmerBubble = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 2,
			BackgroundTransparency = JoinResult.backgroundTransparency,
			BackgroundColor3 = Color,
			Size = UDim2.new(JoinResult.widthPercentage, 0, 0, JoinResult.heightFactor * Style.Tokens.Size.Size_500 + Style.Tokens.Size.Size_400)
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Style.Tokens.Size.Size_300) }),
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(800 * JoinResult.widthPercentage, 1000)
			})
		})
	})
end