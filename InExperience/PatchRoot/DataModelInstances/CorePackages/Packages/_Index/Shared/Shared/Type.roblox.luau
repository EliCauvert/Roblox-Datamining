local SymbolRobloxModule = require(script.Parent["Symbol.roblox"])
local Proxy = newproxy(true)
local NamedResults = {}

local function _(Key)
	-- upvalues: NamedResults (copy), SymbolRobloxModule (copy)
	NamedResults[Key] = SymbolRobloxModule.named("Roact" .. Key)
end

NamedResults.HostChangeEvent = SymbolRobloxModule.named("RoactHostChangeEvent")
NamedResults.HostEvent = SymbolRobloxModule.named("RoactHostEvent")

function NamedResults.of(p1)
	-- upvalues: Proxy (copy)
	return if typeof(p1) == "table" then p1[Proxy] else nil
end

getmetatable(Proxy).__index = NamedResults

getmetatable(Proxy).__tostring = function(): string
	return "RoactType"
end

return Proxy