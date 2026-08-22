local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local components = foundation.Components
local _ = require(components.BaseMenu)
local viewModule = require(components.View)
local constantsModule = require(foundation.Constants)
local iconModule = require(components.Icon)
local inputFieldModule = require(components.InputField)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local textModule = require(components.Text)
local _ = require(foundation.Components.Types)
local blendTransparenciesModule = require(foundation.Utility.blendTransparencies)
local getInputTextSizeModule = require(foundation.Utility.getInputTextSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useDropdownVariantsModule = require(script.Parent.useDropdownVariants)
local controlStateModule = require(foundation.Enums.ControlState)
local _ = require(foundation.Enums.CursorType)
local _ = require(foundation.Enums.InputSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local builderIconsModule = require(parent.BuilderIcons)
local chevronLargeUp = builderIconsModule.Icon.ChevronLargeUp
local chevronLargeDown = builderIconsModule.Icon.ChevronLargeDown
local t = {
	isMenuOpen = false,
	placeholder = "",
	Selectable = true,
	variant = inputVariantModule.Standard
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 64 | named "DropdownControl" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useDropdownVariantsModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), blendTransparenciesModule (ref), constantsModule (ref), textModule (ref), iconModule (ref), chevronLargeUp (ref), chevronLargeDown (ref)
	local var18 = withDefaultsModule(p0, t)
	local var19 = useTokensModule()
	local var20, var21 = reactModule.useState(controlStateModule.Initialize)
	local var22 = useDropdownVariantsModule(var19, var18.size, var18.variant, var20, var18.item == nil, var18.hasError or false, var18.isMenuOpen, var20 == controlStateModule.Hover)
	local var23 = reactModule.useMemo(function() --[[ line: 80 ]]
		-- upvalues: var19 (ref)
		return {
			radius = UDim.new(0, var19.Radius.Small),
			offset = var19.Size.Size_200,
			borderWidth = var19.Stroke.Thicker
		}
	end, { var19 })
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var18, {
		size = getInputTextSizeModule(var18.size),
		hasError = var18.hasError,
		isDisabled = var18.isDisabled,
		label = var18.label,
		hint = var18.hint,
		ref = p1,
		width = var18.width,
		input = function(_) --[[ line: 98 ]]
			-- upvalues: reactModule (copy), viewModule (copy), var21 (ref), var18 (ref), var23 (ref), stateLayerAffordanceModule (copy), var22 (ref), blendTransparenciesModule (copy), constantsModule (copy), textModule (copy), iconModule (copy), chevronLargeUp (copy), chevronLargeDown (copy), var19 (ref)
			return reactModule.createElement(viewModule, {
				onStateChanged = var21,
				isDisabled = var18.isDisabled,
				onActivated = var18.onActivated,
				selection = {
					Selectable = if var18.isDisabled then false else var18.Selectable,
					NextSelectionUp = var18.NextSelectionUp,
					NextSelectionDown = var18.NextSelectionDown,
					NextSelectionLeft = var18.NextSelectionLeft,
					NextSelectionRight = var18.NextSelectionRight
				},
				cursor = var23,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				backgroundStyle = if var22.container.bgStyle then {
					Color3 = var22.container.bgStyle.Color3,
					Transparency = if var18.isDisabled then blendTransparenciesModule(var22.container.bgStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else var22.container.bgStyle.Transparency
				} else nil,
				stroke = if var22.container.strokeStyle then {
					Color = var22.container.strokeStyle.Color3,
					Transparency = if var18.isDisabled then blendTransparenciesModule(var22.container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else var22.container.strokeStyle.Transparency,
					Thickness = var22.container.strokeThickness,
					BorderStrokePosition = Enum.BorderStrokePosition.Inner
				} else nil,
				tag = var22.container.tag,
				ref = var18.inputRef,
				testId = `{var18.testId}--control`
			}, {
				Text = reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = if var18.item then var18.item.text else var18.placeholder,
					tag = var22.text.tag
				}),
				Arrow = reactModule.createElement(iconModule, {
					LayoutOrder = 2,
					name = if var18.isMenuOpen then chevronLargeUp else chevronLargeDown,
					size = var22.arrow.size,
					style = if var18.isDisabled then var19.Color.Content.Muted else nil,
					tag = var22.text.tag,
					testId = `{var18.testId}--arrow`
				})
			})
		end
	}))
end))