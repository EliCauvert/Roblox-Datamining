local parent = script:FindFirstAncestor("AppBlox").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local validateImage = UIBloxModule.Core.ImageSet.Validator.validateImage
local withStyle = UIBloxModule.Core.Style.withStyle
local tModule = require(parent.t)
local hoverButtonBackground = roactModule.PureComponent:extend("HoverButtonBackground")
hoverButtonBackground.validateProps = tModule.strictInterface({
	sidePadding = tModule.optional(tModule.number),
	image = tModule.optional(validateImage),
	sliceCenter = tModule.optional(tModule.Rect)
})

function hoverButtonBackground.render(p0)
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref)
	local var4 = if p0.props.sidePadding then UDim2.new(p0.props.sidePadding, UDim.new()) + UDim2.new(p0.props.sidePadding, UDim.new()) else UDim2.new()
	
	return withStyle(function(p1)
		-- upvalues: roactModule (copy), imageSetLabel (copy), var4 (ref), p0 (ref)
		local backgroundOnHover = p1.Theme.BackgroundOnHover
		
		return roactModule.createElement(imageSetLabel, {
			Size = UDim2.fromScale(1, 1) + var4,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundColor3 = if p0.props.image then nil else backgroundOnHover.Color,
			BackgroundTransparency = if p0.props.image then 1 else backgroundOnHover.Transparency,
			Image = p0.props.image,
			ImageColor3 = backgroundOnHover.Color,
			ImageTransparency = backgroundOnHover.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = p0.props.sliceCenter
		}, {
			corner = if p0.props.image then nil else roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		})
	end)
end

return hoverButtonBackground