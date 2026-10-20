local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local AuthLocalStorageKeysModule = require(AuthCommon.Enums.AuthLocalStorageKeys)
local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local GetFFlagEnableMultiPageSignupFunction = require(Parent.SharedFlags).GetFFlagEnableMultiPageSignup
local _ = require(AuthCommon.Utils.PreviousAccountEntry)
local GameParams = require(Parent.ExperienceService).GameParams
local AppStorageUtilitiesModule = {
	setRobloxLocaleId = function(Value)
		-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
		AppStorageService:SetItem(AuthLocalStorageKeysModule.RobloxLocaleId, Value)
	end,
	setGameLocaleId = function(Value)
		-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
		AppStorageService:SetItem(AuthLocalStorageKeysModule.GameLocaleId, Value)
	end,
	getAuthenticatedTheme = function()
		-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
		return AppStorageService:GetItem(AuthLocalStorageKeysModule.AuthenticatedTheme)
	end,
	setAuthenticatedTheme = function(Value)
		-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
		AppStorageService:SetItem(AuthLocalStorageKeysModule.AuthenticatedTheme, Value)
	end,
	getAccountBlob = function()
		-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
		return game:GetEngineFeature("AccountSwitchFeatureEnabled") and AppStorageService:GetItem(AuthLocalStorageKeysModule.AccountBlob) or ""
	end,
	setAccountBlob = function(p1)
		-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
		if game:GetEngineFeature("AccountSwitchFeatureEnabled") then
			AppStorageService:SetItem(AuthLocalStorageKeysModule.AccountBlob, p1 or "")
		end
	end,
	getDefaultUsername = function()
		-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
		return AppStorageService:GetItem(AuthLocalStorageKeysModule.CredentialValue)
	end,
	getSignupActionRequired = function()
		-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
		return AppStorageService:GetItem(AuthLocalStorageKeysModule.SignupActionRequired)
	end,
	setSignupActionRequired = function(Value)
		-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
		AppStorageService:SetItem(AuthLocalStorageKeysModule.SignupActionRequired, Value)
	end,
	getAccountSwitcherMetadataMap = function()
		-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
		return game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") and AppStorageService:GetItem(AuthLocalStorageKeysModule.AccountSwitcherMetadataMap) or ""
	end,
	setAccountSwitcherMetadataMap = function(Json)
		-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
		if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
			AppStorageService:SetItem(AuthLocalStorageKeysModule.AccountSwitcherMetadataMap, Json or "")
		end
	end
}

function AppStorageUtilitiesModule.setAccountSwitchStartupQueryParams(AccountSwitchStartupQueryParams)
	-- upvalues: HttpService (copy), AppStorageUtilitiesModule (copy)
	if typeof(AccountSwitchStartupQueryParams) == "table" then
		AccountSwitchStartupQueryParams = HttpService:JSONEncode(AccountSwitchStartupQueryParams)
	end
	if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		local AccountSwitcherMetadataMap = AppStorageUtilitiesModule.getAccountSwitcherMetadataMap()
		local config = nil
		
		if AccountSwitcherMetadataMap == nil or AccountSwitcherMetadataMap == "" then
			config = {
				AccountSwitchStartupQueryParams = AccountSwitchStartupQueryParams
			}
		else
			config = HttpService:JSONDecode(AccountSwitcherMetadataMap)
			config.AccountSwitchStartupQueryParams = AccountSwitchStartupQueryParams
		end
		AppStorageUtilitiesModule.setAccountSwitcherMetadataMap(HttpService:JSONEncode(config))
	end
end

function AppStorageUtilitiesModule.clearAccountSwitchStartupGameParams()
	-- upvalues: AppStorageUtilitiesModule (copy)
	AppStorageUtilitiesModule.setAccountSwitchStartupQueryParams("")
end

