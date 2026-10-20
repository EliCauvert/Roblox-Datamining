local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local IconModule = require(Foundation.Components.Icon)
local _ = require(Foundation.Enums.InputSize)
local StepperStepStateModule = require(Foundation.Enums.StepperStepState)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local UseStepperVariantsModule = require(script.Parent.useStepperVariants)
local Icon = BuilderIconsModule.Icon
local IconVariant = BuilderIconsModule.IconVariant

return ReactModule.memo(ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseTokensModule (copy), FillBehaviorModule (copy), UseStepperVariantsModule (copy), ReactModule (copy), ViewModule (copy), StepperStepStateModule (copy), IconModule (copy), Icon (copy), IconVariant (copy), TextModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseStepperVariantsModuleResult = UseStepperVariantsModule(UseTokensModuleResult, Frame.size, Frame.stepState, Frame.fillBehavior == FillBehaviorModule.Fill)
	
	return ReactModule.createElement(ViewModule, {
		tag = UseStepperVariantsModuleResult.container.tag,
		testId = Frame.testId,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Measure = ReactModule.createElement(ViewModule, { LayoutOrder = 1, tag = "size-full", ref = Ref }),
		Content = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = UseStepperVariantsModuleResult.content.tag,
			padding = UseStepperVariantsModuleResult.content.padding,
			testId = `{Frame.testId}--content`
		}, {
			IndicatorOuter = ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				tag = UseStepperVariantsModuleResult.indicatorOuter.tag,
				testId = `{Frame.testId}--indicator-outer`
			}, {
				Indicator = ReactModule.createElement(ViewModule, {
					tag = UseStepperVariantsModuleResult.indicatorInner.tag,
					testId = `{Frame.testId}--indicator`
				}, {
					StepIndex = if Frame.stepState == StepperStepStateModule.Complete then ReactModule.createElement(IconModule, {
						name = Icon.Check,
						style = UseTokensModuleResult.Inverse.Content.Emphasis,
						size = UseStepperVariantsModuleResult.icon.size,
						variant = IconVariant.Filled,
						testId = `{Frame.testId}--check`
					}) else ReactModule.createElement(TextModule, {
						Text = tostring(Frame.index),
						tag = UseStepperVariantsModuleResult.index.tag,
						testId = `{Frame.testId}--index`
					})
				})
			}),
			TextColumn = ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = UseStepperVariantsModuleResult.textColumn.tag,
				padding = UseStepperVariantsModuleResult.textColumn.padding,
				testId = `{Frame.testId}--text-column`
			}, {
				Label = ReactModule.createElement(TextModule, {
					LayoutOrder = 1,
					Text = Frame.step.label,
					tag = UseStepperVariantsModuleResult.label.tag,
					testId = `{Frame.testId}--label`
				}),
				Description = if Frame.step.description then ReactModule.createElement(TextModule, {
					LayoutOrder = 2,
					Text = Frame.step.description,
					tag = UseStepperVariantsModuleResult.description.tag,
					testId = `{Frame.testId}--description`
				}) else nil
			})
		})
	})
end))