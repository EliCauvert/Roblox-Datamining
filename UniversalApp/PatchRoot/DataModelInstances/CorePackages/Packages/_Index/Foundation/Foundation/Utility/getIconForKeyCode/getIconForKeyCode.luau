local _ = require(script:FindFirstAncestor("Foundation").Enums.InputPlatform)
local KeyCodeIconMappingsModule = require(script.Parent.KeyCodeIconMappings)

return function(p1, p2)
	-- upvalues: KeyCodeIconMappingsModule (copy)
	return KeyCodeIconMappingsModule.getIconForKeyName(p1.Name, p2)
end