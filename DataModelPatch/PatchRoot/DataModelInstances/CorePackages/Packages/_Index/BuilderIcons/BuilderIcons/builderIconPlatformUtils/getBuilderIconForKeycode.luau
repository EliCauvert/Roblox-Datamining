local KeycodeMappingsModule = require(script.Parent.KeycodeMappings)
local PlatformModule = require(script.Parent.Platform)
local GetInputPlatformModule = require(script.Parent.getInputPlatform)

return function(p1)
	-- upvalues: GetInputPlatformModule (copy), KeycodeMappingsModule (copy), PlatformModule (copy)
	local Name = p1.Name
	local KeycodeMappingsModuleEntry = KeycodeMappingsModule[GetInputPlatformModule()][Name]
	
	if KeycodeMappingsModuleEntry then
		return KeycodeMappingsModuleEntry
	else
		assert(KeycodeMappingsModule[PlatformModule.Default][Name], `{Name} has no associated BuilderIcon`)
		
		return KeycodeMappingsModule[PlatformModule.Default][Name]
	end
end