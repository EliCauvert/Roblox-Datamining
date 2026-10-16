local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local momentsCommonModule = require(parent.MomentsCommon)
local sharedFlagsModule = require(parent.SharedFlags)
local momentsGetMomentsCommentsStoreModule = require(parent.DataHydration.MomentsGetMomentsCommentsStore)
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local fFlagMomentsCommentsIxpEnabled = sharedFlagsModule.FFlagMomentsCommentsIxpEnabled
local useVerticalPager = require(moments.Components.VerticalPager).useVerticalPager
local usePagerItem = require(moments.Components.VerticalPager).usePagerItem
local useFeedOptional = require(moments.Components.Feed.FeedContext).useFeedOptional
local fStringMomentsCommentsIxpLayerModule = require(moments.Flags.FStringMomentsCommentsIxpLayer)
local fFlagMomentsCommentsCountAnalyticsModule = require(moments.Flags.FFlagMomentsCommentsCountAnalytics)
local makeCommentCountFieldsModule = require(moments.Analytics.makeCommentCountFields)

return function(p1)
	-- upvalues: useVerticalPager (ref), usePagerItem (ref), useFeedOptional (ref), reactModule (ref), signalsModule (ref), signalsReactModule (ref), fFlagMomentsComments (ref), fFlagMomentsCommentsCountAnalyticsModule (ref), makeCommentCountFieldsModule (ref), momentsGetMomentsCommentsStoreModule (ref), momentsCommonModule (ref), fFlagMomentsCommentsIxpEnabled (ref), fStringMomentsCommentsIxpLayerModule (ref)
	local var1 = useVerticalPager()
	local var2 = useFeedOptional()
	local item = usePagerItem().item
	local var3 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), item (ref), var1 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: item (copy), var1 (copy)
			return item ~= nil and var1.store.getCurrentItem(p2) == item
		end)
	end, { var1, item }))
	local var4 = p1 and (var3 and (var2 ~= nil and var2.isActiveFeed))
	local var5 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var4 (ref), item (ref), fFlagMomentsComments (copy), fFlagMomentsCommentsCountAnalyticsModule (copy), makeCommentCountFieldsModule (copy), momentsGetMomentsCommentsStoreModule (copy), momentsCommonModule (copy), fFlagMomentsCommentsIxpEnabled (copy), fStringMomentsCommentsIxpLayerModule (copy)
		local current = var5.current
		var5.current = var4
		
		if not var4 or current or (item == nil or item.kind ~= "moment") then return end
		local recommendationMetadata = item.moment.recommendationMetadata
		local var6 = if recommendationMetadata ~= nil then nil else recommendationMetadata.feedItemId
		
		if fFlagMomentsComments and var6 ~= nil and var6 ~= "" then
			local var7 = if fFlagMomentsCommentsCountAnalyticsModule then makeCommentCountFieldsModule(momentsGetMomentsCommentsStoreModule(false).getCachedMomentComments(var6).data(false)) else {}
			var7.feedItemId = var6
			momentsCommonModule.Analytics.fireAnalyticsEvent(momentsCommonModule.Analytics.EventNames.MomentCommentActionButtonImpression, var7)
		end
		if fFlagMomentsCommentsIxpEnabled then
			momentsCommonModule.Utils.logMomentsLayerExposure(fStringMomentsCommentsIxpLayerModule)
		end
	end, { var4, item })
end