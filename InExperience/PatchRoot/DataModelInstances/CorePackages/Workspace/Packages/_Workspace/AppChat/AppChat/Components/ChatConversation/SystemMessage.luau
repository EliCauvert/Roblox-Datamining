local parent = script:FindFirstAncestor("AppChat").Parent
local text = require(parent.AppCommonLib).Text
local roactModule = require(parent.Roact)
local memoize = require(parent.AppCommonLib).memoize
local withStyle = require(parent.UIBlox).Style.withStyle
local systemMessage = roactModule.PureComponent:extend("SystemMessage")
systemMessage.defaultProps = {
	LayoutOrder = nil,
	Text = "PLACEHOLDER This message could not be displayed",
	maxWidth = 250
}

function systemMessage.init(p0)
	-- upvalues: memoize (ref), text (ref)
	p0.calculateSize = memoize(function(p1, p2, p3, p4)
		-- upvalues: text (copy)
		return text.GetTextBounds(p1, p3, p4, Vector2.new(p2, 1000))
	end)
end

function systemMessage.render(p5)
	-- upvalues: withStyle (ref), roactModule (ref)
	return withStyle(function(p6)
		-- upvalues: p5 (ref), roactModule (copy)
		local captionBody = p6.Font.CaptionBody
		local var2 = p6.Font.BaseSize * captionBody.RelativeSize
		local var3 = p5.calculateSize(p5.props.Text, p5.props.maxWidth, captionBody.Font, var2)
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p5.props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 30 + var3.Y + 8)
		}, {
			UiListLayout = roactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Padding = roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 20) }),
			GreyBox = roactModule.createElement("ImageLabel", {
				BorderSizePixel = 0,
				Image = "rbxasset://textures/ui/LuaChat/9-slice/system-message.png",
				ImageTransparency = 1,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(0, math.min(p5.props.maxWidth, var3.X) + 12, 0, var3.Y + 8),
				SliceCenter = Rect.new(3, 3, 4, 4)
			}, {
				SystemText = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					TextWrapped = true,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Font = captionBody.Font,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(1, 0, 1, 0),
					Text = p5.props.Text,
					TextColor3 = p6.Theme.TextDefault.Color,
					TextSize = var2,
					TextTransparency = p6.Theme.TextDefault.Transparency
				})
			})
		})
	end)
end

return systemMessage