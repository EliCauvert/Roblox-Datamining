local scrollAlignmentModule = require(script:FindFirstAncestor("ViewRecycler").Core.Enums.ScrollAlignment)

local function _(value, p1, p2)
	-- upvalues: scrollAlignmentModule (ref)
	return if p1 == nil or p1 == scrollAlignmentModule.Start or value == 0 then nil else p2(value, p1)
end

return function()
	-- upvalues: scrollAlignmentModule (ref)
	local var1 = false
	
	return {
		onDataSourceChange = function(p1, p2, p3)
			-- upvalues: var1 (write), scrollAlignmentModule (copy)
			if var1 then
				return nil
			end
			local var2 = if p2 == nil or p2 == scrollAlignmentModule.Start or p1 == 0 then nil else p3(p1, p2)
			
			if var2 ~= nil then
				var1 = true
			end
			return var2
		end,
		onDataSourceReplaced = function(p1, p2, p3)
			-- upvalues: var1 (write), scrollAlignmentModule (copy)
			var1 = true
			
			return (if p2 == nil or p2 == scrollAlignmentModule.Start or p1 == 0 then nil else p3(p1, p2)) or 0
		end,
		onViewportChanged = function(p1, p2, p3)
			-- upvalues: var1 (write), scrollAlignmentModule (copy)
			if var1 then
				return nil
			end
			local var2 = if p2 == nil or p2 == scrollAlignmentModule.Start or p1 == 0 then nil else p3(p1, p2)
			
			if var2 ~= nil or p2 == nil or p2 == scrollAlignmentModule.Start then
				var1 = true
			end
			return var2
		end
	}
end