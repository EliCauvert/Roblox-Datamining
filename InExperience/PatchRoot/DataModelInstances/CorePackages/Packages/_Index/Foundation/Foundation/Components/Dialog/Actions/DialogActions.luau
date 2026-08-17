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

return function(p0) --[[ line: 48 | named "DialogActions" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useDialogVariants (ref), useDialogModule (ref), reactModule (ref), dashModule (ref), buttonModule (ref), fillBehaviorModule (ref), dialogSizeModule (ref), orientationModule (ref), viewModule (ref), flagsModule (ref), buttonGroupModule (ref), textModule (ref)
	local var14 = withDefaultsModule(p0, t)
	local var15 = useDialogVariants()
	local var16 = useDialogModule()
	local var17 = reactModule.useMemo(function() --[[ line: 53 ]]
		-- upvalues: var14 (ref), reactModule (copy), dashModule (copy), buttonModule (copy), fillBehaviorModule (copy)
		return if var14.actions then reactModule.createElement(reactModule.Fragment, nil, dashModule.map(var14.actions, function(p1, p2) --[[ line: 60 ]]
			-- upvalues: reactModule (copy), buttonModule (copy), dashModule (copy), fillBehaviorModule (copy)
			return reactModule.createElement(buttonModule, dashModule.join(p1, {
				key = `{p2}-{p1.text}`,
				Name = p1.text,
				LayoutOrder = p2,
				fillBehavior = fillBehaviorModule.Fill
			}))
		end)) else nil
	end, { var14.actions })
	local var18 = var16.responsiveSize == dialogSizeModule.Small
	local var19 = var14.orientation == orientationModule.Vertical and var18
	
	return reactModule.createElement(viewModule, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = var14.LayoutOrder,
		testId = `{var16.testId}--actions`
	}, {
		ActionsContainer = if flagsModule.FoundationDialogBetaUpdate then reactModule.createElement(buttonGroupModule, {
			LayoutOrder = 1,
			buttons = var14.actions or {},
			orientation = if var19 then orientationModule.Vertical else orientationModule.Horizontal,
			fillBehavior = fillBehaviorModule.Fill,
			testId = `{var16.testId}--actions-container`
		}) else reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = {
				["gap-small size-full-0 auto-y"] = true,
				["row wrap"] = if var14.orientation ~= orientationModule.Horizontal then not var18 else true,
				["col flex-x-fill"] = var19
			},
			testId = `{var16.testId}--actions-container`
		}, { Actions = var17 }),
		ActionsLabel = if var14.label then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var14.label,
			tag = var15.actionsLabel.tag,
			testId = `{var16.testId}--actions-label`
		}) else nil
	})
end