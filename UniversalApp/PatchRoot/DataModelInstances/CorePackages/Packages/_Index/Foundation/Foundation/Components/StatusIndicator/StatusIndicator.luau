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
	size = if flagsModule.FoundationAvatarBeta then statusIndicatorSizeModule.Small else nil
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), statusIndicatorShapeModule (ref), var1 (ref), validNumericVariantsModule (ref), dashModule (ref), useTokensModule (ref), useStatusIndicatorVariantsModule (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), textModule (ref), reactIsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = if var1.value then statusIndicatorShapeModule.Circle else var1.shape
	
	if var1 and var1.value ~= nil then
		assert(validNumericVariantsModule[var1.variant], `{var1.variant} is not a supported numeric variant. The following are valid numeric variants: {table.concat(dashModule.filter(dashModule.keys(validNumericVariantsModule), function(p1, _)
			-- upvalues: validNumericVariantsModule (copy)
			return validNumericVariantsModule[p1] == true
		end), ",")}`)
	end
	local var3
	local var4 = useTokensModule()
	local var5 = var1.value ~= nil
	local var6 = useStatusIndicatorVariantsModule(var4, var1.variant, var5, var2, if flagsModule.FoundationAvatarBeta then var1.size else nil)
	local var7 = reactModule.useCallback(function(p1)
		-- upvalues: var1 (ref)
		return if var1.max and var1.max < p1 then `{var1.max}+` else tostring(p1)
	end, { var1.max })
	local createElement = reactModule.createElement
	local var1 = withCommonPropsModule(var1, {
		tag = var6.container.tag,
		backgroundStyle = if var6.container.backgroundStyle then var6.container.backgroundStyle else nil,
		ref = p2,
		Size = if flagsModule.FoundationAvatarBeta then var6.container.size else nil
	})
	local t_1 = {
		Text = if var5 and var6.content.style then reactModule.createElement(textModule, {
			Text = if reactIsModule.isBinding(var1.value) then var1.value:map(var7) else var7(var1.value),
			textStyle = var6.content.style,
			fontStyle = {
				Font = var6.content.font,
				FontSize = var4.Typography.LabelSmall.FontSize,
				LineHeight = var4.Typography.LabelSmall.LineHeight
			},
			tag = var6.content.tag,
			testId = `{var1.testId}--text`
		}) else nil
	}
	
	if flagsModule.FoundationAvatarBeta then
		var3 = var2 == statusIndicatorShapeModule.Ring
		var3 = nil
	else
		var3 = true
	end
	t_1.InnerRing = if var3 and var6.ring then reactModule.createElement(viewModule, {
		tag = var6.ring.tag,
		Size = if flagsModule.FoundationAvatarBeta then var6.ring.size else nil,
		testId = `{var1.testId}--ring`
	}) else nil
	
	return createElement(viewModule, var1, t_1)
end))