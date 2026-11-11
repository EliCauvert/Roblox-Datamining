local Parent = script:FindFirstAncestor("AppBlox").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local TModule = require(Parent.t)
local HoverButtonBackground = RoactModule.PureComponent:extend("HoverButtonBackground")
HoverButtonBackground.validateProps = TModule.strictInterface({
	sidePadding = TModule.optional(TModule.number),
	image = TModule.optional(UIBloxModule.Core.ImageSet.Validator.validateImage),
	sliceCenter = TModule.optional(TModule.Rect)
})

function HoverButtonBackground.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy)
	local _UDim2: UDim2 = if p1.props.sidePadding then UDim2.new(p1.props.sidePadding, UDim.new()) + UDim2.new(p1.props.sidePadding, UDim.new()) else UDim2.new()
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), ImageSetLabel (upval), _UDim2 (copy), p1 (copy)
		local BackgroundOnHover = p2.Theme.BackgroundOnHover
		
		return RoactModule.createElement(ImageSetLabel, {
			Size = UDim2.fromScale(1, 1) + _UDim2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundColor3 = if p1.props.image then nil else BackgroundOnHover.Color,
			BackgroundTransparency = if p1.props.image then 1 else BackgroundOnHover.Transparency,
			Image = p1.props.image,
			ImageColor3 = BackgroundOnHover.Color,
			ImageTransparency = BackgroundOnHover.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = p1.props.sliceCenter
		}, {
			corner = if p1.props.image then nil else RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		})
	end)
end

return HoverButtonBackground