return function()
	local t = {}
	
	return {
		fire = function(...)
			-- upvalues: t (write)
			for i, v in t do
				v(...)
			end
		end,
		connect = function(p1)
			-- upvalues: t (write)
			local var1 = true
			
			local var2 = function(...)
				-- upvalues: var1 (write), p1 (ref)
				if var1 then
					p1(...)
				end
			end
			
			local cloned = table.clone(t)
			table.insert(cloned, var2)
			t = cloned
			
			return function()
				-- upvalues: var1 (write), t (copy), var2 (ref)
				var1 = false
				local index = table.find(t, var2)
				
				if index ~= nil then
					local cloned = table.clone(t)
					table.remove(cloned, index)
					t = cloned
				end
			end
		end
	}
end