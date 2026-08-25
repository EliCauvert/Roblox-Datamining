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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: useTokensModule (ref), fillBehaviorModule (ref), useStepperVariantsModule (ref), reactModule (ref), viewModule (ref), stepperStepStateModule (ref), iconModule (ref), icon (ref), iconVariant (ref), textModule (ref)
	local var10 = useTokensModule()
	local var11 = useStepperVariantsModule(var10, p0.size, p0.stepState, p0.fillBehavior == fillBehaviorModule.Fill)
	
	return reactModule.createElement(viewModule, {
		tag = var11.container.tag,
		testId = p0.testId,
		LayoutOrder = p0.LayoutOrder
	}, {
		Measure = reactModule.createElement(viewModule, { LayoutOrder = 1, tag = "size-full", ref = p1 }),
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var11.content.tag,
			padding = var11.content.padding,
			testId = `{p0.testId}--content`
		}, {
			IndicatorOuter = reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = var11.indicatorOuter.tag,
				testId = `{p0.testId}--indicator-outer`
			}, {
				Indicator = reactModule.createElement(viewModule, {
					tag = var11.indicatorInner.tag,
					testId = `{p0.testId}--indicator`
				}, {
					StepIndex = if p0.stepState == stepperStepStateModule.Complete then reactModule.createElement(iconModule, {
						name = icon.Check,
						style = var10.Inverse.Content.Emphasis,
						size = var11.icon.size,
						variant = iconVariant.Filled,
						testId = `{p0.testId}--check`
					}) else reactModule.createElement(textModule, {
						Text = tostring(p0.index),
						tag = var11.index.tag,
						testId = `{p0.testId}--index`
					})
				})
			}),
			TextColumn = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = var11.textColumn.tag,
				padding = var11.textColumn.padding,
				testId = `{p0.testId}--text-column`
			}, {
				Label = reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = p0.step.label,
					tag = var11.label.tag,
					testId = `{p0.testId}--label`
				}),
				Description = if p0.step.description then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					Text = p0.step.description,
					tag = var11.description.tag,
					testId = `{p0.testId}--description`
				}) else nil
			})
		})
	})
end))