local Parent = script:FindFirstAncestor("MultiPageSignup").Parent
local UserActivationFrameworkModule = require(Parent.UserActivationFramework)
local PayloadKey = UserActivationFrameworkModule.Enums.PayloadKey
local ActivationFrameworkContextAction = UserActivationFrameworkModule.Enums.ActivationFrameworkContextAction
local CredentialsProtocolModule = require(Parent.CredentialsProtocol)
local Default = CredentialsProtocolModule.CredentialsProtocol.default
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = CredentialsProtocolModule.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local Logger = require(Parent.Loggers).Logger
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local AuthClientErrorFunction = AuthAnalyticsModule.Events.authClientError
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants

return function(p1, p2, Callback)
	-- upvalues: PayloadKey (copy), Default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), ActivationFrameworkContextAction (copy), AuthClientErrorFunction (copy), Logger (copy)
	local SupportsDeviceBoundOnly = false
	local IsAvailable = false
	local IsTrue = false
	
	if p1[PayloadKey.CredentialsProtocolPasskeyRegistrationAvailable] == nil then
		local ClockTime = os.clock()
		Default:isAvailable(Default.CredentialsTypes.all, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
			-- upvalues: AuthPageloadFunction (upval), EventStreamConstants (upval), ClockTime (copy), SupportsDeviceBoundOnly (ref), IsTrue (ref), IsAvailable (ref), PayloadKey (upval), Callback (copy), ActivationFrameworkContextAction (upval)
			AuthPageloadFunction(EventStreamConstants.Context.MultiPageSignupIsAvailableFetch, (tostring(os.clock() - ClockTime)))
			
			if Result.FIDO2 == nil then
				SupportsDeviceBoundOnly = Result.isAvailable and Result.supportsDeviceBoundOnly or false
			else
				SupportsDeviceBoundOnly = Result.FIDO2.isAvailable and Result.FIDO2.supportsDeviceBoundOnly
				IsTrue = true
			end
			if Result.password ~= nil then
				IsAvailable = Result.password.isAvailable
			end
			Callback({
				type = ActivationFrameworkContextAction.SetMergePayload,
				data = {
					payloadTable = {
						[PayloadKey.CredentialsProtocolPasskeyRegistrationAvailable] = tostring(SupportsDeviceBoundOnly),
						[PayloadKey.CredentialsProtocolPasswordRegistrationAvailable] = tostring(IsAvailable),
						[PayloadKey.CredentialsProtocolV2InterfaceAvailable] = tostring(IsTrue)
					}
				}
			})
		end):catch(function(Err)
			-- upvalues: AuthClientErrorFunction (upval), p2 (copy), EventStreamConstants (upval), Logger (upval)
			AuthClientErrorFunction(p2, EventStreamConstants.State.CredentialsProtocolNotAvailable)
			Logger:warning("Error checking for credential availability. Error: {}", Err)
		end)
	else
		AuthPageloadFunction(EventStreamConstants.Context.MultiPageSignupIsAvailableFetch, "0")
		SupportsDeviceBoundOnly = p1[PayloadKey.CredentialsProtocolPasskeyRegistrationAvailable] == "true"
		IsAvailable = p1[PayloadKey.CredentialsProtocolPasswordRegistrationAvailable] == "true"
		IsTrue = p1[PayloadKey.CredentialsProtocolV2InterfaceAvailable] == "true"
	end
	return SupportsDeviceBoundOnly, IsAvailable, IsTrue
end