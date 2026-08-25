local _ = require(script.Parent.Types)

return function(p0)
	local var0 = 1
	local var1 = true
	local var2 = nil
	local _ = nil
	
	return function()
		-- upvalues: var1 (write), p0 (ref), var0 (write), var2 (write)
		if var1 then
			local var3 = p0[var0]
			
			if var3 == nil then
				var1 = false
			else
				local var4 = var0
				var0 += 1
				
				return var4, var3
			end
		end
		while true do
			var2 = next(p0, var2)
			if typeof(var2) == "number" and var2 > 0 and (var2 < var0 and var2 % 1 == 0) then continue end
			if var2 == nil then
				return nil
			end
			return var2, p0[var2]
		end
	end
end