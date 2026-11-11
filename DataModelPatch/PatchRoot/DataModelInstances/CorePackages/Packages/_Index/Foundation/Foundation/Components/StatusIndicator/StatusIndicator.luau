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
local StatusIndicatorSizeModule = require(Foundation.Enums.StatusIndicatorSize)
local StatusIndicatorShapeModule = require(Foundation.Enums.StatusIndicatorShape)
local ValidNumericVariantsModule = require(script.Parent.ValidNumericVariants)
local config = {
	max = 1e999,
	testId = "--foundation-status-indicator",
	variant = require(Foundation.Enums.StatusIndicatorVariant).Standard,
	shape = StatusIndicatorShapeModule.Circle,
	size = if FlagsModule.FoundationAvatarBeta then StatusIndicatorSizeModule.Small else nil
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), StatusIndicatorShapeModule (copy), IsDEV (copy), ValidNumericVariantsModule (copy), DashModule (copy), UseTokensModule (copy), UseStatusIndicatorVariantsModule (copy), FlagsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), TextModule (copy), ReactIsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local Circle = if WithDefaultsModuleResult.value then StatusIndicatorShapeModule.Circle else WithDefaultsModuleResult.shape
	
	if IsDEV and WithDefaultsModuleResult.value ~= nil then
		assert(ValidNumericVariantsModule[WithDefaultsModuleResult.variant], `{WithDefaultsModuleResult.variant} is not a supported numeric variant. The following are valid numeric variants: {table.concat(DashModule.filter(DashModule.keys(ValidNumericVariantsModule), function(p2, _): boolean
			-- upvalues: ValidNumericVariantsModule (upval)
			return ValidNumericVariantsModule[p2] == true
		end), ",")}`)
	end
	local UseTokensModuleResult = UseTokensModule()
	local HasValue = WithDefaultsModuleResult.value ~= nil
	local UseStatusIndicatorVariantsModuleResult = UseStatusIndicatorVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.variant, HasValue, Circle, if FlagsModule.FoundationAvatarBeta then WithDefaultsModuleResult.size else nil)
	local UseResult = ReactModule.useCallback(function(p2): string
		-- upvalues: WithDefaultsModuleResult (copy)
		return if WithDefaultsModuleResult.max and WithDefaultsModuleResult.max < p2 then `{WithDefaultsModuleResult.max}+` else tostring(p2)
	end, { WithDefaultsModuleResult.max })
	local NoFoundationAvatarBeta: boolean = not FlagsModule.FoundationAvatarBeta or Circle == StatusIndicatorShapeModule.Ring
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseStatusIndicatorVariantsModuleResult.container.tag,
		backgroundStyle = if UseStatusIndicatorVariantsModuleResult.container.backgroundStyle then UseStatusIndicatorVariantsModuleResult.container.backgroundStyle else nil,
		ref = Ref,
		Size = if FlagsModule.FoundationAvatarBeta then UseStatusIndicatorVariantsModuleResult.container.size else nil
	}), {
		Text = if HasValue and UseStatusIndicatorVariantsModuleResult.content.style then ReactModule.createElement(TextModule, {
			Text = if ReactIsModule.isBinding(WithDefaultsModuleResult.value) then WithDefaultsModuleResult.value:map(UseResult) else UseResult(WithDefaultsModuleResult.value),
			textStyle = UseStatusIndicatorVariantsModuleResult.content.style,
			fontStyle = if FlagsModule.FoundationStatusIndicatorBeta then {
				Font = UseStatusIndicatorVariantsModuleResult.content.font,
				FontSize = UseTokensModuleResult.Typography.LabelSmall.FontSize,
				LineHeight = UseTokensModuleResult.Typography.LabelSmall.LineHeight
			} else nil,
			tag = UseStatusIndicatorVariantsModuleResult.content.tag,
			testId = `{WithDefaultsModuleResult.testId}--text`
		}) else nil,
		InnerRing = if NoFoundationAvatarBeta and UseStatusIndicatorVariantsModuleResult.ring then ReactModule.createElement(ViewModule, {
			tag = UseStatusIndicatorVariantsModuleResult.ring.tag,
			Size = if FlagsModule.FoundationAvatarBeta then UseStatusIndicatorVariantsModuleResult.ring.size else nil,
			testId = `{WithDefaultsModuleResult.testId}--ring`
		}) else nil
	})
end))