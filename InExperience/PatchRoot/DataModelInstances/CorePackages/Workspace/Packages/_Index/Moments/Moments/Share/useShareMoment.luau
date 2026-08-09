local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local _ = require(parent.MomentsTypes)
local feedContextModule = require(moments.Components.Feed.FeedContext)
local signalActionTypeModule = require(moments.Enums.SignalActionType)
local momentContextModule = require(moments.Components.Feed.Items.Moment.MomentContext)
local shareMomentModule = require(script.Parent.shareMoment)
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	shareLinkTitle = "Feature.Moments.Label.ShareLinkTitle",
	linkCopied = "Feature.Moments.Label.LinkCopied",
	linkCopyFailed = "Feature.Moments.Label.LinkCopyFailed"
}

return function(p0) --[[ line: 31 | named "useShareMoment" ]]
	-- upvalues: momentContextModule (ref), reactModule (ref), feedContextModule (ref), useLocalization (ref), t (ref), signalActionTypeModule (ref), shareMomentModule (ref)
	local momentId = momentContextModule.useMoment().momentId
	local var8 = reactModule.useContext(feedContextModule.FeedContext)
	local var9 = useLocalization(t)
	
	return {
		onShareActivated = reactModule.useCallback(function() --[[ line: 39 ]]
			-- upvalues: p0 (ref), var8 (ref), signalActionTypeModule (copy), shareMomentModule (copy), momentId (ref), var9 (ref)
			local t = nil
			
			if p0 and p0.recommendationMetadata then
				local recommendationMetadata = p0.recommendationMetadata
				
				if recommendationMetadata.itemId and recommendationMetadata.itemId ~= "" then
					t = {
						itemId = recommendationMetadata.itemId,
						tracingId = recommendationMetadata.tracingId
					}
				end
			end
			shareMomentModule({
				momentId = momentId,
				description = if p0 and p0.metadata then p0.metadata.description else nil,
				logAction = if t and var8 then function(p1) --[[ line: 53 ]]
					-- upvalues: var8 (copy), signalActionTypeModule (copy), t (write)
					return var8.logAction(signalActionTypeModule.Share, t, p1)
				end else nil,
				strings = {
					linkPreviewTitle = var9.shareLinkTitle,
					linkCopied = var9.linkCopied,
					linkCopyFailed = var9.linkCopyFailed
				}
			})
		end, { momentId, p0, var8, var9 })
	}
end