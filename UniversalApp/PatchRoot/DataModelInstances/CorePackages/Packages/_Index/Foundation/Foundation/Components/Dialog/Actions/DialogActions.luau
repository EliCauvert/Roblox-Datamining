local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local buttonModule = require(foundation.Components.Button)
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

return function(p0) --[[ line: 44 | named "DialogActions" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useDialogVariants (ref), useDialogModule (ref), reactModule (ref), dashModule (ref), buttonModule (ref), fillBehaviorModule (ref), dialogSizeModule (ref), orientationModule (ref), viewModule (ref), textModule (ref)
	local var12 = withDefaultsModule(p0, t)
	local var13 = useDialogVariants()
	local var14 = useDialogModule()
	local var15 = var14.responsiveSize == dialogSizeModule.Small
	
	return reactModule.createElement(viewModule, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = var12.LayoutOrder,
		testId = `{var14.testId}--actions`
	}, {
		ActionsContainer = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = {
				["gap-small size-full-0 auto-y"] = true,
				["row wrap"] = if var12.orientation ~= orientationModule.Horizontal then not var15 else true,
				["col flex-x-fill"] = var12.orientation == orientationModule.Vertical and var15
			},
			testId = `{var14.testId}--actions-container`
		}, {
			Actions = reactModule.useMemo(function() --[[ line: 49 ]]
				-- upvalues: var12 (ref), reactModule (copy), dashModule (copy), buttonModule (copy), fillBehaviorModule (copy)
				return if var12.actions then reactModule.createElement(reactModule.Fragment, nil, dashModule.map(var12.actions, function(p1, p2) --[[ line: 56 ]]
					-- upvalues: reactModule (copy), buttonModule (copy), dashModule (copy), fillBehaviorModule (copy)
					return reactModule.createElement(buttonModule, dashModule.join(p1, {
						key = `{p2}-{p1.text}`,
						Name = p1.text,
						LayoutOrder = p2,
						fillBehavior = fillBehaviorModule.Fill
					}))
				end)) else nil
			end, { var12.actions })
		}),
		ActionsLabel = if var12.label then reactModule.createElement(textModule, {
			LayoutOrder = 2,
			Text = var12.label,
			tag = var13.actionsLabel.tag,
			testId = `{var14.testId}--actions-label`
		}) else nil
	})
end