return function(p0) --[[ line: 3 | named "getEventManager" ]]
	local t = {}
	
	local function _(p1, p2) --[[ line: 6 | named "removeListener" ]]
		-- upvalues: t (ref), p0 (ref)
		local var1 = t[p1]
		local var2 = if var1 then var1[p0] else nil
		
		if var2 then
			table.remove(var2, table.find(var2, p2))
			
			return
		end
	end
	
	return {
		addListener = function(p3, p4) --[[ line: 18 ]]
			-- upvalues: t (ref), p0 (ref)
			t[p3] = t[p3] or {}
			t[p3][p0] = t[p3][p0] or {}
			table.insert(t[p3][p0], p4)
			
			return {
				remove = function() --[[ line: 25 ]]
					-- upvalues: p3 (ref), p4 (ref), t (copy), p0 (copy)
					local var3 = t[p3]
					local var4 = if var3 then var3[p0] else nil
					
					if var4 then
						table.remove(var4, table.find(var4, p4))
						
						return
					end
				end
			}
		end,
		emit = function(p5, p6) --[[ line: 33 ]]
			-- upvalues: t (ref), p0 (ref)
			local var5 = t[p5] or {}
			local var6 = if var5[p0] then table.clone(var5[p0]) else nil
			
			if var6 then
				for i, v in var6 do
					v(p6)
				end
			end
		end
	}
end