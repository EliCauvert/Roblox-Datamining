local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.Chrome)["jest.config"],
		require(Parent.PeopleReactView)["jest.config"],
		require(Parent.PeopleService)["jest.config"],
		game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Chrome["jest.config"]
	}
}