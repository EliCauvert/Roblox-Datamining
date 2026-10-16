local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local ImageSetComponentModule = require(Parent2.Core.ImageSet.ImageSetComponent)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local SpringAnimatedItemModule = require(Parent2.Utility.SpringAnimatedItem)
local ToastFrameModule = require(Parent.ToastFrame)
local ToastTextModule = require(Parent.ToastText)
local SpringOptions = { dampingRatio = 1, frequency = 4 }
local ComponentAssetsCircle21 = require(Parent2.App.ImageSet.Images)["component_assets/circle_21"]
local _Rect = Rect.new(10, 10, 11, 11)
local InteractiveToast = RoactModule.PureComponent:extend("InteractiveToast")
InteractiveToast.validateProps = TModule.strictInterface({
	anchorPoint = TModule.optional(TModule.Vector2),
	buttonProps = TModule.optional(TModule.strictInterface({
		buttonDimensions = TModule.Vector2,
		buttonText = TModule.string,
		onActivated = TModule.callback,
		buttonType = TModule.optional(require(Parent1.Button.Enum.ButtonType).isEnumValue)
	})),
	iconProps = TModule.optional(require(Parent.ToastIcon).validateProps),
	iconChildren = TModule.optional(TModule.table),
	isCompact = TModule.optional(TModule.boolean),
	layoutOrder = TModule.optional(TModule.integer),
	padding = TModule.optional(TModule.numberMin(0)),
	position = TModule.optional(TModule.UDim2),
	pressed = TModule.optional(TModule.boolean),
	pressedScale = TModule.number,
	size = TModule.UDim2,
	subtitleTextProps = TModule.optional(ToastTextModule.validateProps),
	textFrameSize = TModule.optional(TModule.UDim2),
	titleTextProps = ToastTextModule.validateProps
})
InteractiveToast.defaultProps = {
	layoutOrder = 1,
	pressedScale = 0.95,
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0),
	size = UDim2.new(1, 0, 1, 0)
}

function InteractiveToast.render(p1) --[[ Line: 72 ]]
	-- upvalues: WithStyleModule (copy), RoactModule (copy), ImageSetComponentModule (copy), ComponentAssetsCircle21 (copy), _Rect (copy), SpringAnimatedItemModule (copy), SpringOptions (copy), ToastFrameModule (copy)
	return WithStyleModule(function(p2) --[[ Line: 73 ]]
		-- upvalues: RoactModule (upval), ImageSetComponentModule (upval), p1 (copy), ComponentAssetsCircle21 (upval), _Rect (upval), SpringAnimatedItemModule (upval), SpringOptions (upval), ToastFrameModule (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = p1.props.anchorPoint,
			Image = ComponentAssetsCircle21,
			ImageColor3 = Theme.BackgroundUIDefault.Color,
			ImageTransparency = Theme.BackgroundUIDefault.Transparency,
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.position,
			ScaleType = Enum.ScaleType.Slice,
			Size = p1.props.size,
			SliceCenter = _Rect
		}, {
			Scaler = RoactModule.createElement(SpringAnimatedItemModule.AnimatedUIScale, {
				springOptions = SpringOptions,
				animatedValues = { scale = p1.props.pressed and p1.props.pressedScale or 1 },
				mapValuesToProps = function(p3) --[[ Line: 94 ]]
					return { Scale = p3.scale }
				end
			}),
			ToastFrame = RoactModule.createElement(ToastFrameModule, {
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

return InteractiveToast