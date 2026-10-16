local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local IconButtonModule = require(Foundation.Components.IconButton)
local ViewModule = require(Foundation.Components.View)
local _ = require(script.Parent.Parent.useCardVariants)
local Icon = require(Parent.BuilderIcons).Icon
local Small = require(Foundation.Enums.InputSize).Small

return function(p1) --[[ Line: 31 | Named "CardActions" ]]
	-- upvalues: ReactModule (copy), ViewModule (copy), IconButtonModule (copy), Icon (copy), ButtonVariantModule (copy), Small (copy)
	return ReactModule.createElement(ViewModule, {
		ZIndex = 2,
		tag = p1.variantProps.actions.tag,
		AnchorPoint = if p1.isInline then nil else Vector2.new(1, 0),
		Position = if p1.isInline then nil else UDim2.fromScale(1, 0),
		LayoutOrder = if p1.isInline then 2 else nil,
		testId = `{p1.testId}--actions`
	}, {
		Overflow = if p1.onOverflow then ReactModule.createElement(IconButtonModule, {
			isCircular = true,
			LayoutOrder = 1,
			onActivated = p1.onOverflow,
			icon = Icon.ThreeDotsHorizontal,
			variant = if p1.isOverMedia then ButtonVariantModule.OverMedia else ButtonVariantModule.Utility,
			size = Small,
			ref = p1.overflowRef,
			testId = `{p1.testId}--overflow`
		}) else nil,
		Close = if p1.onClose then ReactModule.createElement(IconButtonModule, {
			isCircular = true,
			LayoutOrder = 2,
			onActivated = p1.onClose,
			icon = Icon.X,
			variant = if p1.isOverMedia then ButtonVariantModule.OverMedia else ButtonVariantModule.Utility,
			size = Small,
			testId = `{p1.testId}--close`
		}) else nil
	})
end