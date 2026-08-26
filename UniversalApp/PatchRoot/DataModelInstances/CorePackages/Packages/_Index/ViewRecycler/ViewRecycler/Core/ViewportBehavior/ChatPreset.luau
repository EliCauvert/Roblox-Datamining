local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local autoScrollPolicyModule = require(viewRecycler.Core.Enums.AutoScrollPolicy)
local scrollAlignmentModule = require(viewRecycler.Core.Enums.ScrollAlignment)

return table.freeze({
	create = function(p1)
		-- upvalues: scrollAlignmentModule (ref), autoScrollPolicyModule (ref)
		local var1 = p1 ~= nil and ((if p1 ~= nil then p1.startReachedThreshold else nil) or 0)
		local var2 = p1 ~= nil and ((if p1 ~= nil then p1.endReachedThreshold else nil) or 1)
		assert(var1 >= 0 and var1 < 1e999, "ChatPreset: startReachedThreshold must be a finite non-negative number")
		assert(var2 >= 0 and var2 < 1e999, "ChatPreset: endReachedThreshold must be a finite non-negative number")
		
		return table.freeze({
			preserveScrollPositionOnChange = true,
			initialScrollAlignment = scrollAlignmentModule.End,
			contentAlignment = scrollAlignmentModule.End,
			autoScrollOnChange = autoScrollPolicyModule.WhenAtEnd,
			startReachedThreshold = var1,
			endReachedThreshold = var2
		})
	end
})