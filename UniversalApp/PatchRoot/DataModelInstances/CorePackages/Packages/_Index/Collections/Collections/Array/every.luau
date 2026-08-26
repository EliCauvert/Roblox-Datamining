local dEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3)
	-- upvalues: dEV (ref)
	if dEV then
		if typeof(p1) ~= "table" then
			error(string.format("Array.every called on %s", typeof(p1)))
		end
		if typeof(p2) ~= "function" then
			error("callback is not a function")
		end
	end
	local p0Count = #p1
	local var1 = 1
	while var1 <= p0Count do
		local var2 = p1[var1]
		local _ = nil
		
		if var2 == nil or (if p3 ~= nil then p2(var2, var1, p1) else p2(p3, var2, var1, p1)) then
			var1 += 1
			continue
		end
		return false
	end
	return true
end