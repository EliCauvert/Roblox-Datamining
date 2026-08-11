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
	variant = if flagsModule.FoundationDropdownVariant then inputVariantModule.Standard else nil,
	Selectable = if flagsModule.FoundationDropdownSelectionProps then true else nil
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 66 | named "DropdownControl" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), flagsModule (ref), inputVariantModule (ref), useDropdownVariantsModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), blendTransparenciesModule (ref), constantsModule (ref), textModule (ref), iconModule (ref), chevronLargeUp (ref), chevronLargeDown (ref)
	local var19 = withDefaultsModule(p0, t)
	local var20 = useTokensModule()
	local var21, var22 = reactModule.useState(controlStateModule.Initialize)
	local var23 = var19.item == nil
	
	if flagsModule.FoundationDropdownVariant and var19.variant == nil then
		var19.variant = inputVariantModule.Standard
	end
	local var27
	local size = var19.size
	local var24 = if flagsModule.FoundationDropdownVariant then var19.variant else nil
	local hasError = var19.hasError or false
	local var26 = if flagsModule.FoundationDropdownVariant then var19.isMenuOpen else nil
	
	if flagsModule.FoundationDropdownVariant then
		var27 = var21 == controlStateModule.Hover
		var27 = nil
	else
		var27 = nil
	end
	local var28 = useDropdownVariantsModule(var20, size, var24, var21, var23, hasError, var26, var27)
	local var29 = reactModule.useMemo(function() --[[ line: 86 ]]
		-- upvalues: var20 (ref)
		return {
			radius = UDim.new(0, var20.Radius.Small),
			offset = var20.Size.Size_200,
			borderWidth = var20.Stroke.Thicker
		}
	end, { var20 })
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var19, {
		size = getInputTextSizeModule(var19.size),
		hasError = var19.hasError,
		isDisabled = var19.isDisabled,
		label = var19.label,
		hint = var19.hint,
		ref = p1,
		width = var19.width,
		input = function(_) --[[ line: 104 ]]
			-- upvalues: reactModule (copy), viewModule (copy), var22 (ref), var19 (ref), flagsModule (copy), var29 (ref), stateLayerAffordanceModule (copy), var28 (ref), blendTransparenciesModule (copy), constantsModule (copy), textModule (copy), iconModule (copy), chevronLargeUp (copy), chevronLargeDown (copy), var20 (ref)
			return reactModule.createElement(viewModule, {
				onStateChanged = var22,
				isDisabled = var19.isDisabled,
				onActivated = var19.onActivated,
				selection = {
					Selectable = if flagsModule.FoundationDropdownSelectionProps then if var19.isDisabled then false else var19.Selectable else not var19.isDisabled,
					NextSelectionUp = if flagsModule.FoundationDropdownSelectionProps then var19.NextSelectionUp else nil,
					NextSelectionDown = if flagsModule.FoundationDropdownSelectionProps then var19.NextSelectionDown else nil,
					NextSelectionLeft = if flagsModule.FoundationDropdownSelectionProps then var19.NextSelectionLeft else nil,
					NextSelectionRight = if flagsModule.FoundationDropdownSelectionProps then var19.NextSelectionRight else nil
				},
				cursor = var29,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				backgroundStyle = if flagsModule.FoundationDropdownVariant and var28.container.bgStyle then {
					Color3 = var28.container.bgStyle.Color3,
					Transparency = if var19.isDisabled then blendTransparenciesModule(var28.container.bgStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else var28.container.bgStyle.Transparency
				} else nil,
				stroke = if flagsModule.FoundationDropdownVariant and var28.container.strokeStyle then {
					Color = var28.container.strokeStyle.Color3,
					Transparency = if var19.isDisabled then blendTransparenciesModule(var28.container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else var28.container.strokeStyle.Transparency,
					Thickness = var28.container.strokeThickness,
					BorderStrokePosition = Enum.BorderStrokePosition.Inner
				} else nil,
				tag = var28.container.tag,
				ref = var19.inputRef,
				testId = `{var19.testId}--control`
			}, {
				Text = reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = if var19.item then var19.item.text else var19.placeholder,
					tag = var28.text.tag
				}),
				Arrow = reactModule.createElement(iconModule, {
					LayoutOrder = 2,
					name = if var19.isMenuOpen then chevronLargeUp else chevronLargeDown,
					size = var28.arrow.size,
					style = if var19.isDisabled then var20.Color.Content.Muted else nil,
					tag = var28.text.tag,
					testId = `{var19.testId}--arrow`
				})
			})
		end
	}))
end))