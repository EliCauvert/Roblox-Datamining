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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTokensModule (ref), useTextInputVariantsModule (ref), useScaledValueModule (ref), constantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), internalTextInputModule (ref), t (ref), translatorModule (ref), iconModule (ref), builderIconsModule (ref)
	local var19 = withDefaultsModule(p0, t_1)
	local var20 = useTokensModule()
	local var21 = useTextInputVariantsModule(var20, var19.size, var19.variant)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var19, {
		tag = "auto-y",
		Size = if var19.width then UDim2.new(var19.width, UDim.new(0, 0)) else UDim2.new(UDim.new(0, useScaledValueModule(constantsModule.DEFAULT_INPUT_FIELD_WIDTH_PIXELS)), UDim.new(0, 0))
	}), {
		Input = reactModule.createElement(internalTextInputModule, {
			ref = p1,
			hasError = var19.hasError,
			isDisabled = var19.isDisabled,
			hasClearButton = var19.hasClearButton,
			text = var19.text,
			size = var19.size,
			radius = t[var19.shape],
			variant = var19.variant,
			horizontalPadding = {
				left = var21.container.horizontalPadding,
				right = var21.container.horizontalPadding
			},
			onChanged = var19.onChanged,
			onFocus = var19.onFocusGained,
			onFocusLost = var19.onFocusLost,
			placeholder = if var19.placeholder then var19.placeholder else translatorModule:FormatByKey("CommonUI.Controls.Action.Search"),
			leadingElement = reactModule.createElement(viewModule, {
				tag = "anchor-center-left auto-xy",
				Position = reactModule.useMemo(function()
					-- upvalues: var21 (ref), var20 (ref)
					return UDim2.fromOffset(0, (var21.container.minHeight - var20.Stroke.Standard) / 2)
				end, { var21.container.minHeight, var20.Stroke.Standard })
			}, {
				Icon = reactModule.createElement(iconModule, {
					name = builderIconsModule.Icon.MagnifyingGlass,
					size = var19.size,
					testId = `{var19.testId}--search-icon`
				})
			}),
			testId = `{var19.testId}--input`
		})
	})
end))