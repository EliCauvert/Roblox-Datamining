local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Types)
local keyUtilsModule = require(script.Parent.KeyUtils)

local var1 = function() end

return function(p0, p1)
	-- upvalues: keyUtilsModule (ref), var1 (ref)
	local cloned = table.clone(p0)
	local var3 = keyUtilsModule.keysFor(cloned, p1)
	
	return {
		getItemCount = function()
			-- upvalues: cloned (ref)
			return #cloned
		end,
		getItem = function(p2)
			-- upvalues: cloned (ref)
			return cloned[p2]
		end,
		getItemKey = function(p3)
			-- upvalues: var3 (ref)
			return var3[p3]
		end,
		getItems = function(p4, p5)
			-- upvalues: cloned (ref)
			return table.move(cloned, p4, p5, 1, {})
		end,
		subscribe = function(_)
			-- upvalues: var1 (copy)
			return var1
		end
	}
end