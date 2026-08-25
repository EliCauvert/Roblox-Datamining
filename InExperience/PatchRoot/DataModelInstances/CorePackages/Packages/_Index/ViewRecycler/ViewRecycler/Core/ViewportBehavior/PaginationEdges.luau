local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local _ = require(viewRecycler.Core.Types)

return {
	hasStructuralChange = function(p0)
		-- upvalues: dataSourceChangeTypeModule (ref)
		for i, v in p0.changes do
			if v.type ~= dataSourceChangeTypeModule.Update then
				return true
			end
		end
		return false
	end,
	create = function()
		local var2 = true
		local var3 = true
		
		return {
			check = function(p1)
				-- upvalues: var2 (write), var3 (write)
				if p1.rearmAfterStructureChange then
					var2 = true
					var3 = true
				end
				local var4 = p1.scrollOffset <= p1.startThreshold
				local atEnd = p1.atEnd
				local canReachStart = var4 and (var2 and p1.canReachStart)
				local canReachEnd = atEnd and (var3 and p1.canReachEnd)
				
				if canReachStart then
					var2 = false
				elseif not var4 then
					var2 = true
				end
				if canReachEnd then
					var3 = false
				elseif not atEnd then
					var3 = true
				end
				return { startReached = canReachStart, endReached = canReachEnd }
			end
		}
	end
}