local Parent = script.Parent

return {
	projects = {
		require(Parent.Components.Tests)["jest.config"],
		require(Parent.Thunks.Tests)["jest.config"],
		require(Parent.Utils.Tests)["jest.config"]
	}
}