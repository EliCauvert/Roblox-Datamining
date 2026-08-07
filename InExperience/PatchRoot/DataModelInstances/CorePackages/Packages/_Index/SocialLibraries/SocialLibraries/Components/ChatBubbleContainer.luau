local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roactFitComponents = dependenciesModule.RoactFitComponents
local fitFrameOnAxis = roactFitComponents.FitFrameOnAxis
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local rect = Rect.new(10, 10, 11, 11)
local chatBubbleContainer = roact.PureComponent:extend("ChatBubbleContainer")
chatBubbleContainer.TAIL_WIDTH = 6
chatBubbleContainer.defaultProps = {
	isIncoming = false,
	hasTail = false,
	padding = 12,
	LayoutOrder = 0,
	isPending = false,
	[roact.Change.AbsoluteSize] = function() --[[ line: 24 ]] end,
	overrideImageColor = false
}

function chatBubbleContainer.init(p0) --[[ line: 29 ]]
	-- upvalues: roact (ref)
	local var3, var4 = roact.createBinding(Vector2.new(0, 0))
	p0.bubbleSize = var3
	p0.updateBubbleSize = var4
end

function chatBubbleContainer.render(p1) --[[ line: 33 ]]
	-- upvalues: UIBlox (ref), roact (ref), fitFrameOnAxis (ref), rect (ref), roactFitComponents (ref)
	return UIBlox.Style.withStyle(function(p2) --[[ line: 34 ]]
		-- upvalues: p1 (ref), roact (copy), fitFrameOnAxis (copy), rect (copy), roactFitComponents (copy)
		local children = p1.props[roact.Children] or {}
		local hasTail = p1.props.hasTail
		local isIncoming = p1.props.isIncoming
		local isPending = p1.props.isPending
		local var6 = if isIncoming then p2.Theme.UIDefault elseif isPending then p2.Theme.UIMuted else p2.Theme.UIEmphasis
		local color = var6.Color
		local transparency = var6.Transparency
		
		if p1.props.overrideImageColor then
			color = nil
			
			if not isPending then
				transparency = nil
			end
		end
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p1.bubbleSize:map(function(p3) --[[ line: 69 ]]
				-- upvalues: p1 (copy)
				return UDim2.new(0, p3.X + p1.TAIL_WIDTH, 0, p3.Y)
			end),
			LayoutOrder = p1.props.LayoutOrder
		}, {
			bubble = roact.createElement(fitFrameOnAxis, {
				AnchorPoint = isIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
				axis = fitFrameOnAxis.Axis.Both,
				BackgroundTransparency = 1,
				ImageColor3 = color,
				ImageSet = {
					Image = if hasTail then if isIncoming then "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self2.png",
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = rect
				},
				ImageTransparency = transparency,
				margin = roactFitComponents.Rect.square(p1.props.padding),
				Position = isIncoming and UDim2.new(0, p1.TAIL_WIDTH, 0, 0) or UDim2.new(1, -p1.TAIL_WIDTH, 0, 0),
				[roact.Change.AbsoluteSize] = function(p4) --[[ line: 88 ]]
					-- upvalues: p1 (copy), roact (copy)
					p1.updateBubbleSize(p4.AbsoluteSize)
					p1.props[roact.Change.AbsoluteSize](p4)
				end
			}, children),
			tail = roact.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = isIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
				Size = UDim2.new(0, p1.TAIL_WIDTH, 0, p1.TAIL_WIDTH),
				ImageColor3 = color,
				Position = isIncoming and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 0, 0),
				Image = if isIncoming then "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-tip.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self-tip.png",
				ImageTransparency = transparency,
				Visible = hasTail
			})
		})
	end)
end

return chatBubbleContainer