function AppStorageUtilitiesModule.getAccountSwitchStartupGameParams()
	-- upvalues: AppStorageUtilitiesModule (copy), HttpService (copy), GameParams (copy)
	if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		return nil
	end
	local AccountSwitcherMetadataMap = AppStorageUtilitiesModule.getAccountSwitcherMetadataMap()
	
	if AccountSwitcherMetadataMap == nil or AccountSwitcherMetadataMap == "" then
		return nil
	end
	local Data = HttpService:JSONDecode(AccountSwitcherMetadataMap)
	
	if Data == nil or Data == "" or next(Data) == nil or next(Data) == "" or Data.AccountSwitchTargetUsername == nil then
		return nil
	end
	local AccountSwitchStartupQueryParams = Data.AccountSwitchStartupQueryParams
	
	if AccountSwitchStartupQueryParams == nil or AccountSwitchStartupQueryParams == "" then
		return nil
	end
	local Data1 = HttpService:JSONDecode(AccountSwitchStartupQueryParams)
	
	local function _(p1)
		local Number: number? = tonumber(p1)
		
		return if Number then Number else p1 == "true" or p1 ~= "false" and p1
	end
	
	local FromParamsResult = GameParams.fromParams(Data1)
	
	for i, entry in pairs(Data1) do
		local Number: number? = tonumber(entry)
		FromParamsResult[i] = if Number then Number else entry == "true" or entry ~= "false" and entry
	end
	return FromParamsResult
end

function AppStorageUtilitiesModule.getAccountSwitchTargetUsername()
	-- upvalues: AppStorageUtilitiesModule (copy), HttpService (copy)
	if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		return ""
	end
	local AccountSwitcherMetadataMap = AppStorageUtilitiesModule.getAccountSwitcherMetadataMap()
	
	if AccountSwitcherMetadataMap == nil or AccountSwitcherMetadataMap == "" then
		return ""
	else
		local Data = HttpService:JSONDecode(AccountSwitcherMetadataMap)
		
		return if Data == nil or Data == "" or next(Data) == nil or next(Data) == "" or Data.AccountSwitchTargetUsername == nil then "" else Data.AccountSwitchTargetUsername
	end
end

function AppStorageUtilitiesModule.setAccountSwitchTargetUsername(AccountSwitchTargetUsername)
	-- upvalues: AppStorageUtilitiesModule (copy), HttpService (copy)
	if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		local AccountSwitcherMetadataMap = AppStorageUtilitiesModule.getAccountSwitcherMetadataMap()
		local config = nil
		
		if AccountSwitcherMetadataMap == nil or AccountSwitcherMetadataMap == "" then
			config = {
				AccountSwitchTargetUsername = AccountSwitchTargetUsername
			}
		else
			config = HttpService:JSONDecode(AccountSwitcherMetadataMap)
			config.AccountSwitchTargetUsername = AccountSwitchTargetUsername
		end
		AppStorageUtilitiesModule.setAccountSwitcherMetadataMap(HttpService:JSONEncode(config))
	end
end

function AppStorageUtilitiesModule.getAccountSwitchStatus()
	-- upvalues: AppStorageUtilitiesModule (copy), HttpService (copy)
	if not game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		return ""
	end
	local AccountSwitcherMetadataMap = AppStorageUtilitiesModule.getAccountSwitcherMetadataMap()
	
	if AccountSwitcherMetadataMap == nil or AccountSwitcherMetadataMap == "" then
		return ""
	else
		local Data = HttpService:JSONDecode(AccountSwitcherMetadataMap)
		
		return if Data == nil or Data == "" or next(Data) == nil or next(Data) == "" or Data.AccountSwitchStatus == nil then "" else Data.AccountSwitchStatus
	end
end

