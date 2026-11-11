local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local DashModule = require(CorePackages.Packages.Dash)
local SettingsTileModule = require(Modules.AvatarExperience.OutfitSwitcher.OutfitSwitcherSettingsTile.SettingsTile)
local UseSettingsTilePropsModule = require(Modules.AvatarExperience.OutfitSwitcher.OutfitSwitcherSettingsTile.useSettingsTileProps)

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseSettingsTilePropsModule (copy), ReactModule (copy), SettingsTileModule (copy), DashModule (copy)
	return ReactModule.createElement(SettingsTileModule, DashModule.assign(UseSettingsTilePropsModule(p1, Ref), { ref = Ref }))
end)