local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local HttpService = game:GetService("HttpService")
local Parent = GenericChallenges.Parent
local Default = require(Parent.CredentialsProtocol).CredentialsProtocol.default
local JavascriptHybridModule = require(GenericChallenges.Types.JavascriptHybrid)
local _ = require(GenericChallenges.Middleware.BuildHybridCallback)
local GetFFlagLuaAppEnableCredentialsProtocolFunction = require(Parent.CredentialsProtocol).Flags.GetFFlagLuaAppEnableCredentialsProtocol
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = require(Parent.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local GetFIntLuaAppCredentialsProtocolTimeoutFunction = require(Parent.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolTimeout
local EnableGetCredentialsInCredentialsProtocolHook = game:DefineFastFlag("EnableGetCredentialsInCredentialsProtocolHook", false)
local ExecuteJavaScriptInWebViewModule = require(GenericChallenges.Utils.ExecuteJavaScriptInWebView)

return function(p1) --[[ Line: 19 ]]
	-- upvalues: Default (copy), ExecuteJavaScriptInWebViewModule (copy), GetFFlagLuaAppEnableCredentialsProtocolFunction (copy), JavascriptHybridModule (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), EnableGetCredentialsInCredentialsProtocolHook (copy), GetFIntLuaAppCredentialsProtocolTimeoutFunction (copy), HttpService (copy)
	local DefaultCredentialsProtocol = Default
	local DefaultExecuteJavaScriptInWebView = ExecuteJavaScriptInWebViewModule
	local FFlagLuaAppEnableCredentialsProtocol = GetFFlagLuaAppEnableCredentialsProtocolFunction()
	
	if p1 ~= nil and p1.defaultExecuteJavaScriptInWebView ~= nil then
		DefaultExecuteJavaScriptInWebView = p1.defaultExecuteJavaScriptInWebView
	end
	if p1 ~= nil and p1.defaultCredentialsProtocol ~= nil then
		DefaultCredentialsProtocol = p1.defaultCredentialsProtocol
	end
	if p1 ~= nil and p1.defaultCredentialsProtocolEnabled ~= nil then
		FFlagLuaAppEnableCredentialsProtocol = p1.defaultCredentialsProtocolEnabled
	end
	return function(p2): boolean --[[ Line: 36 ]]
		-- upvalues: FFlagLuaAppEnableCredentialsProtocol (ref), JavascriptHybridModule (upval), DefaultCredentialsProtocol (ref), Default (upval), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (upval), DefaultExecuteJavaScriptInWebView (ref), EnableGetCredentialsInCredentialsProtocolHook (upval), GetFIntLuaAppCredentialsProtocolTimeoutFunction (upval), HttpService (upval)
		if FFlagLuaAppEnableCredentialsProtocol then
			if p2.feature == JavascriptHybridModule.Feature.CredentialsProtocolAvailable then
				DefaultCredentialsProtocol:isAvailable(Default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result) --[[ Line: 44 ]]
					-- upvalues: DefaultExecuteJavaScriptInWebView (upval), p2 (copy)
					DefaultExecuteJavaScriptInWebView.Execute(p2.data.callId, (tostring(Result.isAvailable or false)))
				end):catch(function() --[[ Line: 48 ]]
					-- upvalues: DefaultExecuteJavaScriptInWebView (upval), p2 (copy)
					DefaultExecuteJavaScriptInWebView.Execute(p2.data.callId, "false")
				end)
			elseif EnableGetCredentialsInCredentialsProtocolHook and p2.feature == JavascriptHybridModule.Feature.GetCredentials then
				DefaultCredentialsProtocol:getCredentials(Default.CredentialsTypes.FIDO2, p2.data.authenticationOptionsJSON, GetFIntLuaAppCredentialsProtocolTimeoutFunction()):andThen(function(Result) --[[ Line: 61 ]]
					-- upvalues: DefaultExecuteJavaScriptInWebView (upval), p2 (copy), HttpService (upval)
					DefaultExecuteJavaScriptInWebView.Execute(p2.data.callId, if Result then HttpService:JSONEncode(Result) else "")
				end):catch(function() --[[ Line: 67 ]]
					-- upvalues: DefaultExecuteJavaScriptInWebView (upval), p2 (copy)
					DefaultExecuteJavaScriptInWebView.Execute(p2.data.callId, "")
				end)
			end
		end
		return false
	end
end