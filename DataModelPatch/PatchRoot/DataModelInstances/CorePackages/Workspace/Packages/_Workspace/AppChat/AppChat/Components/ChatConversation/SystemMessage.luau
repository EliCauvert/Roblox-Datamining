local Parent = script:FindFirstAncestor("AppChat").Parent
local Text = require(Parent.AppCommonLib).Text
local RoactModule = require(Parent.Roact)
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local SystemMessage = RoactModule.PureComponent:extend("SystemMessage")
SystemMessage.defaultProps = {
	LayoutOrder = nil,
	Text = "PLACEHOLDER This message could not be displayed",
	maxWidth = 250
}

function SystemMessage.init(p1)
	-- upvalues: MemoizeFunction (copy), Text (copy)
	p1.calculateSize = MemoizeFunction(function(p2, X, p3, p4)
		-- upvalues: Text (upval)
		return Text.GetTextBounds(p2, p3, p4, Vector2.new(X, 1000))
	end)
end

function SystemMessage.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval)
		local CaptionBody = p2.Font.CaptionBody
		local ScaledBaseSize = p2.Font.BaseSize * CaptionBody.RelativeSize
		local Size = p1.calculateSize(p1.props.Text, p1.props.maxWidth, CaptionBody.Font, ScaledBaseSize)
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 30 + Size.Y + 8)
		}, {
			UiListLayout = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 20) }),
			GreyBox = RoactModule.createElement("ImageLabel", {
				BorderSizePixel = 0,
				Image = "rbxasset://textures/ui/LuaChat/9-slice/system-message.png",
				ImageTransparency = 1,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(0, math.min(p1.props.maxWidth, Size.X) + 12, 0, Size.Y + 8),
				SliceCenter = Rect.new(3, 3, 4, 4)
			}, {
				SystemText = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					TextWrapped = true,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Font = CaptionBody.Font,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(1, 0, 1, 0),
					Text = p1.props.Text,
					TextColor3 = p2.Theme.TextDefault.Color,
					TextSize = ScaledBaseSize,
					TextTransparency = p2.Theme.TextDefault.Transparency
				})
			})
		})
	end)
end

return SystemMessage