local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local autoScrollPolicyModule = require(viewRecycler.Core.Enums.AutoScrollPolicy)
local scrollAlignmentModule = require(viewRecycler.Core.Enums.ScrollAlignment)

return table.freeze({
	create = function(p0) --[[ line: 22 ]]
		-- upvalues: scrollAlignmentModule (ref), autoScrollPolicyModule (ref)
		local var3 = p0 ~= nil and ((if p0 ~= nil then p0.startReachedThreshold else nil) or 0)
		local var4 = p0 ~= nil and ((if p0 ~= nil then p0.endReachedThreshold else nil) or 1)
		assert(var3 >= 0 and var3 < 1e999, "ChatPreset: startReachedThreshold must be a finite non-negative number")
		assert(var4 >= 0 and var4 < 1e999, "ChatPreset: endReachedThreshold must be a finite non-negative number")
		
		return table.freeze({
			preserveScrollPositionOnChange = true,
			initialScrollAlignment = scrollAlignmentModule.End,
			contentAlignment = scrollAlignmentModule.End,
			autoScrollOnChange = autoScrollPolicyModule.WhenAtEnd,
			startReachedThreshold = var3,
			endReachedThreshold = var4
		})
	end
})