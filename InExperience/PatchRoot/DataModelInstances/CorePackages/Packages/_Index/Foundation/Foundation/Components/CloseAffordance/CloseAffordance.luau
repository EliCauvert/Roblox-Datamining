local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local iconModule = require(foundation.Components.Icon)
local reactModule = require(parent.React)
local inputSizeModule = require(foundation.Enums.InputSize)
local iconVariant = builderIconsModule.IconVariant
local _ = require(foundation.Enums.IconSize)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local _ = require(foundation.Enums.Radius)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local usePresentationContext = require(foundation.Providers.Style.PresentationContext).usePresentationContext
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local constantsModule = require(foundation.Constants)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useCloseAffordanceVariantsModule = require(script.Parent.useCloseAffordanceVariants)
local t = {
	isDisabled = false,
	isCircular = false,
	hasPadding = true,
	testId = "--foundation-close-affordance",
	size = inputSizeModule.Medium,
	variant = closeAffordanceVariantModule.OverMedia
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), useCloseAffordanceVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), iconModule (ref), builderIconsModule (ref), iconVariant (ref)
	local var13 = withDefaultsModule(p0, t)
	local var14 = useTokensModule()
	local var15 = useCloseAffordanceVariantsModule(var14, var13.size, var13.variant, usePresentationContext().colorNamespace, var13.hasPadding, var13.isCircular)
	local uDim = UDim.new(0, var15.container.radius)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var13, {
		Size = var15.container.size,
		onActivated = var13.onActivated,
		selection = {
			Selectable = if var13.isDisabled then false else var13.Selectable,
			NextSelectionUp = var13.NextSelectionUp,
			NextSelectionDown = var13.NextSelectionDown,
			NextSelectionLeft = var13.NextSelectionLeft,
			NextSelectionRight = var13.NextSelectionRight
		},
		isDisabled = var13.isDisabled,
		padding = var15.container.padding,
		cornerRadius = uDim,
		stateLayer = var15.container.stateLayer,
		cursor = reactModule.useMemo(function()
			-- upvalues: uDim (ref), var14 (ref)
			return {
				radius = uDim,
				offset = var14.Size.Size_150,
				borderWidth = var14.Stroke.Thicker
			}
		end, { var14, uDim }),
		tag = var15.container.tag,
		GroupTransparency = if var13.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		ref = p1
	}), {
		Icon = reactModule.createElement(iconModule, {
			name = builderIconsModule.Icon.X,
			variant = iconVariant.Regular,
			size = var15.content.iconSize,
			style = var15.content.style
		})
	})
end))