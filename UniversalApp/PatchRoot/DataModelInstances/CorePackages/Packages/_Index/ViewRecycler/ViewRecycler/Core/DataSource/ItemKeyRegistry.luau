local var0 = 0

return {
	create = function(p0, p1) --[[ line: 22 ]]
		-- upvalues: var0 (write)
		local t = {}
		local var2 = `{p1}: keys must be strings`
		local var3 = `{p1}: setItem must preserve the existing key`
		
		local function _(p2, p3) --[[ line: 27 | named "resolve" ]]
			-- upvalues: p0 (ref), var0 (copy), var2 (ref)
			local var4
			if p0 == nil then
				var0 += 1
				var4 = `view-recycler:{var0}`
			else
				var4 = p0(p2, p3)
			end
			assert(type(var4) == "string", var2)
			
			return var4
		end
		
		return {
			claim = function(p4, p5) --[[ line: 33 ]]
				-- upvalues: p0 (ref), var0 (copy), var2 (ref), t (write), p1 (ref)
				local var5
				if p0 == nil then
					var0 += 1
					var5 = `view-recycler:{var0}`
				else
					var5 = p0(p4, p5)
				end
				assert(type(var5) == "string", var2)
				
				if t[var5] ~= nil then
					assert(false, `{p1}: duplicate key "{var5}"`)
				end
				t[var5] = true
				
				return var5
			end,
			assertPreserved = function(p6, p7, p8) --[[ line: 74 ]]
				-- upvalues: p0 (ref), var0 (copy), var2 (ref), var3 (ref)
				if p0 ~= nil then
					local var6
					if p0 == nil then
						var0 += 1
						var6 = `view-recycler:{var0}`
					else
						var6 = p0(p7, p8)
					end
					assert(type(var6) == "string", var2)
					assert(var6 == p6, var3)
				end
			end,
			release = function(p9) --[[ line: 79 ]]
				-- upvalues: t (write), p1 (ref)
				if t[p9] == nil then
					assert(false, `{p1}: cannot release missing key "{p9}"`)
				end
				t[p9] = nil
			end,
			replace = function(p10, p11, p12) --[[ line: 42 ]]
				-- upvalues: p0 (ref), var0 (copy), var2 (ref), t (write), p1 (ref)
				local var7
				if p0 == nil then
					var0 += 1
					var7 = `view-recycler:{var0}`
				else
					var7 = p0(p11, p12)
				end
				assert(type(var7) == "string", var2)
				
				if t[p10] == nil then
					assert(false, `{p1}: cannot replace missing key "{p10}"`)
				end
				if var7 ~= p10 and t[var7] ~= nil then
					assert(false, `{p1}: duplicate key "{var7}"`)
				end
				if var7 ~= p10 then
					t[p10] = nil
					t[var7] = true
				end
				return var7
			end,
			rebuild = function(p13) --[[ line: 57 ]]
				-- upvalues: p0 (ref), var0 (copy), var2 (ref), p1 (ref), t (write)
				local list = table.create(#p13)
				local t_1 = {}
				
				for i, v in p13 do
					local var10
					if p0 == nil then
						var0 += 1
						var10 = `view-recycler:{var0}`
					else
						var10 = p0(v, i)
					end
					assert(type(var10) == "string", var2)
					local var11 = var10
					
					if t_1[var11] ~= nil then
						assert(false, `{p1}: duplicate key "{var11}"`)
					end
					list[i] = var11
					t_1[var11] = true
				end
				t = t_1
				
				return list
			end,
			clear = function() --[[ line: 87 ]]
				-- upvalues: t (write)
				t = {}
			end,
			snapshot = function() --[[ line: 90 ]]
				-- upvalues: t (write)
				return table.clone(t)
			end,
			restore = function(p14) --[[ line: 93 ]]
				-- upvalues: t (write)
				t = table.clone(p14)
			end
		}
	end,
	generatedKey = function() --[[ line: 17 ]]
		-- upvalues: var0 (write)
		var0 += 1
		
		return `view-recycler:{var0}`
	end
}