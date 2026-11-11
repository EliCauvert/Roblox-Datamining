local Parent = script:FindFirstAncestor("AddFriends").Parent
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local UIBloxModule = require(Parent.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local WithStyleFunction = UIBloxModule.Style.withStyle
local AddFriendsSectionHeaderFrame = RoactModule.PureComponent:extend("AddFriendsSectionHeaderFrame")
AddFriendsSectionHeaderFrame.validateProps = TModule.strictInterface({
	title = TModule.string,
	icon = TModule.optional(UIBloxModule.Core.ImageSet.Validator.validateImage),
	iconVisible = TModule.optional(TModule.boolean),
	onIconActivated = TModule.optional(TModule.callback),
	layoutOrder = TModule.optional(TModule.integer)
})
AddFriendsSectionHeaderFrame.defaultProps = { layoutOrder = 1 }

function AddFriendsSectionHeaderFrame.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), IconButton (copy), IconSize (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), IconButton (upval), IconSize (upval)
		return RoactModule.createElement("Frame", {
			ZIndex = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 24, 0, 0),
			Size = UDim2.new(1, 0, 0, p2.Tokens.Size.Size_1200),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.props.layoutOrder
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
			}),
			HeaderLabel = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				TextWrapped = true,
				LayoutOrder = 1,
				Font = p2.Font.Header1.Font,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(0.8, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = p1.props.title,
				TextColor3 = p2.Tokens.Color.Content.Emphasis.Color3,
				TextSize = p2.Tokens.Typography.HeadingSmall.FontSize,
				TextTransparency = p2.Tokens.Color.Content.Emphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			}),
			HeaderImageButton = p1.props.iconVisible and RoactModule.createElement(IconButton, {
				layoutOrder = 2,
				size = UDim2.fromOffset(IconSize.Medium, IconSize.Medium),
				position = UDim2.new(1, 0, 0, 6),
				anchorPoint = Vector2.new(1, 0),
				icon = p1.props.icon,
				iconTransparency = p2.Tokens.Color.Content.Emphasis.Transparency,
				iconColor3 = p2.Tokens.Color.Content.Emphasis.Color3,
				onActivated = p1.props.onIconActivated
			}) or nil
		})
	end)
end

return AddFriendsSectionHeaderFrame