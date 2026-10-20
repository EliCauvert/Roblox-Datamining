local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.Layout.LayoutRuntime)
local _ = require(ViewRecycler.Core.Types)

return {
	expandItemRange = function(p1, p2, p3, p4: number)
		return {
			firstIndex = math.max(1, p1.firstIndex - p2),
			lastIndex = math.min(p4, p1.lastIndex + p3)
		}
	end,
	updateItemMeasurementNoop = function(_)
		return { accepted = false, geometryChanged = false }
	end,
	requiresItemMeasurementFalse = function(): boolean
		return false
	end,
	geometryUnchanged = function(): boolean
		return false
	end,
	noop = function() end
}