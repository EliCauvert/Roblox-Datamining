local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local FeedMessageViewModule = require(Moments.Components.Feed.FeedMessageView)
local UseIsPersonalizedFeedModule = require(Moments.Hooks.useIsPersonalizedFeed)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	emptyTitle = "Feature.Moments.Label.FollowingEmptyTitle",
	emptyBodyRecommended = "Feature.Moments.Description.FollowingEmptyBodyRecommended",
	emptyBodyTrending = "Feature.Moments.Description.FollowingEmptyBodyTrending",
	emptyActionRecommended = "Feature.Moments.Action.ViewRecommended",
	emptyActionTrending = "Feature.Moments.Action.ViewTrending",
	caughtUpTitle = "Feature.Moments.Label.FollowingCaughtUpTitle",
	caughtUpBody = "Feature.Moments.Description.FollowingCaughtUpBody",
	caughtUpAction = "Feature.Moments.Action.ViewOtherFeed"
}
local config1 = {
	emptyTitle = "Follow creators to view their Moments",
	emptyBodyRecommended = "Enjoy Moments from your favorites after you follow a few creators. View recommended to find some.",
	emptyBodyTrending = "Enjoy Moments from your favorites after you follow a few creators. View trending to find some.",
	emptyActionRecommended = "View recommended",
	emptyActionTrending = "View trending",
	caughtUpTitle = "You're caught up for now",
	caughtUpBody = "You've watched all the new Moments in this feed. Switch feeds to view more.",
	caughtUpAction = "View other feed"
}
require(Parent.FoundationCloudAssets).preloadAsset("pictograms/magnifyglassperson")

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseIsPersonalizedFeedModule (copy), config1 (copy), ReactModule (copy), FeedMessageViewModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseIsPersonalizedFeedModuleResult = UseIsPersonalizedFeedModule()
	
	local function _(p1)
		-- upvalues: UseLocalizationResult (copy), config1 (upval)
		local UseLocalizationResultEntry = UseLocalizationResult[p1]
		
		return if UseLocalizationResultEntry == nil or UseLocalizationResultEntry == "" then config1[p1] else UseLocalizationResultEntry
	end
	
	local IsEmpty = Frame.variant == "empty"
	local EmptyBodyRecommended: string = if UseIsPersonalizedFeedModuleResult then "emptyBodyRecommended" else "emptyBodyTrending"
	local EmptyActionRecommended: string = if UseIsPersonalizedFeedModuleResult then "emptyActionRecommended" else "emptyActionTrending"
	local EmptyTitle: string = if IsEmpty then "emptyTitle" else "caughtUpTitle"
	local UseLocalizationResultEntry = UseLocalizationResult[EmptyTitle]
	local Entry = if UseLocalizationResultEntry == nil or UseLocalizationResultEntry == "" then config1[EmptyTitle] else UseLocalizationResultEntry
	local EmptyBodyRecommended1: string = if IsEmpty then EmptyBodyRecommended else "caughtUpBody"
	local UseLocalizationResultEntry1 = UseLocalizationResult[EmptyBodyRecommended1]
	local Entry1 = if UseLocalizationResultEntry1 == nil or UseLocalizationResultEntry1 == "" then config1[EmptyBodyRecommended1] else UseLocalizationResultEntry1
	local EmptyActionRecommended1: string = if IsEmpty then EmptyActionRecommended else "caughtUpAction"
	local UseLocalizationResultEntry2 = UseLocalizationResult[EmptyActionRecommended1]
	
	return ReactModule.createElement(FeedMessageViewModule, {
		LayoutOrder = Frame.LayoutOrder,
		iconName = if IsEmpty then nil else "icons/brands/moments_large",
		pictogram = if IsEmpty then "pictograms/magnifyglassperson" else nil,
		title = Entry,
		description = Entry1,
		primaryAction = {
			testId = "--moments-following-view-recommended",
			text = if UseLocalizationResultEntry2 == nil or UseLocalizationResultEntry2 == "" then config1[EmptyActionRecommended1] else UseLocalizationResultEntry2,
			onActivated = Frame.onViewRecommended
		},
		testId = if IsEmpty then "--moments-following-empty" else "--moments-following-caught-up"
	})
end