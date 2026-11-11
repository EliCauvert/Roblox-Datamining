_G.__TESTEZ_RUNNING_TEST__ = true
local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.SduiCompat)["jest.config"],
		require(Parent.SduiCoreSystem)["jest.config"],
		require(Parent.SduiSharedContent)["jest.config"],
		require(Parent.SduiSharedUtilities)["jest.config"]
	}
}