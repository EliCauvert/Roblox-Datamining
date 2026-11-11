local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.ExpChatServer)["jest.config"],
		require(Parent.ExpChat)["jest.config"],
		require(Parent.ExpChat)["mockDataModel-jest.config"],
		require(Parent.ExpChatShared)["jest.config"],
		require(Parent.TextChannelWindow)["jest.config"]
	}
}