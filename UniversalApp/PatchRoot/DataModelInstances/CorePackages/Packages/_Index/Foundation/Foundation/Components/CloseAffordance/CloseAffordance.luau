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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), useCloseAffordanceVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), iconModule (ref), builderIconsModule (ref), iconVariant (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = useCloseAffordanceVariantsModule(var2, var1.size, var1.variant, usePresentationContext().colorNamespace, var1.hasPadding, var1.isCircular)
	local uDim = UDim.new(0, var3.container.radius)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		Size = var3.container.size,
		onActivated = var1.onActivated,
		selection = {
			Selectable = if var1.isDisabled then false else var1.Selectable,
			NextSelectionUp = var1.NextSelectionUp,
			NextSelectionDown = var1.NextSelectionDown,
			NextSelectionLeft = var1.NextSelectionLeft,
			NextSelectionRight = var1.NextSelectionRight
		},
		isDisabled = var1.isDisabled,
		padding = var3.container.padding,
		cornerRadius = uDim,
		stateLayer = var3.container.stateLayer,
		cursor = reactModule.useMemo(function()
			-- upvalues: uDim (ref), var2 (ref)
			return {
				radius = uDim,
				offset = var2.Size.Size_150,
				borderWidth = var2.Stroke.Thicker
			}
		end, { var2, uDim }),
		tag = var3.container.tag,
		GroupTransparency = if var1.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		ref = p2
	}), {
		Icon = reactModule.createElement(iconModule, {
			name = builderIconsModule.Icon.X,
			variant = iconVariant.Regular,
			size = var3.content.iconSize,
			style = var3.content.style
		})
	})
end))