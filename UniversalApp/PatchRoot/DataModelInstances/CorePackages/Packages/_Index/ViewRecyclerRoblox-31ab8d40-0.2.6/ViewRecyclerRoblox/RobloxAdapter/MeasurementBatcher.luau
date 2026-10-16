local _ = require(script:FindFirstAncestor("ViewRecyclerRoblox").Parent.ViewRecycler)

return {
	new = function(Callback1, p1) --[[ Line: 12 ]]
		local Callback = p1 or task.defer
		local List = {}
		local Flag = false
		local Count = 0
		local Flag1 = true
		
		return {
			add = function(p2) --[[ Line: 22 ]]
				-- upvalues: Flag1 (ref), List (ref), Flag (ref), Count (ref), Callback (copy), Callback1 (copy)
				if not Flag1 then return end
				table.insert(List, p2)
				
				if not Flag then
					Flag = true
					Count += 1
					local Count1: number = Count
					Callback(function() --[[ Line: 33 ]]
						-- upvalues: Count1 (copy), Count (upval), Flag (upval), Flag1 (upval), List (upval), Callback1 (upval)
						if Count1 ~= Count then return end
						Flag = false
						
						if Flag1 then
							local List1 = List
							List = {}
							Callback1(List1)
							
							return
						end
					end)
					
					return
				end
			end,
			cancelPending = function() --[[ Line: 47 ]]
				-- upvalues: Count (ref), Flag (ref), List (ref)
				Count += 1
				Flag = false
				List = {}
			end,
			destroy = function() --[[ Line: 56 ]]
				-- upvalues: Flag1 (ref), Count (ref), Flag (ref), List (ref)
				Flag1 = false
				Count += 1
				Flag = false
				List = {}
			end
		}
	end
}