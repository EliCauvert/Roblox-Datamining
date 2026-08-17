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
	setRobloxLocaleId = function(value) --[[ line: 19 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.RobloxLocaleId, value)
	end,
	setGameLocaleId = function(value) --[[ line: 24 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.GameLocaleId, value)
	end,
	getAuthenticatedTheme = function() --[[ line: 28 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return appStorageService:GetItem(authLocalStorageKeysModule.AuthenticatedTheme)
	end,
	setAuthenticatedTheme = function(value) --[[ line: 32 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.AuthenticatedTheme, value)
	end,
	getAccountBlob = function() --[[ line: 36 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return if game:GetEngineFeature("AccountSwitchFeatureEnabled") then appStorageService:GetItem(authLocalStorageKeysModule.AccountBlob) or "" else ""
	end,
	setAccountBlob = function(value) --[[ line: 43 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		if game:GetEngineFeature("AccountSwitchFeatureEnabled") then
			appStorageService:SetItem(authLocalStorageKeysModule.AccountBlob, value or "")
		end
	end,
	getDefaultUsername = function() --[[ line: 49 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return appStorageService:GetItem(authLocalStorageKeysModule.CredentialValue)
	end,
	getSignupActionRequired = function() --[[ line: 53 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return appStorageService:GetItem(authLocalStorageKeysModule.SignupActionRequired)
	end,
	setSignupActionRequired = function(value) --[[ line: 57 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.SignupActionRequired, value)
	end,
	getAccountSwitcherMetadataMap = function() --[[ line: 61 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then appStorageService:GetItem(authLocalStorageKeysModule.AccountSwitcherMetadataMap) or "" else ""
	end,
	setAccountSwitcherMetadataMap = function(value) --[[ line: 68 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
			appStorageService:SetItem(authLocalStorageKeysModule.AccountSwitcherMetadataMap, value or "")
		end
	end
}

function t.setAccountSwitchStartupQueryParams(value) --[[ line: 74 ]]
	-- upvalues: httpService (ref), t (ref)
	if typeof(value) == "table" then
		value = httpService:JSONEncode(value)
	end
	if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		local var6
		local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
		local _ = nil
		
		if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
			var6 = { AccountSwitchStartupQueryParams = value }
		else
			var6 = httpService:JSONDecode(accountSwitcherMetadataMap)
			var6.AccountSwitchStartupQueryParams = value
		end
		t.setAccountSwitcherMetadataMap(httpService:JSONEncode(var6))
	end
end

function t.clearAccountSwitchStartupGameParams() --[[ line: 95 ]]
	-- upvalues: t (ref)
	t.setAccountSwitchStartupQueryParams("")
end

function t.getAccountSwitchStartupGameParams() --[[ line: 99 ]]
	-- upvalues: t (ref), httpService (ref), gameParams (ref)
	if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		return nil
	end
	local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
	
	if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
		return nil
	end
	local var8 = httpService:JSONDecode(accountSwitcherMetadataMap)
	
	if var8 == nil or var8 == "" or (next(var8) == nil or next(var8) == "") or var8.AccountSwitchTargetUsername == nil then
		return nil
	end
	local accountSwitchStartupQueryParams = var8.AccountSwitchStartupQueryParams
	
	if accountSwitchStartupQueryParams == nil or accountSwitchStartupQueryParams == "" then
		return nil
	end
	accountSwitchStartupQueryParams = httpService:JSONDecode(accountSwitchStartupQueryParams)
	
	local _ = function(p0) --[[ line: 123 ]]
		local var11 = tonumber(p0)
		
		return var11 or (p0 == "true" or (if p0 == "false" then false else p0))
	end
	
	local var9 = gameParams.fromParams(accountSwitchStartupQueryParams)
	
	for i, v in pairs(accountSwitchStartupQueryParams) do
		local var10 = tonumber(v)
		var9[i] = var10 or (v == "true" or (if v == "false" then false else v))
	end
	return var9
end

function t.getAccountSwitchTargetUsername() --[[ line: 151 ]]
	-- upvalues: t (ref), httpService (ref)
	if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		return ""
	end
	local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
	
	if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
		return ""
	end
	local var13 = httpService:JSONDecode(accountSwitcherMetadataMap)
	
	return if var13 == nil or var13 == "" or (next(var13) == nil or next(var13) == "") or var13.AccountSwitchTargetUsername == nil then "" else var13.AccountSwitchTargetUsername
end

function t.setAccountSwitchTargetUsername(value) --[[ line: 172 ]]
	-- upvalues: t (ref), httpService (ref)
	if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		local var15
		local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
		local _ = nil
		
		if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
			var15 = { AccountSwitchTargetUsername = value }
		else
			var15 = httpService:JSONDecode(accountSwitcherMetadataMap)
			var15.AccountSwitchTargetUsername = value
		end
		t.setAccountSwitcherMetadataMap(httpService:JSONEncode(var15))
	end
end

function t.getAccountSwitchStatus() --[[ line: 188 ]]
	-- upvalues: t (ref), httpService (ref)
	if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		return ""
	end
	local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
	
	if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
		return ""
	end
	local var17 = httpService:JSONDecode(accountSwitcherMetadataMap)
	
	return if var17 == nil or var17 == "" or (next(var17) == nil or next(var17) == "") or var17.AccountSwitchStatus == nil then "" else var17.AccountSwitchStatus
end

function t.setAccountSwitchStatus(value) --[[ line: 210 ]]
	-- upvalues: t (ref), httpService (ref)
	if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		local var19
		local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
		local _ = nil
		
		if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
			var19 = { AccountSwitchStatus = value }
		else
			var19 = httpService:JSONDecode(accountSwitcherMetadataMap)
			var19.AccountSwitchStatus = value
		end
		t.setAccountSwitcherMetadataMap(httpService:JSONEncode(var19))
	end
end

function t.getMultipageSignupMetadataMap() --[[ line: 226 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	return appStorageService:GetItem(authLocalStorageKeysModule.MultipageSignupMetadataMap) or ""
end

function t.setMultipageSignupMetadataMap(value) --[[ line: 230 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	appStorageService:SetItem(authLocalStorageKeysModule.MultipageSignupMetadataMap, value or "")
end

function t.getIncompleteSignupUserId() --[[ line: 234 ]]
	-- upvalues: t (ref), httpService (ref)
	local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
	
	if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
		return ""
	end
	local var21 = httpService:JSONDecode(multipageSignupMetadataMap)
	
	return if var21 == nil or var21 == "" or (next(var21) == nil or next(var21) == "") or var21.IncompleteSignupUserId == nil then "" else var21.IncompleteSignupUserId
end

function t.setIncompleteSignupUserId(value) --[[ line: 252 ]]
	-- upvalues: getFFlagEnableMultiPageSignup (ref), t (ref), httpService (ref)
	if getFFlagEnableMultiPageSignup() then
		local var23
		local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
		local _ = nil
		
		if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
			var23 = { IncompleteSignupUserId = value }
		else
			var23 = httpService:JSONDecode(multipageSignupMetadataMap)
			var23.IncompleteSignupUserId = value
		end
		t.setMultipageSignupMetadataMap(httpService:JSONEncode(var23))
	end
end

function t.getIncompleteSignupUsername() --[[ line: 268 ]]
	-- upvalues: t (ref), httpService (ref)
	local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
	
	if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
		return ""
	end
	local var25 = httpService:JSONDecode(multipageSignupMetadataMap)
	
	return if var25 == nil or var25 == "" or (next(var25) == nil or next(var25) == "") or var25.IncompleteSignupUsername == nil then "" else var25.IncompleteSignupUsername
end

function t.setIncompleteSignupUsername(value) --[[ line: 286 ]]
	-- upvalues: getFFlagEnableMultiPageSignup (ref), t (ref), httpService (ref)
	if getFFlagEnableMultiPageSignup() then
		local var27
		local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
		local _ = nil
		
		if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
			var27 = { IncompleteSignupUsername = value }
		else
			var27 = httpService:JSONDecode(multipageSignupMetadataMap)
			var27.IncompleteSignupUsername = value
		end
		t.setMultipageSignupMetadataMap(httpService:JSONEncode(var27))
	end
end

function getMultiPageSignupKey(value) --[[ line: 302 ]]
	-- upvalues: t (ref), httpService (ref)
	local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
	
	if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
		return ""
	end
	local var29 = httpService:JSONDecode(multipageSignupMetadataMap)
	
	return if var29 == nil or var29 == "" or (next(var29) == nil or next(var29) == "") or var29[value] == nil then "" else var29[value]
end

function setMultiPageSignupKey(value, p1) --[[ line: 314 ]]
	-- upvalues: t (ref), httpService (ref)
	if game:GetEngineFeature("MultipageSignupMetadataMapKeyAvailable") then
		local var31
		local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
		local _ = nil
		
		if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
			var31 = { [value] = p1 }
		else
			var31 = httpService:JSONDecode(multipageSignupMetadataMap)
			var31[value] = p1
		end
		t.setMultipageSignupMetadataMap(httpService:JSONEncode(var31))
	end
end

function t.getPasskeySignupUsername() --[[ line: 330 ]]
	return getMultiPageSignupKey("PasskeySignupName")
end

function t.setPasskeySignupUsername(value) --[[ line: 334 ]]
	setMultiPageSignupKey("PasskeySignupName", value)
end

function t.getPreviousAccountsList() --[[ line: 338 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref), httpService (ref)
	if not game:GetEngineFeature("PreviousAccountsListAvailable") then
		return {}
	end
	local previousAccountsList = appStorageService:GetItem(authLocalStorageKeysModule.PreviousAccountsList) or ""
	local _ = nil
	
	return if previousAccountsList == "" then {} else httpService:JSONDecode(previousAccountsList)
end

function t.setPreviousAccountsList(value) --[[ line: 352 ]]
	-- upvalues: httpService (ref), appStorageService (ref), authLocalStorageKeysModule (ref)
	if game:GetEngineFeature("PreviousAccountsListAvailable") then
		appStorageService:SetItem(authLocalStorageKeysModule.PreviousAccountsList, httpService:JSONEncode(value))
		appStorageService:flush()
	end
end

function t.getLastSuccessfulSignInMethod() --[[ line: 363 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	return if game:GetEngineFeature("LastSuccessfulSignInMethodKeyAvailable") then appStorageService:GetItem(authLocalStorageKeysModule.LastSuccessfulSignInMethod) else ""
end

function t.setLastSuccessfulSignInMethod(value) --[[ line: 370 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	if game:GetEngineFeature("LastSuccessfulSignInMethodKeyAvailable") then
		appStorageService:SetItem(authLocalStorageKeysModule.LastSuccessfulSignInMethod, value)
	end
end

function t.setDiscoveryClientFallbackCache(value) --[[ line: 376 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	if game:GetEngineFeature("UniversalAppDiscoveryClientFallbackCacheStorageKey") then
		appStorageService:SetItem(authLocalStorageKeysModule.DiscoveryClientFallbackCache, value)
	end
end

function t.flush() --[[ line: 382 ]]
	-- upvalues: appStorageService (ref)
	appStorageService:flush()
end

return t