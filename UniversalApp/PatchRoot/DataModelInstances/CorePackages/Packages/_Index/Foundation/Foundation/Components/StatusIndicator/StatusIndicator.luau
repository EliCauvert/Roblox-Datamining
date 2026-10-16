local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local FlagsModule = require(Foundation.Utility.Flags)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseStatusIndicatorVariantsModule = require(script.Parent.useStatusIndicatorVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local IsDEV = _G.__DEV__ == true
local StatusIndicatorShapeModule = require(Foundation.Enums.StatusIndicatorShape)
local ValidNumericVariantsModule = require(script.Parent.ValidNumericVariants)
local config = {
	max = 1e999,
	testId = "--foundation-status-indicator",
	variant = require(Foundation.Enums.StatusIndicatorVariant).Standard,
	shape = StatusIndicatorShapeModule.Circle,
	size = require(Foundation.Enums.StatusIndicatorSize).Small
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 67 | Named "StatusIndicator" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), StatusIndicatorShapeModule (copy), IsDEV (copy), ValidNumericVariantsModule (copy), DashModule (copy), UseTokensModule (copy), UseStatusIndicatorVariantsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), TextModule (copy), ReactIsModule (copy), FlagsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local Circle = if WithDefaultsModuleResult.value then StatusIndicatorShapeModule.Circle else WithDefaultsModuleResult.shape
	
	if IsDEV and WithDefaultsModuleResult.value ~= nil then
		assert(ValidNumericVariantsModule[WithDefaultsModuleResult.variant], `{WithDefaultsModuleResult.variant} is not a supported numeric variant. The following are valid numeric variants: {table.concat(DashModule.filter(DashModule.keys(ValidNumericVariantsModule), function(p2, _): boolean --[[ Line: 75 ]]
			-- upvalues: ValidNumericVariantsModule (upval)
			return ValidNumericVariantsModule[p2] == true
		end), ",")}`)
	end
	local UseTokensModuleResult = UseTokensModule()
	local HasValue = WithDefaultsModuleResult.value ~= nil
	local UseStatusIndicatorVariantsModuleResult = UseStatusIndicatorVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.variant, HasValue, Circle, WithDefaultsModuleResult.size, WithDefaultsModuleResult.mask)
	local UseResult = ReactModule.useCallback(function(p2): string --[[ Line: 88 ]]
		-- upvalues: WithDefaultsModuleResult (copy)
		return if WithDefaultsModuleResult.max and WithDefaultsModuleResult.max < p2 then `{WithDefaultsModuleResult.max}+` else tostring(p2)
	end, { WithDefaultsModuleResult.max })
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseStatusIndicatorVariantsModuleResult.container.tag,
		backgroundStyle = if UseStatusIndicatorVariantsModuleResult.container.backgroundStyle then UseStatusIndicatorVariantsModuleResult.container.backgroundStyle else nil,
		stroke = if WithDefaultsModuleResult.mask then UseStatusIndicatorVariantsModuleResult.stroke else nil,
		ref = Ref,
		Size = UseStatusIndicatorVariantsModuleResult.container.size
	}), {
		Text = if HasValue and UseStatusIndicatorVariantsModuleResult.content.style then ReactModule.createElement(TextModule, {
			Text = if ReactIsModule.isBinding(WithDefaultsModuleResult.value) then WithDefaultsModuleResult.value:map(UseResult) else UseResult(WithDefaultsModuleResult.value),
			textStyle = UseStatusIndicatorVariantsModuleResult.content.style,
			fontStyle = if FlagsModule.FoundationStatusIndicatorDesignUpdate and UseStatusIndicatorVariantsModuleResult.content.typography then {
				Font = UseStatusIndicatorVariantsModuleResult.content.font,
				FontSize = UseStatusIndicatorVariantsModuleResult.content.typography.FontSize,
				LineHeight = UseStatusIndicatorVariantsModuleResult.content.typography.LineHeight
			} else {
				Font = UseStatusIndicatorVariantsModuleResult.content.font,
				FontSize = UseTokensModuleResult.Typography.LabelSmall.FontSize,
				LineHeight = UseTokensModuleResult.Typography.LabelSmall.LineHeight
			},
			tag = UseStatusIndicatorVariantsModuleResult.content.tag,
			testId = `{WithDefaultsModuleResult.testId}--text`
		}) else nil,
		InnerRing = if Circle == StatusIndicatorShapeModule.Ring and UseStatusIndicatorVariantsModuleResult.ring then ReactModule.createElement(ViewModule, {
			tag = UseStatusIndicatorVariantsModuleResult.ring.tag,
			Size = UseStatusIndicatorVariantsModuleResult.ring.size,
			testId = `{WithDefaultsModuleResult.testId}--ring`
		}) else nil
	})
end))