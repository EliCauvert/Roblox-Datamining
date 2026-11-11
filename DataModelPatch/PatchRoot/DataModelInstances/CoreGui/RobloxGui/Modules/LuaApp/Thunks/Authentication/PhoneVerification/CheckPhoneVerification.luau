local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(Modules.LuaApp.Promise)
local GetPhoneNumberModule = require(Modules.LuaApp.Http.Requests.GetPhoneNumber)
local GetVerifiedEmailModule = require(Modules.LuaApp.Http.Requests.GetVerifiedEmail)
local OpenPhoneUpsellModalModule = require(Modules.LuaApp.Thunks.Verification.OpenPhoneUpsellModal)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local FFlagAddReasonToEveryLogout = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddReasonToEveryLogout
local FFlagLogoutPhoneVerificationUpsellCopy = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLogoutPhoneVerificationUpsellCopy

return function(p1, p2)
	-- upvalues: GetPhoneNumberModule (copy), PromiseModule (copy), GetVerifiedEmailModule (copy), OpenPhoneUpsellModalModule (copy), FFlagAddReasonToEveryLogout (copy), LogoutModule (copy), LuaLogoutReasonNamesModule (copy), EventStreamConstantsModule (copy), FFlagLogoutPhoneVerificationUpsellCopy (copy)
	return function(p3)
		-- upvalues: GetPhoneNumberModule (upval), p1 (copy), PromiseModule (upval), GetVerifiedEmailModule (upval), OpenPhoneUpsellModalModule (upval), FFlagAddReasonToEveryLogout (upval), LogoutModule (upval), p2 (copy), LuaLogoutReasonNamesModule (upval), EventStreamConstantsModule (upval), FFlagLogoutPhoneVerificationUpsellCopy (upval)
		return GetPhoneNumberModule(p1):andThen(function(Result)
			-- upvalues: PromiseModule (upval), GetVerifiedEmailModule (upval), p1 (upval), p3 (copy), OpenPhoneUpsellModalModule (upval), FFlagAddReasonToEveryLogout (upval), LogoutModule (upval), p2 (upval), LuaLogoutReasonNamesModule (upval), EventStreamConstantsModule (upval), FFlagLogoutPhoneVerificationUpsellCopy (upval)
			local Phone = Result.responseBody.phone
			local CountryCode = Result.responseBody.countryCode
			local Prefix = Result.responseBody.prefix
			local IsNotPhoneMatch: boolean = Phone and Phone ~= ""
			
			return if IsNotPhoneMatch then PromiseModule.resolve({ Phone, CountryCode, Prefix }) else GetVerifiedEmailModule(p1):andThen(function(Result)
				-- upvalues: PromiseModule (upval), p3 (upval), OpenPhoneUpsellModalModule (upval), FFlagAddReasonToEveryLogout (upval), LogoutModule (upval), p1 (upval), p2 (upval), LuaLogoutReasonNamesModule (upval), EventStreamConstantsModule (upval), FFlagLogoutPhoneVerificationUpsellCopy (upval)
				local EmailAddress = Result.responseBody.emailAddress
				
				if EmailAddress and EmailAddress ~= "" then
					return PromiseModule.resolve({ EmailAddress = EmailAddress })
				else
					p3:dispatch(OpenPhoneUpsellModalModule({
						addPhoneTitleKey = "Feature.VerificationUpsell.Heading.FinishAccountSetup",
						extraButtonTextKey = "Feature.VerificationUpsell.Action.Logout",
						onSuccess = function()
							-- upvalues: FFlagAddReasonToEveryLogout (upval), p3 (upval), LogoutModule (upval), p1 (upval), p2 (upval), LuaLogoutReasonNamesModule (upval)
							if FFlagAddReasonToEveryLogout then
								p3:dispatch(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.PhoneUpsellLogOut))
								
								return
							else
								p3:dispatch(LogoutModule(p1, p2))
							end
						end,
						eventContext = EventStreamConstantsModule.Context.VerificationUpsell,
						origin = EventStreamConstantsModule.Origin.Logout,
						addPhoneDescriptionKey = if FFlagLogoutPhoneVerificationUpsellCopy then "Feature.VerificationUpsell.Description.LogoutAddPhoneTextV3" else "Feature.VerificationUpsell.Description.LogoutAddPhoneTextV2",
						addPhoneLegalTextKey = if FFlagLogoutPhoneVerificationUpsellCopy then "Feature.VerificationUpsell.Description.AddPhoneBody" else nil,
						addPhoneButtonKey = if FFlagLogoutPhoneVerificationUpsellCopy then "Feature.AccountSettings.Action.Verify" else nil,
						shouldShowVerificationText = not FFlagLogoutPhoneVerificationUpsellCopy and nil,
						alwaysShowAddPhoneLegalText = if FFlagLogoutPhoneVerificationUpsellCopy then true else nil,
						onExtraButtonClick = function()
							-- upvalues: FFlagAddReasonToEveryLogout (upval), p3 (upval), LogoutModule (upval), p1 (upval), p2 (upval), LuaLogoutReasonNamesModule (upval)
							if FFlagAddReasonToEveryLogout then
								p3:dispatch(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.PhoneUpsellLogOut))
								
								return
							else
								p3:dispatch(LogoutModule(p1, p2))
							end
						end
					}))
					
					return PromiseModule.reject()
				end
			end, function(_)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve()
			end)
		end, function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end)
	end
end