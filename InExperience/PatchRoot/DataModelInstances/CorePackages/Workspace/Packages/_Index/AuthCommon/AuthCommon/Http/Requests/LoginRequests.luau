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
local t = {
	logByPasskey = function(p0, p1, p2) --[[ line: 32 ]]
		-- upvalues: httpService (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilitiesModule (ref)
		return p0(getLoginUrl(), "POST", {
			maxRetryCount = 0,
			postBody = httpService:JSONEncode({
				ctype = "Passkey",
				cvalue = httpService:JSONEncode(p1),
				password = p2,
				accountBlob = fFlagEnableLuaAccountSwitch and appStorageUtilitiesModule.getAccountBlob() or nil
			})
		})
	end,
	logByUsername = function(_, _, _, _, _) --[[ line: 42 ]]
		-- upvalues: httpService (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilitiesModule (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 24
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end,
	logByEmail = function(_, _, _, _, _, _) --[[ line: 63 ]]
		-- upvalues: httpService (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), getFFlagEnableLoginAccountSelector (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilitiesModule (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 39
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end,
	logByPhone = function(_, _, _, _, _, _) --[[ line: 85 ]]
		-- upvalues: httpService (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), getFFlagEnableLoginAccountSelector (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilitiesModule (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 55
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end,
	loginWithCode = function(_, _, _, _, _) --[[ line: 107 ]]
		-- upvalues: httpService (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilitiesModule (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 70
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end,
	logByOtp = function(_, _, _, _, _) --[[ line: 128 ]]
		-- upvalues: httpService (ref), getFFlagLuaAppUsingSecurityQuestionsForLuaLogin (ref), getFFlagEnableLoginAccountSelector (ref), fFlagEnableLuaAccountSwitch (ref), appStorageUtilitiesModule (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 84
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end,
	singleSignOnLogin = function(p3) --[[ line: 147 ]]
		-- upvalues: getSingleSignOnUrlsModule (ref), httpService (ref), consoleAuthRequestWrapper (ref), promiseModule (ref), loginErrorCodesModule (ref)
		local var7 = getSingleSignOnUrlsModule()
		local login = var7.login
		
		return if login then consoleAuthRequestWrapper(p3, login(), "POST", {
			maxRetryCount = 0,
			postBody = if var7.linkingPlatform then httpService:JSONEncode({ identityProvider = var7.linkingPlatform }) else "{}"
		}) else promiseModule.reject({ errorCode = loginErrorCodesModule.ServiceUnavailable })
	end,
	singleSignOnConnectWithCode = function(p4, p5, p6) --[[ line: 165 ]]
		-- upvalues: getSingleSignOnUrlsModule (ref), httpService (ref), consoleAuthRequestWrapper (ref), promiseModule (ref), loginErrorCodesModule (ref)
		local var8 = getSingleSignOnUrlsModule()
		local connect = var8.connect
		
		return if connect then consoleAuthRequestWrapper(p4, connect(), "POST", {
			maxRetryCount = 0,
			postBody = httpService:JSONEncode({
				ctype = "AuthToken",
				cvalue = p5,
				password = p6,
				accountLinkParameters = if var8.linkingPlatform then { LinkingPlatform = var8.linkingPlatform } else nil
			})
		}) else promiseModule.reject({ errorCode = loginErrorCodesModule.ServiceUnavailable })
	end,
	singleSignOnConnectWithCredential = function(p7, p8, p9, p10) --[[ line: 194 ]]
		-- upvalues: getSingleSignOnUrlsModule (ref), httpService (ref), consoleAuthRequestWrapper (ref), promiseModule (ref), loginErrorCodesModule (ref)
		local var9 = getSingleSignOnUrlsModule()
		local connect = var9.connect
		
		return if connect then consoleAuthRequestWrapper(p7, connect(), "POST", {
			maxRetryCount = 0,
			postBody = httpService:JSONEncode({
				ctype = p10,
				cvalue = p8,
				password = p9,
				accountLinkParameters = if var9.linkingPlatform then { LinkingPlatform = var9.linkingPlatform } else nil
			})
		}) else promiseModule.reject({ errorCode = loginErrorCodesModule.ServiceUnavailable })
	end
}

function getLoginUrl() --[[ line: 28 ]]
	-- upvalues: url (ref)
	return string.format("%sv2/login", url.AUTH_URL)
end

return t