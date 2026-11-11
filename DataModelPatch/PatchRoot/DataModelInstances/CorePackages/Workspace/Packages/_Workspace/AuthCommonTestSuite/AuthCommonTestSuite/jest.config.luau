local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.PasskeyUpsell)["jest.config"],
		require(Parent.AuthCommon)["jest.config"],
		require(Parent.AccountSwitching)["jest.config"],
		require(Parent.PreHomePage)["jest.config"],
		require(Parent.PlatformRestricted)["jest.config"]
	}
}