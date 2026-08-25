local dEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2)
	-- upvalues: dEV (ref)
	if dEV then
		if typeof(p0) ~= "table" then
			error(string.format("Array.every called on %s", typeof(p0)))
		end
		if typeof(p1) ~= "function" then
			error("callback is not a function")
		end
	end
	local p0Count = #p0
	local var1 = 1
	while var1 <= p0Count do
		local var2 = p0[var1]
		local _ = nil
		
		if var2 == nil or (if p2 ~= nil then p1(var2, var1, p0) else p1(p2, var2, var1, p0)) then
			var1 += 1
			continue
		end
		return false
	end
	return true
end