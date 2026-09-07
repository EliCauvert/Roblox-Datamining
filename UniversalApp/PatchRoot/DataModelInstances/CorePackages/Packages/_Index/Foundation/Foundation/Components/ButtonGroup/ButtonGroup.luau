local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local buttonModule = require(foundation.Components.Button)
local _ = require(foundation.Enums.ButtonVariant)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local inputSizeModule = require(foundation.Enums.InputSize)
local orientationModule = require(foundation.Enums.Orientation)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local devAssertModule = require(foundation.Utility.devAssert)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	testId = "--foundation-button-group",
	orientation = orientationModule.Horizontal,
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), devAssertModule (ref), orientationModule (ref), fillBehaviorModule (ref), reactModule (ref), buttonModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	devAssertModule(#var1.buttons <= 3, `ButtonGroup: a maximum of 3 buttons is supported, got {#var1.buttons}.`)
	local var2 = var1.orientation == orientationModule.Vertical
	local var3 = var2 or var1.fillBehavior == fillBehaviorModule.Fill
	local var4 = if var2 or not var3 then nil else fillBehaviorModule.Fill
	local t_1 = {}
	
	for i, v in var1.buttons do
		t_1[`{i}-{v.text}`] = reactModule.createElement(buttonModule, {
			text = v.text,
			onActivated = v.onActivated,
			variant = v.variant,
			isDisabled = v.isDisabled,
			isLoading = v.isLoading,
			icon = v.icon,
			inputDelay = v.inputDelay,
			ref = v.ref,
			size = var1.size,
			fillBehavior = var4,
			LayoutOrder = i,
			testId = v.testId or `{var1.testId}--button-{i}`
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = {
			["gap-small"] = true,
			["col flex-x-fill"] = var2,
			row = not var2 and var3,
			["row wrap"] = not var2 and not var3,
			["size-full-0 auto-y"] = var3,
			["auto-xy"] = not var3
		},
		ref = p2
	}), t_1)
end))