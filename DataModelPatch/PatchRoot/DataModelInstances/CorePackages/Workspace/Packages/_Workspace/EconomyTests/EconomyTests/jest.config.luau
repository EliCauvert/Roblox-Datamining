local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.AvatarSwitcher)["jest.config"],
		require(Parent.CurrencyTransfers)["jest.config"],
		require(Parent.InExperienceShop)["jest.main.config"],
		require(Parent.InExperienceShop)["jest.mockDataModel.config"]
	}
}