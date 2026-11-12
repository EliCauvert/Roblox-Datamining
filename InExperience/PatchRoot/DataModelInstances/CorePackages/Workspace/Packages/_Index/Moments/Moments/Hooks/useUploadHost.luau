local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local MomentsCommonModule = require(Parent.MomentsCommon)
local MomentsTypesModule = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MomentsCreationModule = require(Parent.MomentsCreation)
local SharedFlagsModule = require(Parent.SharedFlags)
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)
local PublishMomentWithUploadFunction = MomentsCreationModule.publishMomentWithUpload
local GetFFlagEnableMomentTextGenerationFunction = MomentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local GetFFlagMomentsUseUploadPostAsyncFunction = MomentsCommonModule.Flags.GetFFlagMomentsUseUploadPostAsync
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventFunction = MomentsCommonModule.Analytics.fireAnalyticsEvent
local LogMomentsLayerExposureFunction = MomentsCommonModule.Utils.logMomentsLayerExposure
local GenerateMomentTextModule = require(Moments.generateMomentText)
local MomentGeneratedTextFeedbackModule = require(Moments.Feedback.momentGeneratedTextFeedback)
local RefreshOwnMomentsAfterPublishModule = require(Moments.Upload.refreshOwnMomentsAfterPublish)
local SetPublishedMomentOnUploadStoreModule = require(Moments.Upload.setPublishedMomentOnUploadStore)
local PostLifecycleSubscriptionModule = require(Moments.Upload.postLifecycleSubscription)
local CreatePublishedPostResolverModule = require(Moments.Upload.createPublishedPostResolver)
local FFlagMomentsHydratePublishedFeedItemModule = require(Moments.Flags.FFlagMomentsHydratePublishedFeedItem)
local FFlagMomentsPostFeedbackIxpEnabledModule = require(Moments.Flags.FFlagMomentsPostFeedbackIxpEnabled)
local FStringMomentsPostFeedbackIxpLayerModule = require(Moments.Flags.FStringMomentsPostFeedbackIxpLayer)
local MakePostFeedbackEventFieldsModule = require(Moments.Analytics.makePostFeedbackEventFields)
local FFlagMomentsPostFeedback = SharedFlagsModule.FFlagMomentsPostFeedback
local FFlagMomentsRefreshOwnMomentsAfterPublish = SharedFlagsModule.FFlagMomentsRefreshOwnMomentsAfterPublish
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsRefreshProfileOnPostStatus = SharedFlagsModule.FFlagMomentsRefreshProfileOnPostStatus
local FFlagMomentsResolvePublishedPostFeedItem = SharedFlagsModule.FFlagMomentsResolvePublishedPostFeedItem
local FFlagMomentsHidePostStatusToast = SharedFlagsModule.FFlagMomentsHidePostStatusToast
game:DefineFastInt("MomentsPendingMomentTtlSeconds", 300)
local GetUploadStoreModule = require(Moments.Stores.GetUploadStore)
local GetPostStatusCardStoreModule = require(Moments.Stores.GetPostStatusCardStore)
local _ = require(Moments.Stores.GetPostStatusCardStore.createPostStatusCardStore)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local _ = require(Moments.Stores.GetToastStore.createToastStore)
local GetLocalUserIdModule = require(Moments.Utils.getLocalUserId)
local UsePostFeedbackStringsModule = require(Moments.Components.PostFeedback.usePostFeedbackStrings)
local MomentsUpload = require(Parent.Loggers).Logger:new("Moments.Upload")
local config = {
	publishingTitle = "Feature.Moments.Label.RodeoPublishingTitle",
	publishingBody = "Feature.Moments.Label.PublishingRodeoBody",
	publishedTitle = "Feature.Moments.Label.MomentPublishedTitle",
	publishedBody = "Feature.Moments.Label.MomentPublishedBody",
	failedTitle = "Feature.Moments.Label.MomentFailedToPostTitle",
	failedBody = "Feature.Moments.Label.MomentFailedToPostBody",
	removedTitle = "Feature.Moments.Title.MomentRemoved",
	removedBody = "Feature.Moments.Label.PostRemovedBody",
	uploadQuotaReachedBody = "Feature.Moments.Description.TooManyUploads",
	generateInProgressTitle = "Feature.Moments.Label.TextGenerateInProgressTitle",
	generateInProgressBody = "Feature.Moments.Label.TextGenerateInProgressBody",
	generatedTitle = "Feature.Moments.Label.TextGeneratedTitle",
	generatedBody = "Feature.Moments.Label.TextGeneratedBody",
	generateFailedTitle = "Feature.Moments.Label.TextGenerationFailedTitle",
	generateFailedBody = "Feature.Moments.Label.TextGenerationFailedBody",
	generateFilteredTitle = "Feature.Moments.Label.TextGenerationFilteredTitle",
	generateFilteredBody = "Feature.Moments.Label.TextGenerationFilteredBody",
	generateOverrideTitle = "Feature.Moments.Label.TextGenerateOverrideTitle",
	generateOverrideBody = "Feature.Moments.Label.TextGenerateOverrideBody"
}
local v1 = require(Parent.MomentsCommon.isStudio)()
local MomentStatus = MomentsTypesModule.Enums.MomentStatus

