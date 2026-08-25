local scrollAlignmentModule = require(script:FindFirstAncestor("ViewRecycler").Core.Enums.ScrollAlignment)

local function _(value, p0, p1)
	-- upvalues: scrollAlignmentModule (ref)
	return if p0 == nil or p0 == scrollAlignmentModule.Start or value == 0 then nil else p1(value, p0)
end

return function()
	-- upvalues: scrollAlignmentModule (ref)
	local var1 = false
	
	return {
		onDataSourceChange = function(p2, p3, p4)
			-- upvalues: var1 (write), scrollAlignmentModule (copy)
			if var1 then
				return nil
			end
			local var2 = if p3 == nil or p3 == scrollAlignmentModule.Start or p2 == 0 then nil else p4(p2, p3)
			
			if var2 ~= nil then
				var1 = true
			end
			return var2
		end,
		onDataSourceReplaced = function(p5, p6, p7)
			-- upvalues: var1 (write), scrollAlignmentModule (copy)
			var1 = true
			
			return (if p6 == nil or p6 == scrollAlignmentModule.Start or p5 == 0 then nil else p7(p5, p6)) or 0
		end,
		onViewportChanged = function(p8, p9, p10)
			-- upvalues: var1 (write), scrollAlignmentModule (copy)
			if var1 then
				return nil
			end
			local var3 = if p9 == nil or p9 == scrollAlignmentModule.Start or p8 == 0 then nil else p10(p8, p9)
			
			if var3 ~= nil or p9 == nil or p9 == scrollAlignmentModule.Start then
				var1 = true
			end
			return var3
		end
	}
end