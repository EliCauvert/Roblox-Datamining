-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local symbolsModule = require(script.Parent.symbols)
local isAMagicMockModule = require(script.Parent.isAMagicMock)
local t = {}
t.__index = t

function t:__call(...) --[[ line: 9 ]]
	return self.inner(...)
end

local t_1 = {}
setmetatable(t_1, { __mode = "kv" })

function t.new(p0) --[[ line: 16 ]]
	-- upvalues: symbolsModule (ref), t (ref), t_1 (ref)
	local t_2 = { [symbolsModule.isSpy] = true, [symbolsModule.Calls] = {} }
	setmetatable(t_2, t)
	
	local var5 = function(...) --[[ line: 23 ]]
		-- upvalues: p0 (ref), t_2 (ref), symbolsModule (copy)
		local t = { args = table.pack(...), result = table.pack(p0(...)) }
		table.insert(t_2[symbolsModule.Calls], t)
		
		return table.unpack(t.result)
	end
	
	t_2.inner = var5
	t_1[var5] = t_2
	
	return t_2, var5
end

function t.lookup(p1) --[[ line: 38 ]]
	-- upvalues: t_1 (ref)
	return t_1[p1]
end

function t:is() --[[ line: 42 ]]
	-- upvalues: isAMagicMockModule (ref), symbolsModule (ref)
	return if isAMagicMockModule(self) then false else type(self) == "table" and self[symbolsModule.isSpy] ~= nil
end

return t