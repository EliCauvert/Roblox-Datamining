local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.PhoneUpsell)["jest.config"],
		require(Parent.AmpUpsell)["jest.config"],
		require(Parent.IdentityVerification)["jest.config"],
		require(Parent.InExperienceContainer)["jest.config"],
		require(Parent.AccountLockModal)["jest.config"]
	}
}