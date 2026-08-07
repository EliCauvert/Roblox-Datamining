-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local function _(p0) --[[ line: 1 | named "newSymbol" ]]
	local var7 = newproxy(true)
	p0 = ("Mocks.%s"):format(p0)
	
	getmetatable(var7).__tostring = function() --[[ line: 4 ]]
		-- upvalues: p0 (write)
		return p0
	end
	
	return var7
end

local t = {}
local var1 = newproxy(true)
local calls = ("Mocks.%s"):format("Calls")

getmetatable(var1).__tostring = function() --[[ line: 4 ]]
	-- upvalues: calls (write)
	return calls
end

t.Calls = var1
local var3 = newproxy(true)
calls = ("Mocks.%s"):format("Children")

getmetatable(var3).__tostring = function() --[[ line: 4 ]]
	-- upvalues: calls (write)
	return calls
end

t.Children = var3
local var4 = newproxy(true)
calls = ("Mocks.%s"):format("Lock")

getmetatable(var4).__tostring = function() --[[ line: 4 ]]
	-- upvalues: calls (write)
	return calls
end

t.Lock = var4
local var5 = newproxy(true)
calls = ("Mocks.%s"):format("None")

getmetatable(var5).__tostring = function() --[[ line: 4 ]]
	-- upvalues: calls (write)
	return calls
end

t.None = var5
local var6 = newproxy(true)
calls = ("Mocks.%s"):format("ReturnValue")

getmetatable(var6).__tostring = function() --[[ line: 4 ]]
	-- upvalues: calls (write)
	return calls
end

t.ReturnValue = var6

return t