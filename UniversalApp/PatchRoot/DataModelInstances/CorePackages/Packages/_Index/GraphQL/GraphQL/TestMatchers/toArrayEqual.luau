local deepEqualModule = require(script.Parent.Parent.luaUtils.deepEqual)
local deepContainsModule = require(script.Parent.Parent.luaUtils.deepContains)

return function(p1, p2, p3)
	-- upvalues: deepContainsModule (ref), deepEqualModule (ref)
	if #p1 ~= #p2 then
		return {
			pass = false,
			message = ("Expected array length %s / got length %s"):format(tostring(#p1), tostring(#p2))
		}
	end
	for i = 1, #p1 do
		local var1, var2
		local _ = nil
		local _ = nil
		
		if p3 then
			var1, var3 = deepContainsModule(p1[i], p2[i])
			var2 = var3
			
			if var1 then
				continue
			end
			return {
				pass = false,
				message = var2:gsub("{1}", ("{1}[%s]"):format(tostring(i))):gsub("{2}", ("{2}[%s]"):format(tostring(i)))
			}
		else
			var1, var5 = deepEqualModule(p1[i], p2[i])
			var2 = var5
			
			if var1 then
				continue
			end
		end
	end
	return { pass = true, message = "" }
end