local keycodeMappingsModule = require(script.Parent.KeycodeMappings)
local platformModule = require(script.Parent.Platform)
local getInputPlatformModule = require(script.Parent.getInputPlatform)

return function(p1)
	-- upvalues: getInputPlatformModule (ref), keycodeMappingsModule (ref), platformModule (ref)
	local name = p1.Name
	local var1 = keycodeMappingsModule[getInputPlatformModule()][name]
	
	if var1 then
		return var1
	end
	assert(keycodeMappingsModule[platformModule.Default][name], `{name} has no associated BuilderIcon`)
	
	return keycodeMappingsModule[platformModule.Default][name]
end