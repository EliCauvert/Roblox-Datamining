local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local ToastFrameModule = require(Parent.ToastFrame)
local ToastTextModule = require(Parent.ToastText)
local InformativeToast = RoactModule.PureComponent:extend("InformativeToast")
InformativeToast.validateProps = TModule.strictInterface({
	anchorPoint = TModule.optional(TModule.Vector2),
	iconProps = TModule.optional(require(Parent.ToastIcon).validateProps),
	iconChildren = TModule.optional(TModule.table),
	layoutOrder = TModule.optional(TModule.integer),
	padding = TModule.optional(TModule.numberMin(0)),
	position = TModule.optional(TModule.UDim2),
	size = TModule.UDim2,
	subtitleTextProps = TModule.optional(ToastTextModule.validateProps),
	textFrameSize = TModule.optional(TModule.UDim2),
	titleTextProps = ToastTextModule.validateProps
})
InformativeToast.defaultProps = {
	layoutOrder = 1,
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0),
	size = UDim2.new(1, 0, 1, 0)
}

function InformativeToast.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), ToastFrameModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), ToastFrameModule (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ClipsDescendants = true,
			AnchorPoint = p1.props.anchorPoint,
			BackgroundColor3 = Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = Theme.BackgroundUIContrast.Transparency * p2.Settings.PreferredTransparency,
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.position,
			Size = p1.props.size
		}, {
			ToastFrame = RoactModule.createElement(ToastFrameModule, {
				iconProps = p1.props.iconProps,
				iconChildren = p1.props.iconChildren,
				padding = p1.props.padding,
				subtitleTextProps = p1.props.subtitleTextProps,
				textFrameSize = p1.props.textFrameSize,
				titleTextProps = p1.props.titleTextProps
			})
		})
	end)
end

return InformativeToast