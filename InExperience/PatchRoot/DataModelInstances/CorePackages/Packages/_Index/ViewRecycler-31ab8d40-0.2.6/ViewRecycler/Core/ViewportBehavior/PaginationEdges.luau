local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)

return {
	hasStructuralChange = function(p1)
		-- upvalues: dataSourceChangeTypeModule (ref)
		for i, v in p1.changes do
			if v.type ~= dataSourceChangeTypeModule.Update then
				return true
			end
		end
		return false
	end,
	create = function()
		local var1 = true
		local var2 = true
		
		return {
			check = function(p2)
				-- upvalues: var1 (write), var2 (write)
				if p2.rearmAfterStructureChange then
					var1 = true
					var2 = true
				end
				local var3 = p2.scrollOffset <= p2.startThreshold
				local atEnd = p2.atEnd
				local canReachStart = var3 and (var1 and p2.canReachStart)
				local canReachEnd = atEnd and (var2 and p2.canReachEnd)
				
				if canReachStart then
					var1 = false
				elseif not var3 then
					var1 = true
				end
				if canReachEnd then
					var2 = false
				elseif not atEnd then
					var2 = true
				end
				return { startReached = canReachStart, endReached = canReachEnd }
			end
		}
	end
}