local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local withStyle = require(parent.UIBlox).Style.withStyle
local skeleton = require(parent.Foundation).Skeleton
local textPlaceholders = roactModule.PureComponent:extend("TextPlaceholders")
textPlaceholders.defaultProps = { LayoutOrder = 0, avatarSize = 60, avatarCellWidth = 60 }

function textPlaceholders.render(p0) --[[ line: 18 ]]
	-- upvalues: withStyle (ref), roactModule (ref), skeleton (ref)
	return withStyle(function(_) --[[ line: 19 ]]
		-- upvalues: roactModule (copy), p0 (ref), skeleton (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -p0.props.avatarCellWidth, 1, 0),
			LayoutOrder = p0.props.LayoutOrder
		}, {
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 0)
			}),
			UIList = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			topRectangle = roactModule.createElement(skeleton, { LayoutOrder = 1, Size = UDim2.new(0, 94, 0, 12) }),
			spacer = roactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 7)
			}),
			bottomRectangle = roactModule.createElement(skeleton, { LayoutOrder = 3, Size = UDim2.new(0, 169, 0, 12) })
		})
	end)
end

return textPlaceholders