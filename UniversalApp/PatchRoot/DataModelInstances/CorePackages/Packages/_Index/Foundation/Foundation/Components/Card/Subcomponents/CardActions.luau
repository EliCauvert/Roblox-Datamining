local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local inputSizeModule = require(foundation.Enums.InputSize)
local iconButtonModule = require(foundation.Components.IconButton)
local viewModule = require(foundation.Components.View)
local _ = require(script.Parent.Parent.useCardVariants)
local icon = builderIconsModule.Icon
local small = inputSizeModule.Small

return function(p1)
	-- upvalues: reactModule (ref), viewModule (ref), iconButtonModule (ref), icon (ref), buttonVariantModule (ref), small (ref)
	return reactModule.createElement(viewModule, {
		ZIndex = 2,
		tag = p1.variantProps.actions.tag,
		AnchorPoint = if p1.isInline then nil else Vector2.new(1, 0),
		Position = if p1.isInline then nil else UDim2.fromScale(1, 0),
		LayoutOrder = if p1.isInline then 2 else nil,
		testId = `{p1.testId}--actions`
	}, {
		Overflow = if p1.onOverflow then reactModule.createElement(iconButtonModule, {
			isCircular = true,
			LayoutOrder = 1,
			onActivated = p1.onOverflow,
			icon = icon.ThreeDotsHorizontal,
			variant = if p1.isOverMedia then buttonVariantModule.OverMedia else buttonVariantModule.Utility,
			size = small,
			ref = p1.overflowRef,
			testId = `{p1.testId}--overflow`
		}) else nil,
		Close = if p1.onClose then reactModule.createElement(iconButtonModule, {
			isCircular = true,
			LayoutOrder = 2,
			onActivated = p1.onClose,
			icon = icon.X,
			variant = if p1.isOverMedia then buttonVariantModule.OverMedia else buttonVariantModule.Utility,
			size = small,
			testId = `{p1.testId}--close`
		}) else nil
	})
end