local function makeUploadedMomentItem(AssetId, Sound, Edits, Description, p1: number)
	-- upvalues: Players (copy), MomentsCreationModule (copy), MomentStatus (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return {
		assetId = AssetId,
		creatorId = if LocalPlayer == nil then 0 else LocalPlayer.UserId,
		metadata = {
			assetTotalDuration = if Sound.CaptureType == Enum.CaptureType.Screenshot then MomentsCreationModule.Constants.ScreenshotMusicDuration elseif p1 == nil or p1 <= 0 then Sound.TimeLength else p1,
			captureType = Sound.CaptureType,
			description = Description,
			edits = Edits,
			placeId = Sound.SourcePlaceId,
			universeId = Sound.SourceUniverseId
		},
		momentId = tostring(AssetId),
		recommendationMetadata = {},
		status = MomentStatus.Public
	}
end

local function _(Sound, Edits, Description, p1)
	-- upvalues: makeUploadedMomentItem (copy), HttpService (copy), MomentStatus (copy)
	local UploadedMomentItem = makeUploadedMomentItem(0, Sound, Edits, Description, p1)
	UploadedMomentItem.momentId = HttpService:GenerateGUID(false)
	UploadedMomentItem.status = MomentStatus.Pending
	local Success, Result = pcall(Content.fromObject, Sound)
	
	if Success then
		UploadedMomentItem.localContent = Result
	end
	return UploadedMomentItem
end

local function isPendingMomentModerated(p1, Id): boolean
	-- upvalues: MomentsGetMomentsUserStoreModule (copy)
	local PendingUserMoment = MomentsGetMomentsUserStoreModule(false).getPendingUserMoments(false)[p1]
	
	if PendingUserMoment == nil then
		return false
	end
	for _, value in PendingUserMoment do
		if value.moment.momentId == Id then
			return value.status == "Moderated"
		end
	end
	return false
end

local _ = function(p2): boolean
	return p2 == "Moderated" or p2 == tostring(Enum.UploadCaptureResult.CaptureModerated)
end

local function setPublishedPostOnUploadStore(p2, p3, p4, Callback: (any) -> (), Callback1: () -> ())
	-- upvalues: FFlagMomentsOptimisticProfilePending (copy)
	local ResolveResult = p2.resolve(p4)
	
	if Callback ~= nil and ResolveResult ~= nil then
		Callback(ResolveResult)
	end
	if Callback1 ~= nil and ResolveResult == nil then
		Callback1()
	end
	if not p2.isCurrent() then return end
	if FFlagMomentsOptimisticProfilePending and p4 ~= nil then
		p3.reset()
		
		return
	end
	if ResolveResult == nil then
		p3.reset()
		
		return
	else
		p3.setSuccess(ResolveResult)
	end
end

local function makeUploadStore(UploadStore, Sound: Sound, Edits, Description, ResolvedTimeLength, CreationSessionId, p2, p3)
	-- upvalues: FFlagMomentsResolvePublishedPostFeedItem (copy), GetFFlagMomentsUseUploadPostAsyncFunction (copy), CreatePublishedPostResolverModule (copy), GetPostStatusCardStoreModule (copy), isPendingMomentModerated (copy), FFlagMomentsRefreshProfileOnPostStatus (copy), FFlagMomentsOptimisticProfilePending (copy), PostLifecycleSubscriptionModule (copy), GetLocalUserIdModule (copy), makeUploadedMomentItem (copy), HttpService (copy), MomentStatus (copy), FFlagMomentsPostFeedbackIxpEnabledModule (copy), LogMomentsLayerExposureFunction (copy), FStringMomentsPostFeedbackIxpLayerModule (copy), FFlagMomentsPostFeedback (copy), MomentsGetMomentsUserStoreModule (copy), MomentsUpload (copy), FFlagMomentsHidePostStatusToast (copy), setPublishedPostOnUploadStore (copy), FFlagMomentsHydratePublishedFeedItemModule (copy), SetPublishedMomentOnUploadStoreModule (copy), FFlagMomentsRefreshOwnMomentsAfterPublish (copy), RefreshOwnMomentsAfterPublishModule (copy)
	local PublishedPostResolverModule = if FFlagMomentsResolvePublishedPostFeedItem and GetFFlagMomentsUseUploadPostAsyncFunction() then CreatePublishedPostResolverModule({
		captureType = Sound.CaptureType,
		description = Description,
		edits = Edits,
		placeId = Sound.SourcePlaceId
	}) else nil
	local MomentId = nil
	local v2 = nil
	local LocalContent = nil
	local StartedAtClock = 0
	
	local function _(Id, CardType, PublishedMoment)
		-- upvalues: LocalContent (ref), Sound (copy), CreationSessionId (copy), StartedAtClock (ref)
		return {
			id = Id,
			cardType = CardType,
			localContent = LocalContent,
			publishedMoment = PublishedMoment,
			captureType = Sound.CaptureType,
			creationSessionId = CreationSessionId,
			localId = if Sound.LocalId == nil then nil else tostring(Sound.LocalId),
			startedAtClock = StartedAtClock
		}
	end
	
	local _ = function(CardType, PublishedMoment)
		-- upvalues: MomentId (ref), GetPostStatusCardStoreModule (upval), LocalContent (ref), Sound (copy), CreationSessionId (copy), StartedAtClock (ref)
		if MomentId ~= nil then
			GetPostStatusCardStoreModule(false).add({
				id = MomentId,
				cardType = CardType,
				localContent = LocalContent,
				publishedMoment = PublishedMoment,
				captureType = Sound.CaptureType,
				creationSessionId = CreationSessionId,
				localId = if Sound.LocalId == nil then nil else tostring(Sound.LocalId),
				startedAtClock = StartedAtClock
			})
			
			return
		end
	end
	
	local function stopAwaitingLiveCard()
		-- upvalues: MomentId (ref), v2 (ref), isPendingMomentModerated (upval), GetPostStatusCardStoreModule (upval), LocalContent (ref), Sound (copy), CreationSessionId (copy), StartedAtClock (ref)
		if MomentId ~= nil then
			local IsPendingMomentModerated = v2 ~= nil and isPendingMomentModerated(v2, MomentId)
			GetPostStatusCardStoreModule(false).stopAwaitingLiveCard(MomentId, if IsPendingMomentModerated then nil else {
				cardType = "Live",
				publishedMoment = nil,
				id = MomentId,
				localContent = LocalContent,
				captureType = Sound.CaptureType,
				creationSessionId = CreationSessionId,
				localId = if Sound.LocalId == nil then nil else tostring(Sound.LocalId),
				startedAtClock = StartedAtClock
			})
			
			return
		end
	end
	
	return {
		setUploading = if FFlagMomentsRefreshProfileOnPostStatus or PublishedPostResolverModule ~= nil then function()
			-- upvalues: FFlagMomentsRefreshProfileOnPostStatus (upval), FFlagMomentsOptimisticProfilePending (upval), PublishedPostResolverModule (copy), PostLifecycleSubscriptionModule (upval), UploadStore (copy), MomentId (ref), GetLocalUserIdModule (upval), Sound (copy), Edits (copy), Description (copy), ResolvedTimeLength (copy), makeUploadedMomentItem (upval), HttpService (upval), MomentStatus (upval), v2 (ref), FFlagMomentsPostFeedbackIxpEnabledModule (upval), p3 (copy), LogMomentsLayerExposureFunction (upval), FStringMomentsPostFeedbackIxpLayerModule (upval), FFlagMomentsPostFeedback (upval), MomentsGetMomentsUserStoreModule (upval), MomentsUpload (upval), LocalContent (ref), StartedAtClock (ref)
			if FFlagMomentsRefreshProfileOnPostStatus or FFlagMomentsOptimisticProfilePending and PublishedPostResolverModule ~= nil then
				PostLifecycleSubscriptionModule.subscribe()
			end
			if PublishedPostResolverModule ~= nil then
				PublishedPostResolverModule.captureSnapshot()
			end
			UploadStore.setUploading()
			
			if FFlagMomentsOptimisticProfilePending and PublishedPostResolverModule ~= nil and MomentId == nil then
				local LocalUserIdModule = GetLocalUserIdModule()
				
				if LocalUserIdModule ~= nil then
					local UploadedMomentItem = makeUploadedMomentItem(0, Sound, Edits, Description, ResolvedTimeLength)
					UploadedMomentItem.momentId = HttpService:GenerateGUID(false)
					UploadedMomentItem.status = MomentStatus.Pending
					local Success, Result = pcall(Content.fromObject, Sound)
					
					if Success then
						UploadedMomentItem.localContent = Result
					end
					MomentId = UploadedMomentItem.momentId
					v2 = LocalUserIdModule
					
					if FFlagMomentsPostFeedbackIxpEnabledModule and p3 then
						LogMomentsLayerExposureFunction(FStringMomentsPostFeedbackIxpLayerModule)
					end
					local ClockTime = if FFlagMomentsPostFeedback then os.clock() else nil
					MomentsGetMomentsUserStoreModule(false).prependPendingUserMoment(LocalUserIdModule, UploadedMomentItem, ClockTime)
					
					if FFlagMomentsPostFeedback then
						MomentsUpload:debug("event=pending_moment_added momentId={}", UploadedMomentItem.momentId)
						LocalContent = UploadedMomentItem.localContent
						StartedAtClock = ClockTime or os.clock()
					end
				end
			end
		end else UploadStore.setUploading,
		setFailed = if FFlagMomentsOptimisticProfilePending and PublishedPostResolverModule ~= nil then function(p4)
			-- upvalues: v2 (ref), MomentId (ref), MomentsGetMomentsUserStoreModule (upval), FFlagMomentsPostFeedback (upval), p2 (copy), GetPostStatusCardStoreModule (upval), LocalContent (ref), Sound (copy), CreationSessionId (copy), StartedAtClock (ref), FFlagMomentsHidePostStatusToast (upval), PublishedPostResolverModule (copy), UploadStore (copy)
			if v2 ~= nil and MomentId ~= nil then
				MomentsGetMomentsUserStoreModule(false).removePendingUserMoment(v2, MomentId)
			end
			if FFlagMomentsPostFeedback and p2 and (p4 ~= "Moderated" and p4 ~= tostring(Enum.UploadCaptureResult.CaptureModerated) and MomentId ~= nil) then
				GetPostStatusCardStoreModule(false).add({
					cardType = "UploadFailed",
					publishedMoment = nil,
					id = MomentId,
					localContent = LocalContent,
					captureType = Sound.CaptureType,
					creationSessionId = CreationSessionId,
					localId = if Sound.LocalId == nil then nil else tostring(Sound.LocalId),
					startedAtClock = StartedAtClock
				})
			end
			if FFlagMomentsHidePostStatusToast and p2 and MomentId ~= nil then
				GetPostStatusCardStoreModule(false).stopAwaitingLiveCard(MomentId, nil)
			end
			if PublishedPostResolverModule.isCurrent() then
				UploadStore.setFailed(p4)
			end
		end else UploadStore.setFailed,
		setSuccess = function(AssetId)
			-- upvalues: UploadStore (copy), FFlagMomentsOptimisticProfilePending (upval), v2 (ref), MomentId (ref), FFlagMomentsHidePostStatusToast (upval), p2 (copy), GetPostStatusCardStoreModule (upval), FFlagMomentsPostFeedback (upval), isPendingMomentModerated (upval), MomentsUpload (upval), LocalContent (ref), Sound (copy), CreationSessionId (copy), StartedAtClock (ref), MomentsGetMomentsUserStoreModule (upval), PublishedPostResolverModule (copy), setPublishedPostOnUploadStore (upval), stopAwaitingLiveCard (copy), FFlagMomentsHydratePublishedFeedItemModule (upval), SetPublishedMomentOnUploadStoreModule (upval), makeUploadedMomentItem (upval), Edits (copy), Description (copy), ResolvedTimeLength (copy), FFlagMomentsRefreshOwnMomentsAfterPublish (upval), RefreshOwnMomentsAfterPublishModule (upval)
			if type(AssetId) ~= "number" then
				UploadStore.setSuccess(AssetId)
				
				return
			end
			if FFlagMomentsOptimisticProfilePending and v2 ~= nil and MomentId ~= nil then
				local v3 = v2
				local Id = MomentId
				
				if FFlagMomentsHidePostStatusToast and p2 then
					GetPostStatusCardStoreModule(false).awaitLiveCard(Id)
				end
				task.delay(game:GetFastInt("MomentsPendingMomentTtlSeconds"), function()
					-- upvalues: FFlagMomentsPostFeedback (upval), isPendingMomentModerated (upval), v3 (copy), Id (copy), MomentsUpload (upval), FFlagMomentsHidePostStatusToast (upval), p2 (upval), MomentId (upval), v2 (upval), GetPostStatusCardStoreModule (upval), LocalContent (upval), Sound (upval), CreationSessionId (upval), StartedAtClock (upval), MomentsGetMomentsUserStoreModule (upval)
					if FFlagMomentsPostFeedback and isPendingMomentModerated(v3, Id) then
						MomentsUpload:debug("event=pending_moment_ttl_skipped momentId={} reason=moderated", Id)
						
						return
					end
					if FFlagMomentsPostFeedback then
						MomentsUpload:debug("event=pending_moment_ttl_expired momentId={}", Id)
					end
					if FFlagMomentsHidePostStatusToast and p2 and MomentId ~= nil then
						local IsPendingMomentModerated = v2 ~= nil and isPendingMomentModerated(v2, MomentId)
						GetPostStatusCardStoreModule(false).stopAwaitingLiveCard(MomentId, if IsPendingMomentModerated then nil else {
							cardType = "Live",
							publishedMoment = nil,
							id = MomentId,
							localContent = LocalContent,
							captureType = Sound.CaptureType,
							creationSessionId = CreationSessionId,
							localId = if Sound.LocalId == nil then nil else tostring(Sound.LocalId),
							startedAtClock = StartedAtClock
						})
					end
					local MomentsGetMomentsUserStoreModuleResult = MomentsGetMomentsUserStoreModule(false)
					MomentsGetMomentsUserStoreModuleResult.removePendingUserMoment(v3, Id)
					MomentsGetMomentsUserStoreModuleResult.invalidateUser(v3)
				end)
			end
			if PublishedPostResolverModule ~= nil then
				task.spawn(setPublishedPostOnUploadStore, PublishedPostResolverModule, UploadStore, MomentId, if FFlagMomentsPostFeedback and p2 then function(PublishedMoment)
					-- upvalues: MomentId (upval), GetPostStatusCardStoreModule (upval), LocalContent (upval), Sound (upval), CreationSessionId (upval), StartedAtClock (upval)
					if MomentId ~= nil then
						GetPostStatusCardStoreModule(false).add({
							cardType = "Live",
							id = MomentId,
							localContent = LocalContent,
							publishedMoment = PublishedMoment,
							captureType = Sound.CaptureType,
							creationSessionId = CreationSessionId,
							localId = if Sound.LocalId == nil then nil else tostring(Sound.LocalId),
							startedAtClock = StartedAtClock
						})
						
						return
					end
				end else nil, if FFlagMomentsHidePostStatusToast and p2 then stopAwaitingLiveCard else nil)
				
				return
			end
			if FFlagMomentsHydratePublishedFeedItemModule then
				task.spawn(SetPublishedMomentOnUploadStoreModule, AssetId, UploadStore)
				
				return
			end
			UploadStore.setSuccess((makeUploadedMomentItem(AssetId, Sound, Edits, Description, ResolvedTimeLength)))
			
			if FFlagMomentsRefreshOwnMomentsAfterPublish then
				task.spawn(RefreshOwnMomentsAfterPublishModule, AssetId)
			end
		end,
		hasPendingRecord = function(): boolean
			-- upvalues: MomentId (ref)
			return MomentId ~= nil
		end
	}
end

local _ = function(Tbl, p2, p3, p4, p5, p6, p7)
	-- upvalues: FireAnalyticsEventFunction (copy), EventNames (copy)
	local Copy = table.clone(Tbl)
	
	function Copy.triggerToast(p8)
		-- upvalues: p3 (copy), p2 (copy), Tbl (copy), p6 (copy), FireAnalyticsEventFunction (upval), EventNames (upval), p7 (copy), p4 (copy), p5 (copy)
		if p8.title == p3 and p2() then
			local TriggerToastResult = Tbl.triggerToast({
				text = "",
				variant = "snackbar",
				placement = "bottom",
				title = p6
			})
			FireAnalyticsEventFunction(EventNames.MomentPostSnackbarShown, p7)
			
			return TriggerToastResult
		else
			return if p8.title == p4 and p8.text == p5 and p2() then 0 else Tbl.triggerToast(p8)
		end
	end
	
	return Copy
end

return function(p2)
	-- upvalues: FFlagMomentsPostFeedback (copy), FFlagMomentsPostFeedbackIxpEnabledModule (copy), UseLocalizationFunction (copy), config (copy), UsePostFeedbackStringsModule (copy), GetFFlagEnableMomentTextGenerationFunction (copy), ReactModule (copy), GetUploadStoreModule (copy), GetToastStoreModule (copy), GenerateMomentTextModule (copy), MomentGeneratedTextFeedbackModule (copy), MomentsCreationModule (copy), v1 (copy), makeUploadStore (copy), PublishMomentWithUploadFunction (copy), MakePostFeedbackEventFieldsModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy)
	local OnExit = p2.onExit
	local CaptureSource = p2.captureSource
	local IsPostFeedback = if FFlagMomentsPostFeedback then p2.postFeedback == true else nil
	local IsLogsPostFeedbackExposure = if FFlagMomentsPostFeedbackIxpEnabledModule then p2.logsPostFeedbackExposure == true else nil
	local UseLocalizationResult = UseLocalizationFunction(config)
	local PostingSnackbar = if FFlagMomentsPostFeedback then UsePostFeedbackStringsModule().postingSnackbar else nil
	local UseRefResult = if GetFFlagEnableMomentTextGenerationFunction() then ReactModule.useRef({}) else nil
	
	return (ReactModule.useMemo(function()
		-- upvalues: GetUploadStoreModule (upval), GetToastStoreModule (upval), GetFFlagEnableMomentTextGenerationFunction (upval), UseRefResult (ref), OnExit (copy), CaptureSource (copy), GenerateMomentTextModule (upval), MomentGeneratedTextFeedbackModule (upval), UseLocalizationResult (copy), MomentsCreationModule (upval), v1 (upval), makeUploadStore (upval), FFlagMomentsPostFeedback (upval), IsPostFeedback (copy), FFlagMomentsPostFeedbackIxpEnabledModule (upval), IsLogsPostFeedbackExposure (copy), PublishMomentWithUploadFunction (upval), PostingSnackbar (copy), MakePostFeedbackEventFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval)
		local UploadStoreModule = GetUploadStoreModule(false)
		local ToastStoreModule = GetToastStoreModule(false)
		local FFlagEnableMomentTextGeneration = GetFFlagEnableMomentTextGenerationFunction()
		
		local function _(p3)
			-- upvalues: ToastStoreModule (copy), UseRefResult (upval)
			local TriggerToastResult = ToastStoreModule.triggerToast(p3)
			
			if UseRefResult ~= nil then
				table.insert(UseRefResult.current, TriggerToastResult)
			end
		end
		
		return {
			exitCreationFlow = OnExit,
			captureSource = CaptureSource,
			generateMomentText = if FFlagEnableMomentTextGeneration then GenerateMomentTextModule else nil,
			momentGeneratedTextFeedback = if FFlagEnableMomentTextGeneration then MomentGeneratedTextFeedbackModule else nil,
			onGenerateTextManualEditBlocked = if FFlagEnableMomentTextGeneration then function()
				-- upvalues: UseLocalizationResult (upval), ToastStoreModule (copy), UseRefResult (upval)
				local TriggerToastResult = ToastStoreModule.triggerToast({
					title = UseLocalizationResult.generateInProgressTitle,
					text = UseLocalizationResult.generateInProgressBody
				})
				
				if UseRefResult ~= nil then
					table.insert(UseRefResult.current, TriggerToastResult)
				end
			end else nil,
			onGenerateTextSuccess = if FFlagEnableMomentTextGeneration then function()
				-- upvalues: UseLocalizationResult (upval), ToastStoreModule (copy), UseRefResult (upval)
				local TriggerToastResult = ToastStoreModule.triggerToast({
					title = UseLocalizationResult.generatedTitle,
					text = UseLocalizationResult.generatedBody
				})
				
				if UseRefResult ~= nil then
					table.insert(UseRefResult.current, TriggerToastResult)
				end
			end else nil,
			onGenerateTextFailure = if FFlagEnableMomentTextGeneration then function()
				-- upvalues: UseLocalizationResult (upval), ToastStoreModule (copy), UseRefResult (upval)
				local TriggerToastResult = ToastStoreModule.triggerToast({
					title = UseLocalizationResult.generateFailedTitle,
					text = UseLocalizationResult.generateFailedBody
				})
				
				if UseRefResult ~= nil then
					table.insert(UseRefResult.current, TriggerToastResult)
				end
			end else nil,
			onGenerateTextFiltered = if FFlagEnableMomentTextGeneration then function()
				-- upvalues: UseLocalizationResult (upval), ToastStoreModule (copy), UseRefResult (upval)
				local TriggerToastResult = ToastStoreModule.triggerToast({
					title = UseLocalizationResult.generateFilteredTitle,
					text = UseLocalizationResult.generateFilteredBody
				})
				
				if UseRefResult ~= nil then
					table.insert(UseRefResult.current, TriggerToastResult)
				end
			end else nil,
			onGenerateTextWillReplaceInput = if FFlagEnableMomentTextGeneration then function()
				-- upvalues: UseLocalizationResult (upval), ToastStoreModule (copy), UseRefResult (upval)
				local TriggerToastResult = ToastStoreModule.triggerToast({
					title = UseLocalizationResult.generateOverrideTitle,
					text = UseLocalizationResult.generateOverrideBody
				})
				
				if UseRefResult ~= nil then
					table.insert(UseRefResult.current, TriggerToastResult)
				end
			end else nil,
			dismissGenerationToasts = if FFlagEnableMomentTextGeneration then function()
				-- upvalues: UseRefResult (upval), ToastStoreModule (copy)
				if UseRefResult ~= nil then
					for _, value in UseRefResult.current do
						ToastStoreModule.dismissToast(value)
					end
					UseRefResult.current = {}
				end
			end else nil,
			isTextFiltered = MomentsCreationModule.isTextFiltered,
			createMoment = if v1 then function(_, _, p3, _, _)
				print(`[moments-creation] dev publish (not uploaded): "{p42}"`)
			end else function(Sound, Edits, Description, CreationSessionId, ResolvedTimeLength, CommentsEnabled)
				-- upvalues: makeUploadStore (upval), UploadStoreModule (copy), FFlagMomentsPostFeedback (upval), IsPostFeedback (upval), FFlagMomentsPostFeedbackIxpEnabledModule (upval), IsLogsPostFeedbackExposure (upval), PublishMomentWithUploadFunction (upval), UseLocalizationResult (upval), PostingSnackbar (upval), ToastStoreModule (copy), MakePostFeedbackEventFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval)
				local UploadStore = makeUploadStore(UploadStoreModule, Sound, Edits, Description, ResolvedTimeLength, CreationSessionId, if FFlagMomentsPostFeedback then IsPostFeedback else nil, if FFlagMomentsPostFeedbackIxpEnabledModule then IsLogsPostFeedbackExposure else nil)
				local config = {
					localizations = UseLocalizationResult,
					uploadStore = UploadStore
				}
				local ToastStore = nil
				
				if IsPostFeedback and PostingSnackbar ~= nil then
					local HasPendingRecordFunction = UploadStore.hasPendingRecord
					local PublishingTitle = UseLocalizationResult.publishingTitle
					local FailedTitle = UseLocalizationResult.failedTitle
					local FailedBody = UseLocalizationResult.failedBody
					local PostFeedbackEventFieldsModule = MakePostFeedbackEventFieldsModule({
						creationSessionId = CreationSessionId,
						localId = if Sound.LocalId == nil then nil else tostring(Sound.LocalId),
						captureType = Sound.CaptureType
					})
					ToastStore = table.clone(ToastStoreModule)
					
					function ToastStore.triggerToast(p3)
						-- upvalues: PublishingTitle (copy), HasPendingRecordFunction (copy), ToastStoreModule (copy), PostingSnackbar (copy), FireAnalyticsEventFunction (upval), EventNames (upval), PostFeedbackEventFieldsModule (copy), FailedTitle (copy), FailedBody (copy)
						if p3.title == PublishingTitle and HasPendingRecordFunction() then
							local TriggerToastResult = ToastStoreModule.triggerToast({
								text = "",
								variant = "snackbar",
								placement = "bottom",
								title = PostingSnackbar
							})
							FireAnalyticsEventFunction(EventNames.MomentPostSnackbarShown, PostFeedbackEventFieldsModule)
							
							return TriggerToastResult
						else
							return if p3.title == FailedTitle and p3.text == FailedBody and HasPendingRecordFunction() then 0 else ToastStoreModule.triggerToast(p3)
						end
					end
				else
					ToastStore = ToastStoreModule
				end
				config.toastStore = ToastStore
				config.creationSessionId = CreationSessionId
				config.resolvedTimeLength = ResolvedTimeLength
				config.commentsEnabled = CommentsEnabled
				PublishMomentWithUploadFunction(Sound, Edits, Description, config)
			end
		}
	end, {
		OnExit, CaptureSource, UseLocalizationResult, PostingSnackbar, IsPostFeedback,
		IsLogsPostFeedbackExposure
	}))
end