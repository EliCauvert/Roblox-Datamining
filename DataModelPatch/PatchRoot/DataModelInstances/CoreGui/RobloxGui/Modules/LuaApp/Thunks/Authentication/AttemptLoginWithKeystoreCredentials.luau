local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local PromiseModule = require(CorePackages.Packages.Promise)
local LoginResultModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Models.Authentication.LoginResult)
local LoginErrorCodes = require(CorePackages.Workspace.Packages.AuthCommon).Enums.LoginErrorCodes
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local KeystoreConstants = AuthCommonModule.Common.KeystoreConstants
local KeystoreAnalyticsEvents = AuthCommonModule.Analytics.KeystoreAnalyticsEvents
local KeystoreEventConstants = AuthCommonModule.Analytics.KeystoreEventConstants
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagRemoveKeystoreIxpLogicFunction = SharedFlagsModule.GetFFlagRemoveKeystoreIxpLogic
local GetFFlagAddPromCounterToKeystoreOpsFunction = SharedFlagsModule.GetFFlagAddPromCounterToKeystoreOps
local AuthAnalyticsModule = require(CorePackages.Workspace.Packages.AuthAnalytics)
local KeystoreGetCredentialsTelemetryConfig = AuthAnalyticsModule.TelemetryConfigs.KeystoreGetCredentialsTelemetryConfig
local KeystoreAutoLoginTelemetryConfig = AuthAnalyticsModule.TelemetryConfigs.KeystoreAutoLoginTelemetryConfig

