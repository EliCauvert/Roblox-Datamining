local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local buttonGroupModule = require(foundation.Components.ButtonGroup)
local _ = require(foundation.Enums.ButtonVariant)
local dialogSizeModule = require(foundation.Enums.DialogSize)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local orientationModule = require(foundation.Enums.Orientation)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useDialogVariants = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local useDialogModule = require(script.Parent.Parent.useDialog)
local t = { orientation = orientationModule.Horizontal }

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useDialogVariants (ref), useDialogModule (ref), dialogSizeModule (ref), orientationModule (ref), reactModule (ref), viewModule (ref), buttonGroupModule (ref), fillBehaviorModule (ref), textModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useDialogModule()
	
	return reactModule.createElement(viewModule, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = var1.LayoutOrder,
		testId = `{var2.testId}--actions`
	}, {
		ActionsContainer = reactModule.createElement(buttonGroupModule, {
			LayoutOrder = 1,
			buttons = var1.actions or {},
			orientation = if var1.orientation == orientationModule.Vertical and var2.responsiveSize == dialogSizeModule.Small then orientationModule.Vertical else orientationModule.Horizontal,
			fillBehavior = fillBehaviorModule.Fill,
			testId = `{var2.testId}--actions-container`
		}),
		ActionsLabel = if var1.label then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var1.label,
			tag = useDialogVariants().actionsLabel.tag,
			testId = `{var2.testId}--actions-label`
		}) else nil
	})
end