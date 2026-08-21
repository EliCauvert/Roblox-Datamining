local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Types)
local keyUtilsModule = require(script.Parent.KeyUtils)

local var1 = function() --[[ line: 18 ]] end

return function(p0, p1) --[[ line: 20 | named "createArrayDataSource" ]]
	-- upvalues: keyUtilsModule (ref), var1 (ref)
	local cloned = table.clone(p0)
	local var3 = keyUtilsModule.keysFor(cloned, p1)
	
	return {
		getItemCount = function() --[[ line: 24 ]]
			-- upvalues: cloned (ref)
			return #cloned
		end,
		getItem = function(p2) --[[ line: 27 ]]
			-- upvalues: cloned (ref)
			return cloned[p2]
		end,
		getItemKey = function(p3) --[[ line: 30 ]]
			-- upvalues: var3 (ref)
			return var3[p3]
		end,
		getItems = function(p4, p5) --[[ line: 33 ]]
			-- upvalues: cloned (ref)
			return table.move(cloned, p4, p5, 1, {})
		end,
		subscribe = function(_) --[[ line: 36 ]]
			-- upvalues: var1 (copy)
			return var1
		end
	}
end