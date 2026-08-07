local unknownModule = require(script.Parent.Parent["Type.roblox"])
local t = {}
local t_1 = {
	__tostring = function(p0) --[[ line: 35 ]]
		return string.format("RoactHostEvent(%s)", p0.name)
	end
}
setmetatable(t, {
	__index = function(_, p1) --[[ line: 41 ]]
		-- upvalues: unknownModule (ref), t_1 (ref), t (ref)
		local t_2 = { [unknownModule] = unknownModule.HostEvent, name = p1 }
		setmetatable(t_2, t_1)
		t[p1] = t_2
		
		return t_2
	end
})

return t