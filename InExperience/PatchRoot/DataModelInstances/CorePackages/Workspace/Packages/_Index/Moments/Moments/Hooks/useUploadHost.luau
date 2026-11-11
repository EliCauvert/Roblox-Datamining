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
local GenerateMomentTextModule = require(Moments.generateMomentText)
local MomentGeneratedTextFeedbackModule = require(Moments.Feedback.momentGeneratedTextFeedback)
local RefreshOwnMomentsAfterPublishModule = require(Moments.Upload.refreshOwnMomentsAfterPublish)
local SetPublishedMomentOnUploadStoreModule = require(Moments.Upload.setPublishedMomentOnUploadStore)
local PostLifecycleSubscriptionModule = require(Moments.Upload.postLifecycleSubscription)
local CreatePublishedPostResolverModule = require(Moments.Upload.createPublishedPostResolver)
local FFlagMomentsHydratePublishedFeedItemModule = require(Moments.Flags.FFlagMomentsHydratePublishedFeedItem)
local FFlagMomentsPostFeedback = SharedFlagsModule.FFlagMomentsPostFeedback
local FFlagMomentsRefreshOwnMomentsAfterPublish = SharedFlagsModule.FFlagMomentsRefreshOwnMomentsAfterPublish
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsRefreshProfileOnPostStatus = SharedFlagsModule.FFlagMomentsRefreshProfileOnPostStatus
local FFlagMomentsResolvePublishedPostFeedItem = SharedFlagsModule.FFlagMomentsResolvePublishedPostFeedItem
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

local function isPendingMomentModerated(p1, MomentId): boolean
	-- upvalues: MomentsGetMomentsUserStoreModule (copy)
	local PendingUserMoment = MomentsGetMomentsUserStoreModule(false).getPendingUserMoments(false)[p1]
	
	if PendingUserMoment == nil then
		return false
	end
	for _, value in PendingUserMoment do
		if value.moment.momentId == MomentId then
			return value.status == "Moderated"
		end
	end
	return false
end

local function setPublishedPostOnUploadStore(p2, p3, p4, Callback: (any) -> ())
	-- upvalues: FFlagMomentsOptimisticProfilePending (copy)
	local ResolveResult = p2.resolve(p4)
	
	if Callback ~= nil and ResolveResult ~= nil then
		Callback(ResolveResult)
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

