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

return function(p0)
	-- upvalues: default (ref), executeJavaScriptInWebViewModule (ref), getFFlagLuaAppEnableCredentialsProtocol (ref), javascriptHybridModule (ref), getFIntLuaAppCredentialsProtocolAvailableTimeout (ref), enableGetCredentialsInCredentialsProtocolHook (ref), getFIntLuaAppCredentialsProtocolTimeout (ref), httpService (ref)
	local var5 = default
	local var6 = executeJavaScriptInWebViewModule
	local var7 = getFFlagLuaAppEnableCredentialsProtocol()
	
	if p0 ~= nil and p0.defaultExecuteJavaScriptInWebView ~= nil then
		var6 = p0.defaultExecuteJavaScriptInWebView
	end
	if p0 ~= nil and p0.defaultCredentialsProtocol ~= nil then
		var5 = p0.defaultCredentialsProtocol
	end
	if p0 ~= nil and p0.defaultCredentialsProtocolEnabled ~= nil then
		var7 = p0.defaultCredentialsProtocolEnabled
	end
	return function(p1)
		-- upvalues: var7 (write), javascriptHybridModule (copy), var5 (write), default (copy), getFIntLuaAppCredentialsProtocolAvailableTimeout (copy), var6 (write), enableGetCredentialsInCredentialsProtocolHook (copy), getFIntLuaAppCredentialsProtocolTimeout (copy), httpService (copy)
		if var7 then
			if p1.feature == javascriptHybridModule.Feature.CredentialsProtocolAvailable then
				var5:isAvailable(default.CredentialsTypes.FIDO2, getFIntLuaAppCredentialsProtocolAvailableTimeout()):andThen(function(p2)
					-- upvalues: var6 (copy), p1 (ref)
					var6.Execute(p1.data.callId, tostring(p2.isAvailable or false))
				end):catch(function()
					-- upvalues: var6 (copy), p1 (ref)
					var6.Execute(p1.data.callId, "false")
				end)
			elseif enableGetCredentialsInCredentialsProtocolHook and p1.feature == javascriptHybridModule.Feature.GetCredentials then
				var5:getCredentials(default.CredentialsTypes.FIDO2, p1.data.authenticationOptionsJSON, getFIntLuaAppCredentialsProtocolTimeout()):andThen(function(p3)
					-- upvalues: var6 (copy), p1 (ref), httpService (copy)
					var6.Execute(p1.data.callId, if p3 then httpService:JSONEncode(p3) else "")
				end):catch(function()
					-- upvalues: var6 (copy), p1 (ref)
					var6.Execute(p1.data.callId, "")
				end)
			end
		end
		return false
	end
end