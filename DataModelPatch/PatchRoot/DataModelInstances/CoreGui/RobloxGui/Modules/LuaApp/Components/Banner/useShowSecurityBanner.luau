local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseLocalUserIdFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useLocalUserId
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GetFFlagDebugShowAccountSecurityPromptBannerModule = require(Modules.LuaApp.Flags.GetFFlagDebugShowAccountSecurityPromptBanner)
local GetFFlagLuaAppAccountSecurityPromptEnabledModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptEnabled)
local GetFFlagLuaAppAccountSecurityPromptRolloutModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppAccountSecurityPromptRollout)

return function()
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy), UseLocalUserIdFunction (copy), GetFFlagLuaAppAccountSecurityPromptEnabledModule (copy), GetFFlagLuaAppAccountSecurityPromptRolloutModule (copy), GetFFlagDebugShowAccountSecurityPromptBannerModule (copy)
	local HasUseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p1)
		return p1.AccountSecurityPrompt and p1.AccountSecurityPrompt.promptType
	end, {}))) ~= nil
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	
	return GetFFlagLuaAppAccountSecurityPromptEnabledModule() and GetFFlagLuaAppAccountSecurityPromptRolloutModule(UseLocalUserIdResult) and HasUseSelectorResult or GetFFlagDebugShowAccountSecurityPromptBannerModule()
end