-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:20 2026 Pacific Standard Time.

local unknownModule = require(script.Parent["Symbol.roblox"])
local var1 = newproxy(true)
local t = {}

local function _(p0) --[[ line: 32 | named "addType" ]]
	-- upvalues: t (ref), unknownModule (ref)
	t[p0] = unknownModule.named("Roact" .. p0)
end

t.HostChangeEvent = unknownModule.named("RoactHostChangeEvent")
t.HostEvent = unknownModule.named("RoactHostEvent")

function t.of(p1) --[[ line: 39 ]]
	-- upvalues: var1 (ref)
	return if typeof(p1) == "table" then p1[var1] else nil
end

getmetatable(var1).__index = t

getmetatable(var1).__tostring = function() --[[ line: 49 ]]
	return "RoactType"
end

return var1