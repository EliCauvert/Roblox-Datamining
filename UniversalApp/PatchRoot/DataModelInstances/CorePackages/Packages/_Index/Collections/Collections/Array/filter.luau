local dEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2) --[[ line: 27 ]]
	-- upvalues: dEV (ref)
	if dEV then
		if typeof(p0) ~= "table" then
			error(string.format("Array.filter called on %s", typeof(p0)))
		end
		if typeof(p1) ~= "function" then
			error("callback is not a function")
		end
	end
	local p0Count = #p0
	local t = {}
	local var2 = 1
	
	if p2 == nil then
		for i = 1, p0Count do
			local var3 = p0[i]
			
			if var3 ~= nil and p1(var3, i, p0) then
				t[var2] = var3
				var2 += 1
			end
		end
		return t
	else
		for i_1 = 1, p0Count do
			local var4 = p0[i_1]
			
			if var4 ~= nil and p1(p2, var4, i_1, p0) then
				t[var2] = var4
				var2 += 1
			end
		end
		return t
	end
end