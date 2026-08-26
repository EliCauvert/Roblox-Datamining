local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local components = foundation.Components
local iconModule = require(components.Icon)
local internalTextInputModule = require(components.InternalTextInput)
local _ = require(components.Types)
local viewModule = require(components.View)
local constantsModule = require(foundation.Constants)
local translatorModule = require(foundation.Utility.Localization.Translator)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTextInputVariantsModule = require(foundation.Components.TextInput.useTextInputVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local inputSizeModule = require(foundation.Enums.InputSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local radiusModule = require(foundation.Enums.Radius)
local searchInputShapeModule = require(foundation.Enums.SearchInputShape)
local t = {
	[searchInputShapeModule.Pill] = radiusModule.Circle,
	[searchInputShapeModule.Box] = radiusModule.None
}
local t_1 = {
	hasClearButton = true,
	testId = "--foundation-search-input",
	size = inputSizeModule.Medium,
	variant = inputVariantModule.Standard,
	shape = searchInputShapeModule.Pill
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTokensModule (ref), useTextInputVariantsModule (ref), useScaledValueModule (ref), constantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), internalTextInputModule (ref), t (ref), translatorModule (ref), iconModule (ref), builderIconsModule (ref)
	local var1 = withDefaultsModule(p1, t_1)
	local var2 = useTokensModule()
	local var3 = useTextInputVariantsModule(var2, var1.size, var1.variant)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = "auto-y",
		Size = if var1.width then UDim2.new(var1.width, UDim.new(0, 0)) else UDim2.new(UDim.new(0, useScaledValueModule(constantsModule.DEFAULT_INPUT_FIELD_WIDTH_PIXELS)), UDim.new(0, 0))
	}), {
		Input = reactModule.createElement(internalTextInputModule, {
			ref = p2,
			hasError = var1.hasError,
			isDisabled = var1.isDisabled,
			hasClearButton = var1.hasClearButton,
			text = var1.text,
			size = var1.size,
			radius = t[var1.shape],
			variant = var1.variant,
			horizontalPadding = {
				left = var3.container.horizontalPadding,
				right = var3.container.horizontalPadding
			},
			onChanged = var1.onChanged,
			onFocus = var1.onFocusGained,
			onFocusLost = var1.onFocusLost,
			placeholder = if var1.placeholder then var1.placeholder else translatorModule:FormatByKey("CommonUI.Controls.Action.Search"),
			leadingElement = reactModule.createElement(viewModule, {
				tag = "anchor-center-left auto-xy",
				Position = reactModule.useMemo(function()
					-- upvalues: var3 (ref), var2 (ref)
					return UDim2.fromOffset(0, (var3.container.minHeight - var2.Stroke.Standard) / 2)
				end, { var3.container.minHeight, var2.Stroke.Standard })
			}, {
				Icon = reactModule.createElement(iconModule, {
					name = builderIconsModule.Icon.MagnifyingGlass,
					size = var1.size,
					testId = `{var1.testId}--search-icon`
				})
			}),
			testId = `{var1.testId}--input`
		})
	})
end))