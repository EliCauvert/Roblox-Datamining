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
	maxButtonCount = 3,
	testId = "--foundation-button-group",
	orientation = orientationModule.Horizontal,
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 57 | named "ButtonGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), devAssertModule (ref), orientationModule (ref), fillBehaviorModule (ref), reactModule (ref), buttonModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var11 = withDefaultsModule(p0, t)
	devAssertModule(#var11.buttons <= var11.maxButtonCount, `ButtonGroup: a maximum of {var11.maxButtonCount} buttons is supported, got {#var11.buttons}.`)
	local var12 = var11.orientation == orientationModule.Vertical
	local var12_1 = var12 or var11.fillBehavior == fillBehaviorModule.Fill
	local var14 = if var12 or not var12_1 then nil else fillBehaviorModule.Fill
	local t_1 = {}
	
	for i, v in var11.buttons do
		t_1[`{i}-{v.text}`] = reactModule.createElement(buttonModule, {
			text = v.text,
			onActivated = v.onActivated,
			variant = v.variant,
			isDisabled = v.isDisabled,
			isLoading = v.isLoading,
			icon = v.icon,
			inputDelay = v.inputDelay,
			ref = v.ref,
			size = var11.size,
			fillBehavior = var14,
			LayoutOrder = i,
			testId = v.testId or `{var11.testId}--button-{i}`
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var11, {
		tag = {
			["gap-small"] = true,
			["col flex-x-fill"] = var12,
			row = not var12 and var12_1,
			["row wrap"] = not var12 and not var12_1,
			["size-full-0 auto-y"] = var12_1,
			["auto-xy"] = not var12_1
		},
		ref = p1
	}), t_1)
end))