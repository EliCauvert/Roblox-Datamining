local var1 = 0

return {
	create = function(p1, p2)
		-- upvalues: var1 (write)
		local t = {}
		local var2 = `{p2}: keys must be strings`
		local var3 = `{p2}: setItem must preserve the existing key`
		
		local function _(p3, p4)
			-- upvalues: p1 (ref), var1 (copy), var2 (ref)
			local var4
			if p1 == nil then
				var1 += 1
				var4 = `view-recycler:{var1}`
			else
				var4 = p1(p3, p4)
			end
			assert(type(var4) == "string", var2)
			
			return var4
		end
		
		return {
			claim = function(p3, p4)
				-- upvalues: p1 (ref), var1 (copy), var2 (ref), t (write), p2 (ref)
				local var4
				if p1 == nil then
					var1 += 1
					var4 = `view-recycler:{var1}`
				else
					var4 = p1(p3, p4)
				end
				assert(type(var4) == "string", var2)
				
				if t[var4] ~= nil then
					assert(false, `{p2}: duplicate key "{var5}"`)
				end
				t[var4] = true
				
				return var4
			end,
			assertPreserved = function(p3, p4, p5)
				-- upvalues: p1 (ref), var1 (copy), var2 (ref), var3 (ref)
				if p1 ~= nil then
					local var4
					if p1 == nil then
						var1 += 1
						var4 = `view-recycler:{var1}`
					else
						var4 = p1(p4, p5)
					end
					assert(type(var4) == "string", var2)
					assert(var4 == p3, var3)
				end
			end,
			release = function(p3)
				-- upvalues: t (write), p2 (ref)
				if t[p3] == nil then
					assert(false, `{p2}: cannot release missing key "{p9}"`)
				end
				t[p3] = nil
			end,
			replace = function(p3, p4, p5)
				-- upvalues: p1 (ref), var1 (copy), var2 (ref), t (write), p2 (ref)
				local var4
				if p1 == nil then
					var1 += 1
					var4 = `view-recycler:{var1}`
				else
					var4 = p1(p4, p5)
				end
				assert(type(var4) == "string", var2)
				
				if t[p3] == nil then
					assert(false, `{p2}: cannot replace missing key "{p10}"`)
				end
				if var4 ~= p3 and t[var4] ~= nil then
					assert(false, `{p2}: duplicate key "{var7}"`)
				end
				if var4 ~= p3 then
					t[p3] = nil
					t[var4] = true
				end
				return var4
			end,
			rebuild = function(p3)
				-- upvalues: p1 (ref), var1 (copy), var2 (ref), p2 (ref), t (write)
				local list = table.create(#p3)
				local t_1 = {}
				
				for i, v in p3 do
					local var4
					if p1 == nil then
						var1 += 1
						var4 = `view-recycler:{var1}`
					else
						var4 = p1(v, i)
					end
					assert(type(var4) == "string", var2)
					local var5 = var4
					
					if t_1[var5] ~= nil then
						assert(false, `{p2}: duplicate key "{var11}"`)
					end
					list[i] = var5
					t_1[var5] = true
				end
				t = t_1
				
				return list
			end,
			clear = function()
				-- upvalues: t (write)
				t = {}
			end,
			snapshot = function()
				-- upvalues: t (write)
				return table.clone(t)
			end,
			restore = function(p4)
				-- upvalues: t (write)
				t = table.clone(p4)
			end
		}
	end,
	generatedKey = function()
		-- upvalues: var1 (write)
		var1 += 1
		
		return `view-recycler:{var1}`
	end
}