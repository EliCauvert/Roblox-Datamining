local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsReactModule = require(Parent.SignalsReact)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local EventNames = MomentsCommonModule.Analytics.EventNames
local FeedPlaybackSuspension = MomentsCommonModule.Media.feedPlaybackSuspension
local FireAnalyticsEventFunction = MomentsCommonModule.Analytics.fireAnalyticsEvent
local ReportModalCovering = MomentsCommonModule.Media.reportModalCovering
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseSignalStateFunction = SignalsReactModule.useSignalState
local UseStatusBarHeightFunction = MomentsCommonModule.Hooks.useStatusBarHeight
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local _ = require(script.Parent.PostStatusCardView)
local GetPostStatusCardStoreModule = require(Moments.Stores.GetPostStatusCardStore)
local MakePostFeedbackEventFieldsModule = require(Moments.Analytics.makePostFeedbackEventFields)
local _ = require(Moments.Stores.GetPostStatusCardStore.createPostStatusCardStore)
local CreateRecommendationTelemetryModule = require(Moments.Components.Feed.createRecommendationTelemetry)
local _ = require(Moments.Components.Feed.FeedTypes)
local MakeRecommendationAttributionModule = require(Moments.Analytics.makeRecommendationAttribution)
local SignalActionTypeModule = require(Moments.Enums.SignalActionType)
local UseMomentsSessionFunction = require(Moments.Stores.GetMomentsStore.MomentsSessionContext).useMomentsSession
local ShareMomentModule = require(Moments.Share.shareMoment)
local UseMomentsTabIsVisibleModule = require(Moments.Hooks.useMomentsTabIsVisible)
local UsePostStatusCardMotionModule = require(script.Parent.usePostStatusCardMotion)
local UsePostFeedbackStringsModule = require(Moments.Components.PostFeedback.usePostFeedbackStrings)
local FFlagMomentsFollowingFeedModule = require(Moments.Flags.FFlagMomentsFollowingFeed)
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local GetCommentsSheetStoreModule = if FFlagMomentsComments then require(Moments.Components.Comments.Sheet.getCommentsSheetStore) else nil
local FFlagMomentsCreatorAnalyticsModule = require(Moments.Flags.FFlagMomentsCreatorAnalytics)
local GetPostInsightsPageStoreModule = if FFlagMomentsCreatorAnalyticsModule then require(Moments.Components.PostInsights.getPostInsightsPageStore) else nil
game:DefineFastInt("MomentsPostStatusLiveDismissSeconds", 5)
game:DefineFastInt("MomentsPostStatusFailedDismissSeconds", 5)
local config = {
	shareLinkTitle = "Feature.Moments.Label.ShareLinkTitle",
	linkCopied = "Feature.Moments.Label.LinkCopied",
	linkCopyFailed = "Feature.Moments.Label.LinkCopyFailed"
}

local function _(p1): boolean
	return p1.cardType == "Live" or p1.cardType == "UploadFailed"
end

local _ = function(p1)
	for i = #p1, 1, -1 do
		local v1 = p1[i]
		
		if v1.cardType == "Live" or v1.cardType == "UploadFailed" then
			return p1[i]
		end
	end
	return nil
end

local _ = function(p2)
	local PublishedMoment = p2.publishedMoment
	
	if PublishedMoment == nil then
		return nil
	else
		local FeedItemId = PublishedMoment.recommendationMetadata.feedItemId
		
		return if FeedItemId == nil or FeedItemId == "" then nil else FeedItemId
	end
end

local function makeMedia(Current)
	if Current.cardType ~= "Live" then
		return { kind = "unavailable" }
	end
	local LocalContent = Current.localContent
	
	if LocalContent == nil then
		return { kind = "momentsIcon" }
	else
		local CaptureType = Current.captureType or Enum.CaptureType.Screenshot
		
		return {
			kind = "thumbnail",
			mediaItem = {
				momentId = Current.id,
				content = LocalContent,
				posterContent = if CaptureType == Enum.CaptureType.Video then nil else LocalContent,
				captureType = CaptureType
			}
		}
	end
end

