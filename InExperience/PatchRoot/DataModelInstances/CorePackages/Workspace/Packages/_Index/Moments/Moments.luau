local FeedModule = require(script.Components.Feed)

return {
	["jest.config"] = script["jest.config"],
	["jest.main.config"] = script["jest.main.config"],
	["jest.mockDataModel.config"] = script["jest.mockDataModel.config"],
	Constants = require(script.Constants),
	Enums = require(script.Enums),
	Feed = FeedModule.Feed,
	createFeedStore = FeedModule.createFeedStore,
	createMockFeedSource = FeedModule.createMockFeedSource,
	createSnapshotFeedSource = FeedModule.createSnapshotFeedSource,
	useFeed = FeedModule.useFeed,
	MomentItem = require(script.Components.Feed.Items.Moment.MomentItem),
	MomentsTabEntry = require(script.MomentsTabEntry),
	MomentsFeedSurface = require(script.Components.MomentsFeedSurface),
	MomentsBackHeader = require(script.Components.MomentsBackHeader),
	MomentsHostShell = require(script.Components.MomentsHostShell),
	MomentsImmersivePresentation = require(script.Components.MomentsImmersivePresentation),
	reportMoment = require(script.Moderation.reportMoment)
}