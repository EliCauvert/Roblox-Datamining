local copyModule = require(script.Parent.copy)

local function noUpdate(p0)
	return p0
end

local function call(p1, ...)
	if type(p1) == "function" then
		return p1(...)
	end
end

return function(p2, p3, p4, p5)
	-- upvalues: copyModule (ref), noUpdate (ref), call (ref)
	local var7
	local var3 = type(p2)
	assert(var3 == "table", "expected a table for first argument, got " .. var3)
	local var4 = type(p3)
	assert(var4 == "number" and p3 % 1 == 0, "expected an integer for second argument, got " .. var4)
	local var5 = copyModule(p2)
	local _ = nil
	p4 = p4 or noUpdate
	
	if var5[p3] == nil then
		var7 = call(p5, false, p3)
	else
		var7 = p4(var5[p3], p3)
		call(p5, true, var7, p3)
	end
	var5[p3] = var7
	
	return var5
end