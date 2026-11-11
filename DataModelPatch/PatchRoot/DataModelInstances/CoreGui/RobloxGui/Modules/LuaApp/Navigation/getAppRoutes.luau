local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.Navigation)
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FFlagProfilePlatformEnableCurrencyTransfer = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagLuaAppEnableFeatureTileAdPlayer = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnableFeatureTileAdPlayer
local GetSocialRoutesModule = require(Modules.LuaApp.Components.Social.getSocialRoutes)
local GetCurrencyTransferRoutesModule = require(Modules.LuaApp.Components.CurrencyTransfer.getCurrencyTransferRoutes)
local GetAdsRoutesModule = require(Modules.LuaApp.Components.Ads.getAdsRoutes)
local GetProfilePlatformRoutesModule = require(Modules.LuaApp.Components.ProfilePlatform.getProfilePlatformRoutes)
local GetGroupRoutesModule = require(Modules.LuaApp.Components.Groups.getGroupRoutes)

local function validateNoDuplicateRoutes(List)
	local t = {}
	
	for _, value in List do
		local NextEntry = next(value)
		
		if t[NextEntry] then
			error(`Duplicate route name found: {NextEntry}`)
		end
		t[NextEntry] = true
	end
end

local function sanitizeRoutes(List)
	local List1 = {}
	
	for _, value in List do
		if value ~= nil and next(value) ~= nil then
			table.insert(List1, value)
		end
	end
	return List1
end

local function joinHoleyArrays(...)
	local List = {}
	
	for i = 1, select("#", ...) do
		local Selected = select(i, ...)
		
		if Selected ~= nil then
			for _, value in Selected do
				if value ~= nil then
					table.insert(List, value)
				end
			end
		end
	end
	return List
end

return function()
	-- upvalues: joinHoleyArrays (copy), Modules (copy), GetAppFeaturePoliciesFunction (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), GetCurrencyTransferRoutesModule (copy), FFlagLuaAppEnableFeatureTileAdPlayer (copy), GetAdsRoutesModule (copy), GetProfilePlatformRoutesModule (copy), GetSocialRoutesModule (copy), GetGroupRoutesModule (copy), sanitizeRoutes (copy), validateNoDuplicateRoutes (copy)
	local SanitizeRoutesResult = sanitizeRoutes((joinHoleyArrays(require(Modules.LuaApp.Navigation.getLegacyRoutes)(GetAppFeaturePoliciesFunction()), require(Modules.LuaApp.Components.Authentication.getAuthenticationRoutes)(), require(Modules.Personalization.getPersonalizationRoutes)(), require(Modules.LuaApp.Components.More.getMoreRoutes)(), if FFlagProfilePlatformEnableCurrencyTransfer then GetCurrencyTransferRoutesModule() else {}, if FFlagLuaAppEnableFeatureTileAdPlayer then GetAdsRoutesModule() else {}, GetProfilePlatformRoutesModule(), GetSocialRoutesModule(), GetGroupRoutesModule())))
	validateNoDuplicateRoutes(SanitizeRoutesResult)
	
	return SanitizeRoutesResult
end