function AppStorageUtilitiesModule.setAccountSwitchStatus(AccountSwitchStatus)
	-- upvalues: AppStorageUtilitiesModule (copy), HttpService (copy)
	if game:GetEngineFeature("AccountSwitcherMetadataMapKeyAvailable") then
		local AccountSwitcherMetadataMap = AppStorageUtilitiesModule.getAccountSwitcherMetadataMap()
		local config = nil
		
		if AccountSwitcherMetadataMap == nil or AccountSwitcherMetadataMap == "" then
			config = { AccountSwitchStatus = AccountSwitchStatus }
		else
			config = HttpService:JSONDecode(AccountSwitcherMetadataMap)
			config.AccountSwitchStatus = AccountSwitchStatus
		end
		AppStorageUtilitiesModule.setAccountSwitcherMetadataMap(HttpService:JSONEncode(config))
	end
end

function AppStorageUtilitiesModule.getMultipageSignupMetadataMap()
	-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
	return AppStorageService:GetItem(AuthLocalStorageKeysModule.MultipageSignupMetadataMap) or ""
end

function AppStorageUtilitiesModule.setMultipageSignupMetadataMap(Json)
	-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
	AppStorageService:SetItem(AuthLocalStorageKeysModule.MultipageSignupMetadataMap, Json or "")
end

function AppStorageUtilitiesModule.getIncompleteSignupUserId()
	-- upvalues: AppStorageUtilitiesModule (copy), HttpService (copy)
	local MultipageSignupMetadataMap = AppStorageUtilitiesModule.getMultipageSignupMetadataMap()
	
	if MultipageSignupMetadataMap == nil or MultipageSignupMetadataMap == "" then
		return ""
	else
		local Data = HttpService:JSONDecode(MultipageSignupMetadataMap)
		
		return if Data == nil or Data == "" or next(Data) == nil or next(Data) == "" or Data.IncompleteSignupUserId == nil then "" else Data.IncompleteSignupUserId
	end
end

function AppStorageUtilitiesModule.setIncompleteSignupUserId(IncompleteSignupUserId)
	-- upvalues: GetFFlagEnableMultiPageSignupFunction (copy), AppStorageUtilitiesModule (copy), HttpService (copy)
	if GetFFlagEnableMultiPageSignupFunction() then
		local MultipageSignupMetadataMap = AppStorageUtilitiesModule.getMultipageSignupMetadataMap()
		local config = nil
		
		if MultipageSignupMetadataMap == nil or MultipageSignupMetadataMap == "" then
			config = { IncompleteSignupUserId = IncompleteSignupUserId }
		else
			config = HttpService:JSONDecode(MultipageSignupMetadataMap)
			config.IncompleteSignupUserId = IncompleteSignupUserId
		end
		AppStorageUtilitiesModule.setMultipageSignupMetadataMap(HttpService:JSONEncode(config))
	end
end

function AppStorageUtilitiesModule.getIncompleteSignupUsername()
	-- upvalues: AppStorageUtilitiesModule (copy), HttpService (copy)
	local MultipageSignupMetadataMap = AppStorageUtilitiesModule.getMultipageSignupMetadataMap()
	
	if MultipageSignupMetadataMap == nil or MultipageSignupMetadataMap == "" then
		return ""
	else
		local Data = HttpService:JSONDecode(MultipageSignupMetadataMap)
		
		return if Data == nil or Data == "" or next(Data) == nil or next(Data) == "" or Data.IncompleteSignupUsername == nil then "" else Data.IncompleteSignupUsername
	end
end

function AppStorageUtilitiesModule.setIncompleteSignupUsername(IncompleteSignupUsername)
	-- upvalues: GetFFlagEnableMultiPageSignupFunction (copy), AppStorageUtilitiesModule (copy), HttpService (copy)
	if GetFFlagEnableMultiPageSignupFunction() then
		local MultipageSignupMetadataMap = AppStorageUtilitiesModule.getMultipageSignupMetadataMap()
		local config = nil
		
		if MultipageSignupMetadataMap == nil or MultipageSignupMetadataMap == "" then
			config = { IncompleteSignupUsername = IncompleteSignupUsername }
		else
			config = HttpService:JSONDecode(MultipageSignupMetadataMap)
			config.IncompleteSignupUsername = IncompleteSignupUsername
		end
		AppStorageUtilitiesModule.setMultipageSignupMetadataMap(HttpService:JSONEncode(config))
	end
