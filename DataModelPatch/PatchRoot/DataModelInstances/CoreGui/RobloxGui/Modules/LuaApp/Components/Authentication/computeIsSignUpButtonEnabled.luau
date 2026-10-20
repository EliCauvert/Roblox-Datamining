local InputValidityModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.Authentication.Enum.InputValidity)

return function(p1): boolean
	-- upvalues: InputValidityModule (copy)
	local ShouldUsePasswordlessSignup = (not p1.passkeySignupEnabled or not p1.shouldUsePasskeySignup or p1.passkeysAvailable) and p1.shouldUsePasswordlessSignup
	
	if not p1.signupCheckboxDisabled and p1.shouldRequireSignupCheckbox and not p1.signupAgreementsChecked then
		return false
	end
	local IsDisplayNameFieldRequired = p1.displayNamesOnSignupExperimentEnabled and p1.isDisplayNameFieldRequired
	local IsNotUsernameValidMatch = p1.usernameValid ~= InputValidityModule.Valid or (p1.passwordValid ~= InputValidityModule.Valid or (p1.shouldUseAlternateBirthday and p1.birthdayValid ~= InputValidityModule.Valid or (if IsDisplayNameFieldRequired then p1.displayNameValid ~= InputValidityModule.Valid else nil)))
	
	if p1.useBirthdayDropdownForGamepadEnabled and p1.birthday and p1.validBirthday == false then
		return false
	elseif p1.shouldUseMinimalSignup and p1.birthday then
		return not p1.shouldUseAlternateBirthday or p1.birthdayValid == InputValidityModule.Valid
	elseif ShouldUsePasswordlessSignup and p1.birthday and p1.username ~= "" and p1.usernameValid == InputValidityModule.Valid then
		return not p1.shouldUseAlternateBirthday or p1.birthdayValid == InputValidityModule.Valid
	elseif p1.birthday and not IsNotUsernameValidMatch and p1.username ~= "" and p1.password ~= "" and ((not IsDisplayNameFieldRequired or p1.displayName ~= "") and not nil) then
		return p1.validBirthday ~= false
	else
		return false
	end
end