local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(game:GetService("CorePackages").Packages.React)
local MorePageSettingsModule = require(Modules.LuaApp.Components.More.Config.MorePageSettings)
local _ = require(Modules.LuaApp.Components.More.MoreItems.Types)
local LinkButtonItemModule = require(Modules.LuaApp.Components.More.MoreItems.LinkButtonItem)
local config = {
	[MorePageSettingsModule.ItemType.Settings_SwitchProfileSection] = require(Modules.LuaApp.Components.More.MoreItems.SwitchProfileSection),
	[MorePageSettingsModule.ItemType.Settings_DeviceSettingsSection] = require(Modules.LuaApp.Components.More.MoreItems.DeviceSettingsSection),
	[MorePageSettingsModule.ItemType.About_LicensingSection] = require(Modules.LuaApp.Components.More.MoreItems.LicensingSection),
	[MorePageSettingsModule.ItemType.About_VersionSection] = require(Modules.LuaApp.Components.More.MoreItems.VersionSection)
}
local config1 = {
	[MorePageSettingsModule.ItemType.Settings_AccountSettingsInfo] = require(Modules.LuaApp.Components.More.MoreItems.AccountSettingsInfoItem),
	[MorePageSettingsModule.ItemType.About_TermsOfService] = LinkButtonItemModule,
	[MorePageSettingsModule.ItemType.About_Privacy] = LinkButtonItemModule
}

return {
	getSectionComponent = function(p1)
		-- upvalues: config (copy)
		return config[p1]
	end,
	getItemComponent = function(p1)
		-- upvalues: config1 (copy)
		return config1[p1]
	end
}