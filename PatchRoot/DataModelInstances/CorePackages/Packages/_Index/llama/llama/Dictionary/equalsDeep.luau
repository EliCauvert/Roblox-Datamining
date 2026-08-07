-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

local equalObjectsModule = require(script.Parent.Parent.equalObjects)

local function equalsDeepOneWay(p0, p1) --[[ line: 4 ]]
	-- upvalues: equalsDeepOneWay (ref)
	if type(p0) == "table" and type(p1) == "table" then
		for i, v in pairs(p0) do
			if not equalsDeepOneWay(v, p1[i]) then
				return false
			end
		end
	else
		return p0 == p1
	end
end

return function(...) --[[ line: 20 | named "equalsDeep" ]]
	-- upvalues: equalObjectsModule (ref), equalsDeepOneWay (ref)
	if equalObjectsModule(...) then
		return true
	end
	local var2 = select("#", ...)
	
	for i_1 = 1, var2 do
		local var3 = select(i_1, ...)
		
		for i = 1, var2 do
			if i == i_1 or equalsDeepOneWay(var3, select(i, ...)) then
				continue
			end
			return false
		end
	end
	return true
end