local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local toastFrameModule = require(parent.ToastFrame)
local toastIconModule = require(parent.ToastIcon)
local toastTextModule = require(parent.ToastText)
local informativeToast = roactModule.PureComponent:extend("InformativeToast")
informativeToast.validateProps = tModule.strictInterface({
	anchorPoint = tModule.optional(tModule.Vector2),
	iconProps = tModule.optional(toastIconModule.validateProps),
	iconChildren = tModule.optional(tModule.table),
	layoutOrder = tModule.optional(tModule.integer),
	padding = tModule.optional(tModule.numberMin(0)),
	position = tModule.optional(tModule.UDim2),
	size = tModule.UDim2,
	subtitleTextProps = tModule.optional(toastTextModule.validateProps),
	textFrameSize = tModule.optional(tModule.UDim2),
	titleTextProps = toastTextModule.validateProps
})
informativeToast.defaultProps = {
	layoutOrder = 1,
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0),
	size = UDim2.new(1, 0, 1, 0)
}

function informativeToast.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), toastFrameModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: roactModule (copy), p1 (ref), toastFrameModule (copy)
		local theme = p2.Theme
		
		return roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ClipsDescendants = true,
			AnchorPoint = p1.props.anchorPoint,
			BackgroundColor3 = theme.BackgroundUIContrast.Color,
			BackgroundTransparency = theme.BackgroundUIContrast.Transparency * p2.Settings.PreferredTransparency,
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.position,
			Size = p1.props.size
		}, {
			ToastFrame = roactModule.createElement(toastFrameModule, {
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

return informativeToast