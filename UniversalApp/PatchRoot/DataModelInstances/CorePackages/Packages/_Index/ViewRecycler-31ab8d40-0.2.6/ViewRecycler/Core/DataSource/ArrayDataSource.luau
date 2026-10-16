local _ = require(script:FindFirstAncestor("ViewRecycler").Core.Types)
local KeyUtilsModule = require(script.Parent.KeyUtils)

local function v2() --[[ Line: 18 ]] end

return function(Tbl, p1) --[[ Line: 20 | Named "createArrayDataSource" ]]
	-- upvalues: KeyUtilsModule (copy), v2 (copy)
	local Copy = table.clone(Tbl)
	local KeysForResult = KeyUtilsModule.keysFor(Copy, p1)
	
	return {
		getItemCount = function(): number --[[ Line: 24 ]]
			-- upvalues: Copy (copy)
			return #Copy
		end,
		getItem = function(p2) --[[ Line: 27 ]]
			-- upvalues: Copy (copy)
			return Copy[p2]
		end,
		getItemKey = function(p2) --[[ Line: 30 ]]
			-- upvalues: KeysForResult (copy)
			return KeysForResult[p2]
		end,
		getItems = function(p2, p3) --[[ Line: 33 ]]
			-- upvalues: Copy (copy)
			return table.move(Copy, p2, p3, 1, {})
		end,
		subscribe = function(_) --[[ Line: 36 ]]
			-- upvalues: v2 (upval)
			return v2
		end
	}
end