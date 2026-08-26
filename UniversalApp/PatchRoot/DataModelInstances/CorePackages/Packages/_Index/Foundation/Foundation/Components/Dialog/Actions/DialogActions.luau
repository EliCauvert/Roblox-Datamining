local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local buttonModule = require(foundation.Components.Button)
local buttonGroupModule = require(foundation.Components.ButtonGroup)
local _ = require(foundation.Enums.ButtonVariant)
local dialogSizeModule = require(foundation.Enums.DialogSize)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local flagsModule = require(foundation.Utility.Flags)
local orientationModule = require(foundation.Enums.Orientation)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local useDialogVariants = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local useDialogModule = require(script.Parent.Parent.useDialog)
local t = { orientation = orientationModule.Horizontal }

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useDialogVariants (ref), useDialogModule (ref), reactModule (ref), dashModule (ref), buttonModule (ref), fillBehaviorModule (ref), dialogSizeModule (ref), orientationModule (ref), viewModule (ref), flagsModule (ref), buttonGroupModule (ref), textModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useDialogVariants()
	local var3 = useDialogModule()
	local var4 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), reactModule (copy), dashModule (copy), buttonModule (copy), fillBehaviorModule (copy)
		return if var1.actions then reactModule.createElement(reactModule.Fragment, nil, dashModule.map(var1.actions, function(p2, p3)
			-- upvalues: reactModule (copy), buttonModule (copy), dashModule (copy), fillBehaviorModule (copy)
			return reactModule.createElement(buttonModule, dashModule.join(p2, {
				key = `{p3}-{p2.text}`,
				Name = p2.text,
				LayoutOrder = p3,
				fillBehavior = fillBehaviorModule.Fill
			}))
		end)) else nil
	end, { var1.actions })
	local var5 = var3.responsiveSize == dialogSizeModule.Small
	local var6 = var1.orientation == orientationModule.Vertical and var5
	
	return reactModule.createElement(viewModule, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = var1.LayoutOrder,
		testId = `{var3.testId}--actions`
	}, {
		ActionsContainer = if flagsModule.FoundationDialogBetaUpdate then reactModule.createElement(buttonGroupModule, {
			LayoutOrder = 1,
			buttons = var1.actions or {},
			orientation = if var6 then orientationModule.Vertical else orientationModule.Horizontal,
			fillBehavior = fillBehaviorModule.Fill,
			testId = `{var3.testId}--actions-container`
		}) else reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = {
				["gap-small size-full-0 auto-y"] = true,
				["row wrap"] = if var1.orientation ~= orientationModule.Horizontal then not var5 else true,
				["col flex-x-fill"] = var6
			},
			testId = `{var3.testId}--actions-container`
		}, { Actions = var4 }),
		ActionsLabel = if var1.label then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var1.label,
			tag = var2.actionsLabel.tag,
			testId = `{var3.testId}--actions-label`
		}) else nil
	})
end