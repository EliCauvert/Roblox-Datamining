-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local symbolsModule = require(script.Parent.symbols)

local function resetMock(value, p0) --[[ line: 3 ]]
	-- upvalues: symbolsModule (ref), resetMock (ref)
	local var2 = getmetatable(value)
	var2[symbolsModule.Calls] = {}
	
	for i, v in pairs(var2[symbolsModule.Children]) do
		if not p0[v] then
			p0[v] = true
			resetMock(v, p0)
		end
	end
end

return function(p1) --[[ line: 15 ]]
	-- upvalues: resetMock (ref)
	resetMock(p1, {})
end