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

function systemMessage.init(p1)
	-- upvalues: memoize (ref), text (ref)
	p1.calculateSize = memoize(function(p2, p3, p4, p5)
		-- upvalues: text (copy)
		return text.GetTextBounds(p2, p4, p5, Vector2.new(p3, 1000))
	end)
end

function systemMessage.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), roactModule (copy)
		local captionBody = p2.Font.CaptionBody
		local var1 = p2.Font.BaseSize * captionBody.RelativeSize
		local var2 = p1.calculateSize(p1.props.Text, p1.props.maxWidth, captionBody.Font, var1)
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 30 + var2.Y + 8)
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
				Size = UDim2.new(0, math.min(p1.props.maxWidth, var2.X) + 12, 0, var2.Y + 8),
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
					Text = p1.props.Text,
					TextColor3 = p2.Theme.TextDefault.Color,
					TextSize = var1,
					TextTransparency = p2.Theme.TextDefault.Transparency
				})
			})
		})
	end)
end

return systemMessage