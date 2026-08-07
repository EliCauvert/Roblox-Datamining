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

local var5 = function(_) --[[ line: 14 ]] end

return function(p0, p1, p2) --[[ line: 18 ]]
	-- upvalues: networkingUserSettings (ref), promise (ref), var5 (ref), networkingAccountInformation (ref), permissionsProtocol (ref), updateOptedInUsers (ref), llama (ref), contactImporterModalInfoModule (ref), constantsModule (ref), setContactImporterDisplayLogicModule (ref), contactImporterOSPermissionsModule (ref)
	return function(p3) --[[ line: 19 ]]
		-- upvalues: networkingUserSettings (copy), promise (copy), var5 (copy), networkingAccountInformation (copy), p1 (ref), permissionsProtocol (copy), updateOptedInUsers (copy), p2 (ref), llama (copy), contactImporterModalInfoModule (copy), p0 (ref), constantsModule (copy), setContactImporterDisplayLogicModule (copy), contactImporterOSPermissionsModule (copy)
		local _ = {}
		promise.all({
			p3:dispatch(networkingUserSettings.GetUserSettings.API({})):andThen(function(p5) --[[ line: 22 ]]
				-- upvalues: promise (copy), var5 (copy)
				return promise.resolve({
					phoneNumberDiscoverability = p5.responseBody.phoneNumberDiscoverability
				}, var5)
			end),
			p3:dispatch(networkingAccountInformation.GetPhoneInformation.API()):andThen(function(p6) --[[ line: 27 ]]
				-- upvalues: promise (copy), var5 (copy)
				return promise.resolve({ isPhoneVerified = p6.responseBody.isVerified }, var5)
			end),
			p1:hasPermissions({ permissionsProtocol.Permissions.CONTACTS_ACCESS }):andThen(function(p7) --[[ line: 32 ]]
				-- upvalues: permissionsProtocol (copy), updateOptedInUsers (copy), p2 (copy), promise (copy)
				local var8 = p7 and p7.status == permissionsProtocol.Status.AUTHORIZED
				
				if not var8 then
					updateOptedInUsers:clearLocalStorage(p2)
				end
				return promise.resolve({ hasOSPermissions = var8 })
			end, var5)
		}):andThen(function(p4) --[[ line: 41 ]]
			-- upvalues: llama (copy), contactImporterModalInfoModule (copy), p2 (copy), p0 (copy), constantsModule (copy), p3 (ref), setContactImporterDisplayLogicModule (copy), contactImporterOSPermissionsModule (copy)
			local t = {}
			
			for i, v in p4 do
				t = llama.Dictionary.join(t, v)
			end
			local var7 = contactImporterModalInfoModule:isUserOptedInLocalStorage(p2, p0)
			t[constantsModule.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_AGAIN] = contactImporterModalInfoModule:shouldUserSeeModalPotentiallyAgain(p2, p0)
			t[constantsModule.IS_USER_OPTED_IN_LOCAL_STORAGE] = var7
			p3:dispatch(setContactImporterDisplayLogicModule(t))
			contactImporterOSPermissionsModule:updateOSPermissionSettings(p2, t.hasOSPermissions)
		end):catch(function() --[[ line: 64 ]] end)
	end
end