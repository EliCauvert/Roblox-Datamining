-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:54 2026 Pacific Standard Time.

local dEV = _G.__DEV__
local parent = script.Parent
local isArrayModule = require(parent.isArray)
local _ = require(parent.Parent.Parent.ES7Types)

return function(p0, ...) --[[ line: 29 | named "concat" ]]
	-- upvalues: isArrayModule (ref), dEV (ref)
	local cloned
	local _ = nil
	local var1 = 0
	
	if isArrayModule(p0) then
		cloned = table.clone(p0)
		var1 = #p0
	else
		var1 += 1
		cloned = { [var1] = p0 }
	end
	local var3
	for i_1 = 1, select("#", ...) do
		var3 = select(i_1, ...)
		local var4 = typeof(var3)
		
		if var3 == nil then
			continue
		end
		if var4 ~= "table" then
			var1 += 1
			cloned[var1] = var3
			continue
		end
		if dEV and not isArrayModule(var3) then
			error("Array.concat(...) only works with array-like tables but it received an object-like table.\nYou can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`")
		end
		for i = 1, #var3 do
			var1 += 1
			cloned[var1] = var3[i]
		end
	end
	return cloned
end