local dEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3)
	-- upvalues: dEV (ref)
	if dEV then
		if typeof(p1) ~= "table" then
			error(string.format("Array.filter called on %s", typeof(p1)))
		end
		if typeof(p2) ~= "function" then
			error("callback is not a function")
		end
	end
	local p0Count = #p1
	local t = {}
	local var1 = 1
	
	if p3 == nil then
		for i = 1, p0Count do
			local var2 = p1[i]
			
			if var2 ~= nil and p2(var2, i, p1) then
				t[var1] = var2
				var1 += 1
			end
		end
		return t
	else
		for i_1 = 1, p0Count do
			local var3 = p1[i_1]
			
			if var3 ~= nil and p2(p3, var3, i_1, p1) then
				t[var1] = var3
				var1 += 1
			end
		end
		return t
	end
end