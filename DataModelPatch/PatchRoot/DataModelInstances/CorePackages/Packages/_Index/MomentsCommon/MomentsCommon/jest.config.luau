local Parent = script.Parent

return {
	projects = {
		require(Parent.Components.Tests)["jest.config"],
		require(Parent.Hooks.Tests)["jest.config"],
		require(Parent.Utils.Tests)["jest.config"]
	}
}