local parent = script.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local networkingUserSettings = dependenciesModule.NetworkingUserSettings
local networkingAccountInformation = dependenciesModule.NetworkingAccountInformation
local permissionsProtocol = dependenciesModule.PermissionsProtocol
local promise = dependenciesModule.Promise
local llama = dependenciesModule.llama
local contactImporterModalInfoModule = require(parent.Utils.contactImporterModalInfo)
local updateOptedInUsers = dependenciesModule.SocialModalsCommon.Utils.updateOptedInUsers
local contactImporterOSPermissionsModule = require(parent.Utils.contactImporterOSPermissions)
local constantsModule = require(parent.Common.Constants)
local setContactImporterDisplayLogicModule = require(parent.Actions.SetContactImporterDisplayLogic)

local var1 = function(_) end

return function(p1, p2, p3)
	-- upvalues: networkingUserSettings (ref), promise (ref), var1 (ref), networkingAccountInformation (ref), permissionsProtocol (ref), updateOptedInUsers (ref), llama (ref), contactImporterModalInfoModule (ref), constantsModule (ref), setContactImporterDisplayLogicModule (ref), contactImporterOSPermissionsModule (ref)
	return function(p4)
		-- upvalues: networkingUserSettings (copy), promise (copy), var1 (copy), networkingAccountInformation (copy), p2 (ref), permissionsProtocol (copy), updateOptedInUsers (copy), p3 (ref), llama (copy), contactImporterModalInfoModule (copy), p1 (ref), constantsModule (copy), setContactImporterDisplayLogicModule (copy), contactImporterOSPermissionsModule (copy)
		local _ = {}
		promise.all({
			p4:dispatch(networkingUserSettings.GetUserSettings.API({})):andThen(function(p5)
				-- upvalues: promise (copy), var1 (copy)
				return promise.resolve({
					phoneNumberDiscoverability = p5.responseBody.phoneNumberDiscoverability
				}, var1)
			end),
			p4:dispatch(networkingAccountInformation.GetPhoneInformation.API()):andThen(function(p5)
				-- upvalues: promise (copy), var1 (copy)
				return promise.resolve({ isPhoneVerified = p5.responseBody.isVerified }, var1)
			end),
			p2:hasPermissions({ permissionsProtocol.Permissions.CONTACTS_ACCESS }):andThen(function(p5)
				-- upvalues: permissionsProtocol (copy), updateOptedInUsers (copy), p3 (copy), promise (copy)
				local var2 = p5 and p5.status == permissionsProtocol.Status.AUTHORIZED
				
				if not var2 then
					updateOptedInUsers:clearLocalStorage(p3)
				end
				return promise.resolve({ hasOSPermissions = var2 })
			end, var1)
		}):andThen(function(p5)
			-- upvalues: llama (copy), contactImporterModalInfoModule (copy), p3 (copy), p1 (copy), constantsModule (copy), p4 (ref), setContactImporterDisplayLogicModule (copy), contactImporterOSPermissionsModule (copy)
			local t = {}
			
			for i, v in p5 do
				t = llama.Dictionary.join(t, v)
			end
			local var2 = contactImporterModalInfoModule:isUserOptedInLocalStorage(p3, p1)
			t[constantsModule.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_AGAIN] = contactImporterModalInfoModule:shouldUserSeeModalPotentiallyAgain(p3, p1)
			t[constantsModule.IS_USER_OPTED_IN_LOCAL_STORAGE] = var2
			p4:dispatch(setContactImporterDisplayLogicModule(t))
			contactImporterOSPermissionsModule:updateOSPermissionSettings(p3, t.hasOSPermissions)
		end):catch(function() end)
	end
end