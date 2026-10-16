local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(ViewRecycler.Core.Types)

return {
	hasStructuralChange = function(p1): boolean --[[ Line: 28 ]]
		-- upvalues: DataSourceChangeTypeModule (copy)
		for _, change in p1.changes do
			if change.type ~= DataSourceChangeTypeModule.Update then
				return true
			end
		end
		return false
	end,
	create = function() --[[ Line: 37 ]]
		local Flag = true
		local Flag1 = true
		
		return {
			check = function(p2) --[[ Line: 42 ]]
				-- upvalues: Flag (ref), Flag1 (ref)
				if p2.rearmAfterStructureChange then
					Flag = true
					Flag1 = true
				end
				local IsScrollOffsetBelow = p2.scrollOffset <= p2.startThreshold
				local AtEnd = p2.atEnd
				local CanReachStart = IsScrollOffsetBelow and (Flag and p2.canReachStart)
				local CanReachEnd = AtEnd and (Flag1 and p2.canReachEnd)
				
				if CanReachStart then
					Flag = false
				elseif not IsScrollOffsetBelow then
					Flag = true
				end
				if CanReachEnd then
					Flag1 = false
				elseif not AtEnd then
					Flag1 = true
				end
				return { startReached = CanReachStart, endReached = CanReachEnd }
			end
		}
	end
}