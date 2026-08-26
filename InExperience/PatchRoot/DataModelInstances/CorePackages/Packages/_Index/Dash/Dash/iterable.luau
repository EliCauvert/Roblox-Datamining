local _ = require(script.Parent.Types)

return function(p1)
	local var1 = 1
	local var2 = true
	local var3 = nil
	local _ = nil
	
	return function()
		-- upvalues: var2 (write), p1 (ref), var1 (write), var3 (write)
		if var2 then
			local var4 = p1[var1]
			
			if var4 == nil then
				var2 = false
			else
				local var5 = var1
				var1 += 1
				
				return var5, var4
			end
		end
		while true do
			var3 = next(p1, var3)
			if typeof(var3) == "number" and var3 > 0 and (var3 < var1 and var3 % 1 == 0) then continue end
			if var3 == nil then
				return nil
			end
			return var3, p1[var3]
		end
	end
end