local _ = require(script.Parent.Parent.Parent.LuauPolyfill)
local t = {}

local function _(p1)
	-- upvalues: t (ref)
	return if p1 == nil then t else p1
end

local _ = function()
	return setmetatable({}, { __mode = "kv" })
end

return {
	memoize3 = function(p1)
		-- upvalues: t (ref)
		local var1 = nil
		
		return function(p2, p3, p4)
			-- upvalues: t (copy), var1 (write), p1 (ref)
			local var2 = if p2 == nil then t else p2
			local var3 = if p3 == nil then t else p3
			local var4 = if p4 == nil then t else p4
			
			if not var1 then
				var1 = setmetatable({}, { __mode = "kv" })
			end
			local var5 = var1[var2]
			local tbl = nil
			
			if var5 then
				tbl = var5[var3]
				
				if tbl then
					local var6 = tbl[var4]
					
					if var6 == nil then
						if not tbl then
							tbl = setmetatable({}, { __mode = "kv" })
							var5[var3] = tbl
						end
						local var7 = p1(p2, p3, p4)
						tbl[var4] = if var7 == nil then t else var7
						
						return var7
					else
						return if var6 == t then nil else var6
					end
				end
			else
				var5 = setmetatable({}, { __mode = "kv" })
				var1[var2] = var5
			end
		end
	end
}