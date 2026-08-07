-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

local noneModule = require(script.Parent.Parent.None)
local copyDeepModule = require(script.Parent.copyDeep)

local function joinDeep(...) --[[ line: 5 ]]
	-- upvalues: copyDeepModule (ref), joinDeep (ref), noneModule (ref)
	local t = {}
	local var4 = 1
	
	for i_1 = 1, select("#", ...) do
		local var5 = select(i_1, ...)
		
		if not var5 then
			continue
		end
		for i = 1, #var5 do
			if type(var5[i]) == "table" then
				if t[var4] == nil or type(t[var4] ~= "table") then
					t[var4] = copyDeepModule(var5[i])
				else
					t[var4] = joinDeep(t[var4], var5[i])
				end
			elseif var5[i] ~= noneModule then
				t[var4] = var5[i]
			end
			var4 += 1
		end
	end
	return t
end

return joinDeep