local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local httpService = game:GetService("HttpService")
local parent = genericChallenges.Parent
local default = require(parent.CredentialsProtocol).CredentialsProtocol.default
local javascriptHybridModule = require(genericChallenges.Types.JavascriptHybrid)
local _ = require(genericChallenges.Middleware.BuildHybridCallback)
local getFFlagLuaAppEnableCredentialsProtocol = require(parent.CredentialsProtocol).Flags.GetFFlagLuaAppEnableCredentialsProtocol
local getFIntLuaAppCredentialsProtocolAvailableTimeout = require(parent.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local getFIntLuaAppCredentialsProtocolTimeout = require(parent.CredentialsProtocol).Flags.GetFIntLuaAppCredentialsProtocolTimeout
local enableGetCredentialsInCredentialsProtocolHook = game:DefineFastFlag("EnableGetCredentialsInCredentialsProtocolHook", false)
local executeJavaScriptInWebViewModule = require(genericChallenges.Utils.ExecuteJavaScriptInWebView)

return function(p1)
	-- upvalues: default (ref), executeJavaScriptInWebViewModule (ref), getFFlagLuaAppEnableCredentialsProtocol (ref), javascriptHybridModule (ref), getFIntLuaAppCredentialsProtocolAvailableTimeout (ref), enableGetCredentialsInCredentialsProtocolHook (ref), getFIntLuaAppCredentialsProtocolTimeout (ref), httpService (ref)
	local var1 = default
	local var2 = executeJavaScriptInWebViewModule
	local var3 = getFFlagLuaAppEnableCredentialsProtocol()
	
	if p1 ~= nil and p1.defaultExecuteJavaScriptInWebView ~= nil then
		var2 = p1.defaultExecuteJavaScriptInWebView
	end
	if p1 ~= nil and p1.defaultCredentialsProtocol ~= nil then
		var1 = p1.defaultCredentialsProtocol
	end
	if p1 ~= nil and p1.defaultCredentialsProtocolEnabled ~= nil then
		var3 = p1.defaultCredentialsProtocolEnabled
	end
	return function(p2)
		-- upvalues: var3 (write), javascriptHybridModule (copy), var1 (write), default (copy), getFIntLuaAppCredentialsProtocolAvailableTimeout (copy), var2 (write), enableGetCredentialsInCredentialsProtocolHook (copy), getFIntLuaAppCredentialsProtocolTimeout (copy), httpService (copy)
		if var3 then
			if p2.feature == javascriptHybridModule.Feature.CredentialsProtocolAvailable then
				var1:isAvailable(default.CredentialsTypes.FIDO2, getFIntLuaAppCredentialsProtocolAvailableTimeout()):andThen(function(p3)
					-- upvalues: var2 (copy), p2 (ref)
					var2.Execute(p2.data.callId, tostring(p3.isAvailable or false))
				end):catch(function()
					-- upvalues: var2 (copy), p2 (ref)
					var2.Execute(p2.data.callId, "false")
				end)
			elseif enableGetCredentialsInCredentialsProtocolHook and p2.feature == javascriptHybridModule.Feature.GetCredentials then
				var1:getCredentials(default.CredentialsTypes.FIDO2, p2.data.authenticationOptionsJSON, getFIntLuaAppCredentialsProtocolTimeout()):andThen(function(p3)
					-- upvalues: var2 (copy), p2 (ref), httpService (copy)
					var2.Execute(p2.data.callId, if p3 then httpService:JSONEncode(p3) else "")
				end):catch(function()
					-- upvalues: var2 (copy), p2 (ref)
					var2.Execute(p2.data.callId, "")
				end)
			end
		end
		return false
	end
end