local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Theme = FoundationModule.Enums.Theme
local GetTokensFunction = FoundationModule.Utility.getTokens
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AccountTypeThemeOverridesModule = require(Modules.LuaApp.Themes.AccountTypeThemeOverrides)
local FFlagEnableRobloxPlusThemeSetting = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableRobloxPlusThemeSetting
local RobloxPlusThemeModule = require(Modules.LuaApp.Themes.RobloxPlusTheme)
local RobloxPlusThemeOverridesModule = if FFlagEnableRobloxPlusThemeSetting then require(Modules.LuaApp.Themes.RobloxPlusThemeOverrides) else nil
local GetRobloxPlusThemeStoreModule = if FFlagEnableRobloxPlusThemeSetting then require(Modules.LuaApp.Themes.Stores.GetRobloxPlusThemeStore) else nil
local UseShowRobloxPlusThemeSettingModule = if FFlagEnableRobloxPlusThemeSetting then require(Modules.LuaApp.Hooks.useShowRobloxPlusThemeSetting) else nil

local function getEngineFeatureSafe(Name): boolean
	local Success, Result = pcall(function()
		-- upvalues: Name (copy)
		return game:GetEngineFeature(Name)
	end)
	
	return Success and Result == true
end

local list = {
	"Color.Common.NavigationBar", "Color.Surface.Surface_0",
	"Color.Surface.Surface_100", "Color.Content.Default", "Color.Content.Muted",
	"Color.ActionEmphasis.Background", "Color.ActionEmphasis.Foreground"
}

local function getTokenAtPath(p1, Text: string)
	local v1 = p1
	
	for _, value in string.split(Text, ".") do
		if v1 == nil or type(v1) ~= "table" then
			return nil
		end
		v1 = v1[value]
	end
	return v1
end

local function _(p2): boolean
	return type(p2) == "table" and typeof(p2.Color3) == "Color3"
end

local _ = function(p2): boolean
	return type(p2) == "string" and p2:match("^#?%x%x%x%x%x%x$") ~= nil
end

local function resolveColor3FromOverride(p2, p3)
	-- upvalues: getTokenAtPath (copy)
	if typeof(p3) == "Color3" then
		return p3
	end
	if type(p3) == "string" and p3:match("^#?%x%x%x%x%x%x$") ~= nil then
		return Color3.fromHex(p3)
	end
	if type(p3) == "string" then
		local TokenAtPath = getTokenAtPath(p2, p3)
		
		if typeof(TokenAtPath) == "Color3" then
			return TokenAtPath
		elseif type(TokenAtPath) == "table" and typeof(TokenAtPath.Color3) == "Color3" then
			return TokenAtPath.Color3
		end
	end
	return nil
end

local _ = function(p2, p3, p4)
	-- upvalues: getTokenAtPath (copy)
	if type(p3) == "number" then
		return p3
	end
	if type(p3) == "string" then
		local TokenAtPath = getTokenAtPath(p2, p3)
		
		if type(TokenAtPath) == "number" then
			return TokenAtPath
		elseif type(TokenAtPath) == "table" and typeof(TokenAtPath.Color3) == "Color3" then
			return TokenAtPath.Transparency
		end
	end
	return if p4 then p4.Transparency else nil
end

local function resolveForTheme(Dark, p2, Text)
	-- upvalues: GetTokensFunction (copy), getTokenAtPath (copy), resolveColor3FromOverride (copy)
	local Tokens = GetTokensFunction(Dark)
	local TokenAtPath = getTokenAtPath(Tokens, Text)
	local IsColor3: boolean = type(TokenAtPath) == "table" and typeof(TokenAtPath.Color3) == "Color3"
	local TokenAtPath1 = if IsColor3 then TokenAtPath else nil
	local v2 = p2 and p2[Text]
	local v3 = p2 and p2[Text .. ".Color3"]
	local v4 = p2 and p2[Text .. ".Transparency"]
	
	if v2 and type(v2) == "string" and (type(v2) ~= "string" or v2:match("^#?%x%x%x%x%x%x$") == nil) then
		local TokenAtPath2 = getTokenAtPath(Tokens, v2)
		
		if type(TokenAtPath2) == "table" and typeof(TokenAtPath2.Color3) == "Color3" then
			return TokenAtPath2
		end
	end
	local ResolveColor3FromOverrideResult = resolveColor3FromOverride(Tokens, v3)
	local Transparency = nil
	
	if ResolveColor3FromOverrideResult then
		repeat
			if type(v4) == "number" then
				Transparency = v4
				break
			end
			if type(v4) == "string" then
				local TokenAtPath3 = getTokenAtPath(Tokens, v4)
				
				if type(TokenAtPath3) == "number" then
					Transparency = TokenAtPath3
					break
				end
				if type(TokenAtPath3) == "table" and typeof(TokenAtPath3.Color3) == "Color3" then
					Transparency = TokenAtPath3.Transparency
					break
				end
			end
			Transparency = if TokenAtPath1 then TokenAtPath1.Transparency else nil
		until true
		if Transparency ~= nil then
			return {
				Color3 = ResolveColor3FromOverrideResult,
				Transparency = Transparency
			}
		end
	end
	return if TokenAtPath1 then TokenAtPath1 else nil
end

