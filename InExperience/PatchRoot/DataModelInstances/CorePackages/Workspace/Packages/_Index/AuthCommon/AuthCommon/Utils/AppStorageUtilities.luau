local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local authLocalStorageKeysModule = require(authCommon.Enums.AuthLocalStorageKeys)
local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local getFFlagEnableMultiPageSignup = require(parent.SharedFlags).GetFFlagEnableMultiPageSignup
local getFStringAccountSwitcherTruthyVariantId = require(parent.SharedFlags).GetFStringAccountSwitcherTruthyVariantId
local getFStringAccountSwitcherFalsyVariantId = require(parent.SharedFlags).GetFStringAccountSwitcherFalsyVariantId
local _ = require(authCommon.Utils.PreviousAccountEntry)
local gameParams = require(parent.ExperienceService).GameParams
local _ = { passkeySignupName = "PasskeySignupName" }
local t = {
	setRobloxLocaleId = function(value) --[[ line: 21 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.RobloxLocaleId, value)
	end,
	setGameLocaleId = function(value) --[[ line: 26 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.GameLocaleId, value)
	end,
	getAuthenticatedTheme = function() --[[ line: 30 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return appStorageService:GetItem(authLocalStorageKeysModule.AuthenticatedTheme)
	end,
	setAuthenticatedTheme = function(value) --[[ line: 34 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.AuthenticatedTheme, value)
	end,
	getAccountBlob = function() --[[ line: 38 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return if game:GetEngineFeature("AccountSwitchFeatureEnabled") then appStorageService:GetItem(authLocalStorageKeysModule.AccountBlob) or "" else ""
	end,
	setAccountBlob = function(value) --[[ line: 45 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		if game:GetEngineFeature("AccountSwitchFeatureEnabled") then
			appStorageService:SetItem(authLocalStorageKeysModule.AccountBlob, value or "")
		end
	end,
	getDefaultUsername = function() --[[ line: 51 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return appStorageService:GetItem(authLocalStorageKeysModule.CredentialValue)
	end,
	getSignupActionRequired = function() --[[ line: 55 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return appStorageService:GetItem(authLocalStorageKeysModule.SignupActionRequired)
	end,
	setSignupActionRequired = function(value) --[[ line: 59 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		appStorageService:SetItem(authLocalStorageKeysModule.SignupActionRequired, value)
	end,
	getAccountSwitcherMetadataMap = function() --[[ line: 63 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		return if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then appStorageService:GetItem(authLocalStorageKeysModule.AccountSwitcherMetadataMap) or "" else ""
	end,
	setAccountSwitcherMetadataMap = function(value) --[[ line: 70 ]]
		-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
		if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
			appStorageService:SetItem(authLocalStorageKeysModule.AccountSwitcherMetadataMap, value or "")
		end
	end
}

function t.setAccountSwitchStartupQueryParams(value) --[[ line: 76 ]]
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

function t.clearAccountSwitchStartupGameParams() --[[ line: 97 ]]
	-- upvalues: t (ref)
	t.setAccountSwitchStartupQueryParams("")
end

function t.getAccountSwitchStartupGameParams() --[[ line: 101 ]]
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
	
	local _ = function(p0) --[[ line: 125 ]]
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

function t.setAccountSwitcherExperimentVariantId(value) --[[ line: 153 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	if game:GetEngineFeature("AccountSwitcherExperimentVariantIdKeyAvailable") then
		appStorageService:SetItem(authLocalStorageKeysModule.AccountSwitcherExperimentVariantId, value)
	end
end

function t.getAccountSwitcherAvailableByVariantId() --[[ line: 159 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref), getFStringAccountSwitcherFalsyVariantId (ref), getFStringAccountSwitcherTruthyVariantId (ref)
	if not game:GetEngineFeature("AccountSwitcherExperimentVariantIdKeyAvailable") then
		return false
	end
	local accountSwitcherExperimentVariantIdItem = appStorageService:GetItem(authLocalStorageKeysModule.AccountSwitcherExperimentVariantId)
	
	return if accountSwitcherExperimentVariantIdItem == getFStringAccountSwitcherFalsyVariantId() then false else accountSwitcherExperimentVariantIdItem == getFStringAccountSwitcherTruthyVariantId() or nil
end

function t.getAccountSwitchTargetUsername() --[[ line: 178 ]]
	-- upvalues: t (ref), httpService (ref)
	if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		return ""
	end
	local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
	
	if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
		return ""
	end
	local var14 = httpService:JSONDecode(accountSwitcherMetadataMap)
	
	return if var14 == nil or var14 == "" or (next(var14) == nil or next(var14) == "") or var14.AccountSwitchTargetUsername == nil then "" else var14.AccountSwitchTargetUsername
end

function t.setAccountSwitchTargetUsername(value) --[[ line: 199 ]]
	-- upvalues: t (ref), httpService (ref)
	if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		local var16
		local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
		local _ = nil
		
		if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
			var16 = { AccountSwitchTargetUsername = value }
		else
			var16 = httpService:JSONDecode(accountSwitcherMetadataMap)
			var16.AccountSwitchTargetUsername = value
		end
		t.setAccountSwitcherMetadataMap(httpService:JSONEncode(var16))
	end
end

function t.getAccountSwitchStatus() --[[ line: 215 ]]
	-- upvalues: t (ref), httpService (ref)
	if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		return ""
	end
	local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
	
	if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
		return ""
	end
	local var18 = httpService:JSONDecode(accountSwitcherMetadataMap)
	
	return if var18 == nil or var18 == "" or (next(var18) == nil or next(var18) == "") or var18.AccountSwitchStatus == nil then "" else var18.AccountSwitchStatus
end

function t.setAccountSwitchStatus(value) --[[ line: 237 ]]
	-- upvalues: t (ref), httpService (ref)
	if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		local var20
		local accountSwitcherMetadataMap = t.getAccountSwitcherMetadataMap()
		local _ = nil
		
		if accountSwitcherMetadataMap == nil or accountSwitcherMetadataMap == "" then
			var20 = { AccountSwitchStatus = value }
		else
			var20 = httpService:JSONDecode(accountSwitcherMetadataMap)
			var20.AccountSwitchStatus = value
		end
		t.setAccountSwitcherMetadataMap(httpService:JSONEncode(var20))
	end
end

function t.getMultipageSignupMetadataMap() --[[ line: 253 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	return appStorageService:GetItem(authLocalStorageKeysModule.MultipageSignupMetadataMap) or ""
end

function t.setMultipageSignupMetadataMap(value) --[[ line: 257 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	appStorageService:SetItem(authLocalStorageKeysModule.MultipageSignupMetadataMap, value or "")
end

function t.getIncompleteSignupUserId() --[[ line: 261 ]]
	-- upvalues: t (ref), httpService (ref)
	local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
	
	if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
		return ""
	end
	local var22 = httpService:JSONDecode(multipageSignupMetadataMap)
	
	return if var22 == nil or var22 == "" or (next(var22) == nil or next(var22) == "") or var22.IncompleteSignupUserId == nil then "" else var22.IncompleteSignupUserId
end

function t.setIncompleteSignupUserId(value) --[[ line: 279 ]]
	-- upvalues: getFFlagEnableMultiPageSignup (ref), t (ref), httpService (ref)
	if getFFlagEnableMultiPageSignup() then
		local var24
		local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
		local _ = nil
		
		if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
			var24 = { IncompleteSignupUserId = value }
		else
			var24 = httpService:JSONDecode(multipageSignupMetadataMap)
			var24.IncompleteSignupUserId = value
		end
		t.setMultipageSignupMetadataMap(httpService:JSONEncode(var24))
	end
end

function t.getIncompleteSignupUsername() --[[ line: 295 ]]
	-- upvalues: t (ref), httpService (ref)
	local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
	
	if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
		return ""
	end
	local var26 = httpService:JSONDecode(multipageSignupMetadataMap)
	
	return if var26 == nil or var26 == "" or (next(var26) == nil or next(var26) == "") or var26.IncompleteSignupUsername == nil then "" else var26.IncompleteSignupUsername
end

function t.setIncompleteSignupUsername(value) --[[ line: 313 ]]
	-- upvalues: getFFlagEnableMultiPageSignup (ref), t (ref), httpService (ref)
	if getFFlagEnableMultiPageSignup() then
		local var28
		local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
		local _ = nil
		
		if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
			var28 = { IncompleteSignupUsername = value }
		else
			var28 = httpService:JSONDecode(multipageSignupMetadataMap)
			var28.IncompleteSignupUsername = value
		end
		t.setMultipageSignupMetadataMap(httpService:JSONEncode(var28))
	end
end

function getMultiPageSignupKey(value) --[[ line: 329 ]]
	-- upvalues: t (ref), httpService (ref)
	local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
	
	if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
		return ""
	end
	local var30 = httpService:JSONDecode(multipageSignupMetadataMap)
	
	return if var30 == nil or var30 == "" or (next(var30) == nil or next(var30) == "") or var30[value] == nil then "" else var30[value]
end

function setMultiPageSignupKey(value, p1) --[[ line: 341 ]]
	-- upvalues: t (ref), httpService (ref)
	if game:GetEngineFeature("MultipageSignupMetadataMapKeyAvailable") then
		local var32
		local multipageSignupMetadataMap = t.getMultipageSignupMetadataMap()
		local _ = nil
		
		if multipageSignupMetadataMap == nil or multipageSignupMetadataMap == "" then
			var32 = { [value] = p1 }
		else
			var32 = httpService:JSONDecode(multipageSignupMetadataMap)
			var32[value] = p1
		end
		t.setMultipageSignupMetadataMap(httpService:JSONEncode(var32))
	end
end

function t.getPasskeySignupUsername() --[[ line: 357 ]]
	return getMultiPageSignupKey("PasskeySignupName")
end

function t.setPasskeySignupUsername(value) --[[ line: 361 ]]
	setMultiPageSignupKey("PasskeySignupName", value)
end

function t.getPreviousAccountsList() --[[ line: 365 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref), httpService (ref)
	if not game:GetEngineFeature("PreviousAccountsListAvailable") then
		return {}
	end
	local previousAccountsList = appStorageService:GetItem(authLocalStorageKeysModule.PreviousAccountsList) or ""
	local _ = nil
	
	return if previousAccountsList == "" then {} else httpService:JSONDecode(previousAccountsList)
end

function t.setPreviousAccountsList(value) --[[ line: 379 ]]
	-- upvalues: httpService (ref), appStorageService (ref), authLocalStorageKeysModule (ref)
	if game:GetEngineFeature("PreviousAccountsListAvailable") then
		appStorageService:SetItem(authLocalStorageKeysModule.PreviousAccountsList, httpService:JSONEncode(value))
		appStorageService:flush()
	end
end

function t.getLastSuccessfulSignInMethod() --[[ line: 390 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	return if game:GetEngineFeature("LastSuccessfulSignInMethodKeyAvailable") then appStorageService:GetItem(authLocalStorageKeysModule.LastSuccessfulSignInMethod) else ""
end

function t.setLastSuccessfulSignInMethod(value) --[[ line: 397 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	if game:GetEngineFeature("LastSuccessfulSignInMethodKeyAvailable") then
		appStorageService:SetItem(authLocalStorageKeysModule.LastSuccessfulSignInMethod, value)
	end
end

function t.setDiscoveryClientFallbackCache(value) --[[ line: 403 ]]
	-- upvalues: appStorageService (ref), authLocalStorageKeysModule (ref)
	if game:GetEngineFeature("UniversalAppDiscoveryClientFallbackCacheStorageKey") then
		appStorageService:SetItem(authLocalStorageKeysModule.DiscoveryClientFallbackCache, value)
	end
end

function t.flush() --[[ line: 409 ]]
	-- upvalues: appStorageService (ref)
	appStorageService:flush()
end

return t