return function()
	-- upvalues: GetPostStatusCardStoreModule (copy), UseSignalStateFunction (copy), UseMomentsTabIsVisibleModule (copy), ReportModalCovering (copy), FeedPlaybackSuspension (copy), FFlagMomentsComments (copy), GetCommentsSheetStoreModule (copy), FFlagMomentsCreatorAnalyticsModule (copy), GetPostInsightsPageStoreModule (copy), UsePostFeedbackStringsModule (copy), UseLocalizationFunction (copy), config (copy), UseTokensFunction (copy), UseStatusBarHeightFunction (copy), UseDeviceInsetsFunction (copy), UseMomentsSessionFunction (copy), ReactModule (copy), FFlagEnableArgus (copy), CreateRecommendationTelemetryModule (copy), UsePostStatusCardMotionModule (copy), MakePostFeedbackEventFieldsModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), makeMedia (copy), ButtonVariant (copy), MakeRecommendationAttributionModule (copy), ShareMomentModule (copy), SignalActionTypeModule (copy), FFlagMomentsFollowingFeedModule (copy)
	local PostStatusCardStoreModule = GetPostStatusCardStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(PostStatusCardStoreModule.getCards)
	local UseMomentsTabIsVisibleModuleResult = UseMomentsTabIsVisibleModule()
	local UseSignalStateResult1 = UseSignalStateFunction(ReportModalCovering.getCovering)
	local UseSignalStateResult2 = UseSignalStateFunction(FeedPlaybackSuspension.getSuspended)
	local UseSignalStateResult3 = if FFlagMomentsComments and GetCommentsSheetStoreModule ~= nil then UseSignalStateFunction(GetCommentsSheetStoreModule(false).getIsExpanded) else false
	local UseSignalStateResult4 = if FFlagMomentsCreatorAnalyticsModule and GetPostInsightsPageStoreModule ~= nil then UseSignalStateFunction(GetPostInsightsPageStoreModule(false).getIsOpen) else false
	local UsePostFeedbackStringsModuleResult = UsePostFeedbackStringsModule()
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseTokensResult = UseTokensFunction()
	local UseStatusBarHeightResult = UseStatusBarHeightFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseMomentsSessionResult = UseMomentsSessionFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagEnableArgus (upval), CreateRecommendationTelemetryModule (upval), UseMomentsSessionResult (copy)
		return if FFlagEnableArgus then CreateRecommendationTelemetryModule({
			getMomentsSessionId = UseMomentsSessionResult.getMomentsSessionId
		}) else nil
	end, { UseMomentsSessionResult })
	local UseRefResult = ReactModule.useRef(nil)
	local Current = nil
	
	if UseMomentsTabIsVisibleModuleResult and not UseSignalStateResult1 and not UseSignalStateResult2 and not UseSignalStateResult3 and not UseSignalStateResult4 then
		Current = nil
		
		for i = #UseSignalStateResult, 1, -1 do
			local UseSignalStateResultEntry = UseSignalStateResult[i]
			
			if UseSignalStateResultEntry.cardType ~= "Live" and UseSignalStateResultEntry.cardType ~= "UploadFailed" then
				continue
			end
			Current = UseSignalStateResult[i]
			break
		end
	else
		Current = nil
	end
	local Id = if Current == nil then nil else Current.id
	local CardType = if Current == nil then nil else Current.cardType
	local UsePostStatusCardMotionModuleResult = UsePostStatusCardMotionModule(Id)
	local HideFunction = UsePostStatusCardMotionModuleResult.hide
	ReactModule.useEffect(function()
		-- upvalues: Id (copy), CardType (copy), UseRefResult (copy), HideFunction (copy), PostStatusCardStoreModule (copy)
		if Id == nil then
			return nil
		else
			local DelayedThread = task.delay(if CardType == "Live" then game:GetFastInt("MomentsPostStatusLiveDismissSeconds") else game:GetFastInt("MomentsPostStatusFailedDismissSeconds"), function()
				-- upvalues: UseRefResult (upval), Id (upval), HideFunction (upval), PostStatusCardStoreModule (upval)
				UseRefResult.current = Id
				HideFunction(function()
					-- upvalues: PostStatusCardStoreModule (upval), Id (upval)
					PostStatusCardStoreModule.dismiss(Id)
				end)
			end)
			
			return function()
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		end
	end, { PostStatusCardStoreModule, Id, CardType, HideFunction })
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), PostStatusCardStoreModule (copy), MakePostFeedbackEventFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval)
		local Current = UseRefResult1.current
		
		if Current ~= nil and PostStatusCardStoreModule.markShown(Current.id) then
			local PostFeedbackEventFieldsModule = MakePostFeedbackEventFieldsModule(Current)
			PostFeedbackEventFieldsModule.cardType = Current.cardType
			FireAnalyticsEventFunction(EventNames.MomentPostStatusCardShown, PostFeedbackEventFieldsModule)
			
			return
		end
	end, { PostStatusCardStoreModule, Id })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Current (copy), makeMedia (upval)
		return if Current == nil then nil else makeMedia(Current)
	end, { Current })
	
	if Current == nil then
		return nil
	end
	local function _(): boolean
		-- upvalues: UseRefResult (copy), Current (copy), HideFunction (copy), PostStatusCardStoreModule (copy)
		if UseRefResult.current == Current.id then
			return false
		else
			UseRefResult.current = Current.id
			HideFunction(function()
				-- upvalues: PostStatusCardStoreModule (upval), Current (upval)
				PostStatusCardStoreModule.dismiss(Current.id)
			end)
			
			return true
		end
	end
	
	local List = {}
	local PublishedMoment = Current.publishedMoment
	local FeedItemId = nil
	
	if PublishedMoment == nil then
		FeedItemId = nil
	else
		local FeedItemId1 = PublishedMoment.recommendationMetadata.feedItemId
		FeedItemId = if FeedItemId1 == nil or FeedItemId1 == "" then nil else FeedItemId1
	end
	local PublishedMoment1 = Current.publishedMoment
	
	if Current.cardType == "Live" and PublishedMoment1 ~= nil and FeedItemId ~= nil then
		table.insert(List, {
			text = UsePostFeedbackStringsModuleResult.share,
			variant = ButtonVariant.SoftEmphasis,
			onActivated = function()
				-- upvalues: UseRefResult (copy), Current (copy), HideFunction (copy), PostStatusCardStoreModule (copy), FireAnalyticsEventFunction (upval), EventNames (upval), MakePostFeedbackEventFieldsModule (upval), MakeRecommendationAttributionModule (upval), PublishedMoment1 (copy), ShareMomentModule (upval), FeedItemId (copy), UseMemoResult (copy), SignalActionTypeModule (upval), UseLocalizationResult (copy)
				local Flag = nil
				if UseRefResult.current == Current.id then
					Flag = false
				else
					UseRefResult.current = Current.id
					HideFunction(function()
						-- upvalues: PostStatusCardStoreModule (upval), Current (upval)
						PostStatusCardStoreModule.dismiss(Current.id)
					end)
					Flag = true
				end
				if Flag then
					FireAnalyticsEventFunction(EventNames.MomentPostStatusCardShareTapped, MakePostFeedbackEventFieldsModule(Current))
					local RecommendationAttributionModule = MakeRecommendationAttributionModule(PublishedMoment1.recommendationMetadata, PublishedMoment1)
					ShareMomentModule({
						momentId = PublishedMoment1.momentId,
						feedItemId = FeedItemId,
						feedSessionId = PublishedMoment1.recommendationMetadata.tracingId,
						description = PublishedMoment1.metadata.description,
						logAction = if UseMemoResult == nil or RecommendationAttributionModule == nil then nil else function(p2)
							-- upvalues: UseMemoResult (upval), SignalActionTypeModule (upval), RecommendationAttributionModule (copy)
							return UseMemoResult.logAction(SignalActionTypeModule.Share, RecommendationAttributionModule, p2)
						end,
						strings = {
							linkPreviewTitle = UseLocalizationResult.shareLinkTitle,
							linkCopied = UseLocalizationResult.linkCopied,
							linkCopyFailed = UseLocalizationResult.linkCopyFailed
						}
					})
					
					return
				end
			end
		})
	end
	table.insert(List, {
		text = UsePostFeedbackStringsModuleResult.dismiss,
		variant = ButtonVariant.Standard,
		onActivated = function()
			-- upvalues: UseRefResult (copy), Current (copy), HideFunction (copy), PostStatusCardStoreModule (copy), MakePostFeedbackEventFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval)
			local Flag = nil
			if UseRefResult.current == Current.id then
				Flag = false
			else
				UseRefResult.current = Current.id
				HideFunction(function()
					-- upvalues: PostStatusCardStoreModule (upval), Current (upval)
					PostStatusCardStoreModule.dismiss(Current.id)
				end)
				Flag = true
			end
			if Flag then
				local PostFeedbackEventFieldsModule = MakePostFeedbackEventFieldsModule(Current)
				PostFeedbackEventFieldsModule.cardType = Current.cardType
				PostFeedbackEventFieldsModule.dismissMethod = "button"
				FireAnalyticsEventFunction(EventNames.MomentPostStatusCardDismissed, PostFeedbackEventFieldsModule)
			end
		end
	})
	local IsLive = Current.cardType == "Live"
	
	return {
		title = if IsLive then UsePostFeedbackStringsModuleResult.liveTitle else UsePostFeedbackStringsModuleResult.failedTitle,
		body = if IsLive then UsePostFeedbackStringsModuleResult.liveBody else UsePostFeedbackStringsModuleResult.failedBody,
		media = UseMemoResult1,
		actions = List,
		shown = UsePostStatusCardMotionModuleResult.shown,
		topInset = UseStatusBarHeightResult + UseTokensResult.Size.Size_1400 + (if FFlagMomentsFollowingFeedModule then UseTokensResult.Size.Size_800 else 0) + UseTokensResult.Padding.Small,
		leftInset = UseDeviceInsetsResult.left,
		rightInset = UseDeviceInsetsResult.right
	}
end