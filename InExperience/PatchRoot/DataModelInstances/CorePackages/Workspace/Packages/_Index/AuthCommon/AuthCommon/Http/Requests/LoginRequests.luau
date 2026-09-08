local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local getSingleSignOnUrlsModule = require(authCommon.Utils.getSingleSignOnUrls)
local consoleAuthRequestWrapper = require(parent.Http).Utils.ConsoleAuthRequestWrapper
local httpService = game:GetService("HttpService")
local appStorageUtilitiesModule = require(authCommon.Utils.AppStorageUtilities)
local loginErrorCodesModule = require(authCommon.Enums.LoginErrorCodes)
local getFFlagLuaAppUsingSecurityQuestionsForLuaLogin = require(parent.SharedFlags).GetFFlagLuaAppUsingSecurityQuestionsForLuaLogin
local getFFlagEnableLoginAccountSelector = require(parent.SharedFlags).GetFFlagEnableLoginAccountSelector
local fFlagEnableLuaAccountSwitch = require(parent.SharedFlags).FFlagEnableLuaAccountSwitch
local fFlagClearAccountBlobForPioneerLoginModule = require(authCommon.Flags.FFlagClearAccountBlobForPioneerLogin)
local isPioneerLaunch = require(parent.PioneerUtils).isPioneerLaunch
local t = {
	logByPasskey = function(p1, p2, p3)
		-- upvalues: httpService (ref), fFlagClearAccountBlobForPioneerLoginModule (ref), isPioneerLaunch (ref), appStorageUtilitiesModule (ref), fFlagEnableLuaAccountSwitch (ref)
		local t = {
			ctype = "Passkey",
			cvalue = httpService:JSONEncode(p2),
			password = p3
		}
		
		if fFlagClearAccountBlobForPioneerLoginModule and isPioneerLaunch() then
			appStorageUtilitiesModule.setAccountBlob("")
			appStorageUtilitiesModule.flush()
		end
		t.accountBlob = fFlagEnableLuaAccountSwitch and appStorageUtilitiesModule.getAccountBlob() or nil
		
		return p1(getLoginUrl(), "POST", { maxRetryCount = 0, postBody = httpService:JSONEncode(t) })
	end,
	logByUsername = function(_, _, _, _, _)
		-- upvalues: httpService (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), fFlagClearAccountBlobForPioneerLoginModule (ref), isPioneerLaunch (ref), appStorageUtilitiesModule (ref), fFlagEnableLuaAccountSwitch (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 34
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end,
	logByEmail = function(_, _, _, _, _, _)
		-- upvalues: httpService (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), getFFlagEnableLoginAccountSelector (ref), fFlagClearAccountBlobForPioneerLoginModule (ref), isPioneerLaunch (ref), appStorageUtilitiesModule (ref), fFlagEnableLuaAccountSwitch (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 52
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end,
	logByPhone = function(_, _, _, _, _, _)
		-- upvalues: httpService (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), getFFlagEnableLoginAccountSelector (ref), fFlagClearAccountBlobForPioneerLoginModule (ref), isPioneerLaunch (ref), appStorageUtilitiesModule (ref), fFlagEnableLuaAccountSwitch (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 71
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end,
	loginWithCode = function(_, _, _, _, _)
		-- upvalues: httpService (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), fFlagClearAccountBlobForPioneerLoginModule (ref), isPioneerLaunch (ref), appStorageUtilitiesModule (ref), fFlagEnableLuaAccountSwitch (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 89
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end,
	logByOtp = function(_, _, _, _, _)
		-- upvalues: httpService (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), getFFlagEnableLoginAccountSelector (ref), fFlagClearAccountBlobForPioneerLoginModule (ref), isPioneerLaunch (ref), appStorageUtilitiesModule (ref), fFlagEnableLuaAccountSwitch (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 106
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end,
	singleSignOnLogin = function(p1)
		-- upvalues: getSingleSignOnUrlsModule (ref), httpService (ref), consoleAuthRequestWrapper (ref), promiseModule (ref), loginErrorCodesModule (ref)
		local var1 = getSingleSignOnUrlsModule()
		local login = var1.login
		
		return if login then consoleAuthRequestWrapper(p1, login(), "POST", {
			maxRetryCount = 0,
			postBody = if var1.linkingPlatform then httpService:JSONEncode({ identityProvider = var1.linkingPlatform }) else "{}"
		}) else promiseModule.reject({ errorCode = loginErrorCodesModule.ServiceUnavailable })
	end,
	singleSignOnConnectWithCode = function(p1, p2, p3)
		-- upvalues: getSingleSignOnUrlsModule (ref), httpService (ref), consoleAuthRequestWrapper (ref), promiseModule (ref), loginErrorCodesModule (ref)
		local var1 = getSingleSignOnUrlsModule()
		local connect = var1.connect
		
		return if connect then consoleAuthRequestWrapper(p1, connect(), "POST", {
			maxRetryCount = 0,
			postBody = httpService:JSONEncode({
				ctype = "AuthToken",
				cvalue = p2,
				password = p3,
				accountLinkParameters = if var1.linkingPlatform then { LinkingPlatform = var1.linkingPlatform } else nil
			})
		}) else promiseModule.reject({ errorCode = loginErrorCodesModule.ServiceUnavailable })
	end,
	singleSignOnConnectWithCredential = function(p1, p2, p3, p4)
		-- upvalues: getSingleSignOnUrlsModule (ref), httpService (ref), consoleAuthRequestWrapper (ref), promiseModule (ref), loginErrorCodesModule (ref)
		local var1 = getSingleSignOnUrlsModule()
		local connect = var1.connect
		
		return if connect then consoleAuthRequestWrapper(p1, connect(), "POST", {
			maxRetryCount = 0,
			postBody = httpService:JSONEncode({
				ctype = p4,
				cvalue = p2,
				password = p3,
				accountLinkParameters = if var1.linkingPlatform then { LinkingPlatform = var1.linkingPlatform } else nil
			})
		}) else promiseModule.reject({ errorCode = loginErrorCodesModule.ServiceUnavailable })
	end
}

function getLoginUrl()
	-- upvalues: url (ref)
	return string.format("%sv2/login", url.AUTH_URL)
end

local function _()
	-- upvalues: fFlagClearAccountBlobForPioneerLoginModule (ref), isPioneerLaunch (ref), appStorageUtilitiesModule (ref), fFlagEnableLuaAccountSwitch (ref)
	if fFlagClearAccountBlobForPioneerLoginModule and isPioneerLaunch() then
		appStorageUtilitiesModule.setAccountBlob("")
		appStorageUtilitiesModule.flush()
	end
	return fFlagEnableLuaAccountSwitch and appStorageUtilitiesModule.getAccountBlob() or nil
end

return t