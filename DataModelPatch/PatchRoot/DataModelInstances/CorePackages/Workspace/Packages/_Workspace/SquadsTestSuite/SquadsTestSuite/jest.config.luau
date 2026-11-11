local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.NetworkingSquads)["jest.config"],
		require(Parent.RoduxSquads)["jest.config"],
		require(Parent.Squads)["jest.config"],
		require(Parent.SquadsCore)["jest.config"]
	}
}