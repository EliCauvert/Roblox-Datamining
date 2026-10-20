return function(p1)
	local t = {}
	
	local function _(p2, Value)
		-- upvalues: t (copy), p1 (copy)
		local Entry = t[p2]
		local List = if Entry then Entry[p1] else nil
		
		if List then
			table.remove(List, (table.find(List, Value)))
			
			return
		end
	end
	
	return {
		addListener = function(Key, Value)
			-- upvalues: t (copy), p1 (copy)
			t[Key] = t[Key] or {}
			t[Key][p1] = t[Key][p1] or {}
			table.insert(t[Key][p1], Value)
			
			return {
				remove = function()
					-- upvalues: Key (copy), Value (copy), t (upval), p1 (upval)
					local Entry = t[Key]
					local List = if Entry then Entry[p1] else nil
					
					if List then
						table.remove(List, (table.find(List, Value)))
						
						return
					end
				end
			}
		end,
		emit = function(p2, p3)
			-- upvalues: t (copy), p1 (copy)
			local Entry = t[p2] or {}
			local Copy = if Entry[p1] then table.clone(Entry[p1]) else nil
			
			if Copy then
				for _, value in Copy do
					value(p3)
				end
			end
		end
	}
end