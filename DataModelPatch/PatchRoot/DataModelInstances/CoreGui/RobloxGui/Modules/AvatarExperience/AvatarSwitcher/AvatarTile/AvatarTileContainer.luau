local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local DashModule = require(CorePackages.Packages.Dash)
local AvatarTileModule = require(Modules.AvatarExperience.AvatarSwitcher.AvatarTile.AvatarTile)
local UseAvatarTilePropsModule = require(Modules.AvatarExperience.AvatarSwitcher.AvatarTile.useAvatarTileProps)

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseAvatarTilePropsModule (copy), ReactModule (copy), AvatarTileModule (copy), DashModule (copy)
	return ReactModule.createElement(AvatarTileModule, DashModule.assign(UseAvatarTilePropsModule(p1, Ref), { ref = Ref }))
end)