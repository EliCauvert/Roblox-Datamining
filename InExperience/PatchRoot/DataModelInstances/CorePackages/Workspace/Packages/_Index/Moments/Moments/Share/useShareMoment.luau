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

return function(p0) --[[ line: 32 | named "useShareMoment" ]]
	-- upvalues: momentContextModule (ref), reactModule (ref), feedContextModule (ref), useLocalization (ref), t (ref), makeRecommendationAttributionModule (ref), signalActionTypeModule (ref), shareMomentModule (ref)
	local momentId = momentContextModule.useMoment().momentId
	local var9 = reactModule.useContext(feedContextModule.FeedContext)
	local var10 = useLocalization(t)
	
	return {
		onShareActivated = reactModule.useCallback(function() --[[ line: 40 ]]
			-- upvalues: makeRecommendationAttributionModule (copy), p0 (ref), var9 (ref), signalActionTypeModule (copy), shareMomentModule (copy), momentId (ref), var10 (ref)
			local var11 = makeRecommendationAttributionModule(if p0 then p0.recommendationMetadata else nil)
			shareMomentModule({
				momentId = momentId,
				feedItemId = if p0 and p0.recommendationMetadata then p0.recommendationMetadata.feedItemId else nil,
				feedSessionId = if p0 and p0.recommendationMetadata then p0.recommendationMetadata.tracingId else nil,
				description = if p0 and p0.metadata then p0.metadata.description else nil,
				logAction = if var11 and var9 then function(p1) --[[ line: 49 ]]
					-- upvalues: var9 (copy), signalActionTypeModule (copy), var11 (ref)
					return var9.logAction(signalActionTypeModule.Share, var11, p1)
				end else nil,
				strings = {
					linkPreviewTitle = var10.shareLinkTitle,
					linkCopied = var10.linkCopied,
					linkCopyFailed = var10.linkCopyFailed
				}
			})
		end, { momentId, p0, var9, var10 })
	}
end