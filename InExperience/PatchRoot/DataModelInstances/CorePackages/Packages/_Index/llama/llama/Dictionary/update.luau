local copyModule = require(script.Parent.copy)

local function noUpdate(p1, p2)
	return p1, p2
end

local function call(p1, ...)
	if type(p1) == "function" then
		return p1(...)
	end
end

return function(p1, p2, p3, p4)
	-- upvalues: copyModule (ref), noUpdate (ref), call (ref)
	local var1, var2
	local var3 = type(p1)
	assert(var3 == "table", "expected a table for first argument, got " .. var3)
	assert(p2 ~= nil, "expected second argument to be anything but nil, got nil")
	local var4 = copyModule(p1)
	local _ = nil
	local _ = nil
	p3 = p3 or noUpdate
	
	if var4[p2] == nil then
		local var5, var6 = call(p4, false, p2)
		var1 = var5
		var2 = var6
	else
		p3, var6 = p3(var4[p2], p2)
		var1 = p3
		var2 = var6
		call(p4, true, var1, var2 or p2)
	end
	var4[var2 or p2] = var1
	
	return var4
end