local UserInputService = game:GetService("UserInputService")
local AppStorageService = game:GetService("AppStorageService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local LocalStorageKey = require(game:GetService("CorePackages").Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local GetFStringDebugDefaultPageOverrideModule = require(Modules.LuaApp.Flags.GetFStringDebugDefaultPageOverride)
local LuaAppChartsPreloadingEnabled = game:DefineFastFlag("LuaAppChartsPreloadingEnabled", false)
local FlagSettingsModule = {
	IsLuaGamesPagePreloadingEnabled = function(_)
		-- upvalues: LuaAppChartsPreloadingEnabled (copy)
		return LuaAppChartsPreloadingEnabled or not settings():GetFFlag("LuaAppGamesPagePreloadingDisabled")
	end
}
game:DefineFastInt("LuaAppLoginRollout", 0)
game:DefineFastInt("LuaAppLoginRolloutIos", 0)

function FlagSettingsModule.LuaAppLoginRolloutEnabledForDevice(): boolean
	-- upvalues: UserInputService (copy), AppStorageService (copy), LocalStorageKey (copy)
	return (tonumber(AppStorageService:GetItem(LocalStorageKey.BrowserTrackerId)) or 99) % 100 < (if UserInputService:GetPlatform() == Enum.Platform.IOS then game:GetFastInt("LuaAppLoginRolloutIos") else game:GetFastInt("LuaAppLoginRollout"))
end

function FlagSettingsModule.LuaAppLoginUIEnabled()
	-- upvalues: FlagSettingsModule (copy)
	return FlagSettingsModule.LuaAppLoginRolloutEnabledForDevice()
end

game:DefineFastInt("CrossDeviceLoginRollout2", 0)

function FlagSettingsModule.CrossDeviceLoginRolloutEnabledForDevice(): boolean
	-- upvalues: AppStorageService (copy), LocalStorageKey (copy)
	return (tonumber(AppStorageService:GetItem(LocalStorageKey.BrowserTrackerId)) or 99) % 100 < game:GetFastInt("CrossDeviceLoginRollout2")
end

game:DefineFastFlag("LuaAppEnableSinglePageSignUp", false)

function FlagSettingsModule.LuaAppEnableSinglePageSignUp()
	-- upvalues: FlagSettingsModule (copy)
	return game:GetFastFlag("LuaAppEnableSinglePageSignUp") or FlagSettingsModule.LuaAppLoginRolloutEnabledForDevice()
end

function FlagSettingsModule.WeChatLoginEnabled(): boolean
	return tonumber(settings():GetFVariable("LuaAppLoginMethod")) == 2
end

function FlagSettingsModule.GetDefaultAppPage()
	-- upvalues: GetFStringDebugDefaultPageOverrideModule (copy), AppPageModule (copy)
	local FStringDebugDefaultPageOverrideModule = GetFStringDebugDefaultPageOverrideModule()
	
	return if #FStringDebugDefaultPageOverrideModule > 0 then FStringDebugDefaultPageOverrideModule else AppPageModule.Startup
end

function FlagSettingsModule.GetGamesTabName(): string
	return "CommonUI.Features.Label.Discover"
end

function FlagSettingsModule.LuaAuthEnabledForLuobu()
	return game:GetEngineFeature("LuobuLuaAuthEnabled")
end

return FlagSettingsModule