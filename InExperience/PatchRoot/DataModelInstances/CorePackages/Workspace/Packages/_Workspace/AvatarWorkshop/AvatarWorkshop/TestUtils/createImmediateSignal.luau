return function()
	local Tbl = {}
	local List = {}
	
	return {
		Event = {
			Connect = function(_, p1)
				-- upvalues: Tbl (copy)
				local t = {}
				
				function t.Disconnect()
					-- upvalues: Tbl (upval), t (copy)
					Tbl[t] = nil
				end
				
				Tbl[t] = p1
				
				return t
			end,
			Wait = function()
				-- upvalues: List (ref)
				table.insert(List, coroutine.running())
				
				return coroutine.yield()
			end
		},
		Fire = function(_, ...)
			-- upvalues: Tbl (copy), List (ref)
			for _, value in table.clone(Tbl) do
				task.spawn(value, ...)
			end
			local Callbacks = List
			List = {}
			
			for _, callback in Callbacks do
				task.spawn(callback, ...)
			end
		end
	}
end