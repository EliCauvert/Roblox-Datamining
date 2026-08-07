-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:18 2026 Pacific Standard Time.

local keycodeMappingsModule = require(script.Parent.KeycodeMappings)
local platformModule = require(script.Parent.Platform)
local getInputPlatformModule = require(script.Parent.getInputPlatform)

return function(p0) --[[ line: 5 | named "getBuilderIconForKeycode" ]]
	-- upvalues: getInputPlatformModule (ref), keycodeMappingsModule (ref), platformModule (ref)
	local name = p0.Name
	local var3 = keycodeMappingsModule[getInputPlatformModule()][name]
	
	if var3 then
		return var3
	end
	assert(keycodeMappingsModule[platformModule.Default][name], `{name} has no associated BuilderIcon`)
	
	return keycodeMappingsModule[platformModule.Default][name]
end