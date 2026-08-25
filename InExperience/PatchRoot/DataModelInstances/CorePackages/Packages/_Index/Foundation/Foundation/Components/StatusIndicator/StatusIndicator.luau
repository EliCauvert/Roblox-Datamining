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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), statusIndicatorShapeModule (ref), var11 (ref), validNumericVariantsModule (ref), dashModule (ref), useTokensModule (ref), useStatusIndicatorVariantsModule (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), textModule (ref), reactIsModule (ref)
	local var17 = withDefaultsModule(p0, t)
	local var18 = if var17.value then statusIndicatorShapeModule.Circle else var17.shape
	
	if var11 and var17.value ~= nil then
		assert(validNumericVariantsModule[var17.variant], `{var17.variant} is not a supported numeric variant. The following are valid numeric variants: {table.concat(dashModule.filter(dashModule.keys(validNumericVariantsModule), function(p2, _)
			-- upvalues: validNumericVariantsModule (copy)
			return validNumericVariantsModule[p2] == true
		end), ",")}`)
	end
	local var25
	local var19 = useTokensModule()
	local var20 = var17.value ~= nil
	local var21 = useStatusIndicatorVariantsModule(var19, var17.variant, var20, var18, if flagsModule.FoundationAvatarBeta then var17.size else nil)
	local var22 = reactModule.useCallback(function(p3)
		-- upvalues: var17 (ref)
		return if var17.max and var17.max < p3 then `{var17.max}+` else tostring(p3)
	end, { var17.max })
	local createElement = reactModule.createElement
	local var23 = withCommonPropsModule(var17, {
		tag = var21.container.tag,
		backgroundStyle = if var21.container.backgroundStyle then var21.container.backgroundStyle else nil,
		ref = p1,
		Size = if flagsModule.FoundationAvatarBeta then var21.container.size else nil
	})
	local t_1 = {
		Text = if var20 and var21.content.style then reactModule.createElement(textModule, {
			Text = if reactIsModule.isBinding(var17.value) then var17.value:map(var22) else var22(var17.value),
			textStyle = var21.content.style,
			fontStyle = {
				Font = var21.content.font,
				FontSize = var19.Typography.LabelSmall.FontSize,
				LineHeight = var19.Typography.LabelSmall.LineHeight
			},
			tag = var21.content.tag,
			testId = `{var17.testId}--text`
		}) else nil
	}
	
	if flagsModule.FoundationAvatarBeta then
		var25 = var18 == statusIndicatorShapeModule.Ring
		var25 = nil
	else
		var25 = true
	end
	t_1.InnerRing = if var25 and var21.ring then reactModule.createElement(viewModule, {
		tag = var21.ring.tag,
		Size = if flagsModule.FoundationAvatarBeta then var21.ring.size else nil,
		testId = `{var17.testId}--ring`
	}) else nil
	
	return createElement(viewModule, var23, t_1)
end))