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
local flagsModule = require(foundation.Utility.Flags)
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
	variant = inputVariantModule.Standard,
	Selectable = if flagsModule.FoundationDropdownSelectionProps then true else nil
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useDropdownVariantsModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), viewModule (ref), flagsModule (ref), stateLayerAffordanceModule (ref), blendTransparenciesModule (ref), constantsModule (ref), textModule (ref), iconModule (ref), chevronLargeUp (ref), chevronLargeDown (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3, var4 = reactModule.useState(controlStateModule.Initialize)
	local var5 = useDropdownVariantsModule(var2, var1.size, var1.variant, var3, var1.item == nil, var1.hasError or false, var1.isMenuOpen, var3 == controlStateModule.Hover)
	local var6 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return {
			radius = UDim.new(0, var2.Radius.Small),
			offset = var2.Size.Size_200,
			borderWidth = var2.Stroke.Thicker
		}
	end, { var2 })
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var1, {
		size = getInputTextSizeModule(var1.size),
		hasError = var1.hasError,
		isDisabled = var1.isDisabled,
		label = var1.label,
		hint = var1.hint,
		ref = p2,
		width = var1.width,
		input = function(_)
			-- upvalues: reactModule (copy), viewModule (copy), var4 (ref), var1 (ref), flagsModule (copy), var6 (ref), stateLayerAffordanceModule (copy), var5 (ref), blendTransparenciesModule (copy), constantsModule (copy), textModule (copy), iconModule (copy), chevronLargeUp (copy), chevronLargeDown (copy), var2 (ref)
			return reactModule.createElement(viewModule, {
				onStateChanged = var4,
				isDisabled = var1.isDisabled,
				onActivated = var1.onActivated,
				selection = {
					Selectable = if flagsModule.FoundationDropdownSelectionProps then if var1.isDisabled then false else var1.Selectable else not var1.isDisabled,
					NextSelectionUp = if flagsModule.FoundationDropdownSelectionProps then var1.NextSelectionUp else nil,
					NextSelectionDown = if flagsModule.FoundationDropdownSelectionProps then var1.NextSelectionDown else nil,
					NextSelectionLeft = if flagsModule.FoundationDropdownSelectionProps then var1.NextSelectionLeft else nil,
					NextSelectionRight = if flagsModule.FoundationDropdownSelectionProps then var1.NextSelectionRight else nil
				},
				cursor = var6,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				backgroundStyle = if var5.container.bgStyle then {
					Color3 = var5.container.bgStyle.Color3,
					Transparency = if var1.isDisabled then blendTransparenciesModule(var5.container.bgStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else var5.container.bgStyle.Transparency
				} else nil,
				stroke = if var5.container.strokeStyle then {
					Color = var5.container.strokeStyle.Color3,
					Transparency = if var1.isDisabled then blendTransparenciesModule(var5.container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else var5.container.strokeStyle.Transparency,
					Thickness = var5.container.strokeThickness,
					BorderStrokePosition = Enum.BorderStrokePosition.Inner
				} else nil,
				tag = var5.container.tag,
				ref = var1.inputRef,
				testId = `{var1.testId}--control`
			}, {
				Text = reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = if var1.item then var1.item.text else var1.placeholder,
					tag = var5.text.tag
				}),
				Arrow = reactModule.createElement(iconModule, {
					LayoutOrder = 2,
					name = if var1.isMenuOpen then chevronLargeUp else chevronLargeDown,
					size = var5.arrow.size,
					style = if var1.isDisabled then var2.Color.Content.Muted else nil,
					tag = var5.text.tag,
					testId = `{var1.testId}--arrow`
				})
			})
		end
	}))
end))