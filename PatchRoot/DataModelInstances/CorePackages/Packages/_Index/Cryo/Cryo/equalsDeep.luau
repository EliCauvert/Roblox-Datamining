-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

local equalObjectsModule = require(script.Parent.equalObjects)

local function compareDeep(p0, p1) --[[ line: 4 ]]
	-- upvalues: compareDeep (ref)
	if type(p0) ~= "table" or type(p1) ~= "table" then
		return p0 == p1
	end
	for i, v in p0 do
		if not compareDeep(p1[i], v) then
			return false
		end
	end
	for i, v in p1 do
		if not compareDeep(p0[i], v) then
			return false
		end
	end
	return true
end

return function(...) --[[ line: 24 | named "equalsDeep" ]]
	-- upvalues: equalObjectsModule (ref), compareDeep (ref)
	if equalObjectsModule(...) then
		return true
	end
	local var2 = select(1, ...)
	
	for i = 2, select("#", ...) do
		if compareDeep(var2, select(i, ...)) then
			continue
		end
		return false
	end
	return true
end