local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local AutoScrollPolicyModule = require(ViewRecycler.Core.Enums.AutoScrollPolicy)
local ReachedThresholdModule = require(ViewRecycler.Core.ViewportBehavior.ReachedThreshold)
local ScrollAlignmentModule = require(ViewRecycler.Core.Enums.ScrollAlignment)

return table.freeze({
	create = function(p1) --[[ Line: 25 ]]
		-- upvalues: ReachedThresholdModule (copy), ScrollAlignmentModule (copy), AutoScrollPolicyModule (copy)
		local StartReachedThreshold = if p1 == nil then 0 else p1.startReachedThreshold or 0
		local EndReachedThreshold = if p1 == nil then 1 else p1.endReachedThreshold or 1
		ReachedThresholdModule.validate(StartReachedThreshold, "ChatPreset: startReachedThreshold")
		local AutoScrollThreshold = if p1 == nil then 1 else p1.autoScrollThreshold or 1
		ReachedThresholdModule.validate(EndReachedThreshold, "ChatPreset: endReachedThreshold")
		ReachedThresholdModule.validate(AutoScrollThreshold, "ChatPreset: autoScrollThreshold")
		
		return table.freeze({
			preserveScrollPositionOnChange = true,
			initialScrollAlignment = ScrollAlignmentModule.End,
			contentAlignment = ScrollAlignmentModule.End,
			autoScrollOnChange = AutoScrollPolicyModule.WhenAtEnd,
			autoScrollThreshold = AutoScrollThreshold,
			startReachedThreshold = StartReachedThreshold,
			endReachedThreshold = EndReachedThreshold
		})
	end
})