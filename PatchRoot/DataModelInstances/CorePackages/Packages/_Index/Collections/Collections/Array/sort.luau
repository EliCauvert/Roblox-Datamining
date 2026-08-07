-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:55 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local noneModule = require(parent.Object.None)
local _ = require(parent.Parent.ES7Types)

local var1 = function(p0, p1) --[[ line: 23 ]]
	return type(p0) .. tostring(p0) < type(p1) .. tostring(p1)
end

return function(p2, p3) --[[ line: 27 ]]
	-- upvalues: var1 (ref), noneModule (ref)
	local var2 = var1
	
	if p3 ~= nil and p3 ~= noneModule then
		if typeof(p3) ~= "function" then
			error("invalid argument to Array.sort: compareFunction must be a function")
		end
		var2 = function(p4, p5) --[[ line: 34 ]]
			-- upvalues: p3 (ref)
			local var3 = p3(p4, p5)
			
			if typeof(var3) ~= "number" then
				error(("invalid result from compare function, expected number but got %s"):format(typeof(var3)))
			end
			return var3 < 0
		end
	end
	table.sort(p2, var2)
	
	return p2
end