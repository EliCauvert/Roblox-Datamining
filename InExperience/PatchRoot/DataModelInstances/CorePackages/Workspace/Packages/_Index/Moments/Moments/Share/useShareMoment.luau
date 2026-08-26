local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local _ = require(parent.MomentsTypes)
local feedContextModule = require(moments.Components.Feed.FeedContext)
local signalActionTypeModule = require(moments.Enums.SignalActionType)
local momentContextModule = require(moments.Components.Feed.Items.Moment.MomentContext)
local makeRecommendationAttributionModule = require(moments.Analytics.makeRecommendationAttribution)
local shareMomentModule = require(script.Parent.shareMoment)
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	shareLinkTitle = "Feature.Moments.Label.ShareLinkTitle",
	linkCopied = "Feature.Moments.Label.LinkCopied",
	linkCopyFailed = "Feature.Moments.Label.LinkCopyFailed"
}

return function(p1)
	-- upvalues: momentContextModule (ref), reactModule (ref), feedContextModule (ref), useLocalization (ref), t (ref), makeRecommendationAttributionModule (ref), signalActionTypeModule (ref), shareMomentModule (ref)
	local momentId = momentContextModule.useMoment().momentId
	local var1 = reactModule.useContext(feedContextModule.FeedContext)
	local var2 = useLocalization(t)
	
	return {
		onShareActivated = reactModule.useCallback(function()
			-- upvalues: makeRecommendationAttributionModule (copy), p1 (ref), var1 (ref), signalActionTypeModule (copy), shareMomentModule (copy), momentId (ref), var2 (ref)
			local var3 = makeRecommendationAttributionModule(if p1 then p1.recommendationMetadata else nil)
			shareMomentModule({
				momentId = momentId,
				feedItemId = if p1 and p1.recommendationMetadata then p1.recommendationMetadata.feedItemId else nil,
				feedSessionId = if p1 and p1.recommendationMetadata then p1.recommendationMetadata.tracingId else nil,
				description = if p1 and p1.metadata then p1.metadata.description else nil,
				logAction = if var3 and var1 then function(p2)
					-- upvalues: var1 (copy), signalActionTypeModule (copy), var3 (ref)
					return var1.logAction(signalActionTypeModule.Share, var3, p2)
				end else nil,
				strings = {
					linkPreviewTitle = var2.shareLinkTitle,
					linkCopied = var2.linkCopied,
					linkCopyFailed = var2.linkCopyFailed
				}
			})
		end, { momentId, p1, var1, var2 })
	}
end