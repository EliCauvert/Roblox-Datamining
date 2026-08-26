return function(p1)
	local t = {}
	
	local function _(p2, p3)
		-- upvalues: t (ref), p1 (ref)
		local var1 = t[p2]
		local var2 = if var1 then var1[p1] else nil
		
		if var2 then
			table.remove(var2, table.find(var2, p3))
			
			return
		end
	end
	
	return {
		addListener = function(p2, p3)
			-- upvalues: t (ref), p1 (ref)
			t[p2] = t[p2] or {}
			t[p2][p1] = t[p2][p1] or {}
			table.insert(t[p2][p1], p3)
			
			return {
				remove = function()
					-- upvalues: p2 (ref), p3 (ref), t (copy), p1 (copy)
					local var1 = t[p2]
					local var2 = if var1 then var1[p1] else nil
					
					if var2 then
						table.remove(var2, table.find(var2, p3))
						
						return
					end
				end
			}
		end,
		emit = function(p2, p3)
			-- upvalues: t (ref), p1 (ref)
			local var1 = t[p2] or {}
			local var2 = if var1[p1] then table.clone(var1[p1]) else nil
			
			if var2 then
				for i, v in var2 do
					v(p3)
				end
			end
		end
	}
end