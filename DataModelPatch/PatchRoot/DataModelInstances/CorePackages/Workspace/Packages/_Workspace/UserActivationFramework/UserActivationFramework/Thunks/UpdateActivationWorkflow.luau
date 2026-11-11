local UserActivationFramework = script:FindFirstAncestor("UserActivationFramework")
local UserActivationSignupPageStateModule = require(UserActivationFramework.Enums.UserActivationSignupPageState)
local NavigationActionModule = require(UserActivationFramework.Enums.NavigationAction)
local PayloadKeyModule = require(UserActivationFramework.Enums.PayloadKey)
local _ = require(UserActivationFramework.Enums.Namespace)
local FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage = require(UserActivationFramework.Parent.SharedFlags).FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage

function containsValue(List, p1): boolean
	for _, value in pairs(List) do
		if value == p1 then
			return true
		end
	end
	return false
end

return function(Namespace, EnterUserIdentifier, Payload, Back, Entry, p2)
	-- upvalues: NavigationActionModule (copy), FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage (copy), UserActivationSignupPageStateModule (copy), PayloadKeyModule (copy)
	if Back == NavigationActionModule.Close then
		return nil
	end
	local Config = if FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage then {
		[UserActivationSignupPageStateModule.EnterBirthday] = UserActivationSignupPageStateModule.NonInteractiveStoreUserAgreements,
		[UserActivationSignupPageStateModule.NonInteractiveStoreUserAgreements] = UserActivationSignupPageStateModule.EnterUserIdentifier,
		[UserActivationSignupPageStateModule.EnterUserIdentifier] = UserActivationSignupPageStateModule.AddAuthMethod,
		[UserActivationSignupPageStateModule.AddAuthMethod] = UserActivationSignupPageStateModule.SelectGender,
		[UserActivationSignupPageStateModule.SelectGender] = UserActivationSignupPageStateModule.Complete,
		[UserActivationSignupPageStateModule.Complete] = UserActivationSignupPageStateModule.Complete
	} else {
		[UserActivationSignupPageStateModule.EnterBirthday] = UserActivationSignupPageStateModule.EnterUserIdentifier,
		[UserActivationSignupPageStateModule.EnterUserIdentifier] = UserActivationSignupPageStateModule.AddAuthMethod,
		[UserActivationSignupPageStateModule.AddAuthMethod] = UserActivationSignupPageStateModule.SelectGender,
		[UserActivationSignupPageStateModule.SelectGender] = UserActivationSignupPageStateModule.Complete,
		[UserActivationSignupPageStateModule.Complete] = UserActivationSignupPageStateModule.Complete
	}
	Config[UserActivationSignupPageStateModule.TestingPageA] = UserActivationSignupPageStateModule.TestingPageB
	Config[UserActivationSignupPageStateModule.TestingPageB] = UserActivationSignupPageStateModule.TestingPageC
	local config = {
		[UserActivationSignupPageStateModule.EnterBirthday] = {
			NavigationActionModule.Next,
			NavigationActionModule.Close
		},
		[UserActivationSignupPageStateModule.EnterUserIdentifier] = { NavigationActionModule.Next, NavigationActionModule.Back },
		[UserActivationSignupPageStateModule.NonInteractiveStoreUserAgreements] = { NavigationActionModule.Next, NavigationActionModule.Back },
		[UserActivationSignupPageStateModule.AddAuthMethod] = { NavigationActionModule.Next, NavigationActionModule.Back },
		[UserActivationSignupPageStateModule.SelectGender] = { NavigationActionModule.Next, NavigationActionModule.Back },
		[UserActivationSignupPageStateModule.Complete] = {},
		[UserActivationSignupPageStateModule.TestingPageA] = { NavigationActionModule.Next },
		[UserActivationSignupPageStateModule.TestingPageB] = { NavigationActionModule.Next, NavigationActionModule.Back },
		[UserActivationSignupPageStateModule.TestingPageC] = {}
	}
	local SelectGender = EnterUserIdentifier
	local Copy = table.clone(Entry)
	
	if Back == NavigationActionModule.Next or Back == NavigationActionModule.Skip then
		if EnterUserIdentifier == UserActivationSignupPageStateModule.EnterUserIdentifier and p2 and p2[PayloadKeyModule.SignupPasskeyResult] and #p2[PayloadKeyModule.SignupPasskeyResult] > 0 then
			SelectGender = UserActivationSignupPageStateModule.SelectGender
		else
			SelectGender = Config[EnterUserIdentifier]
			
			if SelectGender == nil then
				return nil
			end
		end
		table.insert(Copy, SelectGender)
	elseif Back == NavigationActionModule.Back then
		if not containsValue(config[EnterUserIdentifier], NavigationActionModule.Back) then
			return nil
		end
		table.remove(Copy)
		
		if #Copy == 0 then
			return nil
		end
		SelectGender = Copy[#Copy]
	elseif Back == NavigationActionModule.Reset then
		SelectGender = Entry[1]
		Copy = if #Entry > 0 then { SelectGender } else {}
	end
	return {
		namespace = Namespace,
		state = SelectGender,
		availableActions = if config[SelectGender] then if SelectGender == UserActivationSignupPageStateModule.SelectGender and p2 and p2[PayloadKeyModule.SignupPasskeyResult] and #p2[PayloadKeyModule.SignupPasskeyResult] > 0 then { NavigationActionModule.Next } else config[SelectGender] elseif SelectGender == UserActivationSignupPageStateModule.SelectGender and p2 and p2[PayloadKeyModule.SignupPasskeyResult] and #p2[PayloadKeyModule.SignupPasskeyResult] > 0 then { NavigationActionModule.Next } else {},
		payload = Payload,
		history = Copy
	}
end