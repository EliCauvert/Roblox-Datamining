local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local statusBadgeShapeModule = require(foundation.Enums.StatusBadgeShape)
local statusBadgeSizeModule = require(foundation.Enums.StatusBadgeSize)
local statusBadgeVariantModule = require(foundation.Enums.StatusBadgeVariant)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useStatusBadgeVariantsModule = require(script.Parent.useStatusBadgeVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	testId = "--foundation-status-badge",
	variant = statusBadgeVariantModule.Standard,
	shape = statusBadgeShapeModule.Utility,
	size = statusBadgeSizeModule.Small
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useStatusBadgeVariantsModule (ref), useScaledValueModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), textModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useStatusBadgeVariantsModule(useTokensModule(), var1.variant, var1.shape, var1.size)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = var2.container.tag, ref = p2 }), {
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = var2.content.tag,
			layout = if var2.content.gap then {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var2.content.gap)
			} else nil,
			testId = `{var1.testId}--content`
		}, {
			StatusLight = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = var2.statusLight.tag,
				testId = `{var1.testId}--status-light`
			}, {
				Dot = reactModule.createElement(viewModule, {
					LayoutOrder = 1,
					tag = var2.dot.tag,
					testId = `{var1.testId}--dot`
				})
			}),
			Text = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				Text = var1.text,
				tag = var2.text.tag,
				textStyle = var2.text.style,
				sizeConstraint = { MaxSize = Vector2.new(useScaledValueModule(200), 1e999) },
				testId = `{var1.testId}--text`
			})
		})
	})
end))