local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local TileContextModule = require(script.Parent.TileContext)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(Foundation.Enums.FillBehavior)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local config = {
	isContained = false,
	testId = "--foundation-tile",
	FillDirection = Enum.FillDirection.Vertical
}

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), StateLayerAffordanceModule (copy), TileContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = {
			["bg-shift-200"] = WithDefaultsModuleResult.isContained,
			["gap-small"] = not WithDefaultsModuleResult.isContained,
			["radius-medium"] = true
		},
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		onStateChanged = WithDefaultsModuleResult.onStateChanged,
		layout = {
			FillDirection = WithDefaultsModuleResult.FillDirection,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		Size = WithDefaultsModuleResult.Size,
		ref = Ref
	}), {
		TileContext = if WithDefaultsModuleResult.children then ReactModule.createElement(TileContextModule.Provider, {
			value = {
				isContained = WithDefaultsModuleResult.isContained,
				fillDirection = WithDefaultsModuleResult.FillDirection,
				testId = WithDefaultsModuleResult.testId
			}
		}, WithDefaultsModuleResult.children) else nil
	})
end)