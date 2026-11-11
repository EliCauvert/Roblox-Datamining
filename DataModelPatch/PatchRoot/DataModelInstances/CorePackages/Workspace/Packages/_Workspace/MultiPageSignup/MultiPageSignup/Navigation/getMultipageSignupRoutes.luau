local MultiPageSignup = script:FindFirstAncestor("MultiPageSignup")
local Parent = MultiPageSignup.Parent
local UserActivationFrameworkModule = require(Parent.UserActivationFramework)
local UserActivationSignupPageState = UserActivationFrameworkModule.Enums.UserActivationSignupPageState
local _ = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local EnterBirthdayComponentModule = require(MultiPageSignup.Components.EnterBirthdayComponent)
local EnterUserIdentifierComponentModule = require(MultiPageSignup.Components.EnterUserIdentifierComponent)
local AddAuthMethodComponentModule = require(MultiPageSignup.Components.AddAuthMethodComponent)
local SelectGenderComponentModule = require(MultiPageSignup.Components.SelectGenderComponent)
local NonInteractiveStoreUserAgreementsComponentModule = require(MultiPageSignup.Components.NonInteractiveStoreUserAgreementsComponent)
local CryoModule = require(Parent.Cryo)
local Namespace = UserActivationFrameworkModule.Enums.Namespace

local function _(p1)
	-- upvalues: CryoModule (copy), Namespace (copy), ReactModule (copy)
	return function(p2)
		-- upvalues: CryoModule (upval), Namespace (upval), ReactModule (upval), p1 (copy)
		return ReactModule.createElement(p1, (CryoModule.Dictionary.join(p2, { namespace = Namespace.MultiPageSignup })))
	end
end

return function()
	-- upvalues: UserActivationSignupPageState (copy), EnterBirthdayComponentModule (copy), CryoModule (copy), Namespace (copy), ReactModule (copy), NonInteractiveStoreUserAgreementsComponentModule (copy), EnterUserIdentifierComponentModule (copy), AddAuthMethodComponentModule (copy), SelectGenderComponentModule (copy)
	return {
		{
			[UserActivationSignupPageState.EnterBirthday] = function(p1)
				-- upvalues: CryoModule (upval), Namespace (upval), ReactModule (upval), EnterBirthdayComponentModule (copy)
				return ReactModule.createElement(EnterBirthdayComponentModule, (CryoModule.Dictionary.join(p1, { namespace = Namespace.MultiPageSignup })))
			end
		},
		{
			[UserActivationSignupPageState.NonInteractiveStoreUserAgreements] = function(p1)
				-- upvalues: CryoModule (upval), Namespace (upval), ReactModule (upval), NonInteractiveStoreUserAgreementsComponentModule (copy)
				return ReactModule.createElement(NonInteractiveStoreUserAgreementsComponentModule, (CryoModule.Dictionary.join(p1, { namespace = Namespace.MultiPageSignup })))
			end
		},
		{
			[UserActivationSignupPageState.EnterUserIdentifier] = function(p1)
				-- upvalues: CryoModule (upval), Namespace (upval), ReactModule (upval), EnterUserIdentifierComponentModule (copy)
				return ReactModule.createElement(EnterUserIdentifierComponentModule, (CryoModule.Dictionary.join(p1, { namespace = Namespace.MultiPageSignup })))
			end
		},
		{
			[UserActivationSignupPageState.AddAuthMethod] = function(p1)
				-- upvalues: CryoModule (upval), Namespace (upval), ReactModule (upval), AddAuthMethodComponentModule (copy)
				return ReactModule.createElement(AddAuthMethodComponentModule, (CryoModule.Dictionary.join(p1, { namespace = Namespace.MultiPageSignup })))
			end
		},
		{
			[UserActivationSignupPageState.SelectGender] = function(p1)
				-- upvalues: CryoModule (upval), Namespace (upval), ReactModule (upval), SelectGenderComponentModule (copy)
				return ReactModule.createElement(SelectGenderComponentModule, (CryoModule.Dictionary.join(p1, { namespace = Namespace.MultiPageSignup })))
			end
		}
	}
end