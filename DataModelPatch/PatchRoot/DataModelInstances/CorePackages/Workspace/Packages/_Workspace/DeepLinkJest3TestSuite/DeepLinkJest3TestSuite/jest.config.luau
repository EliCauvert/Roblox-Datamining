return {
	projects = {
		game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.LuaApp.DeepLinks["jest.config"],
		require(script.Parent.Parent.Dev.DeepLink)["jest.config"]
	}
}