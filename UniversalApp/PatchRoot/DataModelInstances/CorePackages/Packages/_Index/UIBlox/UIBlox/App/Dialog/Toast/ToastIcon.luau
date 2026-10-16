local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local CryoModule = require(Parent1.Cryo)
local TModule = require(Parent1.t)
local ImageSetComponentModule = require(Parent.Core.ImageSet.ImageSetComponent)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local ToastIcon = RoactModule.PureComponent:extend("ToastIcon")
ToastIcon.validateProps = TModule.interface({
	Image = TModule.union(TModule.table, TModule.string, TModule.callback),
	Size = TModule.UDim2,
	AnchorPoint = TModule.optional(TModule.Vector2),
	colorStyle = TModule.optional((require(Parent.Core.Style.Validator.validateColorInfo))),
	LayoutOrder = TModule.optional(TModule.integer),
	Position = TModule.optional(TModule.UDim2)
})
ToastIcon.defaultProps = { BackgroundTransparency = 1 }

function ToastIcon.render(p1) --[[ Line: 34 ]]
	-- upvalues: WithStyleModule (copy), CryoModule (copy), RoactModule (copy), ImageSetComponentModule (copy)
	return WithStyleModule(function(p2) --[[ Line: 35 ]]
		-- upvalues: p1 (copy), CryoModule (upval), RoactModule (upval), ImageSetComponentModule (upval)
		local Theme = p2.Theme
		local ColorStyle = p1.props.colorStyle
		
		if ColorStyle == nil then
			ColorStyle = Theme.IconEmphasis
		end
		return RoactModule.createElement(ImageSetComponentModule.Label, (CryoModule.Dictionary.join(p1.props, {
			colorStyle = CryoModule.None,
			ImageColor3 = ColorStyle.Color,
			ImageTransparency = ColorStyle.Transparency
		})))
	end)
end

return ToastIcon