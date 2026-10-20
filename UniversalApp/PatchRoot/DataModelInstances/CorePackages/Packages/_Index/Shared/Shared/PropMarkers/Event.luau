local TypeRobloxModule = require(script.Parent.Parent["Type.roblox"])
local EventModule = {}
local config = {
	__tostring = function(p1): string
		return string.format("RoactHostEvent(%s)", p1.name)
	end
}
setmetatable(EventModule, {
	__index = function(_, Name)
		-- upvalues: TypeRobloxModule (copy), config (copy), EventModule (copy)
		local config1 = {
			[TypeRobloxModule] = TypeRobloxModule.HostEvent,
			name = Name
		}
		setmetatable(config1, config)
		EventModule[Name] = config1
		
		return config1
	end
})

return EventModule