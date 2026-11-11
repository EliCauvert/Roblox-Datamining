local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local NetworkingUserSettings = DependenciesModule.NetworkingUserSettings
local NetworkingAccountInformation = DependenciesModule.NetworkingAccountInformation
local PermissionsProtocol = DependenciesModule.PermissionsProtocol
local Promise = DependenciesModule.Promise
local Llama = DependenciesModule.llama
local ContactImporterModalInfoModule = require(Parent.Utils.contactImporterModalInfo)
local UpdateOptedInUsers = DependenciesModule.SocialModalsCommon.Utils.updateOptedInUsers
local ContactImporterOSPermissionsModule = require(Parent.Utils.contactImporterOSPermissions)
local ConstantsModule = require(Parent.Common.Constants)
local SetContactImporterDisplayLogicModule = require(Parent.Actions.SetContactImporterDisplayLogic)

local function v12(_) end

return function(p1, p2, p3)
	-- upvalues: NetworkingUserSettings (copy), Promise (copy), v12 (copy), NetworkingAccountInformation (copy), PermissionsProtocol (copy), UpdateOptedInUsers (copy), Llama (copy), ContactImporterModalInfoModule (copy), ConstantsModule (copy), SetContactImporterDisplayLogicModule (copy), ContactImporterOSPermissionsModule (copy)
	return function(p4)
		-- upvalues: NetworkingUserSettings (upval), Promise (upval), v12 (upval), NetworkingAccountInformation (upval), p2 (copy), PermissionsProtocol (upval), UpdateOptedInUsers (upval), p3 (copy), Llama (upval), ContactImporterModalInfoModule (upval), p1 (copy), ConstantsModule (upval), SetContactImporterDisplayLogicModule (upval), ContactImporterOSPermissionsModule (upval)
		Promise.all({
			p4:dispatch(NetworkingUserSettings.GetUserSettings.API({})):andThen(function(Result)
				-- upvalues: Promise (upval), v12 (upval)
				return Promise.resolve({
					phoneNumberDiscoverability = Result.responseBody.phoneNumberDiscoverability
				}, v12)
			end),
			p4:dispatch(NetworkingAccountInformation.GetPhoneInformation.API()):andThen(function(Result)
				-- upvalues: Promise (upval), v12 (upval)
				return Promise.resolve({ isPhoneVerified = Result.responseBody.isVerified }, v12)
			end),
			p2:hasPermissions({ PermissionsProtocol.Permissions.CONTACTS_ACCESS }):andThen(function(Result)
				-- upvalues: PermissionsProtocol (upval), UpdateOptedInUsers (upval), p3 (upval), Promise (upval)
				local IsStatusMatch: boolean = Result and Result.status == PermissionsProtocol.Status.AUTHORIZED
				
				if not IsStatusMatch then
					UpdateOptedInUsers:clearLocalStorage(p3)
				end
				return Promise.resolve({ hasOSPermissions = IsStatusMatch })
			end, v12)
		}):andThen(function(Result)
			-- upvalues: Llama (upval), ContactImporterModalInfoModule (upval), p3 (upval), p1 (upval), ConstantsModule (upval), p4 (copy), SetContactImporterDisplayLogicModule (upval), ContactImporterOSPermissionsModule (upval)
			local JoinResult = {}
			
			for _, value in Result do
				JoinResult = Llama.Dictionary.join(JoinResult, value)
			end
			local IsUserOptedInLocalStorage = ContactImporterModalInfoModule:isUserOptedInLocalStorage(p3, p1)
			JoinResult[ConstantsModule.SHOULD_SHOW_CONTACT_IMPORTER_UPSELL_AGAIN] = ContactImporterModalInfoModule:shouldUserSeeModalPotentiallyAgain(p3, p1)
			JoinResult[ConstantsModule.IS_USER_OPTED_IN_LOCAL_STORAGE] = IsUserOptedInLocalStorage
			p4:dispatch(SetContactImporterDisplayLogicModule(JoinResult))
			local _ = ContactImporterOSPermissionsModule:getLastOSPermissionSettings(p3)
			ContactImporterOSPermissionsModule:updateOSPermissionSettings(p3, JoinResult.hasOSPermissions)
		end):catch(function() end)
	end
end