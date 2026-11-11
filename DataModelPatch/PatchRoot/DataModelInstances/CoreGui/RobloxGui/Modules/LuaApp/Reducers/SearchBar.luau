local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetSearchBarFocusedModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetSearchBarFocused)

return function(p1, p2)
	-- upvalues: SetSearchBarFocusedModule (copy), CryoModule (copy)
	local P0 = p1 or { focused = false }
	
	if p2.type == SetSearchBarFocusedModule.name then
		P0 = CryoModule.Dictionary.join(P0, { focused = p2.focused })
	end
	return P0
end