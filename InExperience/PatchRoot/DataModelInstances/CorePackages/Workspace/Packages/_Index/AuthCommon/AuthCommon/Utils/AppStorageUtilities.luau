local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local authLocalStorageKeysModule = require(authCommon.Enums.AuthLocalStorageKeys)
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local getFFlagEnableMultiPageSignup = require(parent.SharedFlags).GetFFlagEnableMultiPageSignup
local _ = require(authCommon.Utils.PreviousAccountEntry)
local gameParams = require(parent.ExperienceService).GameParams
local _ = { passkeySignupName = "PasskeySignupName" }
local t = {
	setRobloxLocaleId = function(value)
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.RobloxLocaleId, value)
	end,
	setGameLocaleId = function(value)
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.GameLocaleId, value)
	end,
	getAuthenticatedTheme = function()
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return appStorageService:GetItem(authLocalStorageKeysModule.AuthenticatedTheme)
	end,
	setAuthenticatedTheme = function(value)
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.AuthenticatedTheme, value)
	end,
	getAccountBlob = function()
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return if game:GetEngineFeature("AccountSwitchFeatureEnabled") then appStorageService:GetItem(authLocalStorageKeysModule.AccountBlob) or "" else ""
	end,
	setAccountBlob = function(value)
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		if game:GetEngineFeature("AccountSwitchFeatureEnabled") then
			appStorageService:SetItem(authLocalStorageKeysModule.AccountBlob, value or "")
		end
	end,
	getDefaultUsername = function()
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return appStorageService:GetItem(authLocalStorageKeysModule.CredentialValue)
	end,
	getSignupActionRequired = function()
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return appStorageService:GetItem(authLocalStorageKeysModule.SignupActionRequired)
	end,
	setSignupActionRequired = function(value)
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.SignupActionRequired, value)
	end,
	getAccountSwitcherMetadataMap = function()
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then appStorageService:GetItem(authLocalStorageKeysModule.AccountSwitcherMetadataMap) or "" else ""
	end,
	setAccountSwitcherMetadataMap = function(value)
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
			appStorageService:SetItem(authLocalStorageKeysModule.AccountSwitcherMetadataMap, value or "")
		end
	end
}

function t.setAccountSwitchStartupQueryParams(value)
	-- upvalues: httpService (ref), t (ref)
	if typeof(value) == "table" then
		value = httpService:JSONEncode(value)
	end
	if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		local var1
		local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
		local _ = nil
		
		if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
			var1 = { AccountSwitchStartupQueryParams = value }
		else
			var1 = httpService:JSONDecode(accountSwitcherMetadataMap)
			var1.AccountSwitchStartupQueryParams = value
		end
		t.setAccountSwitcherMetadataMap(httpService:JSONEncode(var1))
	end
end

function t.clearAccountSwitchStartupGameParams()
	-- upvalues: t (ref)
	t.setAccountSwitchStartupQueryParams("")
end

function t.getAccountSwitchStartupGameParams()
	-- upvalues: t (ref), httpService (ref), gameParams (ref)
	if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		return nil
	end
	local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
	
	if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
		return nil
	end
	local var1 = httpService:JSONDecode(accountSwitcherMetadataMap)
	
	if var1 == nil or var1 == "" or (next(var1) == nil or next(var1) == "") or var1.AccountSwitchTargetUsername == nil then
		return nil
	end
	local accountSwitchStartupQueryParams = var1.AccountSwitchStartupQueryParams
	
	if accountSwitchStartupQueryParams == nil or accountSwitchStartupQueryParams == "" then
		return nil
	end
	accountSwitchStartupQueryParams = httpService:JSONDecode(accountSwitchStartupQueryParams)
	
	local _ = function(p1)
		local var2 = tonumber(p1)
		
		return var2 or (p1 == "true" or (if p1 == "false" then false else p1))
	end
	
	local var2 = gameParams.fromParams(accountSwitchStartupQueryParams)
	
	for i, v in pairs(accountSwitchStartupQueryParams) do
		local var3 = tonumber(v)
		var2[i] = var3 or (v == "true" or (if v == "false" then false else v))
	end
	return var2
end

function t.getAccountSwitchTargetUsername()
	-- upvalues: t (ref), httpService (ref)
	if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		return ""
	end
	local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
	
	if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
		return ""
	end
	local var4 = httpService:JSONDecode(accountSwitcherMetadataMap)
	
	return if var4 == nil or var4 == "" or (next(var4) == nil or next(var4) == "") or var4.AccountSwitchTargetUsername == nil then "" else var4.AccountSwitchTargetUsername
end

function t.setAccountSwitchTargetUsername(value)
	-- upvalues: t (ref), httpService (ref)
	if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		local var4
		local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
		local _ = nil
		
		if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
			var4 = { AccountSwitchTargetUsername = value }
		else
			var4 = httpService:JSONDecode(accountSwitcherMetadataMap)
			var4.AccountSwitchTargetUsername = value
		end
		t.setAccountSwitcherMetadataMap(httpService:JSONEncode(var4))
	end
end

function t.getAccountSwitchStatus()
	-- upvalues: t (ref), httpService (ref)
	if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		return ""
	end
	local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
	
	if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
		return ""
	end
	local var4 = httpService:JSONDecode(accountSwitcherMetadataMap)
	
	return if var4 == nil or var4 == "" or (next(var4) == nil or next(var4) == "") or var4.AccountSwitchStatus == nil then "" else var4.AccountSwitchStatus
