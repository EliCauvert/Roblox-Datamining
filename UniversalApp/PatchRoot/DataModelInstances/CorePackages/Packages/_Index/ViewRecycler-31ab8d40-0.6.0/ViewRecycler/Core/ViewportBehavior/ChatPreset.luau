local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local autoScrollPolicyModule = require(viewRecycler.Core.Enums.AutoScrollPolicy)
local reachedThresholdModule = require(viewRecycler.Core.ViewportBehavior.ReachedThreshold)
local scrollAlignmentModule = require(viewRecycler.Core.Enums.ScrollAlignment)

return table.freeze({
	create = function(p1)
		-- upvalues: reachedThresholdModule (ref), scrollAlignmentModule (ref), autoScrollPolicyModule (ref)
		local var1 = p1 ~= nil and ((if p1 ~= nil then p1.startReachedThreshold else nil) or 0)
		local var2 = p1 ~= nil and ((if p1 ~= nil then p1.endReachedThreshold else nil) or 1)
		reachedThresholdModule.validate(var1, "ChatPreset: startReachedThreshold")
		local var3 = p1 ~= nil and ((if p1 ~= nil then p1.autoScrollThreshold else nil) or 1)
		reachedThresholdModule.validate(var2, "ChatPreset: endReachedThreshold")
		reachedThresholdModule.validate(var3, "ChatPreset: autoScrollThreshold")
		
		return table.freeze({
			preserveScrollPositionOnChange = true,
			initialScrollAlignment = scrollAlignmentModule.End,
			contentAlignment = scrollAlignmentModule.End,
			autoScrollOnChange = autoScrollPolicyModule.WhenAtEnd,
			autoScrollThreshold = var3,
			startReachedThreshold = var1,
			endReachedThreshold = var2
		})
	end
})