local PreHomePage = script:FindFirstAncestor("PreHomePage")
local Parent = PreHomePage.Parent
local PasskeyUpsellModule = require(Parent.PasskeyUpsell)
local PasskeyCheckFunction = PasskeyUpsellModule.Utils.PasskeyCheck
local CooldownCheckFunction = PasskeyUpsellModule.Utils.CooldownCheck
local Logger = require(Parent.Loggers).Logger
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local AppPage = require(Parent.RobloxAppEnums).AppPage
local PromiseModule = require(Parent.Promise)
local CredentialsProtocolModule = require(Parent.CredentialsProtocol)
local Default = CredentialsProtocolModule.CredentialsProtocol.default
local GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction = CredentialsProtocolModule.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local IXPServiceWrapper = require(Parent.IXPServiceWrapper).IXPServiceWrapper
local AppBtidLayers = require(Parent.ExperimentLayers).AppBtidLayers
local UserJustLoggedInFunction = require(PreHomePage.Common).Checks.userJustLoggedIn

local function _()
	-- upvalues: IXPServiceWrapper (copy), AppBtidLayers (copy)
	return IXPServiceWrapper:GetBTIDLayerData(AppBtidLayers.LoginLayer).shouldShowPasskeyUpsell
end

local function canRegisterPasskey()
	-- upvalues: Default (copy), GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction (copy), EventStreamConstants (copy), AuthPageloadFunction (copy), Logger (copy)
	return Default:isAvailable(Default.CredentialsTypes.FIDO2, GetFIntLuaAppCredentialsProtocolAvailableTimeoutFunction()):andThen(function(Result)
		-- upvalues: EventStreamConstants (upval), AuthPageloadFunction (upval)
		AuthPageloadFunction(EventStreamConstants.Context.HandlePreHomePageRouting, if Result.isAvailable then EventStreamConstants.State.CredentialsProtocolAvailable else EventStreamConstants.State.CredentialsProtocolNotAvailable)
		
		return Result.isAvailable
	end):catch(function(Err): boolean
		-- upvalues: Logger (upval)
		Logger:warning("Error checking for available credential types. Error: {}", Err)
		
		return false
	end)
end

return function(p1, p2, Callback)
	-- upvalues: LinkingProtocol (copy), Logger (copy), AuthPageloadFunction (copy), EventStreamConstants (copy), PromiseModule (copy), UserJustLoggedInFunction (copy), canRegisterPasskey (copy), IXPServiceWrapper (copy), AppBtidLayers (copy), CooldownCheckFunction (copy), PasskeyCheckFunction (copy), AppPage (copy)
	if LinkingProtocol:getLastLuaURL() ~= nil and LinkingProtocol:getLastLuaURL() ~= "" then
		Logger:info("Skipping passkey upsell due to deep link")
		AuthPageloadFunction(EventStreamConstants.Context.HandlePreHomePageRouting, EventStreamConstants.State.FilteredByDeepLink)
		
		return PromiseModule.resolve(false)
	elseif UserJustLoggedInFunction(p2) then
		return canRegisterPasskey():andThen(function(Result)
			-- upvalues: Logger (upval), IXPServiceWrapper (upval), AppBtidLayers (upval), AuthPageloadFunction (upval), EventStreamConstants (upval), CooldownCheckFunction (upval), p1 (copy), p2 (copy), PasskeyCheckFunction (upval), PromiseModule (upval), Callback (copy), AppPage (upval)
			if not Result then
				Logger:info("Skipping passkey upsell due to passkey registration not available")
				
				return false
			end
			local ShouldShowPasskeyUpsell = IXPServiceWrapper:GetBTIDLayerData(AppBtidLayers.LoginLayer).shouldShowPasskeyUpsell
			
			if ShouldShowPasskeyUpsell then
				return PromiseModule.all({
					CooldownCheckFunction(p1, p2),
					(PasskeyCheckFunction(p1))
				}):andThen(function(Entry): boolean
					-- upvalues: Logger (upval), AuthPageloadFunction (upval), EventStreamConstants (upval), ShouldShowPasskeyUpsell (copy), p2 (upval), Callback (upval), AppPage (upval)
					local Entry1 = Entry[1]
					local Entry2 = Entry[2]
					Logger:info("Parallel passkey upsell calls completed. HasCooldown: {}, HasPasskey: {}", Entry1, Entry2)
					
					if Entry1 then
						AuthPageloadFunction(EventStreamConstants.Context.HandlePreHomePageRouting, EventStreamConstants.State.FilteredByCooldown)
					end
					if Entry2 then
						AuthPageloadFunction(EventStreamConstants.Context.HandlePreHomePageRouting, EventStreamConstants.State.FilteredByExistingPasskey)
					end
					if not Entry1 and not Entry2 then
						AuthPageloadFunction(EventStreamConstants.Context.HandlePreHomePageRouting, EventStreamConstants.State.ShouldSeePasskeyUpsell)
						
						if ShouldShowPasskeyUpsell then
							Logger:info("User has no cooldown and no passkey, routing to upsell screen.")
							p2:dispatch(Callback({
								{
									name = AppPage.PasskeyUpsellScreen,
									extraProps = { resetNavigationHistory = Callback }
								}
							}))
							
							return true
						end
					end
					return false
				end, function(p3): boolean
					-- upvalues: Logger (upval)
					Logger:debug("Error checking for passkey: {}", p3)
					
					return false
				end)
			else
				AuthPageloadFunction(EventStreamConstants.Context.HandlePreHomePageRouting, EventStreamConstants.State.FilteredByIXP)
				
				return false
			end
		end)
	else
		Logger:info("Skipping passkey upsell due to not just logged in")
		AuthPageloadFunction(EventStreamConstants.Context.HandlePreHomePageRouting, EventStreamConstants.State.FilteredByCachedLogin)
		
		return PromiseModule.resolve(false)
	end
end