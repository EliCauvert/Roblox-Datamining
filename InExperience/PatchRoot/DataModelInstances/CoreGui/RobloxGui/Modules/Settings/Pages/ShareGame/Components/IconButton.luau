local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local IconButton = RoactModule.PureComponent:extend("IconButton")

function IconButton.render(p1) --[[ Line: 6 ]]
	-- upvalues: RoactModule (copy)
	local Visible = p1.props.visible
	local AnchorPoint = p1.props.anchorPoint
	local Position = p1.props.position
	local Size = p1.props.size
	local ZIndex = p1.props.zIndex
	local OnClick = p1.props.onClick
	local IconHorizontalAlignment = p1.props.iconHorizontalAlignment or Enum.HorizontalAlignment.Center
	local IconVerticalAlignment = p1.props.iconVerticalAlignment or Enum.VerticalAlignment.Center
	local IconSpritePath = p1.props.iconSpritePath
	local IconSpriteFrame = p1.props.iconSpriteFrame
	local HorizontalInset = p1.props.horizontalInset or 12
	local LayoutOrder = 0
	local LayoutOrder1 = 1
	
	if IconHorizontalAlignment == Enum.HorizontalAlignment.Center then
		HorizontalInset = 0
	elseif IconHorizontalAlignment == Enum.HorizontalAlignment.Left then
		Position = UDim2.new(Position.X.Scale, Position.X.Offset - HorizontalInset, Position.Y.Scale, Position.Y.Offset)
	elseif IconHorizontalAlignment == Enum.HorizontalAlignment.Right then
		Position = UDim2.new(Position.X.Scale, Position.X.Offset + HorizontalInset, Position.Y.Scale, Position.Y.Offset)
		LayoutOrder = 1
		LayoutOrder1 = 0
	end
	return RoactModule.createElement("ImageButton", {
		Visible = Visible,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = AnchorPoint,
		Position = Position,
		Size = UDim2.new(Size.X.Scale, Size.X.Offset + HorizontalInset, Size.Y.Scale, Size.Y.Offset),
		ZIndex = ZIndex,
		[RoactModule.Event.Activated] = OnClick
	}, {
		IconLayout = RoactModule.createElement("UIListLayout", {
			HorizontalAlignment = IconHorizontalAlignment,
			VerticalAlignment = IconVerticalAlignment,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Offset = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(0, HorizontalInset, 0, 0)
		}),
		BackIcon = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, IconSpriteFrame.size.X, 0, IconSpriteFrame.size.Y),
			Image = IconSpritePath,
			ImageRectOffset = IconSpriteFrame.offset,
			ImageRectSize = IconSpriteFrame.size,
			ZIndex = ZIndex,
			LayoutOrder = LayoutOrder1
		})
	})
end

return IconButton