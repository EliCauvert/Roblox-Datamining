local _ = require(script:FindFirstAncestor("Foundation").Enums.InputPlatform)
local keyCodeIconMappingsModule = require(script.Parent.KeyCodeIconMappings)

return function(p1, p2)
	-- upvalues: keyCodeIconMappingsModule (ref)
	return keyCodeIconMappingsModule.getIconForKeyName(p1.Name, p2)
end