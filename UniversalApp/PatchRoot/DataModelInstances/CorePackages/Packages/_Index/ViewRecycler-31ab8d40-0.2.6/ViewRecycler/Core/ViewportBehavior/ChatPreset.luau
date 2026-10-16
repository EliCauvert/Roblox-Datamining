local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local AutoScrollPolicyModule = require(ViewRecycler.Core.Enums.AutoScrollPolicy)
local ScrollAlignmentModule = require(ViewRecycler.Core.Enums.ScrollAlignment)

return table.freeze({
	create = function(p1) --[[ Line: 22 ]]
		-- upvalues: ScrollAlignmentModule (copy), AutoScrollPolicyModule (copy)
		local StartReachedThreshold = if p1 == nil then 0 else p1.startReachedThreshold or 0
		local EndReachedThreshold = if p1 == nil then 1 else p1.endReachedThreshold or 1
		assert(StartReachedThreshold >= 0 and StartReachedThreshold < 1e999, "ChatPreset: startReachedThreshold must be a finite non-negative number")
		assert(EndReachedThreshold >= 0 and EndReachedThreshold < 1e999, "ChatPreset: endReachedThreshold must be a finite non-negative number")
		
		return table.freeze({
			preserveScrollPositionOnChange = true,
			initialScrollAlignment = ScrollAlignmentModule.End,
			contentAlignment = ScrollAlignmentModule.End,
			autoScrollOnChange = AutoScrollPolicyModule.WhenAtEnd,
			startReachedThreshold = StartReachedThreshold,
			endReachedThreshold = EndReachedThreshold
		})
	end
})