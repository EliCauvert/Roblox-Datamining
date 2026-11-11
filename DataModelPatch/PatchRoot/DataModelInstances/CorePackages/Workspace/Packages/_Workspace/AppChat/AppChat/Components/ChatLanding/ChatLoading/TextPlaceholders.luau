local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local Skeleton = require(Parent.Foundation).Skeleton
local TextPlaceholders = RoactModule.PureComponent:extend("TextPlaceholders")
TextPlaceholders.defaultProps = { LayoutOrder = 0, avatarSize = 60, avatarCellWidth = 60 }

function TextPlaceholders.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), Skeleton (copy)
	return WithStyleFunction(function(_)
		-- upvalues: RoactModule (upval), p1 (copy), Skeleton (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -p1.props.avatarCellWidth, 1, 0),
			LayoutOrder = p1.props.LayoutOrder
		}, {
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 0)
			}),
			UIList = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			topRectangle = RoactModule.createElement(Skeleton, { LayoutOrder = 1, Size = UDim2.new(0, 94, 0, 12) }),
			spacer = RoactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 7)
			}),
			bottomRectangle = RoactModule.createElement(Skeleton, { LayoutOrder = 3, Size = UDim2.new(0, 169, 0, 12) })
		})
	end)
end

return TextPlaceholders