local _ = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	new = function(Callback1, p1)
		local Callback = p1 or task.defer
		local v1 = nil
		local Flag = true
		
		return {
			add = function(p2)
				-- upvalues: Flag (ref), v1 (ref), Callback (copy), Callback1 (copy)
				if not Flag then return end
				local List = v1
				
				if List == nil then
					List = {}
					v1 = List
					Callback(function()
						-- upvalues: Flag (upval), v1 (upval), List (ref), Callback1 (upval)
						if Flag and v1 == List then
							v1 = nil
							Callback1(List)
						end
					end)
				end
				table.insert(List, p2)
			end,
			flush = function()
				-- upvalues: v1 (ref), Flag (ref), Callback1 (copy)
				local v2 = v1
				
				if Flag and v2 ~= nil then
					v1 = nil
					Callback1(v2)
					
					return v2
				else
					return nil
				end
			end,
			cancelPending = function()
				-- upvalues: v1 (ref)
				v1 = nil
			end,
			destroy = function()
				-- upvalues: Flag (ref), v1 (ref)
				Flag = false
				v1 = nil
			end
		}
	end
}