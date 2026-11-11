local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local UiModeStyleProvider = require(CorePackages.Workspace.Packages.Style).UiModeStyleProvider
local _ = require(CorePackages.Packages.Foundation)
local CryoModule = require(CorePackages.Packages.Cryo)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local AccountTypeThemeOverridesModule = require(script.Parent.Parent.Themes.AccountTypeThemeOverrides)
local FFlagEnableCoreContentTheme = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableCoreContentTheme
local FFlagEnableCoreContentThemeUseGuacForTokenOverrides = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableCoreContentThemeUseGuacForTokenOverrides
local FFlagUseDefaultThemeForLoggedOutUsers = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseDefaultThemeForLoggedOutUsers
local FFlagEnableRobloxPlusThemeSetting = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableRobloxPlusThemeSetting
local RobloxPlusThemeModule = require(script.Parent.Parent.Themes.RobloxPlusTheme)
local RobloxPlusThemeOverridesModule = if FFlagEnableRobloxPlusThemeSetting then require(script.Parent.Parent.Themes.RobloxPlusThemeOverrides) else nil
local GetRobloxPlusThemeStoreModule = if FFlagEnableRobloxPlusThemeSetting then require(script.Parent.Parent.Themes.Stores.GetRobloxPlusThemeStore) else nil
local UseShowRobloxPlusThemeSettingModule = if FFlagEnableRobloxPlusThemeSetting then require(script.Parent.Parent.Hooks.useShowRobloxPlusThemeSetting) else nil
local UseHydrateRobloxPlusThemeFromServerEffectModule = if FFlagEnableRobloxPlusThemeSetting then require(script.Parent.Parent.Hooks.useHydrateRobloxPlusThemeFromServerEffect) else nil
local KidsThemeBlueColorsIxpEnabled = game:DefineFastFlag("KidsThemeBlueColorsIxpEnabled", false)
local KidsThemeBlueColorsIxpLayer = game:DefineFastString("KidsThemeBlueColorsIxpLayer", "UniversalApp.KidsTheme")

local function _(p1): boolean
	return p1:match("^#?%x%x%x%x%x%x$") ~= nil
end

local function convertHexLeafValuesToColor3(List)
	-- upvalues: convertHexLeafValuesToColor3 (copy)
	if type(List) == "string" and List:match("^#?%x%x%x%x%x%x$") ~= nil then
		return Color3.fromHex(List)
	end
	if type(List) == "table" then
		for i, value in List do
			List[i] = convertHexLeafValuesToColor3(value)
		end
	end
	return List
end

