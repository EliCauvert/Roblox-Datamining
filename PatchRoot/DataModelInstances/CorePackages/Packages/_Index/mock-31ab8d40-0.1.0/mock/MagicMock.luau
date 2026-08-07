-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local symbolsModule = require(script.Parent.symbols)
local spyModule = require(script.Parent.Spy)
local t = {}
local t_1 = {
	__index = function(p0, p1) --[[ line: 7 ]]
		-- upvalues: symbolsModule (ref), t (ref)
		local var4 = getmetatable(p0)
		local var5 = var4[symbolsModule.Children][p1]
		
		if var5 == nil then
			var5 = t.new()
			var4[symbolsModule.Children][p1] = var5
			
			return var5
		end
		return if var5 == symbolsModule.None then nil else var5
	end,
	__newindex = function(p2, p3, p4) --[[ line: 22 ]]
		-- upvalues: spyModule (ref), symbolsModule (ref)
		local var6 = getmetatable(p2)
		
		if type(p4) == "function" then
			local _, var7 = spyModule.new(p4)
			p4 = var7
		elseif p4 == nil then
			p4 = symbolsModule.None
		end
		if p3 == symbolsModule.ReturnValue then
			var6[symbolsModule.ReturnValue] = { p4, n = 1 }
			
			return
		end
		var6[symbolsModule.Children][p3] = p4
	end,
	__call = function(p5, ...) --[[ line: 39 ]]
		-- upvalues: symbolsModule (ref), t (ref)
		local var8 = getmetatable(p5)
		local t_1 = {
			args = table.pack(...),
			result = var8[symbolsModule.ReturnValue]
		}
		
		if t_1.result == nil then
			t_1.result = { t.new(), n = 1 }
			var8[symbolsModule.ReturnValue] = t_1.result
		elseif t_1.result == symbolsModule.None then
			t_1.result = { n = 1 }
		end
		table.insert(var8[symbolsModule.Calls], t_1)
		
		return table.unpack(t_1.result)
	end
}

function t.new(p6) --[[ line: 60 ]]
	-- upvalues: symbolsModule (ref), t_1 (ref)
	local t = {
		[symbolsModule.Calls] = {},
		[symbolsModule.Children] = {},
		[symbolsModule.Lock] = p6,
		[symbolsModule.ReturnValue] = nil
	}
	
	for i, v in pairs(t_1) do
		t[i] = v
	end
	return setmetatable({}, t)
end

return t