return function(Callback, Callback1, Callback2)
	-- upvalues: PromiseModule (copy), KeystoreAnalyticsEvents (copy), KeystoreEventConstants (copy), GetFFlagAddPromCounterToKeystoreOpsFunction (copy), TelemetryService (copy), KeystoreGetCredentialsTelemetryConfig (copy), HttpService (copy), GetFFlagRemoveKeystoreIxpLogicFunction (copy), KeystoreConstants (copy), KeystoreAutoLoginTelemetryConfig (copy), LoginResultModule (copy), LoginErrorCodes (copy)
	return function(p1)
		-- upvalues: PromiseModule (upval), Callback1 (copy), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreGetCredentialsTelemetryConfig (upval), HttpService (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), KeystoreConstants (upval), Callback (copy), Callback2 (copy), KeystoreAutoLoginTelemetryConfig (upval), LoginResultModule (upval), LoginErrorCodes (upval)
		local Flag = false
		
		local function _(p2)
			-- upvalues: PromiseModule (upval), Flag (ref)
			return function(p3, p4, p5)
				-- upvalues: p2 (copy), PromiseModule (upval), Flag (upval)
				local Promise, v1 = p2(p3, p4, p5)
				
				return Promise:andThen(function(Result)
					-- upvalues: PromiseModule (upval)
					return PromiseModule.resolve(Result)
				end):catch(function(Err)
					-- upvalues: Flag (upval), PromiseModule (upval)
					Flag = true
					
					return PromiseModule.reject(Err)
				end), v1
			end
		end
		
		return PromiseModule.new(function(Callback3, Callback4)
			-- upvalues: Callback1 (upval), KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreGetCredentialsTelemetryConfig (upval), HttpService (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), KeystoreConstants (upval), Callback (upval), PromiseModule (upval), Flag (ref), Callback2 (upval), p1 (copy), KeystoreAutoLoginTelemetryConfig (upval), LoginResultModule (upval), LoginErrorCodes (upval)
			local Credentials = { username = nil, userId = nil, password = nil }
			Callback1():andThen(function(Result)
				-- upvalues: KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreGetCredentialsTelemetryConfig (upval), Callback4 (copy), Credentials (copy), HttpService (upval), GetFFlagRemoveKeystoreIxpLogicFunction (upval), KeystoreConstants (upval), Callback (upval), PromiseModule (upval), Flag (upval), Callback2 (upval), p1 (upval), KeystoreAutoLoginTelemetryConfig (upval), Callback3 (copy), LoginResultModule (upval), LoginErrorCodes (upval)
				if Result == nil then
					KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.getCredentialsNilResult)
					
					if GetFFlagAddPromCounterToKeystoreOpsFunction() then
						TelemetryService:LogCounter(KeystoreGetCredentialsTelemetryConfig, { customFields = { result = "nil_result" } }, 1)
					end
					Callback4({
						credentialsValidForLogin = false,
						redirectToLoginPage = false,
						credentials = Credentials
					})
					
					return
				else
					local ResponseEntry = HttpService:JSONDecode(Result).response[1]
					Credentials.username = ResponseEntry.username
					Credentials.userId = ResponseEntry.userId
					Credentials.password = ResponseEntry.password
					
					if GetFFlagRemoveKeystoreIxpLogicFunction() then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.getCredentials, Credentials.userId)
						
						if GetFFlagAddPromCounterToKeystoreOpsFunction() then
							TelemetryService:LogCounter(KeystoreGetCredentialsTelemetryConfig, { customFields = { result = "has_credentials" } }, 1)
						end
					else
						Credentials.experimentGroup = ResponseEntry.experimentGroup
						KeystoreAnalyticsEvents.sendPageLoadEvent(({
							[KeystoreConstants.Experiment] = KeystoreEventConstants.origin.getCredentialsExperimentGroup,
							[KeystoreConstants.Control] = KeystoreEventConstants.origin.getCredentialsControlGroup
						})[Credentials.experimentGroup] or KeystoreEventConstants.origin.getCredentialsNoIxpGroup, Credentials.userId)
						
						if Credentials.experimentGroup ~= KeystoreConstants.Experiment then
							Callback4({
								credentialsValidForLogin = false,
								redirectToLoginPage = false,
								credentials = Credentials
							})
						end
					end
					if ResponseEntry.username == "" then
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.getCredentialsEmptyResult)
						
						if GetFFlagAddPromCounterToKeystoreOpsFunction() then
							TelemetryService:LogCounter(KeystoreGetCredentialsTelemetryConfig, { customFields = { result = "empty_result" } }, 1)
						end
						Callback4({
							credentialsValidForLogin = false,
							redirectToLoginPage = false,
							credentials = Credentials
						})
						
						return
					else
						if ResponseEntry.errorCode and ResponseEntry.errorCode == "" then
							Callback2(function(p2, p3, p4)
								-- upvalues: Callback (copy), PromiseModule (upval), Flag (upval)
								local Promise, v1 = Callback(p2, p3, p4)
								
								return Promise:andThen(function(Result)
									-- upvalues: PromiseModule (upval)
									return PromiseModule.resolve(Result)
								end):catch(function(Err)
									-- upvalues: Flag (upval), PromiseModule (upval)
									Flag = true
									
									return PromiseModule.reject(Err)
								end), v1
							end, Credentials)(p1):andThen(function(Result)
								-- upvalues: KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), Credentials (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreAutoLoginTelemetryConfig (upval), Flag (upval), Callback3 (upval), LoginResultModule (upval)
								KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.successfulLogin, Credentials.userId)
								
								if GetFFlagAddPromCounterToKeystoreOpsFunction() then
									TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, { customFields = { outcome = "success" } }, 1)
								end
								if Flag then
									KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.gcsCase, Credentials.userId)
									
									if GetFFlagAddPromCounterToKeystoreOpsFunction() then
										TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, { customFields = { outcome = "gcs" } }, 1)
									end
									Callback3({
										credentialsValidForLogin = false,
										redirectToLoginPage = false,
										credentials = Credentials
									})
									
									return
								elseif LoginResultModule.hasTwoStepData(Result) then
									KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.hasTwoStepData, Credentials.userId)
									
									if GetFFlagAddPromCounterToKeystoreOpsFunction() then
										TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, { customFields = { outcome = "two_step" } }, 1)
									end
									Callback3({
										credentialsValidForLogin = true,
										redirectToLoginPage = true,
										credentials = Credentials
									})
									
									return
								else
									KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.regularAccountSuccess, Credentials.userId)
									
									if GetFFlagAddPromCounterToKeystoreOpsFunction() then
										TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, { customFields = { outcome = "regular_success" } }, 1)
									end
									Callback3({
										credentialsValidForLogin = true,
										redirectToLoginPage = false,
										loginResult = Result,
										credentials = Credentials
									})
								end
							end):catch(function(Err)
								-- upvalues: KeystoreAnalyticsEvents (upval), KeystoreEventConstants (upval), Credentials (upval), GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreAutoLoginTelemetryConfig (upval), Flag (upval), LoginErrorCodes (upval), Callback4 (upval)
								KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.failedLogin, Credentials.userId)
								
								if GetFFlagAddPromCounterToKeystoreOpsFunction() then
									TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, { customFields = { outcome = "failed" } }, 1)
								end
								local NoFlag = not Flag
								
								if Err and Err.errorCode == LoginErrorCodes.IncorrectCValueOrPassword then
									KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.failedLoginIncorrectPassword, Credentials.userId)
									
									if GetFFlagAddPromCounterToKeystoreOpsFunction() then
										TelemetryService:LogCounter(KeystoreAutoLoginTelemetryConfig, { customFields = { outcome = "failed_incorrect_password" } }, 1)
									end
									NoFlag = true
								end
								Callback4({
									credentialsValidForLogin = false,
									credentials = Credentials,
									redirectToLoginPage = NoFlag
								})
							end)
							
							return
						end
						KeystoreAnalyticsEvents.sendPageLoadEvent(KeystoreEventConstants.origin.getCredentialsPopulateUsername, Credentials.userId)
						
						if GetFFlagAddPromCounterToKeystoreOpsFunction() then
							TelemetryService:LogCounter(KeystoreGetCredentialsTelemetryConfig, { customFields = { result = "populate_username" } }, 1)
						end
						Callback4({
							credentialsValidForLogin = false,
							redirectToLoginPage = true,
							credentials = Credentials
						})
					end
				end
			end):catch(function(_)
				-- upvalues: GetFFlagAddPromCounterToKeystoreOpsFunction (upval), TelemetryService (upval), KeystoreGetCredentialsTelemetryConfig (upval), Callback4 (copy), Credentials (copy), Flag (upval)
				if GetFFlagAddPromCounterToKeystoreOpsFunction() then
					TelemetryService:LogCounter(KeystoreGetCredentialsTelemetryConfig, { customFields = { result = "error" } }, 1)
				end
				Callback4({
					credentialsValidForLogin = false,
					credentials = Credentials,
					redirectToLoginPage = not Flag
				})
			end)
		end)
	end
end