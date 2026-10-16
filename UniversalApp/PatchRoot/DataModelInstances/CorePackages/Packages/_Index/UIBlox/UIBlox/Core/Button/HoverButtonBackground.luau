local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local ImageSetComponentModule = require(Parent.ImageSet.ImageSetComponent)
local WithStyleModule = require(Parent.Style.withStyle)
local HoverButtonBackground = RoactModule.PureComponent:extend("HoverButtonBackground")
HoverButtonBackground.validateProps = TModule.strictInterface({
	sidePadding = TModule.optional(TModule.number),
	image = TModule.optional((require(Parent.ImageSet.Validator.validateImage))),
	sliceCenter = TModule.optional(TModule.Rect)
})

function HoverButtonBackground.render(p1) --[[ Line: 32 ]]
	-- upvalues: WithStyleModule (copy), RoactModule (copy), ImageSetComponentModule (copy)
	local _UDim2: UDim2 = if p1.props.sidePadding then UDim2.new(p1.props.sidePadding, UDim.new()) + UDim2.new(p1.props.sidePadding, UDim.new()) else UDim2.new()
	
	return WithStyleModule(function(p2) --[[ Line: 37 ]]
		-- upvalues: RoactModule (upval), ImageSetComponentModule (upval), _UDim2 (copy), p1 (copy)
		local BackgroundOnHover = p2.Theme.BackgroundOnHover
		
		return RoactModule.createElement(ImageSetComponentModule.Label, {
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