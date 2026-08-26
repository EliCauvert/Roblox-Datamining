local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local tileContextModule = require(script.Parent.TileContext)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Enums.FillBehavior)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local t = {
	isContained = false,
	testId = "--foundation-tile",
	FillDirection = Enum.FillDirection.Vertical
}

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), tileContextModule (ref)
	local var1 = withDefaultsModule(p1, t)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = {
			["bg-shift-200"] = var1.isContained,
			["gap-small"] = not var1.isContained,
			["radius-medium"] = true
		},
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		onStateChanged = var1.onStateChanged,
		layout = {
			FillDirection = var1.FillDirection,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		Size = var1.Size,
		ref = p2
	}), {
		TileContext = if var1.children then reactModule.createElement(tileContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
				-- upvalues: var1 (ref)
				return {
					isContained = var1.isContained,
					fillDirection = var1.FillDirection,
					testId = var1.testId
				}
			end, { var1.isContained, var1.FillDirection, var1.testId }) else nil else {
				isContained = var1.isContained,
				fillDirection = var1.FillDirection,
				testId = var1.testId
			}
		}, var1.children) else nil
	})
end)