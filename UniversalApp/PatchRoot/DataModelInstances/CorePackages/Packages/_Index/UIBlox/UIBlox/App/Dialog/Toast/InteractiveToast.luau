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

function interactiveToast.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref), circle21 (ref), rect (ref), springAnimatedItemModule (ref), t (ref), toastFrameModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: roactModule (copy), imageSetComponentModule (copy), p1 (ref), circle21 (copy), rect (copy), springAnimatedItemModule (copy), t (copy), toastFrameModule (copy)
		local theme = p2.Theme
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = p1.props.anchorPoint,
			Image = circle21,
			ImageColor3 = theme.BackgroundUIDefault.Color,
			ImageTransparency = theme.BackgroundUIDefault.Transparency,
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.position,
			ScaleType = Enum.ScaleType.Slice,
			Size = p1.props.size,
			SliceCenter = rect
		}, {
			Scaler = roactModule.createElement(springAnimatedItemModule.AnimatedUIScale, {
				springOptions = t,
				animatedValues = {
					scale = if p1.props.pressed then p1.props.pressedScale else 1
				},
				mapValuesToProps = function(p3)
					return { Scale = p3.scale }
				end
			}),
			ToastFrame = roactModule.createElement(toastFrameModule, {
				buttonProps = p1.props.buttonProps,
				iconProps = p1.props.iconProps,
				iconChildren = p1.props.iconChildren,
				isCompact = p1.props.isCompact,
				padding = p1.props.padding,
				subtitleTextProps = p1.props.subtitleTextProps,
				textFrameSize = p1.props.textFrameSize,
				titleTextProps = p1.props.titleTextProps
			})
		})
	end)
end

return interactiveToast