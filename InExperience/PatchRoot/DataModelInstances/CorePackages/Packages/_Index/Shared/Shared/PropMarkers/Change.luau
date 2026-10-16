local TypeRobloxModule = require(script.Parent.Parent["Type.roblox"])
local ChangeModule = {}
local config = {
	__tostring = function(p1): string --[[ Line: 33 ]]
		return string.format("RoactHostChangeEvent(%s)", p1.name)
	end
}
setmetatable(ChangeModule, {
	__index = function(_, Name) --[[ Line: 39 ]]
		-- upvalues: TypeRobloxModule (copy), config (copy), ChangeModule (copy)
		local config1 = {
			[TypeRobloxModule] = TypeRobloxModule.HostChangeEvent,
			name = Name
		}
		setmetatable(config1, config)
		ChangeModule[Name] = config1
		
		return config1
	end
})

return ChangeModule