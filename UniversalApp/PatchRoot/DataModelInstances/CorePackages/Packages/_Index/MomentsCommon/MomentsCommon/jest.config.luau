local parent = script.Parent

return {
	projects = {
		require(parent.Components.Tests)["jest.config"],
		require(parent.Hooks.Tests)["jest.config"],
		require(parent.Utils.Tests)["jest.config"]
	}
}