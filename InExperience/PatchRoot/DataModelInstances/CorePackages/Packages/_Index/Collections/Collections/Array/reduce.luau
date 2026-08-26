local dEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1, p2, p3)
	-- upvalues: dEV (ref)
	if dEV then
		if typeof(p1) ~= "table" then
			error(string.format("Array.reduce called on %s", typeof(p1)))
		end
		if typeof(p2) ~= "function" then
			error("callback is not a function")
		end
	end
	local var1
	local p0Count = #p1
	local _ = nil
	local var2 = 1
	
	if p3 == nil then
		var2 = 2
		
		if p0Count == 0 then
			error("reduce of empty array with no initial value")
		end
		var1 = p1[1]
	else
		var1 = p3
	end
	for i = var2, p0Count do
		var1 = p2(var1, p1[i], i, p1)
	end
	return var1
end