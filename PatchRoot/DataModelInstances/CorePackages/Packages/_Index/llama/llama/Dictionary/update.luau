-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

local copyModule = require(script.Parent.copy)

local function noUpdate(p0, p1) --[[ line: 4 ]]
	return p0, p1
end

local function call(p2, ...) --[[ line: 8 ]]
	if type(p2) == "function" then
		return p2(...)
	end
end

return function(p3, p4, p5, p6) --[[ line: 14 | named "update" ]]
	-- upvalues: copyModule (ref), noUpdate (ref), call (ref)
	local var7, var8
	local var3 = type(p3)
	assert(var3 == "table", "expected a table for first argument, got " .. var3)
	assert(p4 ~= nil, "expected second argument to be anything but nil, got nil")
	local var4 = copyModule(p3)
	local _ = nil
	local _ = nil
	p5 = p5 or noUpdate
	
	if var4[p4] == nil then
		local var9, var10 = call(p6, false, p4)
		var7 = var9
		var8 = var10
	else
		p5, var6 = p5(var4[p4], p4)
		var7 = p5
		var8 = var6
		call(p6, true, var7, var8 or p4)
	end
	var4[var8 or p4] = var7
	
	return var4
end