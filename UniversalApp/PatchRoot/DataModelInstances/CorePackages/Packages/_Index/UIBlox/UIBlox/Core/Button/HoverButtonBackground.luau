local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local imageSetComponentModule = require(parent.ImageSet.ImageSetComponent)
local validateImageModule = require(parent.ImageSet.Validator.validateImage)
local withStyleModule = require(parent.Style.withStyle)
local hoverButtonBackground = roactModule.PureComponent:extend("HoverButtonBackground")
hoverButtonBackground.validateProps = tModule.strictInterface({
	sidePadding = tModule.optional(tModule.number),
	image = tModule.optional(validateImageModule),
	sliceCenter = tModule.optional(tModule.Rect)
})

function hoverButtonBackground.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref)
	local var1 = if p1.props.sidePadding then UDim2.new(p1.props.sidePadding, UDim.new()) + UDim2.new(p1.props.sidePadding, UDim.new()) else UDim2.new()
	
	return withStyleModule(function(p2)
		-- upvalues: roactModule (copy), imageSetComponentModule (copy), var1 (ref), p1 (ref)
		local backgroundOnHover = p2.Theme.BackgroundOnHover
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			Size = UDim2.fromScale(1, 1) + var1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundColor3 = if p1.props.image then nil else backgroundOnHover.Color,
			BackgroundTransparency = if p1.props.image then 1 else backgroundOnHover.Transparency,
			Image = p1.props.image,
			ImageColor3 = backgroundOnHover.Color,
			ImageTransparency = backgroundOnHover.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = p1.props.sliceCenter
		}, {
			corner = if p1.props.image then nil else roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		})
	end)
end

return hoverButtonBackground