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
	local var2 = withDefaultsModule(p1, t)
	local var3 = if var2.value then statusIndicatorShapeModule.Circle else var2.shape
	
	if var2 and var2.value ~= nil then
		assert(validNumericVariantsModule[var2.variant], `{var2.variant} is not a supported numeric variant. The following are valid numeric variants: {table.concat(dashModule.filter(dashModule.keys(validNumericVariantsModule), function(p3, _)
			-- upvalues: validNumericVariantsModule (copy)
			return validNumericVariantsModule[p3] == true
		end), ",")}`)
	end
	local var4
	local var5 = useTokensModule()
	local var6 = var2.value ~= nil
	local var7 = useStatusIndicatorVariantsModule(var5, var2.variant, var6, var3, if flagsModule.FoundationAvatarBeta then var2.size else nil)
	local var8 = reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref)
		return if var2.max and var2.max < p3 then `{var2.max}+` else tostring(p3)
	end, { var2.max })
	local createElement = reactModule.createElement
	local var2 = withCommonPropsModule(var2, {
		tag = var7.container.tag,
		backgroundStyle = if var7.container.backgroundStyle then var7.container.backgroundStyle else nil,
		ref = p2,
		Size = if flagsModule.FoundationAvatarBeta then var7.container.size else nil
	})
	local t_1 = {
		Text = if var6 and var7.content.style then reactModule.createElement(textModule, {
			Text = if reactIsModule.isBinding(var2.value) then var2.value:map(var8) else var8(var2.value),
			textStyle = var7.content.style,
			fontStyle = {
				Font = var7.content.font,
				FontSize = var5.Typography.LabelSmall.FontSize,
				LineHeight = var5.Typography.LabelSmall.LineHeight
			},
			tag = var7.content.tag,
			testId = `{var2.testId}--text`
		}) else nil
	}
	
	if flagsModule.FoundationAvatarBeta then
		var4 = var3 == statusIndicatorShapeModule.Ring
		var4 = nil
	else
		var4 = true
	end
	t_1.InnerRing = if var4 and var7.ring then reactModule.createElement(viewModule, {
		tag = var7.ring.tag,
		Size = if flagsModule.FoundationAvatarBeta then var7.ring.size else nil,
		testId = `{var2.testId}--ring`
	}) else nil
	
	return createElement(viewModule, var2, t_1)
end))