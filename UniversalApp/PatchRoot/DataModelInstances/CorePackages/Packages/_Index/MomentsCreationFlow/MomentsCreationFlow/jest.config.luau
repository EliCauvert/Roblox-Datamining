local parent = script.Parent

return {
	projects = {
		require(parent.Components.Tests)["jest.config"],
		require(parent.Thunks.Tests)["jest.config"],
		require(parent.Utils.Tests)["jest.config"]
	}
}