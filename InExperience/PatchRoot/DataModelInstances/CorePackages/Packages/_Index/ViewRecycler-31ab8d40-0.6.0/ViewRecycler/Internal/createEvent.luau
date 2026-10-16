return function() --[[ Line: 8 | Named "createEvent" ]]
	local Tbl = {}
	
	return {
		fire = function(...) --[[ Line: 14 ]]
			-- upvalues: Tbl (ref)
			for _, value in Tbl do
				value(...)
			end
		end,
		connect = function(Callback) --[[ Line: 20 ]]
			-- upvalues: Tbl (ref)
			local Flag = true
			
			local function Value(...) --[[ Line: 22 ]]
				-- upvalues: Flag (ref), Callback (copy)
				if Flag then
					Callback(...)
				end
			end
			
			local Copy = table.clone(Tbl)
			table.insert(Copy, Value)
			Tbl = Copy
			
			return function() --[[ Line: 30 ]]
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