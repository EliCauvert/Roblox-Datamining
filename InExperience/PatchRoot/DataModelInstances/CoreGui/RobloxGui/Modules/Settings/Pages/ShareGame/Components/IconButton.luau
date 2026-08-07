local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local iconButton = roactModule.PureComponent:extend("IconButton")

function iconButton.render(p0) --[[ line: 6 ]]
	-- upvalues: roactModule (ref)
	local visible = p0.props.visible
	local anchorPoint = p0.props.anchorPoint
	local position = p0.props.position
	local size = p0.props.size
	local zIndex = p0.props.zIndex
	local onClick = p0.props.onClick
	local iconHorizontalAlignment = p0.props.iconHorizontalAlignment or Enum.HorizontalAlignment.Center
	local iconVerticalAlignment = p0.props.iconVerticalAlignment or Enum.VerticalAlignment.Center
	local iconSpritePath = p0.props.iconSpritePath
	local iconSpriteFrame = p0.props.iconSpriteFrame
	local horizontalInset = p0.props.horizontalInset or 12
	local var5 = 0
	local var6 = 1
	
	if iconHorizontalAlignment == Enum.HorizontalAlignment.Center then
		horizontalInset = 0
	elseif iconHorizontalAlignment == Enum.HorizontalAlignment.Left then
		position = UDim2.new(position.X.Scale, position.X.Offset - horizontalInset, position.Y.Scale, position.Y.Offset)
	elseif iconHorizontalAlignment == Enum.HorizontalAlignment.Right then
		position = UDim2.new(position.X.Scale, position.X.Offset + horizontalInset, position.Y.Scale, position.Y.Offset)
		var5 = 1
		var6 = 0
	end
	return roactModule.createElement("ImageButton", {
		Visible = visible,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = anchorPoint,
		Position = position,
		Size = UDim2.new(size.X.Scale, size.X.Offset + horizontalInset, size.Y.Scale, size.Y.Offset),
		ZIndex = zIndex,
		[roactModule.Event.Activated] = onClick
	}, {
		IconLayout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = iconHorizontalAlignment,
			VerticalAlignment = iconVerticalAlignment,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Offset = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = var5,
			Size = UDim2.new(0, horizontalInset, 0, 0)
		}),
		BackIcon = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, iconSpriteFrame.size.X, 0, iconSpriteFrame.size.Y),
			Image = iconSpritePath,
			ImageRectOffset = iconSpriteFrame.offset,
			ImageRectSize = iconSpriteFrame.size,
			ZIndex = zIndex,
			LayoutOrder = var6
		})
	})
end

return iconButton