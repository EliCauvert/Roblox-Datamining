local copyModule = require(script.Parent.copy)

local function noUpdate(p1)
	return p1
end

local function call(p1, ...)
	if type(p1) == "function" then
		return p1(...)
	end
end

return function(p1, p2, p3, p4)
	-- upvalues: copyModule (ref), noUpdate (ref), call (ref)
	local var1
	local var2 = type(p1)
	assert(var2 == "table", "expected a table for first argument, got " .. var3)
	local var3 = type(p2)
	assert(var3 == "number" and p2 % 1 == 0, "expected an integer for second argument, got " .. var4)
	local var4 = copyModule(p1)
	local _ = nil
	p3 = p3 or noUpdate
	
	if var4[p2] == nil then
		var1 = call(p4, false, p2)
	else
		var1 = p3(var4[p2], p2)
		call(p4, true, var1, p2)
	end
	var4[p2] = var1
	
	return var4
end