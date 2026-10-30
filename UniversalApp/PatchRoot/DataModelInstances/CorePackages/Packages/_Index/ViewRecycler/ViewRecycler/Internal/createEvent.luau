return function()
	local Tbl = {}
	
	return {
		fire = function(...)
			-- upvalues: Tbl (ref)
			for _, value in Tbl do
				value(...)
			end
		end,
		connect = function(Callback)
			-- upvalues: Tbl (ref)
			local Flag = true
			
			local function Value(...)
				-- upvalues: Flag (ref), Callback (copy)
				if Flag then
					Callback(...)
				end
			end
			
			local Copy = table.clone(Tbl)
			table.insert(Copy, Value)
			Tbl = Copy
			
			return function()
				-- upvalues: Flag (ref), Tbl (upval), Value (copy)
				Flag = false
				local FoundIndex: number? = table.find(Tbl, Value)
				
				if FoundIndex ~= nil then
					local Copy = table.clone(Tbl)
					table.remove(Copy, FoundIndex)
					Tbl = Copy
				end
			end
		end
	}
end