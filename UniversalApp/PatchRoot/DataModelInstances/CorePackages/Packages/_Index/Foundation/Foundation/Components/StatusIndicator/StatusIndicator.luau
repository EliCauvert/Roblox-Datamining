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
local var1 = _G.__DEV__ == true
local statusIndicatorSizeModule = require(foundation.Enums.StatusIndicatorSize)
local statusIndicatorVariantModule = require(foundation.Enums.StatusIndicatorVariant)
local statusIndicatorShapeModule = require(foundation.Enums.StatusIndicatorShape)
local validNumericVariantsModule = require(script.Parent.ValidNumericVariants)
local t = {
	max = 1e999,
	testId = "--foundation-status-indicator",
	variant = statusIndicatorVariantModule.Standard,
	shape = statusIndicatorShapeModule.Circle,
	size = statusIndicatorSizeModule.Small
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), statusIndicatorShapeModule (ref), var1 (ref), validNumericVariantsModule (ref), dashModule (ref), useTokensModule (ref), useStatusIndicatorVariantsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), textModule (ref), reactIsModule (ref), flagsModule (ref)
	local var2 = withDefaultsModule(p1, t)
	local var3 = if var2.value then statusIndicatorShapeModule.Circle else var2.shape
	
	if var1 and var2.value ~= nil then
		assert(validNumericVariantsModule[var2.variant], `{var2.variant} is not a supported numeric variant. The following are valid numeric variants: {table.concat(dashModule.filter(dashModule.keys(validNumericVariantsModule), function(p3, _)
			-- upvalues: validNumericVariantsModule (copy)
			return validNumericVariantsModule[p3] == true
		end), ",")}`)
	end
	local var4
	local var5 = useTokensModule()
	local var6 = var2.value ~= nil
	local var7 = useStatusIndicatorVariantsModule(var5, var2.variant, var6, var3, var2.size, var2.mask)
	local var8 = reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref)
		return if var2.max and var2.max < p3 then `{var2.max}+` else tostring(p3)
	end, { var2.max })
	local createElement = reactModule.createElement
	local var9 = withCommonPropsModule(var2, {
		tag = var7.container.tag,
		backgroundStyle = if var7.container.backgroundStyle then var7.container.backgroundStyle else nil,
		stroke = if var2.mask then var7.stroke else nil,
		ref = p2,
		Size = var7.container.size
	})
	local t_1 = {}
	
	if var6 and var7.content.style then
		var4 = reactModule.createElement
		var4 = var4(textModule, {
			Text = if reactIsModule.isBinding(var2.value) then var2.value:map(var8) else var8(var2.value),
			textStyle = var7.content.style,
			fontStyle = if flagsModule.FoundationStatusIndicatorDesignUpdate and var7.content.typography then {
				Font = var7.content.font,
				FontSize = var7.content.typography.FontSize,
				LineHeight = var7.content.typography.LineHeight
			} else {
				Font = var7.content.font,
				FontSize = var5.Typography.LabelSmall.FontSize,
				LineHeight = var5.Typography.LabelSmall.LineHeight
			},
			tag = var7.content.tag,
			testId = `{var2.testId}--text`
		})
	else
		var4 = nil
	end
	t_1.Text = var4
	t_1.InnerRing = if var3 == statusIndicatorShapeModule.Ring and var7.ring then reactModule.createElement(viewModule, {
		tag = var7.ring.tag,
		Size = var7.ring.size,
		testId = `{var2.testId}--ring`
	}) else nil
	
	return createElement(viewModule, var9, t_1)
end))