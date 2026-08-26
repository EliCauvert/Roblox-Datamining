local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local iconModule = require(foundation.Components.Icon)
local _ = require(foundation.Enums.InputSize)
local stepperStepStateModule = require(foundation.Enums.StepperStepState)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local useStepperVariantsModule = require(script.Parent.useStepperVariants)
local icon = builderIconsModule.Icon
local iconVariant = builderIconsModule.IconVariant

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokensModule (ref), fillBehaviorModule (ref), useStepperVariantsModule (ref), reactModule (ref), viewModule (ref), stepperStepStateModule (ref), iconModule (ref), icon (ref), iconVariant (ref), textModule (ref)
	local var1 = useTokensModule()
	local var2 = useStepperVariantsModule(var1, p1.size, p1.stepState, p1.fillBehavior == fillBehaviorModule.Fill)
	
	return reactModule.createElement(viewModule, {
		tag = var2.container.tag,
		testId = p1.testId,
		LayoutOrder = p1.LayoutOrder
	}, {
		Measure = reactModule.createElement(viewModule, { LayoutOrder = 1, tag = "size-full", ref = p2 }),
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var2.content.tag,
			padding = var2.content.padding,
			testId = `{p1.testId}--content`
		}, {
			IndicatorOuter = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = var2.indicatorOuter.tag,
				testId = `{p1.testId}--indicator-outer`
			}, {
				Indicator = reactModule.createElement(viewModule, {
					tag = var2.indicatorInner.tag,
					testId = `{p1.testId}--indicator`
				}, {
					StepIndex = if p1.stepState == stepperStepStateModule.Complete then reactModule.createElement(iconModule, {
						name = icon.Check,
						style = var1.Inverse.Content.Emphasis,
						size = var2.icon.size,
						variant = iconVariant.Filled,
						testId = `{p1.testId}--check`
					}) else reactModule.createElement(textModule, {
						Text = tostring(p1.index),
						tag = var2.index.tag,
						testId = `{p1.testId}--index`
					})
				})
			}),
			TextColumn = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = var2.textColumn.tag,
				padding = var2.textColumn.padding,
				testId = `{p1.testId}--text-column`
			}, {
				Label = reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = p1.step.label,
					tag = var2.label.tag,
					testId = `{p1.testId}--label`
				}),
				Description = if p1.step.description then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					Text = p1.step.description,
					tag = var2.description.tag,
					testId = `{p1.testId}--description`
				}) else nil
			})
		})
	})
end))