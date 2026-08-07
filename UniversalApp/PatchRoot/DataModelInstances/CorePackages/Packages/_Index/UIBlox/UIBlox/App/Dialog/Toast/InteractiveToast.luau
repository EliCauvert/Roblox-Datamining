local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local imageSetComponentModule = require(parent_2.Core.ImageSet.ImageSetComponent)
local imagesModule = require(parent_2.App.ImageSet.Images)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local springAnimatedItemModule = require(parent_2.Utility.SpringAnimatedItem)
local buttonTypeModule = require(parent_1.Button.Enum.ButtonType)
local toastFrameModule = require(parent.ToastFrame)
local toastIconModule = require(parent.ToastIcon)
local toastTextModule = require(parent.ToastText)
local t = { dampingRatio = 1, frequency = 4 }
local circle21 = imagesModule["component_assets/circle_21"]
local rect = Rect.new(10, 10, 11, 11)
local interactiveToast = roactModule.PureComponent:extend("InteractiveToast")
interactiveToast.validateProps = tModule.strictInterface({
	anchorPoint = tModule.optional(tModule.Vector2),
	buttonProps = tModule.optional(tModule.strictInterface({
		buttonDimensions = tModule.Vector2,
		buttonText = tModule.string,
		onActivated = tModule.callback,
		buttonType = tModule.optional(buttonTypeModule.isEnumValue)
	})),
	iconProps = tModule.optional(toastIconModule.validateProps),
	iconChildren = tModule.optional(tModule.table),
	isCompact = tModule.optional(tModule.boolean),
	layoutOrder = tModule.optional(tModule.integer),
	padding = tModule.optional(tModule.numberMin(0)),
	position = tModule.optional(tModule.UDim2),
	pressed = tModule.optional(tModule.boolean),
	pressedScale = tModule.number,
	size = tModule.UDim2,
	subtitleTextProps = tModule.optional(toastTextModule.validateProps),
	textFrameSize = tModule.optional(tModule.UDim2),
	titleTextProps = toastTextModule.validateProps
})
interactiveToast.defaultProps = {
	layoutOrder = 1,
	pressedScale = 0.95,
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0),
	size = UDim2.new(1, 0, 1, 0)
}

function interactiveToast.render(p0) --[[ line: 72 ]]
	-- upvalues: withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref), circle21 (ref), rect (ref), springAnimatedItemModule (ref), t (ref), toastFrameModule (ref)
	return withStyleModule(function(p1) --[[ line: 73 ]]
		-- upvalues: roactModule (copy), imageSetComponentModule (copy), p0 (ref), circle21 (copy), rect (copy), springAnimatedItemModule (copy), t (copy), toastFrameModule (copy)
		local theme = p1.Theme
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = p0.props.anchorPoint,
			Image = circle21,
			ImageColor3 = theme.BackgroundUIDefault.Color,
			ImageTransparency = theme.BackgroundUIDefault.Transparency,
			LayoutOrder = p0.props.layoutOrder,
			Position = p0.props.position,
			ScaleType = Enum.ScaleType.Slice,
			Size = p0.props.size,
			SliceCenter = rect
		}, {
			Scaler = roactModule.createElement(springAnimatedItemModule.AnimatedUIScale, {
				springOptions = t,
				animatedValues = {
					scale = if p0.props.pressed then p0.props.pressedScale else 1
				},
				mapValuesToProps = function(p2) --[[ line: 94 ]]
					return { Scale = p2.scale }
				end
			}),
			ToastFrame = roactModule.createElement(toastFrameModule, {
				buttonProps = p0.props.buttonProps,
				iconProps = p0.props.iconProps,
				iconChildren = p0.props.iconChildren,
				isCompact = p0.props.isCompact,
				padding = p0.props.padding,
				subtitleTextProps = p0.props.subtitleTextProps,
				textFrameSize = p0.props.textFrameSize,
				titleTextProps = p0.props.titleTextProps
			})
		})
	end)
end

return interactiveToast