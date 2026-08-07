local dEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2) --[[ line: 27 ]]
	-- upvalues: dEV (ref)
	if dEV then
		if typeof(p0) ~= "table" then
			error(string.format("Array.map called on %s", typeof(p0)))
		end
		if typeof(p1) ~= "function" then
			error("callback is not a function")
		end
	end
	local p0Count = #p0
	local t = {}
	local var2 = 1
	while var2 <= p0Count do
		local var3 = p0[var2]
		
		if var3 ~= nil then
			t[var2] = if p2 ~= nil then p1(var3, var2, p0) else p1(p2, var3, var2, p0)
		end
		var2 += 1
	end
	return t
end