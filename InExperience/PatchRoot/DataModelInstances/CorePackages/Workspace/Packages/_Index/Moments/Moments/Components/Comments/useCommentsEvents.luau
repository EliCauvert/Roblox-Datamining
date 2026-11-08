local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.MomentsTypes)
local MomentsCommonModule = require(Parent.MomentsCommon)
local MomentsGetMomentsCommentsStoreModule = require(Parent.DataHydration.MomentsGetMomentsCommentsStore)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppAppLifecycleObserverService = require(Parent.RoactServiceTags).AppAppLifecycleObserverService
local UseFeedOptionalFunction = require(Moments.Components.Feed.FeedContext).useFeedOptional
local MakeRecommendationAttributionModule = require(Moments.Analytics.makeRecommendationAttribution)
local MakeCommentCountFieldsModule = require(Moments.Analytics.makeCommentCountFields)
local _ = require(Moments.Analytics.RecommendationContentType)
local FFlagMomentsCommentsCountAnalyticsModule = require(Moments.Flags.FFlagMomentsCommentsCountAnalytics)
local FFlagMomentsRecommendationContentTypeModule = require(Moments.Flags.FFlagMomentsRecommendationContentType)
local GetCommentsSheetStoreModule = require(script.Parent.Sheet.getCommentsSheetStore)
local CreateCommentsRecommendationSessionModule = require(script.Parent.createCommentsRecommendationSession)
local CreateCommentsAnalyticsSessionModule = require(script.Parent.createCommentsAnalyticsSession)
local UseCommentCapabilitiesModule = require(script.Parent.useCommentCapabilities)
local _ = require(script.Parent.Sheet.createCommentsSheetStore)
local FFlagMomentsCommentDeepLinks = require(Parent.SharedFlags).FFlagMomentsCommentDeepLinks
local GetDeepLinkStoreModule = if FFlagMomentsCommentDeepLinks then require(Moments.Stores.GetDeepLinkStore) else nil

