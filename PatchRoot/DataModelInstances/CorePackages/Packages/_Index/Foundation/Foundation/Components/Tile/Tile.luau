-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:10 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
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

return reactModule.forwardRef(function(p0, p1) --[[ line: 36 | named "Tile" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), stateLayerAffordanceModule (ref), tileContextModule (ref)
	local var8 = withDefaultsModule(p0, t)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var8, {
		tag = {
			["bg-shift-200"] = var8.isContained,
			["gap-small"] = not var8.isContained,
			["radius-medium"] = true
		},
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		onStateChanged = var8.onStateChanged,
		layout = {
			FillDirection = var8.FillDirection,
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		Size = var8.Size,
		ref = p1
	}), {
		TileContext = if var8.children then reactModule.createElement(tileContextModule.Provider, {
			value = {
				isContained = var8.isContained,
				fillDirection = var8.FillDirection,
				testId = var8.testId
			}
		}, var8.children) else nil
	})
end)