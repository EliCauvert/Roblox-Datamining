local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local flagsModule = require(foundation.Utility.Flags)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useStatusIndicatorVariantsModule = require(script.Parent.useStatusIndicatorVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local var11 = _G.__DEV__ == true
local statusIndicatorVariantModule = require(foundation.Enums.StatusIndicatorVariant)
local statusIndicatorShapeModule = require(foundation.Enums.StatusIndicatorShape)
local validNumericVariantsModule = require(script.Parent.ValidNumericVariants)
local t = {
	max = 1e999,
	testId = "--foundation-status-indicator",
	variant = statusIndicatorVariantModule.Standard,
	shape = statusIndicatorShapeModule.Circle
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 55 | named "StatusIndicator" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), statusIndicatorShapeModule (ref), var11 (ref), validNumericVariantsModule (ref), dashModule (ref), useTokensModule (ref), useStatusIndicatorVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), textModule (ref), reactIsModule (ref), flagsModule (ref)
	local var16 = withDefaultsModule(p0, t)
	local var17 = if var16.value then statusIndicatorShapeModule.Circle else var16.shape
	
	if var11 and var16.value ~= nil then
		assert(validNumericVariantsModule[var16.variant], `{var16.variant} is not a supported numeric variant. The following are valid numeric variants: {table.concat(dashModule.filter(dashModule.keys(validNumericVariantsModule), function(p2, _) --[[ line: 63 ]]
			-- upvalues: validNumericVariantsModule (copy)
			return validNumericVariantsModule[p2] == true
		end), ",")}`)
	end
	local var18 = useTokensModule()
	local var19 = var16.value ~= nil
	local var20 = useStatusIndicatorVariantsModule(var18, var16.variant, var19, var17)
	local var21 = reactModule.useCallback(function(p3) --[[ line: 75 ]]
		-- upvalues: var16 (ref)
		return if var16.max and var16.max < p3 then `{var16.max}+` else tostring(p3)
	end, { var16.max })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var16, {
		tag = var20.container.tag,
		backgroundStyle = if var20.container.backgroundStyle then var20.container.backgroundStyle else nil,
		ref = p1
	}), {
		Text = if var19 and var20.content.style then reactModule.createElement(textModule, {
			Text = if reactIsModule.isBinding(var16.value) then var16.value:map(var21) else var21(var16.value),
			textStyle = var20.content.style,
			fontStyle = if flagsModule.FoundationStatusIndicatorBeta then {
				Font = var20.content.font,
				FontSize = var18.Typography.LabelSmall.FontSize,
				LineHeight = var18.Typography.LabelSmall.LineHeight
			} else nil,
			tag = var20.content.tag,
			testId = `{var16.testId}--text`
		}) else nil,
		InnerRing = if var20.ring then reactModule.createElement(viewModule, { tag = var20.ring.tag, testId = `{var16.testId}--ring` }) else nil
	})
end))