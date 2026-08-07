local deepEqualModule = require(script.Parent.Parent.luaUtils.deepEqual)
local deepContainsModule = require(script.Parent.Parent.luaUtils.deepContains)

return function(p0, p1, p2) --[[ line: 18 | named "toArrayEqual" ]]
	-- upvalues: deepContainsModule (ref), deepEqualModule (ref)
	if #p0 ~= #p1 then
		return {
			pass = false,
			message = ("Expected array length %s / got length %s"):format(tostring(#p0), tostring(#p1))
		}
	end
	for i = 1, #p0 do
		local var2, var4
		local _ = nil
		local _ = nil
		
		if p2 then
			var2, var3 = deepContainsModule(p0[i], p1[i])
			var4 = var3
			
			if var2 then
				continue
			end
			return {
				pass = false,
				message = var4:gsub("{1}", ("{1}[%s]"):format(tostring(i))):gsub("{2}", ("{2}[%s]"):format(tostring(i)))
			}
		else
			var2, var5 = deepEqualModule(p0[i], p1[i])
			var4 = var5
			
			if var2 then
				continue
			end
		end
	end
	return { pass = true, message = "" }
end