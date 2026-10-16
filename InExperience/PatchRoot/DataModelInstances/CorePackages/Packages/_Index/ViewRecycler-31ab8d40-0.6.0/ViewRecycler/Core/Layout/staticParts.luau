local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.Layout.LayoutRuntime)
local _ = require(ViewRecycler.Core.Types)

return {
	expandItemRange = function(p1, p2, p3, p4: number) --[[ Line: 9 ]]
		return {
			firstIndex = math.max(1, p1.firstIndex - p2),
			lastIndex = math.min(p4, p1.lastIndex + p3)
		}
	end,
	updateItemMeasurementNoop = function(_) --[[ Line: 21 ]]
		return { accepted = false, geometryChanged = false }
	end,
	requiresItemMeasurementFalse = function(): boolean --[[ Line: 28 ]]
		return false
	end,
	geometryUnchanged = function(): boolean --[[ Line: 32 ]]
		return false
	end,
	noop = function() --[[ Line: 36 ]] end
}