end

function t.setAccountSwitchStatus(value)
	-- upvalues: t (ref), httpService (ref)
	if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		local var4
		local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
		local _ = nil
		
		if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
			var4 = { AccountSwitchStatus = value }
		else
			var4 = httpService:JSONDecode(accountSwitcherMetadataMap)
			var4.AccountSwitchStatus = value
		end
		t.setAccountSwitcherMetadataMap(httpService:JSONEncode(var4))
	end
end

function t.getMultipageSignupMetadataMap()
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	return appStorageService:GetItem(authLocalStorageKeysModule.MultipageSignupMetadataMap) or ""
end

function t.setMultipageSignupMetadataMap(value)
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	appStorageService:SetItem(authLocalStorageKeysModule.MultipageSignupMetadataMap, value or "")
end

function t.getIncompleteSignupUserId()
	-- upvalues: t (ref), httpService (ref)
	local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
	
	if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
		return ""
	end
	local var4 = httpService:JSONDecode(multipageSignupMetadataMap)
	
	return if var4 == nil or var4 == "" or (next(var4) == nil or next(var4) == "") or var4.IncompleteSignupUserId == nil then "" else var4.IncompleteSignupUserId
end

function t.setIncompleteSignupUserId(value)
	-- upvalues: getFFlagEnableMultiPageSignup (ref), t (ref), httpService (ref)
	if getFFlagEnableMultiPageSignup() then
		local var4
		local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
		local _ = nil
		
		if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
			var4 = { IncompleteSignupUserId = value }
		else
			var4 = httpService:JSONDecode(multipageSignupMetadataMap)
			var4.IncompleteSignupUserId = value
		end
		t.setMultipageSignupMetadataMap(httpService:JSONEncode(var4))
	end
end

function t.getIncompleteSignupUsername()
	-- upvalues: t (ref), httpService (ref)
	local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
	
	if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
		return ""
	end
	local var4 = httpService:JSONDecode(multipageSignupMetadataMap)
	
	return if var4 == nil or var4 == "" or (next(var4) == nil or next(var4) == "") or var4.IncompleteSignupUsername == nil then "" else var4.IncompleteSignupUsername
end

function t.setIncompleteSignupUsername(value)
	-- upvalues: getFFlagEnableMultiPageSignup (ref), t (ref), httpService (ref)
	if getFFlagEnableMultiPageSignup() then
		local var4
		local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
		local _ = nil
		
		if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
			var4 = { IncompleteSignupUsername = value }
		else
			var4 = httpService:JSONDecode(multipageSignupMetadataMap)
			var4.IncompleteSignupUsername = value
		end
		t.setMultipageSignupMetadataMap(httpService:JSONEncode(var4))
	end
end

function getMultiPageSignupKey(value)
	-- upvalues: t (ref), httpService (ref)
	local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
	
	if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
		return ""
	end
	local var4 = httpService:JSONDecode(multipageSignupMetadataMap)
	
	return if var4 == nil or var4 == "" or (next(var4) == nil or next(var4) == "") or var4[value] == nil then "" else var4[value]
end

function setMultiPageSignupKey(value, p1)
	-- upvalues: t (ref), httpService (ref)
	if game:GetEngineFeature("MultipageSignupMetadataMapKeyAvailable") then
		local var4
		local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
		local _ = nil
		
		if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
			var4 = { [value] = p1 }
		else
			var4 = httpService:JSONDecode(multipageSignupMetadataMap)
			var4[value] = p1
		end
		t.setMultipageSignupMetadataMap(httpService:JSONEncode(var4))
	end
end

function t.getPasskeySignupUsername()
	return getMultiPageSignupKey("PasskeySignupName")
end

function t.setPasskeySignupUsername(value)
	setMultiPageSignupKey("PasskeySignupName", value)
end

function t.getPreviousAccountsList()
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref), httpService (ref)
	if not game:GetEngineFeature("PreviousAccountsListAvailable") then
		return {}
	end
	local previousAccountsList = appStorageService:GetItem(authLocalStorageKeysModule.PreviousAccountsList) or ""
	local _ = nil
	
	return if previousAccountsList == "" then {} else httpService:JSONDecode(previousAccountsList)
end

function t.setPreviousAccountsList(value)
	-- upvalues: httpService (ref), appStorageService (ref), authLocalStorageKeysModule (ref)
	if game:GetEngineFeature("PreviousAccountsListAvailable") then
		appStorageService:SetItem(authLocalStorageKeysModule.PreviousAccountsList, httpService:JSONEncode(value))
		appStorageService:flush()
	end
end

function t.getLastSuccessfulSignInMethod()
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	return if game:GetEngineFeature("LastSuccessfulSignInMethodKeyAvailable") then appStorageService:GetItem(authLocalStorageKeysModule.LastSuccessfulSignInMethod) else ""
end

function t.setLastSuccessfulSignInMethod(value)
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	if game:GetEngineFeature("LastSuccessfulSignInMethodKeyAvailable") then
		appStorageService:SetItem(authLocalStorageKeysModule.LastSuccessfulSignInMethod, value)
	end
end

function t.setDiscoveryClientFallbackCache(value)
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	if game:GetEngineFeature("UniversalAppDiscoveryClientFallbackCacheStorageKey") then
		appStorageService:SetItem(authLocalStorageKeysModule.DiscoveryClientFallbackCache, value)
	end
end

function t.flush()
	-- upvalues: appStorageService (ref)
	appStorageService:flush()
end

return t