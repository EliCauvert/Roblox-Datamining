local function _(p0) --[[ line: 20 | named "resolveCapacity" ]]
	if p0 == nil then
		return 256
	elseif p0 == "unlimited" then
		return nil
	end
	assert(type(p0) == "number" and (p0 >= 0 and (p0 < 1e999 and p0 % 1 == 0)), "Layout.measured: detachedMeasurementCapacity must be zero, a positive integer, or \"unlimited\"")
	
	return p0
end

return {
	new = function(p1) --[[ line: 34 ]]
		local var0
		if p1 == nil then
			var0 = 256
		elseif p1 == "unlimited" then
			var0 = nil
		else
			assert(type(p1) == "number" and (p1 >= 0 and (p1 < 1e999 and p1 % 1 == 0)), "Layout.measured: detachedMeasurementCapacity must be zero, a positive integer, or \"unlimited\"")
			var0 = p1
		end
		local t = {}
		local var2 = nil
		local var3 = nil
		local var4 = 0
		
		local function _(p2) --[[ line: 41 | named "unlink" ]]
			-- upvalues: var2 (write), var3 (write)
			if p2.previous == nil then
				var2 = p2.next
			else
				p2.previous.next = p2.next
			end
			if p2.next == nil then
				var3 = p2.previous
			else
				p2.next.previous = p2.previous
			end
			p2.previous = nil
			p2.next = nil
		end
		
		local _ = function(p3) --[[ line: 56 | named "append" ]]
			-- upvalues: var3 (write), var2 (write)
			p3.previous = var3
			
			if var3 == nil then
				var2 = p3
			else
				var3.next = p3
			end
			var3 = p3
		end
		
		return {
			put = function(p4, p5) --[[ line: 77 ]]
				-- upvalues: var0 (ref), t (ref), var2 (write), var3 (write), var4 (write)
				if var0 == 0 then return end
				local var5 = t[p4]
				
				if var5 == nil then
					local t_1 = { previous = nil, next = nil, key = p4, value = p5 }
					t[p4] = t_1
					t_1.previous = var3
					
					if var3 == nil then
						var2 = t_1
					else
						var3.next = t_1
					end
					var3 = t_1
					var4 += 1
					
					if var0 ~= nil and var0 < var4 then
						local var8 = var2
						
						if var8.previous == nil then
							var2 = var8.next
						else
							var8.previous.next = var8.next
						end
						if var8.next == nil then
							var3 = var8.previous
						else
							var8.next.previous = var8.previous
						end
						var8.previous = nil
						var8.next = nil
						t[var8.key] = nil
						var4 -= 1
					end
					return
				else
					var5.value = p5
					
					if var5.previous == nil then
						var2 = var5.next
					else
						var5.previous.next = var5.next
					end
					if var5.next == nil then
						var3 = var5.previous
					else
						var5.next.previous = var5.previous
					end
					var5.previous = nil
					var5.next = nil
					local var6 = var5
					var6.previous = var3
					
					if var3 == nil then
						var2 = var6
					else
						var3.next = var6
					end
					var3 = var6
				end
			end,
			take = function(p6) --[[ line: 66 ]]
				-- upvalues: t (ref), var2 (write), var3 (write), var4 (write)
				local var9 = t[p6]
				
				if var9 == nil then
					return nil
				elseif var9.previous == nil then
					var2 = var9.next
				else
					var9.previous.next = var9.next
				end
				if var9.next == nil then
					var3 = var9.previous
				else
					var9.next.previous = var9.previous
				end
				var9.previous = nil
				var9.next = nil
				t[p6] = nil
				var4 -= 1
				
				return var9.value
			end
		}
	end
}