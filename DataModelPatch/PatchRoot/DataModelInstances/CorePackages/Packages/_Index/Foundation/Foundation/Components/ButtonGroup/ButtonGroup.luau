local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ButtonModule = require(Foundation.Components.Button)
local _ = require(Foundation.Enums.ButtonVariant)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local OrientationModule = require(Foundation.Enums.Orientation)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	testId = "--foundation-button-group",
	orientation = OrientationModule.Horizontal,
	size = require(Foundation.Enums.InputSize).Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), OrientationModule (copy), FillBehaviorModule (copy), ReactModule (copy), ButtonModule (copy), ViewModule (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	assert(#WithDefaultsModuleResult.buttons <= 3, `ButtonGroup: a maximum of 3 buttons is supported, got {#WithDefaultsModuleResult.buttons}.`)
	local IsOrientationMatch = WithDefaultsModuleResult.orientation == OrientationModule.Vertical
	local IsOrientationMatch1: boolean = IsOrientationMatch or WithDefaultsModuleResult.fillBehavior == FillBehaviorModule.Fill
	local Fill = if IsOrientationMatch or not IsOrientationMatch1 then nil else FillBehaviorModule.Fill
	local Elements = {}
	
	for LayoutOrder, button in WithDefaultsModuleResult.buttons do
		Elements["Button" .. LayoutOrder] = ReactModule.createElement(ButtonModule, {
			text = button.text,
			onActivated = button.onActivated,
			variant = button.variant,
			isDisabled = button.isDisabled,
			isLoading = button.isLoading,
			icon = button.icon,
			inputDelay = button.inputDelay,
			ref = button.ref,
			size = WithDefaultsModuleResult.size,
			fillBehavior = Fill,
			LayoutOrder = LayoutOrder,
			testId = `{WithDefaultsModuleResult.testId}--button-{LayoutOrder}`
		})
	end
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = {
			["gap-small"] = true,
			["col flex-x-fill"] = IsOrientationMatch,
			row = not IsOrientationMatch and IsOrientationMatch1,
			["row wrap"] = not IsOrientationMatch and not IsOrientationMatch1,
			["size-full-0 auto-y"] = IsOrientationMatch1,
			["auto-xy"] = not IsOrientationMatch1
		},
		ref = Ref
	}), Elements)
end))