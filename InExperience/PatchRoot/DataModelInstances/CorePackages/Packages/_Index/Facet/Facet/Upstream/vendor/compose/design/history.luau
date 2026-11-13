local _ = require("./types")

return function(p1)
	local List = {}
	local List1 = {}
	local v1 = p1
	
	return {
		current = function()
			-- upvalues: v1 (ref)
			return v1
		end,
		commit = function(p2)
			-- upvalues: List (copy), v1 (ref), List1 (copy)
			table.insert(List, v1)
			
			if #List > 100 then
				table.remove(List, 1)
			end
			table.clear(List1)
			v1 = p2
		end,
		undo = function(): boolean
			-- upvalues: List (copy), List1 (copy), v1 (ref)
			local Removed = table.remove(List)
			
			if Removed == nil then
				return false
			else
				table.insert(List1, v1)
				v1 = Removed
				
				return true
			end
		end,
		redo = function(): boolean
			-- upvalues: List1 (copy), List (copy), v1 (ref)
			local Removed = table.remove(List1)
			
			if Removed == nil then
				return false
			else
				table.insert(List, v1)
				v1 = Removed
				
				return true
			end
		end,
		canUndo = function(): boolean
			-- upvalues: List (copy)
			return #List > 0
		end,
		canRedo = function(): boolean
			-- upvalues: List1 (copy)
			return #List1 > 0
		end
	}
end