local _ = function(p2, Default, p3)
	-- upvalues: FFlagEnableRobloxPlusThemeSetting (copy), RobloxPlusThemeModule (copy), RobloxPlusThemeOverridesModule (copy), AccountTypeThemeOverridesModule (copy)
	if FFlagEnableRobloxPlusThemeSetting and p3 and Default ~= RobloxPlusThemeModule.Default then
		local RobloxPlusThemeOverridesModuleEntry = RobloxPlusThemeOverridesModule[Default]
		
		if RobloxPlusThemeOverridesModuleEntry then
			return RobloxPlusThemeOverridesModuleEntry
		end
	end
	return if p2 == nil then nil else AccountTypeThemeOverridesModule[p2]
end

local function buildColorTokens(p2, Default, HasRobloxPlusSubscription)
	-- upvalues: FFlagEnableRobloxPlusThemeSetting (copy), RobloxPlusThemeModule (copy), RobloxPlusThemeOverridesModule (copy), AccountTypeThemeOverridesModule (copy), Theme (copy), list (copy), resolveForTheme (copy)
	local AccountTypeThemeOverridesModuleEntry = nil
	repeat
		if FFlagEnableRobloxPlusThemeSetting and HasRobloxPlusSubscription and Default ~= RobloxPlusThemeModule.Default then
			local RobloxPlusThemeOverridesModuleEntry = RobloxPlusThemeOverridesModule[Default]
			
			if RobloxPlusThemeOverridesModuleEntry then
				AccountTypeThemeOverridesModuleEntry = RobloxPlusThemeOverridesModuleEntry
				break
			end
		end
		AccountTypeThemeOverridesModuleEntry = if p2 == nil then nil else AccountTypeThemeOverridesModule[p2]
	until true
	if AccountTypeThemeOverridesModuleEntry == nil then
		return nil
	end
	local AccountTypeThemeOverridesModuleEntry1 = AccountTypeThemeOverridesModuleEntry[Theme.Dark]
	local AccountTypeThemeOverridesModuleEntry2 = AccountTypeThemeOverridesModuleEntry[Theme.Light]
	local t = {}
	
	for _, value in list do
		local ResolveForThemeResult = resolveForTheme(Theme.Dark, AccountTypeThemeOverridesModuleEntry1, value)
		local ResolveForThemeResult1 = resolveForTheme(Theme.Light, AccountTypeThemeOverridesModuleEntry2, value)
		
		if ResolveForThemeResult and ResolveForThemeResult1 then
			t[string.gsub(value, "^Color%.", "")] = {
				dark = ResolveForThemeResult,
				light = ResolveForThemeResult1
			}
		end
	end
	return t
end

local function getDesignFoundationsService()
	local Success, Result = pcall(function()
		return game:GetService("DesignFoundationsService")
	end)
	
	return if Success and Result ~= nil then Result else nil
end

return function(p3)
	-- upvalues: getEngineFeatureSafe (copy), getDesignFoundationsService (copy), UseAppPolicyFunction (copy), RobloxPlusThemeModule (copy), FFlagEnableRobloxPlusThemeSetting (copy), GetRobloxPlusThemeStoreModule (copy), UseSignalStateFunction (copy), UseShowRobloxPlusThemeSettingModule (copy), ReactModule (copy), buildColorTokens (copy)
	local GetService = p3.getService or getDesignFoundationsService
	local DesignFoundationsServiceEnabled = (p3.getEngineFeature or getEngineFeatureSafe)("DesignFoundationsServiceEnabled")
	local UseAppPolicyResult = UseAppPolicyFunction(function(p4)
		local GetAccountTypeFunction = p4.getAccountType
		
		return if GetAccountTypeFunction then GetAccountTypeFunction() else nil
	end)
	local Default = RobloxPlusThemeModule.Default
	local HasRobloxPlusSubscription = false
	
	if FFlagEnableRobloxPlusThemeSetting then
		Default = UseSignalStateFunction(GetRobloxPlusThemeStoreModule(false).getColorThemeKey)
		local UseShowRobloxPlusThemeSettingModuleResult = UseShowRobloxPlusThemeSettingModule()
		HasRobloxPlusSubscription = UseShowRobloxPlusThemeSettingModuleResult.isRobloxPlusUpsellEligible and UseShowRobloxPlusThemeSettingModuleResult.hasRobloxPlusSubscription
	end
	ReactModule.useEffect(function()
		-- upvalues: DesignFoundationsServiceEnabled (copy), GetService (copy), buildColorTokens (upval), UseAppPolicyResult (copy), Default (ref), HasRobloxPlusSubscription (ref)
		if not DesignFoundationsServiceEnabled then return end
		local Service = GetService()
		
		if not Service then
			warn("[DesignFoundationsBridge] DesignFoundationsService not available")
			
			return
		end
		local ColorTokens = buildColorTokens(UseAppPolicyResult, Default, HasRobloxPlusSubscription)
		
		if ColorTokens and next(ColorTokens) ~= nil then
			local config = { colorTokens = ColorTokens }
			local Success1, Result1 = pcall(function()
				-- upvalues: Service (copy), config (copy)
				Service:SetTokens(config)
			end)
			
			if not Success1 then
				warn("[DesignFoundationsBridge] SetTokens failed:", Result1)
				
				return
			end
		else
			local Success, Result = pcall(function()
				-- upvalues: Service (copy)
				Service:ClearTokens()
			end)
			
			if not Success then
				warn("[DesignFoundationsBridge] ClearTokens failed:", Result)
			end
		end
	end, {
		UseAppPolicyResult,
		DesignFoundationsServiceEnabled,
		GetService,
		Default,
		HasRobloxPlusSubscription
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, p3.children)
end