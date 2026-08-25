local dEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2)
	-- upvalues: dEV (ref)
	if dEV then
		if typeof(p0) ~= "table" then
			error(string.format("Array.reduce called on %s", typeof(p0)))
		end
		if typeof(p1) ~= "function" then
			error("callback is not a function")
		end
	end
	local var2
	local p0Count = #p0
	local _ = nil
	local var1 = 1
	
	if p2 == nil then
		var1 = 2
		
		if p0Count == 0 then
			error("reduce of empty array with no initial value")
		end
		var2 = p0[1]
	else
		var2 = p2
	end
	for i = var1, p0Count do
		var2 = p1(var2, p0[i], i, p0)
	end
	return var2
end