local function makeUploadStore(UploadStore, Sound: Sound, Edits, Description, ResolvedTimeLength, CreationSessionId)
	-- upvalues: FFlagMomentsResolvePublishedPostFeedItem (copy), GetFFlagMomentsUseUploadPostAsyncFunction (copy), CreatePublishedPostResolverModule (copy), GetPostStatusCardStoreModule (copy), FFlagMomentsRefreshProfileOnPostStatus (copy), FFlagMomentsOptimisticProfilePending (copy), PostLifecycleSubscriptionModule (copy), GetLocalUserIdModule (copy), makeUploadedMomentItem (copy), HttpService (copy), MomentStatus (copy), FFlagMomentsPostFeedback (copy), MomentsGetMomentsUserStoreModule (copy), MomentsUpload (copy), isPendingMomentModerated (copy), setPublishedPostOnUploadStore (copy), FFlagMomentsHydratePublishedFeedItemModule (copy), SetPublishedMomentOnUploadStoreModule (copy), FFlagMomentsRefreshOwnMomentsAfterPublish (copy), RefreshOwnMomentsAfterPublishModule (copy)
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
	
	local function addPostStatusCard(CardType, PublishedMoment)
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
	
	return {
		setUploading = if FFlagMomentsRefreshProfileOnPostStatus or PublishedPostResolverModule ~= nil then function()
			-- upvalues: FFlagMomentsRefreshProfileOnPostStatus (upval), FFlagMomentsOptimisticProfilePending (upval), PublishedPostResolverModule (copy), PostLifecycleSubscriptionModule (upval), UploadStore (copy), MomentId (ref), GetLocalUserIdModule (upval), Sound (copy), Edits (copy), Description (copy), ResolvedTimeLength (copy), makeUploadedMomentItem (upval), HttpService (upval), MomentStatus (upval), v2 (ref), FFlagMomentsPostFeedback (upval), MomentsGetMomentsUserStoreModule (upval), MomentsUpload (upval), LocalContent (ref), StartedAtClock (ref)
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
		setFailed = if FFlagMomentsOptimisticProfilePending and PublishedPostResolverModule ~= nil then function(p2)
			-- upvalues: v2 (ref), MomentId (ref), MomentsGetMomentsUserStoreModule (upval), FFlagMomentsPostFeedback (upval), addPostStatusCard (copy), PublishedPostResolverModule (copy), UploadStore (copy)
			if v2 ~= nil and MomentId ~= nil then
				MomentsGetMomentsUserStoreModule(false).removePendingUserMoment(v2, MomentId)
			end
			if FFlagMomentsPostFeedback then
				addPostStatusCard("UploadFailed")
			end
			if PublishedPostResolverModule.isCurrent() then
				UploadStore.setFailed(p2)
			end
		end else UploadStore.setFailed,
		setSuccess = function(AssetId)
			-- upvalues: UploadStore (copy), FFlagMomentsOptimisticProfilePending (upval), v2 (ref), MomentId (ref), FFlagMomentsPostFeedback (upval), isPendingMomentModerated (upval), MomentsUpload (upval), MomentsGetMomentsUserStoreModule (upval), PublishedPostResolverModule (copy), setPublishedPostOnUploadStore (upval), addPostStatusCard (copy), FFlagMomentsHydratePublishedFeedItemModule (upval), SetPublishedMomentOnUploadStoreModule (upval), makeUploadedMomentItem (upval), Sound (copy), Edits (copy), Description (copy), ResolvedTimeLength (copy), FFlagMomentsRefreshOwnMomentsAfterPublish (upval), RefreshOwnMomentsAfterPublishModule (upval)
			if type(AssetId) ~= "number" then
				UploadStore.setSuccess(AssetId)
				
				return
			end
			if FFlagMomentsOptimisticProfilePending and v2 ~= nil and MomentId ~= nil then
				local v3 = v2
				local MomentId1 = MomentId
				task.delay(game:GetFastInt("MomentsPendingMomentTtlSeconds"), function()
					-- upvalues: FFlagMomentsPostFeedback (upval), isPendingMomentModerated (upval), v3 (copy), MomentId1 (copy), MomentsUpload (upval), MomentsGetMomentsUserStoreModule (upval)
					if FFlagMomentsPostFeedback and isPendingMomentModerated(v3, MomentId1) then
						MomentsUpload:debug("event=pending_moment_ttl_skipped momentId={} reason=moderated", MomentId1)
						
						return
					end
					if FFlagMomentsPostFeedback then
						MomentsUpload:debug("event=pending_moment_ttl_expired momentId={}", MomentId1)
					end
					local MomentsGetMomentsUserStoreModuleResult = MomentsGetMomentsUserStoreModule(false)
					MomentsGetMomentsUserStoreModuleResult.removePendingUserMoment(v3, MomentId1)
					MomentsGetMomentsUserStoreModuleResult.invalidateUser(v3)
				end)
			end
			if PublishedPostResolverModule ~= nil then
				task.spawn(setPublishedPostOnUploadStore, PublishedPostResolverModule, UploadStore, MomentId, if FFlagMomentsPostFeedback then function(PublishedMoment)
					-- upvalues: addPostStatusCard (upval)
					addPostStatusCard("Live", PublishedMoment)
				end else nil)
				
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

local _ = function(Tbl, p2, p3, p4)
	local Copy = table.clone(Tbl)
	
	function Copy.triggerToast(p5)
		-- upvalues: p3 (copy), p2 (copy), Tbl (copy), p4 (copy)
		return if p5.title == p3 and p2() then Tbl.triggerToast({
			text = "",
			variant = "snackbar",
			placement = "bottom",
			title = p4
		}) else Tbl.triggerToast(p5)
	end
	
	return Copy
end

return function(p2)
	-- upvalues: UseLocalizationFunction (copy), config (copy), FFlagMomentsPostFeedback (copy), UsePostFeedbackStringsModule (copy), GetFFlagEnableMomentTextGenerationFunction (copy), ReactModule (copy), GetUploadStoreModule (copy), GetToastStoreModule (copy), GenerateMomentTextModule (copy), MomentGeneratedTextFeedbackModule (copy), MomentsCreationModule (copy), v1 (copy), makeUploadStore (copy), PublishMomentWithUploadFunction (copy)
	local OnExit = p2.onExit
	local CaptureSource = p2.captureSource
	local UseLocalizationResult = UseLocalizationFunction(config)
	local PostingSnackbar = if FFlagMomentsPostFeedback then UsePostFeedbackStringsModule().postingSnackbar else nil
	local UseRefResult = if GetFFlagEnableMomentTextGenerationFunction() then ReactModule.useRef({}) else nil
	
	return (ReactModule.useMemo(function()
		-- upvalues: GetUploadStoreModule (upval), GetToastStoreModule (upval), GetFFlagEnableMomentTextGenerationFunction (upval), UseRefResult (ref), OnExit (copy), CaptureSource (copy), GenerateMomentTextModule (upval), MomentGeneratedTextFeedbackModule (upval), UseLocalizationResult (copy), MomentsCreationModule (upval), v1 (upval), makeUploadStore (upval), PublishMomentWithUploadFunction (upval), PostingSnackbar (copy)
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
				print(`[moments-creation] dev publish (not uploaded): "{p33}"`)
			end else function(Sound, Edits, Description, CreationSessionId, ResolvedTimeLength, CommentsEnabled)
				-- upvalues: makeUploadStore (upval), UploadStoreModule (copy), PublishMomentWithUploadFunction (upval), UseLocalizationResult (upval), PostingSnackbar (upval), ToastStoreModule (copy)
				local UploadStore = makeUploadStore(UploadStoreModule, Sound, Edits, Description, ResolvedTimeLength, CreationSessionId)
				local config = {
					localizations = UseLocalizationResult,
					uploadStore = UploadStore
				}
				local Copy = nil
				
				if PostingSnackbar == nil then
					Copy = ToastStoreModule
				else
					local HasPendingRecordFunction = UploadStore.hasPendingRecord
					local PublishingTitle = UseLocalizationResult.publishingTitle
					Copy = table.clone(ToastStoreModule)
					
					function Copy.triggerToast(p3)
						-- upvalues: PublishingTitle (copy), HasPendingRecordFunction (copy), ToastStoreModule (copy), PostingSnackbar (copy)
						return if p3.title == PublishingTitle and HasPendingRecordFunction() then ToastStoreModule.triggerToast({
							text = "",
							variant = "snackbar",
							placement = "bottom",
							title = PostingSnackbar
						}) else ToastStoreModule.triggerToast(p3)
					end
				end
				config.toastStore = Copy
				config.creationSessionId = CreationSessionId
				config.resolvedTimeLength = ResolvedTimeLength
				config.commentsEnabled = CommentsEnabled
				PublishMomentWithUploadFunction(Sound, Edits, Description, config)
			end
		}
	end, {
		OnExit,
		CaptureSource,
		UseLocalizationResult,
		PostingSnackbar
	}))
end