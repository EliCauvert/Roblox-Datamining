local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local GetIABottomBarItemsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.AppNav.GetIABottomBarItems)

return function()
	-- upvalues: GetIABottomBarItemsModule (copy), CryoModule (copy)
	local IABottomBarItemsModule, _ = GetIABottomBarItemsModule()
	
	return CryoModule.List.map(IABottomBarItemsModule, function(p1)
		return p1.page
	end)
end