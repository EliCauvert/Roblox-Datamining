local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local MomentsCommonModule = require(Parent.MomentsCommon)
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
local FFlagMomentsRefreshOwnMomentsAfterPublish = SharedFlagsModule.FFlagMomentsRefreshOwnMomentsAfterPublish
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsRefreshProfileOnPostStatus = SharedFlagsModule.FFlagMomentsRefreshProfileOnPostStatus
local FFlagMomentsResolvePublishedPostFeedItem = SharedFlagsModule.FFlagMomentsResolvePublishedPostFeedItem
local GetUploadStoreModule = require(Moments.Stores.GetUploadStore)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local _ = require(Moments.Stores.GetToastStore.createToastStore)
local GetLocalUserIdModule = require(Moments.Utils.getLocalUserId)
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
local MomentStatus = require(Parent.MomentsTypes).Enums.MomentStatus

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

local function setPublishedPostOnUploadStore(p1, p2, p3)
	-- upvalues: FFlagMomentsOptimisticProfilePending (copy)
	local ResolveResult = p1.resolve(p3)
	
	if not p1.isCurrent() then return end
	if FFlagMomentsOptimisticProfilePending and p3 ~= nil then
		p2.reset()
		
		return
	end
	if ResolveResult == nil then
		p2.reset()
		
		return
	else
		p2.setSuccess(ResolveResult)
	end
end