end

function getMultiPageSignupKey(p1)
	-- upvalues: AppStorageUtilitiesModule (copy), HttpService (copy)
	local MultipageSignupMetadataMap = AppStorageUtilitiesModule.getMultipageSignupMetadataMap()
	
	if MultipageSignupMetadataMap == nil or MultipageSignupMetadataMap == "" then
		return ""
	else
		local Data = HttpService:JSONDecode(MultipageSignupMetadataMap)
		
		return if Data == nil or Data == "" or next(Data) == nil or next(Data) == "" or Data[p1] == nil then "" else Data[p1]
	end
end

function setMultiPageSignupKey(Key, p1)
	-- upvalues: AppStorageUtilitiesModule (copy), HttpService (copy)
	if game:GetEngineFeature("MultipageSignupMetadataMapKeyAvailable") then
		local MultipageSignupMetadataMap = AppStorageUtilitiesModule.getMultipageSignupMetadataMap()
		local config = nil
		
		if MultipageSignupMetadataMap == nil or MultipageSignupMetadataMap == "" then
			config = { [Key] = p1 }
		else
			config = HttpService:JSONDecode(MultipageSignupMetadataMap)
			config[Key] = p1
		end
		AppStorageUtilitiesModule.setMultipageSignupMetadataMap(HttpService:JSONEncode(config))
	end
end

function AppStorageUtilitiesModule.getPasskeySignupUsername()
	return getMultiPageSignupKey("PasskeySignupName")
end

function AppStorageUtilitiesModule.setPasskeySignupUsername(p1)
	setMultiPageSignupKey("PasskeySignupName", p1)
end

function AppStorageUtilitiesModule.getPreviousAccountsList()
	-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy), HttpService (copy)
	if game:GetEngineFeature("PreviousAccountsListAvailable") then
		local Item = AppStorageService:GetItem(AuthLocalStorageKeysModule.PreviousAccountsList) or ""
		
		return if Item == "" then {} else HttpService:JSONDecode(Item)
	else
		return {}
	end
end

function AppStorageUtilitiesModule.setPreviousAccountsList(Input)
	-- upvalues: HttpService (copy), AppStorageService (copy), AuthLocalStorageKeysModule (copy)
	if game:GetEngineFeature("PreviousAccountsListAvailable") then
		AppStorageService:SetItem(AuthLocalStorageKeysModule.PreviousAccountsList, (HttpService:JSONEncode(Input)))
		AppStorageService:flush()
	end
end

function AppStorageUtilitiesModule.getLastSuccessfulSignInMethod()
	-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
	return if game:GetEngineFeature("LastSuccessfulSignInMethodKeyAvailable") then AppStorageService:GetItem(AuthLocalStorageKeysModule.LastSuccessfulSignInMethod) else ""
end

function AppStorageUtilitiesModule.setLastSuccessfulSignInMethod(Value)
	-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
	if game:GetEngineFeature("LastSuccessfulSignInMethodKeyAvailable") then
		AppStorageService:SetItem(AuthLocalStorageKeysModule.LastSuccessfulSignInMethod, Value)
	end
end

function AppStorageUtilitiesModule.setDiscoveryClientFallbackCache(Value)
	-- upvalues: AppStorageService (copy), AuthLocalStorageKeysModule (copy)
	if game:GetEngineFeature("UniversalAppDiscoveryClientFallbackCacheStorageKey") then
		AppStorageService:SetItem(AuthLocalStorageKeysModule.DiscoveryClientFallbackCache, Value)
	end
end

function AppStorageUtilitiesModule.flush()
	-- upvalues: AppStorageService (copy)
	AppStorageService:flush()
end

return AppStorageUtilitiesModule