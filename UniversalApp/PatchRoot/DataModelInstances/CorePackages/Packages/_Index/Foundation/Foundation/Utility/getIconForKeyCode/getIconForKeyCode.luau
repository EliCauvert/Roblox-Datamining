local _ = require(script:FindFirstAncestor("Foundation").Enums.InputPlatform)
local KeyCodeIconMappingsModule = require(script.Parent.KeyCodeIconMappings)

return function(p1, p2) --[[ Line: 19 | Named "getIconForKeyCode" ]]
	-- upvalues: KeyCodeIconMappingsModule (copy)
	return KeyCodeIconMappingsModule.getIconForKeyName(p1.Name, p2)
end