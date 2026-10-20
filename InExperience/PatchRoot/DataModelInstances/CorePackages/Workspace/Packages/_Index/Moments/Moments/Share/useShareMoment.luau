local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.MomentsTypes)
local FeedContextModule = require(Moments.Components.Feed.FeedContext)
local SignalActionTypeModule = require(Moments.Enums.SignalActionType)
local MomentContextModule = require(Moments.Components.Feed.Items.Moment.MomentContext)
local MakeRecommendationAttributionModule = require(Moments.Analytics.makeRecommendationAttribution)
local ShareMomentModule = require(script.Parent.shareMoment)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	shareLinkTitle = "Feature.Moments.Label.ShareLinkTitle",
	linkCopied = "Feature.Moments.Label.LinkCopied",
	linkCopyFailed = "Feature.Moments.Label.LinkCopyFailed"
}

return function(p1)
	-- upvalues: MomentContextModule (copy), ReactModule (copy), FeedContextModule (copy), UseLocalizationFunction (copy), config (copy), MakeRecommendationAttributionModule (copy), SignalActionTypeModule (copy), ShareMomentModule (copy)
	local MomentId = MomentContextModule.useMoment().momentId
	local UseContextResult = ReactModule.useContext(FeedContextModule.FeedContext)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return {
		onShareActivated = ReactModule.useCallback(function()
			-- upvalues: MakeRecommendationAttributionModule (upval), p1 (copy), UseContextResult (copy), SignalActionTypeModule (upval), ShareMomentModule (upval), MomentId (copy), UseLocalizationResult (copy)
			local RecommendationAttributionModule = MakeRecommendationAttributionModule(if p1 then p1.recommendationMetadata else nil)
			ShareMomentModule({
				momentId = MomentId,
				feedItemId = if p1 and p1.recommendationMetadata then p1.recommendationMetadata.feedItemId else nil,
				feedSessionId = if p1 and p1.recommendationMetadata then p1.recommendationMetadata.tracingId else nil,
				description = if p1 and p1.metadata then p1.metadata.description else nil,
				logAction = if RecommendationAttributionModule and UseContextResult then function(p2)
					-- upvalues: UseContextResult (upval), SignalActionTypeModule (upval), RecommendationAttributionModule (copy)
					return UseContextResult.logAction(SignalActionTypeModule.Share, RecommendationAttributionModule, p2)
				end else nil,
				strings = {
					linkPreviewTitle = UseLocalizationResult.shareLinkTitle,
					linkCopied = UseLocalizationResult.linkCopied,
					linkCopyFailed = UseLocalizationResult.linkCopyFailed
				}
			})
		end, { MomentId, p1, UseContextResult, UseLocalizationResult })
	}
end