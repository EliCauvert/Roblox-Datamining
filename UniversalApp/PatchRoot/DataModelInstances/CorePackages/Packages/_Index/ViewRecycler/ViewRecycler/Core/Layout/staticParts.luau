local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local _ = require(viewRecycler.Core.Types)

return {
	expandItemRange = function(p1, p2, p3, p4)
		return {
			firstIndex = math.max(1, p1.firstIndex - p2),
			lastIndex = math.min(p4, p1.lastIndex + p3)
		}
	end,
	updateItemMeasurementNoop = function(_)
		return { accepted = false, geometryChanged = false }
	end,
	requiresItemMeasurementFalse = function()
		return false
	end,
	geometryUnchanged = function()
		return false
	end,
	noop = function() end
}