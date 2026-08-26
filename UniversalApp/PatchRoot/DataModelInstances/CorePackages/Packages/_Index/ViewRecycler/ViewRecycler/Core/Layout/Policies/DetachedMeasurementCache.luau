local function _(p1)
	if p1 == nil then
		return 256
	elseif p1 == "unlimited" then
		return nil
	end
	assert(type(p1) == "number" and (p1 >= 0 and (p1 < 1e999 and p1 % 1 == 0)), "Layout.measured: detachedMeasurementCapacity must be zero, a positive integer, or \"unlimited\"")
	
	return p1
end

return {
	new = function(p1)
		local var1
		if p1 == nil then
			var1 = 256
		elseif p1 == "unlimited" then
			var1 = nil
		else
			assert(type(p1) == "number" and (p1 >= 0 and (p1 < 1e999 and p1 % 1 == 0)), "Layout.measured: detachedMeasurementCapacity must be zero, a positive integer, or \"unlimited\"")
			var1 = p1
		end
		local t = {}
		local var2 = nil
		local var3 = nil
		local var4 = 0
		
		local function _(p2)
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
		
		local _ = function(p2)
			-- upvalues: var3 (write), var2 (write)
			p2.previous = var3
			
			if var3 == nil then
				var2 = p2
			else
				var3.next = p2
			end
			var3 = p2
		end
		
		return {
			put = function(p2, p3)
				-- upvalues: var1 (ref), t (ref), var2 (write), var3 (write), var4 (write)
				if var1 == 0 then return end
				local var5 = t[p2]
				
				if var5 == nil then
					local t_1 = { previous = nil, next = nil, key = p2, value = p3 }
					t[p2] = t_1
					t_1.previous = var3
					
					if var3 == nil then
						var2 = t_1
					else
						var3.next = t_1
					end
					var3 = t_1
					var4 += 1
					
					if var1 ~= nil and var1 < var4 then
						local var6 = var2
						
						if var6.previous == nil then
							var2 = var6.next
						else
							var6.previous.next = var6.next
						end
						if var6.next == nil then
							var3 = var6.previous
						else
							var6.next.previous = var6.previous
						end
						var6.previous = nil
						var6.next = nil
						t[var6.key] = nil
						var4 -= 1
					end
					return
				else
					var5.value = p3
					
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
					local var7 = var5
					var7.previous = var3
					
					if var3 == nil then
						var2 = var7
					else
						var3.next = var7
					end
					var3 = var7
				end
			end,
			take = function(p2)
				-- upvalues: t (ref), var2 (write), var3 (write), var4 (write)
				local var5 = t[p2]
				
				if var5 == nil then
					return nil
				elseif var5.previous == nil then
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
				t[p2] = nil
				var4 -= 1
				
				return var5.value
			end
		}
	end
}