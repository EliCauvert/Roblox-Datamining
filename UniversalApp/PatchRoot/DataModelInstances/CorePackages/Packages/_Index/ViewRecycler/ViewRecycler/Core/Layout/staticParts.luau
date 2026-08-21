local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.Layout.LayoutRuntime)
local _ = require(viewRecycler.Core.Types)

return {
	expandItemRange = function(p0, p1, p2, p3) --[[ line: 9 ]]
		return {
			firstIndex = math.max(1, p0.firstIndex - p1),
			lastIndex = math.min(p3, p0.lastIndex + p2)
		}
	end,
	updateItemMeasurementNoop = function(_) --[[ line: 21 ]]
		return { accepted = false, geometryChanged = false }
	end,
	requiresItemMeasurementFalse = function() --[[ line: 30 ]]
		return false
	end,
	geometryUnchanged = function() --[[ line: 34 ]]
		return false
	end,
	noop = function() --[[ line: 38 ]] end
}