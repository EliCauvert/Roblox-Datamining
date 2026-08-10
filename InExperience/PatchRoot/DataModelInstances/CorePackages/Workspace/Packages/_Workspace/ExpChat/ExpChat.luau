local parent = script.Parent

return {
	Events = require(script.Events),
	mountClientApp = require(script.mountClientApp),
	listenToDispatch = require(script.listenToDispatch)(require(parent.ExpChatShared).ActionBindableEvent),
	GlobalFlags = require(script.GlobalFlags),
	getExperienceChatVisualConfig = require(script.getExperienceChatVisualConfig),
	Stores = require(script.Stores),
	Hooks = {
		useExpChatMessagesReducerSlice = require(script.useExpChatMessagesReducerSlice)
	},
	isUserChatEnabled = require(script.isUserChatEnabled),
	requestSelectTab = require(script.ExternalNavigation.requestSelectTab),
	requestSelectFriendsTab = require(script.ExternalNavigation.requestSelectFriendsTab),
	shouldSuppressUnreadForTabMetadata = require(script.shouldSuppressUnreadForTabMetadata),
	ExpChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker,
	["jest.config"] = script["jest.config"],
	["jest.bench.config"] = script["jest.bench.config"],
	["mockDataModel-jest.config"] = script["mockDataModel-jest.config"]
}