return function(p1, Callback, p2)
	-- upvalues: UseFeedOptionalFunction (copy), UseRoactServiceFunction (copy), AppAppLifecycleObserverService (copy), GetCommentsSheetStoreModule (copy), ReactModule (copy), SignalsModule (copy), UseCommentCapabilitiesModule (copy), MakeRecommendationAttributionModule (copy), FFlagMomentsRecommendationContentTypeModule (copy), CreateCommentsRecommendationSessionModule (copy), MomentsGetMomentsCommentsStoreModule (copy), MomentsCommonModule (copy), FFlagMomentsCommentsCountAnalyticsModule (copy), MakeCommentCountFieldsModule (copy), CreateCommentsAnalyticsSessionModule (copy), FFlagMomentsCommentDeepLinks (copy), GetDeepLinkStoreModule (copy)
	local UseFeedOptionalResult = UseFeedOptionalFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppAppLifecycleObserverService)
	local CommentsSheetStoreModule = GetCommentsSheetStoreModule(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local IsPlaybackActive = UseFeedOptionalResult ~= nil and (UseFeedOptionalResult.isActiveFeed and UseFeedOptionalResult.isPlaybackActive)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(true)
		
		return { get = Signal, set = Signal2 }
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRoactServiceResult (copy), UseMemoResult (copy)
		if UseRoactServiceResult == nil then return end
		local OnHideConnection = UseRoactServiceResult.OnHide:Connect(function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.set(false)
		end)
		local OnUnhideConnection = UseRoactServiceResult.OnUnhide:Connect(function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.set(true)
		end)
		
		return function()
			-- upvalues: OnHideConnection (copy), OnUnhideConnection (copy)
			OnHideConnection:Disconnect()
			OnUnhideConnection:Disconnect()
		end
	end, { UseRoactServiceResult, UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy), CommentsSheetStoreModule (copy), UseRefResult (copy), UseRefResult1 (copy), IsPlaybackActive (copy)
		return SignalsModule.createEffect(function(p3)
			-- upvalues: UseMemoResult (upval), CommentsSheetStoreModule (upval), UseRefResult (upval), UseRefResult1 (upval), IsPlaybackActive (upval)
			local GetResult = UseMemoResult.get(p3)
			local IsOpen = CommentsSheetStoreModule.getIsOpen(p3)
			local OpenSessionId = CommentsSheetStoreModule.getOpenSessionId(p3)
			local FeedItemId = CommentsSheetStoreModule.getFeedItemId(false) or ""
			local Current = UseRefResult.current
			local Current1 = UseRefResult1.current
			local IsOpen1 = IsPlaybackActive and (GetResult and IsOpen)
			
			if Current ~= nil then
				if IsOpen1 and CommentsSheetStoreModule.getRecommendationSession(FeedItemId, OpenSessionId) == Current then
					Current.startView()
				else
					Current.finishView()
				end
			end
			if Current1 ~= nil then
				if IsOpen1 and CommentsSheetStoreModule.getAnalyticsSession(FeedItemId, OpenSessionId) == Current1 then
					Current1.startView()
					
					return
				end
				if not GetResult then
					Current1.finishView("app_hidden")
					
					return
				end
				if not IsPlaybackActive then
					Current1.finishView("navigation_hidden")
				end
			end
		end)
	end, {
		IsPlaybackActive,
		CommentsSheetStoreModule,
		UseMemoResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult (upval), UseRefResult1 (upval)
			if UseRefResult.current ~= nil then
				UseRefResult.current.finishView()
			end
			if UseRefResult1.current ~= nil then
				UseRefResult1.current.finishView("unmounted")
			end
		end
	end, {})
	local CanRead = UseCommentCapabilitiesModule().canRead
	local UseResult = ReactModule.useCallback(function(p3)
		-- upvalues: p1 (copy), CanRead (copy), MakeRecommendationAttributionModule (upval), FFlagMomentsRecommendationContentTypeModule (upval), p2 (copy), UseFeedOptionalResult (copy), CreateCommentsRecommendationSessionModule (upval), Callback (copy), MomentsGetMomentsCommentsStoreModule (upval), MomentsCommonModule (upval), FFlagMomentsCommentsCountAnalyticsModule (upval), MakeCommentCountFieldsModule (upval), CreateCommentsAnalyticsSessionModule (upval), UseRefResult (copy), UseRefResult1 (copy), CommentsSheetStoreModule (copy), FFlagMomentsCommentDeepLinks (upval)
		local FeedItemId = if p1 == nil then nil else p1.feedItemId
		
		if FeedItemId == nil or FeedItemId == "" or not CanRead then return end
		local Current = nil
		local RecommendationAttributionModule = MakeRecommendationAttributionModule(p1, nil, if FFlagMomentsRecommendationContentTypeModule then p2 else nil)
		
		if UseFeedOptionalResult ~= nil and RecommendationAttributionModule ~= nil then
			Current = CreateCommentsRecommendationSessionModule(UseFeedOptionalResult.logAction, RecommendationAttributionModule, Callback(false))
		end
		local MomentsGetMomentsCommentsStoreModuleResult = MomentsGetMomentsCommentsStoreModule(false)
		local OwnerGeneration = MomentsGetMomentsCommentsStoreModuleResult.getOwnerGeneration(false)
		local IsRecommendationSourceMatch: boolean = UseFeedOptionalResult ~= nil and (UseFeedOptionalResult.recommendationSource == MomentsCommonModule.Analytics.RecommendationSource.Profile or UseFeedOptionalResult.recommendationSource == MomentsCommonModule.Analytics.RecommendationSource.MyMoments)
		local CommentsAnalyticsSessionModule = CreateCommentsAnalyticsSessionModule(FeedItemId, if IsRecommendationSourceMatch then "profile" else "watch_tab", function(): boolean
			-- upvalues: MomentsGetMomentsCommentsStoreModuleResult (copy), OwnerGeneration (copy)
			return MomentsGetMomentsCommentsStoreModuleResult.getOwnerGeneration(false) == OwnerGeneration
		end, nil, nil, nil, if FFlagMomentsCommentsCountAnalyticsModule then function()
			-- upvalues: MakeCommentCountFieldsModule (upval), MomentsGetMomentsCommentsStoreModuleResult (copy), FeedItemId (copy)
			return MakeCommentCountFieldsModule(MomentsGetMomentsCommentsStoreModuleResult.getCachedMomentComments(FeedItemId).data(false))
		end else nil)
		UseRefResult.current = Current
		UseRefResult1.current = CommentsAnalyticsSessionModule
		CommentsSheetStoreModule.open(FeedItemId, Current, CommentsAnalyticsSessionModule, if FFlagMomentsCommentDeepLinks then p3 else nil)
	end, {
		p1 or false, UseFeedOptionalResult or false, CommentsSheetStoreModule,
		Callback, FFlagMomentsRecommendationContentTypeModule and p2 or false, CanRead
	})
	
	if FFlagMomentsCommentDeepLinks and GetDeepLinkStoreModule ~= nil then
		local FeedItemId = if p1 == nil then nil else p1.feedItemId
		local GetCurrentItem = if UseFeedOptionalResult == nil then nil else UseFeedOptionalResult.getCurrentItem
		ReactModule.useEffect(function()
			-- upvalues: IsPlaybackActive (copy), CanRead (copy), GetCurrentItem (copy), FeedItemId (copy), GetDeepLinkStoreModule (upval), SignalsModule (upval), UseResult (copy)
			if not IsPlaybackActive or not CanRead or GetCurrentItem == nil or FeedItemId == nil or FeedItemId == "" then return end
			local DeepLinkStoreModule = GetDeepLinkStoreModule()
			
			return SignalsModule.createEffect(function(p3)
				-- upvalues: DeepLinkStoreModule (copy), FeedItemId (upval), GetCurrentItem (upval), UseResult (upval)
				local PendingCommentsTarget = DeepLinkStoreModule.getPendingCommentsTarget(p3)
				
				if PendingCommentsTarget == nil or PendingCommentsTarget.feedItemId ~= FeedItemId then return end
				local CurrentItem = GetCurrentItem(p3)
				local FeedItemId1 = nil
				
				if CurrentItem == nil or CurrentItem.kind ~= "moment" then
					if CurrentItem ~= nil and CurrentItem.kind == "avatarMoment" then
						FeedItemId1 = CurrentItem.moment.recommendationMetadata.feedItemId
					end
				else
					FeedItemId1 = CurrentItem.moment.recommendationMetadata.feedItemId
				end
				if FeedItemId1 ~= FeedItemId then return end
				local TakeCommentsTargetResult = DeepLinkStoreModule.takeCommentsTarget(FeedItemId)
				
				if TakeCommentsTargetResult ~= nil then
					UseResult(TakeCommentsTargetResult)
				end
			end)
		end, {
			IsPlaybackActive,
			CanRead,
			GetCurrentItem or false,
			FeedItemId or false,
			UseResult
		})
		
		return ReactModule.useCallback(function()
			-- upvalues: UseResult (copy)
			UseResult(nil)
		end, { UseResult })
	else
		return UseResult
	end
end