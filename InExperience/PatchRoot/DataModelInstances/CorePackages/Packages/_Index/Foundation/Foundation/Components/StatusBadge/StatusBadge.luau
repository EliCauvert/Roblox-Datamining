local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseStatusBadgeVariantsModule = require(script.Parent.useStatusBadgeVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	testId = "--foundation-status-badge",
	variant = require(Foundation.Enums.StatusBadgeVariant).Standard,
	shape = require(Foundation.Enums.StatusBadgeShape).Utility,
	size = require(Foundation.Enums.StatusBadgeSize).Small
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseStatusBadgeVariantsModule (copy), UseScaledValueModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStatusBadgeVariantsModuleResult = UseStatusBadgeVariantsModule(UseTokensModule(), WithDefaultsModuleResult.variant, WithDefaultsModuleResult.shape, WithDefaultsModuleResult.size)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseStatusBadgeVariantsModuleResult.container.tag,
		ref = Ref
	}), {
		Content = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = UseStatusBadgeVariantsModuleResult.content.tag,
			layout = if UseStatusBadgeVariantsModuleResult.content.gap then {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, UseStatusBadgeVariantsModuleResult.content.gap)
			} else nil,
			testId = `{WithDefaultsModuleResult.testId}--content`
		}, {
			StatusLight = ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				tag = UseStatusBadgeVariantsModuleResult.statusLight.tag,
				testId = `{WithDefaultsModuleResult.testId}--status-light`
			}, {
				Dot = ReactModule.createElement(ViewModule, {
					LayoutOrder = 1,
					tag = UseStatusBadgeVariantsModuleResult.dot.tag,
					testId = `{WithDefaultsModuleResult.testId}--dot`
				})
			}),
			Text = ReactModule.createElement(TextModule, {
				LayoutOrder = 2,
				Text = WithDefaultsModuleResult.text,
				tag = UseStatusBadgeVariantsModuleResult.text.tag,
				textStyle = UseStatusBadgeVariantsModuleResult.text.style,
				sizeConstraint = { MaxSize = Vector2.new(UseScaledValueModule(200), 1e999) },
				testId = `{WithDefaultsModuleResult.testId}--text`
			})
		})
	})
end))