local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local cryoModule = require(parent_1.Cryo)
local tModule = require(parent_1.t)
local imageSetComponentModule = require(parent.Core.ImageSet.ImageSetComponent)
local validateColorInfoModule = require(parent.Core.Style.Validator.validateColorInfo)
local withStyleModule = require(parent.Core.Style.withStyle)
local toastIcon = roactModule.PureComponent:extend("ToastIcon")
toastIcon.validateProps = tModule.interface({
	Image = tModule.union(tModule.table, tModule.string, tModule.callback),
	Size = tModule.UDim2,
	AnchorPoint = tModule.optional(tModule.Vector2),
	colorStyle = tModule.optional(validateColorInfoModule),
	LayoutOrder = tModule.optional(tModule.integer),
	Position = tModule.optional(tModule.UDim2)
})
toastIcon.defaultProps = { BackgroundTransparency = 1 }

function toastIcon.render(p0)
	-- upvalues: withStyleModule (ref), cryoModule (ref), roactModule (ref), imageSetComponentModule (ref)
	return withStyleModule(function(p1)
		-- upvalues: p0 (ref), cryoModule (copy), roactModule (copy), imageSetComponentModule (copy)
		local theme = p1.Theme
		local colorStyle = p0.props.colorStyle
		
		if colorStyle == nil then
			colorStyle = theme.IconEmphasis
		end
		return roactModule.createElement(imageSetComponentModule.Label, cryoModule.Dictionary.join(p0.props, {
			colorStyle = cryoModule.None,
			ImageColor3 = colorStyle.Color,
			ImageTransparency = colorStyle.Transparency
		}))
	end)
end

return toastIcon