local function useCoreContentThemeOverridesByTheme()
	-- upvalues: UseAppPolicyFunction (copy), FFlagUseDefaultThemeForLoggedOutUsers (copy), FFlagEnableCoreContentThemeUseGuacForTokenOverrides (copy), convertHexLeafValuesToColor3 (copy), RobloxPlusThemeModule (copy), FFlagEnableRobloxPlusThemeSetting (copy), GetRobloxPlusThemeStoreModule (copy), UseSignalStateFunction (copy), UseShowRobloxPlusThemeSettingModule (copy), KidsThemeBlueColorsIxpEnabled (copy), ReactModule (copy), IXPServiceWrapper (copy), KidsThemeBlueColorsIxpLayer (copy), RobloxPlusThemeOverridesModule (copy), AccountTypeThemeOverridesModule (copy)
	local UseAppPolicyResult, UseAppPolicyResult2 = UseAppPolicyFunction(function(p1)
		-- upvalues: FFlagUseDefaultThemeForLoggedOutUsers (upval), FFlagEnableCoreContentThemeUseGuacForTokenOverrides (upval), convertHexLeafValuesToColor3 (upval)
		if FFlagUseDefaultThemeForLoggedOutUsers and (not game.Players.LocalPlayer or game.Players.LocalPlayer.UserId <= 0) then
			return "Roblox", nil
		end
		local GetAccountTypeFunction = p1.getAccountType
		local AccountType = if GetAccountTypeFunction then GetAccountTypeFunction() else nil
		local v1 = nil
		
		if FFlagEnableCoreContentThemeUseGuacForTokenOverrides then
			local GetCoreContentThemeFunction = p1.getCoreContentTheme
			local CoreContentTheme = if GetCoreContentThemeFunction then GetCoreContentThemeFunction() else nil
			
			if CoreContentTheme then
				return AccountType, (convertHexLeafValuesToColor3(CoreContentTheme))
			end
			v1 = nil
		end
		return AccountType, v1
	end)
	local Default = RobloxPlusThemeModule.Default
	local HasRobloxPlusSubscription = false
	
	if FFlagEnableRobloxPlusThemeSetting then
		local RobloxPlusThemeStoreModule = GetRobloxPlusThemeStoreModule(false)
		Default = UseSignalStateFunction(RobloxPlusThemeStoreModule.getColorThemeKey)
		local UseShowRobloxPlusThemeSettingModuleResult = UseShowRobloxPlusThemeSettingModule()
		HasRobloxPlusSubscription = UseShowRobloxPlusThemeSettingModuleResult.isRobloxPlusUpsellEligible and UseShowRobloxPlusThemeSettingModuleResult.hasRobloxPlusSubscription
		local UseSignalStateResult = UseSignalStateFunction(RobloxPlusThemeStoreModule.getPreviewColorThemeKey)
		
		if UseSignalStateResult ~= nil and UseShowRobloxPlusThemeSettingModuleResult.isRobloxPlusUpsellEligible then
			Default = UseSignalStateResult
			HasRobloxPlusSubscription = true
		end
	end
	if KidsThemeBlueColorsIxpEnabled and FFlagEnableCoreContentThemeUseGuacForTokenOverrides then
		ReactModule.useEffect(function()
			-- upvalues: UseAppPolicyResult (copy), IXPServiceWrapper (upval), KidsThemeBlueColorsIxpLayer (upval)
			if UseAppPolicyResult == "Kids" then
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(KidsThemeBlueColorsIxpLayer)
			end
		end, { UseAppPolicyResult })
	end
	if FFlagEnableRobloxPlusThemeSetting and HasRobloxPlusSubscription and Default ~= RobloxPlusThemeModule.Default then
		local RobloxPlusThemeOverridesModuleEntry = RobloxPlusThemeOverridesModule[Default]
		
		if RobloxPlusThemeOverridesModuleEntry then
			return RobloxPlusThemeOverridesModuleEntry
		end
	end
	return if UseAppPolicyResult2 then UseAppPolicyResult2 elseif UseAppPolicyResult and AccountTypeThemeOverridesModule[UseAppPolicyResult] then AccountTypeThemeOverridesModule[UseAppPolicyResult] else nil
end

return function(p1)
	-- upvalues: FFlagEnableRobloxPlusThemeSetting (copy), UseHydrateRobloxPlusThemeFromServerEffectModule (copy), FFlagEnableCoreContentTheme (copy), useCoreContentThemeOverridesByTheme (copy), CryoModule (copy), ReactRobloxModule (copy), ReactModule (copy), UiModeStyleProvider (copy), CoreGui (copy)
	if FFlagEnableRobloxPlusThemeSetting then
		UseHydrateRobloxPlusThemeFromServerEffectModule()
	end
	local v1 = nil
	
	if FFlagEnableCoreContentTheme then
		local UseCoreContentThemeOverridesByThemeResult = useCoreContentThemeOverridesByTheme()
		v1 = {
			tokenOverridesByTheme = if UseCoreContentThemeOverridesByThemeResult then UseCoreContentThemeOverridesByThemeResult else CryoModule.None
		}
	end
	return ReactRobloxModule.createPortal({
		ReactModule.createElement(UiModeStyleProvider, if v1 then CryoModule.Dictionary.join(p1, v1) else p1)
	}, CoreGui)
end