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

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), tileContextModule (ref)
	local var9 = withDefaultsModule(p0, t)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var9, {
		tag = {
			["bg-shift-200"] = var9.isContained,
			["gap-small"] = not var9.isContained,
			["radius-medium"] = true
		},
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		onStateChanged = var9.onStateChanged,
		layout = {
			FillDirection = var9.FillDirection,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		Size = var9.Size,
		ref = p1
	}), {
		TileContext = if var9.children then reactModule.createElement(tileContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
				-- upvalues: var9 (ref)
				return {
					isContained = var9.isContained,
					fillDirection = var9.FillDirection,
					testId = var9.testId
				}
			end, { var9.isContained, var9.FillDirection, var9.testId }) else nil else {
				isContained = var9.isContained,
				fillDirection = var9.FillDirection,
				testId = var9.testId
			}
		}, var9.children) else nil
	})
end)