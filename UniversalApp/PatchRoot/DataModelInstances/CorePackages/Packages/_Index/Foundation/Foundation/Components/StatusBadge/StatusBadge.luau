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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 38 | named "StatusBadge" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useStatusBadgeVariantsModule (ref), useScaledValueModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), textModule (ref)
	local var13 = withDefaultsModule(p0, t)
	local var14 = useStatusBadgeVariantsModule(useTokensModule(), var13.variant, var13.shape, var13.size)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var13, { tag = var14.container.tag, ref = p1 }), {
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = var14.content.tag,
			layout = if var14.content.gap then {
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, var14.content.gap)
			} else nil,
			testId = `{var13.testId}--content`
		}, {
			StatusLight = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = var14.statusLight.tag,
				testId = `{var13.testId}--status-light`
			}, {
				Dot = reactModule.createElement(viewModule, {
					LayoutOrder = 1,
					tag = var14.dot.tag,
					testId = `{var13.testId}--dot`
				})
			}),
			Text = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				Text = var13.text,
				tag = var14.text.tag,
				textStyle = var14.text.style,
				sizeConstraint = { MaxSize = Vector2.new(useScaledValueModule(200), 1e999) },
				testId = `{var13.testId}--text`
			})
		})
	})
end))