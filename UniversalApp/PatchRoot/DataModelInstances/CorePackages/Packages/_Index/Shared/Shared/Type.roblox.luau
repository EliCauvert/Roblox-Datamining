local unknownModule = require(script.Parent["Symbol.roblox"])
local var1 = newproxy(true)
local t = {}

local function _(p0)
	-- upvalues: t (ref), unknownModule (ref)
	t[p0] = unknownModule.named("Roact" .. p0)
end

t.HostChangeEvent = unknownModule.named("RoactHostChangeEvent")
t.HostEvent = unknownModule.named("RoactHostEvent")

function t.of(p1)
	-- upvalues: var1 (ref)
	return if typeof(p1) == "table" then p1[var1] else nil
end

getmetatable(var1).__index = t

getmetatable(var1).__tostring = function()
	return "RoactType"
end

return var1