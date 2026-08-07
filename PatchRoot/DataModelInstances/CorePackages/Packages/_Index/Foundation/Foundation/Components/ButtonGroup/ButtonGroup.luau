-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:00 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local buttonModule = require(foundation.Components.Button)
local _ = require(foundation.Enums.ButtonVariant)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local inputSizeModule = require(foundation.Enums.InputSize)
local orientationModule = require(foundation.Enums.Orientation)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	testId = "--foundation-button-group",
	orientation = orientationModule.Horizontal,
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 52 | named "ButtonGroup" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), orientationModule (ref), fillBehaviorModule (ref), reactModule (ref), buttonModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var10 = withDefaultsModule(p0, t)
	assert(#var10.buttons <= 3, `ButtonGroup: a maximum of 3 buttons is supported, got {#var10.buttons}.`)
	local var11 = var10.orientation == orientationModule.Vertical
	local var11_1 = var11 or var10.fillBehavior == fillBehaviorModule.Fill
	local var13 = if var11 or not var11_1 then nil else fillBehaviorModule.Fill
	local t_1 = {}
	
	for i, v in var10.buttons do
		t_1["Button" .. i] = reactModule.createElement(buttonModule, {
			text = v.text,
			onActivated = v.onActivated,
			variant = v.variant,
			isDisabled = v.isDisabled,
			isLoading = v.isLoading,
			icon = v.icon,
			inputDelay = v.inputDelay,
			ref = v.ref,
			size = var10.size,
			fillBehavior = var13,
			LayoutOrder = i,
			testId = `{var10.testId}--button-{i}`
		})
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var10, {
		tag = {
			["gap-small"] = true,
			["col flex-x-fill"] = var11,
			row = not var11 and var11_1,
			["row wrap"] = not var11 and not var11_1,
			["size-full-0 auto-y"] = var11_1,
			["auto-xy"] = not var11_1
		},
		ref = p1
	}), t_1)
end))