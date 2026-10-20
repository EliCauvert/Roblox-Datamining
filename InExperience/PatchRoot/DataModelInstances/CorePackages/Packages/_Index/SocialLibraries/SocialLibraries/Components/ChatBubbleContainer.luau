local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local RoactFitComponents = DependenciesModule.RoactFitComponents
local FitFrameOnAxis = RoactFitComponents.FitFrameOnAxis
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local _Rect = Rect.new(10, 10, 11, 11)
local ChatBubbleContainer = Roact.PureComponent:extend("ChatBubbleContainer")
ChatBubbleContainer.TAIL_WIDTH = 6
ChatBubbleContainer.defaultProps = {
	isIncoming = false,
	hasTail = false,
	padding = 12,
	LayoutOrder = 0,
	isPending = false,
	[Roact.Change.AbsoluteSize] = function() end,
	overrideImageColor = false
}

function ChatBubbleContainer.init(p1)
	-- upvalues: Roact (copy)
	p1.bubbleSize, p1.updateBubbleSize = Roact.createBinding(Vector2.new(0, 0))
end

function ChatBubbleContainer.render(p1)
	-- upvalues: UIBlox (copy), Roact (copy), FitFrameOnAxis (copy), _Rect (copy), RoactFitComponents (copy)
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: p1 (copy), Roact (upval), FitFrameOnAxis (upval), _Rect (upval), RoactFitComponents (upval)
		local Prop = p1.props[Roact.Children] or {}
		local HasTail = p1.props.hasTail
		local IsIncoming = p1.props.isIncoming
		local IsPending = p1.props.isPending
		local UIDefault = if IsIncoming then p2.Theme.UIDefault elseif IsPending then p2.Theme.UIMuted else p2.Theme.UIEmphasis
		local Color = UIDefault.Color
		local Transparency = UIDefault.Transparency
		
		if p1.props.overrideImageColor then
			Color = nil
			
			if not IsPending then
				Transparency = nil
			end
		end
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p1.bubbleSize:map(function(Vector): UDim2
				-- upvalues: p1 (upval)
				return UDim2.new(0, Vector.X + p1.TAIL_WIDTH, 0, Vector.Y)
			end),
			LayoutOrder = p1.props.LayoutOrder
		}, {
			bubble = Roact.createElement(FitFrameOnAxis, {
				AnchorPoint = IsIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
				axis = FitFrameOnAxis.Axis.Both,
				BackgroundTransparency = 1,
				ImageColor3 = Color,
				ImageSet = {
					Image = if HasTail then if IsIncoming then "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self2.png",
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = _Rect
				},
				ImageTransparency = Transparency,
				margin = RoactFitComponents.Rect.square(p1.props.padding),
				Position = IsIncoming and UDim2.new(0, p1.TAIL_WIDTH, 0, 0) or UDim2.new(1, -p1.TAIL_WIDTH, 0, 0),
				[Roact.Change.AbsoluteSize] = function(Frame)
					-- upvalues: p1 (upval), Roact (upval)
					p1.updateBubbleSize(Frame.AbsoluteSize)
					p1.props[Roact.Change.AbsoluteSize](Frame)
				end
			}, Prop),
			tail = Roact.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = IsIncoming and Vector2.new(0, 0) or Vector2.new(1, 0),
				Size = UDim2.new(0, p1.TAIL_WIDTH, 0, p1.TAIL_WIDTH),
				ImageColor3 = Color,
				Position = IsIncoming and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 0, 0),
				Image = if IsIncoming then "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-tip.png" else "rbxasset://textures/ui/LuaChat/9-slice/chat-bubble-self-tip.png",
				ImageTransparency = Transparency,
				Visible = HasTail
			})
		})
	end)
end

return ChatBubbleContainer