local function makeUploadStore(UploadStore, Sound: Sound, Edits, Description, ResolvedTimeLength)
	-- upvalues: FFlagMomentsResolvePublishedPostFeedItem (copy), GetFFlagMomentsUseUploadPostAsyncFunction (copy), CreatePublishedPostResolverModule (copy), FFlagMomentsRefreshProfileOnPostStatus (copy), FFlagMomentsOptimisticProfilePending (copy), PostLifecycleSubscriptionModule (copy), GetLocalUserIdModule (copy), makeUploadedMomentItem (copy), HttpService (copy), MomentStatus (copy), MomentsGetMomentsUserStoreModule (copy), setPublishedPostOnUploadStore (copy), FFlagMomentsHydratePublishedFeedItemModule (copy), SetPublishedMomentOnUploadStoreModule (copy), FFlagMomentsRefreshOwnMomentsAfterPublish (copy), RefreshOwnMomentsAfterPublishModule (copy)
	local PublishedPostResolverModule = if FFlagMomentsResolvePublishedPostFeedItem and GetFFlagMomentsUseUploadPostAsyncFunction() then CreatePublishedPostResolverModule({
		captureType = Sound.CaptureType,
		description = Description,
		edits = Edits,
		placeId = Sound.SourcePlaceId
	}) else nil
	local MomentId = nil
	local v2 = nil
	
	return {
		setUploading = if FFlagMomentsRefreshProfileOnPostStatus or PublishedPostResolverModule ~= nil then function()
			-- upvalues: FFlagMomentsRefreshProfileOnPostStatus (upval), FFlagMomentsOptimisticProfilePending (upval), PublishedPostResolverModule (copy), PostLifecycleSubscriptionModule (upval), UploadStore (copy), MomentId (ref), GetLocalUserIdModule (upval), Sound (copy), Edits (copy), Description (copy), ResolvedTimeLength (copy), makeUploadedMomentItem (upval), HttpService (upval), MomentStatus (upval), v2 (ref), MomentsGetMomentsUserStoreModule (upval)
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
					MomentsGetMomentsUserStoreModule(false).prependPendingUserMoment(LocalUserIdModule, UploadedMomentItem)
				end
			end
		end else UploadStore.setUploading,
		setFailed = if FFlagMomentsOptimisticProfilePending and PublishedPostResolverModule ~= nil then function(p1)
			-- upvalues: v2 (ref), MomentId (ref), MomentsGetMomentsUserStoreModule (upval), PublishedPostResolverModule (copy), UploadStore (copy)
			if v2 ~= nil and MomentId ~= nil then
				MomentsGetMomentsUserStoreModule(false).removePendingUserMoment(v2, MomentId)
			end
			if PublishedPostResolverModule.isCurrent() then
				UploadStore.setFailed(p1)
			end
		end else UploadStore.setFailed,
		setSuccess = function(AssetId)
			-- upvalues: UploadStore (copy), FFlagMomentsOptimisticProfilePending (upval), v2 (ref), MomentId (ref), MomentsGetMomentsUserStoreModule (upval), PublishedPostResolverModule (copy), setPublishedPostOnUploadStore (upval), FFlagMomentsHydratePublishedFeedItemModule (upval), SetPublishedMomentOnUploadStoreModule (upval), makeUploadedMomentItem (upval), Sound (copy), Edits (copy), Description (copy), ResolvedTimeLength (copy), FFlagMomentsRefreshOwnMomentsAfterPublish (upval), RefreshOwnMomentsAfterPublishModule (upval)
			if type(AssetId) ~= "number" then
				UploadStore.setSuccess(AssetId)
				
				return
			end
			if FFlagMomentsOptimisticProfilePending and v2 ~= nil and MomentId ~= nil then
				local v3 = v2
				local MomentId1 = MomentId
				task.delay(300, function()
					-- upvalues: MomentsGetMomentsUserStoreModule (upval), v3 (copy), MomentId1 (copy)
					local MomentsGetMomentsUserStoreModuleResult = MomentsGetMomentsUserStoreModule(false)
					MomentsGetMomentsUserStoreModuleResult.removePendingUserMoment(v3, MomentId1)
					MomentsGetMomentsUserStoreModuleResult.invalidateUser(v3)
				end)
			end
			if PublishedPostResolverModule ~= nil then
				task.spawn(setPublishedPostOnUploadStore, PublishedPostResolverModule, UploadStore, MomentId)
				
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
		end
	}
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), GetFFlagEnableMomentTextGenerationFunction (copy), ReactModule (copy), GetUploadStoreModule (copy), GetToastStoreModule (copy), GenerateMomentTextModule (copy), MomentGeneratedTextFeedbackModule (copy), MomentsCreationModule (copy), v1 (copy), PublishMomentWithUploadFunction (copy), makeUploadStore (copy)
	local OnExit = p1.onExit
	local CaptureSource = p1.captureSource
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseRefResult = if GetFFlagEnableMomentTextGenerationFunction() then ReactModule.useRef({}) else nil
	
	return (ReactModule.useMemo(function()
		-- upvalues: GetUploadStoreModule (upval), GetToastStoreModule (upval), GetFFlagEnableMomentTextGenerationFunction (upval), UseRefResult (ref), OnExit (copy), CaptureSource (copy), GenerateMomentTextModule (upval), MomentGeneratedTextFeedbackModule (upval), UseLocalizationResult (copy), MomentsCreationModule (upval), v1 (upval), PublishMomentWithUploadFunction (upval), makeUploadStore (upval)
		local UploadStoreModule = GetUploadStoreModule(false)
		local ToastStoreModule = GetToastStoreModule(false)
		local FFlagEnableMomentTextGeneration = GetFFlagEnableMomentTextGenerationFunction()
		
		local function _(p2)
			-- upvalues: ToastStoreModule (copy), UseRefResult (upval)
			local TriggerToastResult = ToastStoreModule.triggerToast(p2)
			
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
			createMoment = if v1 then function(_, _, p2, _, _)
				print(`[moments-creation] dev publish (not uploaded): "{p23}"`)
			end else function(Sound, Edits, Description, CreationSessionId, ResolvedTimeLength, CommentsEnabled)
				-- upvalues: PublishMomentWithUploadFunction (upval), UseLocalizationResult (upval), makeUploadStore (upval), UploadStoreModule (copy), ToastStoreModule (copy)
				PublishMomentWithUploadFunction(Sound, Edits, Description, {
					localizations = UseLocalizationResult,
					uploadStore = makeUploadStore(UploadStoreModule, Sound, Edits, Description, ResolvedTimeLength),
					toastStore = ToastStoreModule,
					creationSessionId = CreationSessionId,
					resolvedTimeLength = ResolvedTimeLength,
					commentsEnabled = CommentsEnabled
				})
			end
		}
	end, { OnExit, CaptureSource, UseLocalizationResult }))
end