local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Types)
local keyUtilsModule = require(script.Parent.KeyUtils)

local var1 = function() end

return function(p1, p2)
	-- upvalues: keyUtilsModule (ref), var1 (ref)
	local cloned = table.clone(p1)
	local var2 = keyUtilsModule.keysFor(cloned, p2)
	
	return {
		getItemCount = function()
			-- upvalues: cloned (ref)
			return #cloned
		end,
		getItem = function(p3)
			-- upvalues: cloned (ref)
			return cloned[p3]
		end,
		getItemKey = function(p3)
			-- upvalues: var2 (ref)
			return var2[p3]
		end,
		getItems = function(p3, p4)
			-- upvalues: cloned (ref)
			return table.move(cloned, p3, p4, 1, {})
		end,
		subscribe = function(_)
			-- upvalues: var1 (copy)
			return var1
		end
	}
end