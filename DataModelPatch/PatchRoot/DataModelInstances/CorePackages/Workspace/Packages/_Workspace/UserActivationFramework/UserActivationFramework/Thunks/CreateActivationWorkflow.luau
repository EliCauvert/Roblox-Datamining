local UserActivationFramework = script:FindFirstAncestor("UserActivationFramework")
local AppStorageUtilities = require(UserActivationFramework.Parent.AuthCommon).Utils.AppStorageUtilities
local UserActivationSignupPageStateModule = require(UserActivationFramework.Enums.UserActivationSignupPageState)
local NavigationActionModule = require(UserActivationFramework.Enums.NavigationAction)
local _ = require(UserActivationFramework.Enums.PayloadKey)
local _ = require(UserActivationFramework.Enums.Namespace)

return function(Namespace, Payload, p1)
	-- upvalues: AppStorageUtilities (copy), UserActivationSignupPageStateModule (copy), NavigationActionModule (copy)
	if p1 then
		AppStorageUtilities.setSignupActionRequired("")
		AppStorageUtilities.flush()
	end
	local EnterBirthday = UserActivationSignupPageStateModule.EnterBirthday
	
	return {
		namespace = Namespace,
		state = EnterBirthday,
		availableActions = if EnterBirthday == UserActivationSignupPageStateModule.EnterBirthday then {
			NavigationActionModule.Close,
			NavigationActionModule.Next
		} elseif EnterBirthday == UserActivationSignupPageStateModule.AddAuthMethod then { NavigationActionModule.Next } else {},
		payload = Payload,
		history = { EnterBirthday }
	}
end