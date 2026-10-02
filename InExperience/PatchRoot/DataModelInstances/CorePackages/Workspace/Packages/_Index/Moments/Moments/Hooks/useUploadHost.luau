local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local momentsTypesModule = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local useLocalization = localizationModule.Hooks.useLocalization
local momentsCreationModule = require(parent.MomentsCreation)
local sharedFlagsModule = require(parent.SharedFlags)
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)
local publishMomentWithUpload = momentsCreationModule.publishMomentWithUpload
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local getFFlagMomentsUseUploadPostAsync = momentsCommonModule.Flags.GetFFlagMomentsUseUploadPostAsync
local generateMomentTextModule = require(moments.generateMomentText)
local momentGeneratedTextFeedbackModule = require(moments.Feedback.momentGeneratedTextFeedback)
local refreshOwnMomentsAfterPublishModule = require(moments.Upload.refreshOwnMomentsAfterPublish)
local setPublishedMomentOnUploadStoreModule = require(moments.Upload.setPublishedMomentOnUploadStore)
local postLifecycleSubscriptionModule = require(moments.Upload.postLifecycleSubscription)
local createPublishedPostResolverModule = require(moments.Upload.createPublishedPostResolver)
local fFlagMomentsHydratePublishedFeedItemModule = require(moments.Flags.FFlagMomentsHydratePublishedFeedItem)
local fFlagMomentsRefreshOwnMomentsAfterPublish = sharedFlagsModule.FFlagMomentsRefreshOwnMomentsAfterPublish
local fFlagMomentsOptimisticProfilePending = sharedFlagsModule.FFlagMomentsOptimisticProfilePending
local fFlagMomentsRefreshProfileOnPostStatus = sharedFlagsModule.FFlagMomentsRefreshProfileOnPostStatus
local fFlagMomentsResolvePublishedPostFeedItem = sharedFlagsModule.FFlagMomentsResolvePublishedPostFeedItem
local getUploadStoreModule = require(moments.Stores.GetUploadStore)
local getToastStoreModule = require(moments.Stores.GetToastStore)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local getLocalUserIdModule = require(moments.Utils.getLocalUserId)
local t = {
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
local var1 = isStudioModule()
local momentStatus = momentsTypesModule.Enums.MomentStatus

local function makeUploadedMomentItem(p1, p2, p3, p4, p5)
	-- upvalues: playersService (ref), momentsCreationModule (ref), momentStatus (ref)
	local localPlayer = playersService.LocalPlayer
	
	return {
		assetId = p1,
		creatorId = if localPlayer ~= nil then 0 else localPlayer.UserId,
		metadata = {
			assetTotalDuration = if p2.CaptureType == Enum.CaptureType.Screenshot then momentsCreationModule.Constants.ScreenshotMusicDuration elseif p5 == nil or p5 <= 0 then p2.TimeLength else p5,
			captureType = p2.CaptureType,
			description = p4,
			edits = p3,
			placeId = p2.SourcePlaceId,
			universeId = p2.SourceUniverseId
		},
		momentId = tostring(p1),
		recommendationMetadata = {},
		status = momentStatus.Public
	}
end

local function _(p1, p2, p3, p4)
	-- upvalues: makeUploadedMomentItem (ref), httpService (ref), momentStatus (ref)
	local var2 = makeUploadedMomentItem(0, p1, p2, p3, p4)
	var2.momentId = httpService:GenerateGUID(false)
	var2.status = momentStatus.Pending
	local ok, status = pcall(Content.fromObject, p1)
	
	if ok then
		var2.localContent = status
	end
	return var2
end

local function setPublishedPostOnUploadStore(value, p1, p2)
	-- upvalues: fFlagMomentsOptimisticProfilePending (ref)
	local var2 = value.resolve(p2)
	
	if not value.isCurrent() then return end
	if fFlagMomentsOptimisticProfilePending and p2 ~= nil then
		p1.reset()
		
		return
	elseif var2 == nil then
		p1.reset()
		
		return
	end
	p1.setSuccess(var2)
end

local function makeUploadStore(p1, p2, p3, p4, p5)
	-- upvalues: fFlagMomentsResolvePublishedPostFeedItem (ref), getFFlagMomentsUseUploadPostAsync (ref), createPublishedPostResolverModule (ref), fFlagMomentsRefreshProfileOnPostStatus (ref), fFlagMomentsOptimisticProfilePending (ref), postLifecycleSubscriptionModule (ref), getLocalUserIdModule (ref), makeUploadedMomentItem (ref), httpService (ref), momentStatus (ref), momentsGetMomentsUserStoreModule (ref), setPublishedPostOnUploadStore (ref), fFlagMomentsHydratePublishedFeedItemModule (ref), setPublishedMomentOnUploadStoreModule (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (ref), refreshOwnMomentsAfterPublishModule (ref)
	local var2 = if fFlagMomentsResolvePublishedPostFeedItem and getFFlagMomentsUseUploadPostAsync() then createPublishedPostResolverModule({
		captureType = p2.CaptureType,
		description = p4,
		edits = p3,
		placeId = p2.SourcePlaceId
	}) else nil
	local var3 = nil
	local var4 = nil
	
	return {
		setUploading = if fFlagMomentsRefreshProfileOnPostStatus or var2 ~= nil then function()
			-- upvalues: fFlagMomentsRefreshProfileOnPostStatus (copy), fFlagMomentsOptimisticProfilePending (copy), var2 (ref), postLifecycleSubscriptionModule (copy), p1 (ref), var3 (write), getLocalUserIdModule (copy), p2 (ref), p3 (ref), p4 (ref), p5 (ref), makeUploadedMomentItem (copy), httpService (copy), momentStatus (copy), var4 (write), momentsGetMomentsUserStoreModule (copy)
			if fFlagMomentsRefreshProfileOnPostStatus or fFlagMomentsOptimisticProfilePending and var2 ~= nil then
				postLifecycleSubscriptionModule.subscribe()
			end
			if var2 ~= nil then
				var2.captureSnapshot()
			end
			p1.setUploading()
			
			if fFlagMomentsOptimisticProfilePending and var2 ~= nil and var3 == nil then
				local var5 = getLocalUserIdModule()
				
				if var5 ~= nil then
					local var6 = makeUploadedMomentItem(0, p2, p3, p4, p5)
					var6.momentId = httpService:GenerateGUID(false)
					var6.status = momentStatus.Pending
					local ok, status = pcall(Content.fromObject, p2)
					
					if ok then
						var6.localContent = status
					end
					local var7 = var6
					var3 = var7.momentId
					var4 = var5
					momentsGetMomentsUserStoreModule(false).prependPendingUserMoment(var5, var7)
				end
			end
		end else p1.setUploading,
		setFailed = if fFlagMomentsOptimisticProfilePending and var2 ~= nil then function(p6)
			-- upvalues: var4 (write), var3 (write), momentsGetMomentsUserStoreModule (copy), var2 (ref), p1 (ref)
			if var4 ~= nil and var3 ~= nil then
				momentsGetMomentsUserStoreModule(false).removePendingUserMoment(var4, var3)
			end
			if var2.isCurrent() then
				p1.setFailed(p6)
			end
		end else p1.setFailed,
		setSuccess = function(value)
			-- upvalues: p1 (ref), fFlagMomentsOptimisticProfilePending (copy), var4 (write), var3 (write), momentsGetMomentsUserStoreModule (copy), var2 (ref), setPublishedPostOnUploadStore (copy), fFlagMomentsHydratePublishedFeedItemModule (copy), setPublishedMomentOnUploadStoreModule (copy), makeUploadedMomentItem (copy), p2 (ref), p3 (ref), p4 (ref), p5 (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (copy), refreshOwnMomentsAfterPublishModule (copy)
			if type(value) ~= "number" then
				p1.setSuccess(value)
				
				return
			elseif fFlagMomentsOptimisticProfilePending and var4 ~= nil and var3 ~= nil then
				local var5 = var4
				local var6 = var3
				task.delay(300, function()
					-- upvalues: momentsGetMomentsUserStoreModule (copy), var5 (ref), var6 (ref)
					local var7 = momentsGetMomentsUserStoreModule(false)
					var7.removePendingUserMoment(var5, var6)
					var7.invalidateUser(var5)
				end)
			end
			if var2 ~= nil then
				task.spawn(setPublishedPostOnUploadStore, var2, p1, var3)
				
				return
			elseif fFlagMomentsHydratePublishedFeedItemModule then
				task.spawn(setPublishedMomentOnUploadStoreModule, value, p1)
				
				return
			end
			p1.setSuccess(makeUploadedMomentItem(value, p2, p3, p4, p5))
			
			if fFlagMomentsRefreshOwnMomentsAfterPublish then
				task.spawn(refreshOwnMomentsAfterPublishModule, value)
			end
		end
	}
end

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), getFFlagEnableMomentTextGeneration (ref), reactModule (ref), getUploadStoreModule (ref), getToastStoreModule (ref), generateMomentTextModule (ref), momentGeneratedTextFeedbackModule (ref), momentsCreationModule (ref), var1 (ref), publishMomentWithUpload (ref), makeUploadStore (ref)
	local onExit = p1.onExit
	local captureSource = p1.captureSource
	local var2 = useLocalization(t)
	local var3 = if getFFlagEnableMomentTextGeneration() then reactModule.useRef({}) else nil
	
	return reactModule.useMemo(function()
		-- upvalues: getUploadStoreModule (copy), getToastStoreModule (copy), getFFlagEnableMomentTextGeneration (copy), var3 (write), onExit (ref), captureSource (ref), generateMomentTextModule (copy), momentGeneratedTextFeedbackModule (copy), var2 (ref), momentsCreationModule (copy), var1 (copy), publishMomentWithUpload (copy), makeUploadStore (copy)
		local var4 = getUploadStoreModule(false)
		local var5 = getToastStoreModule(false)
		local var6 = getFFlagEnableMomentTextGeneration()
		
		local function _(p2)
			-- upvalues: var5 (ref), var3 (copy)
			local var7 = var5.triggerToast(p2)
			
			if var3 ~= nil then
				table.insert(var3.current, var7)
			end
		end
		
		return {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			generateMomentText = if var6 then generateMomentTextModule else nil,
			momentGeneratedTextFeedback = if var6 then momentGeneratedTextFeedbackModule else nil,
			onGenerateTextManualEditBlocked = if var6 then function()
				-- upvalues: var2 (copy), var5 (ref), var3 (copy)
				local var7 = var5.triggerToast({
					title = var2.generateInProgressTitle,
					text = var2.generateInProgressBody
				})
				
				if var3 ~= nil then
					table.insert(var3.current, var7)
				end
			end else nil,
			onGenerateTextSuccess = if var6 then function()
				-- upvalues: var2 (copy), var5 (ref), var3 (copy)
				local var7 = var5.triggerToast({ title = var2.generatedTitle, text = var2.generatedBody })
				
				if var3 ~= nil then
					table.insert(var3.current, var7)
				end
			end else nil,
			onGenerateTextFailure = if var6 then function()
				-- upvalues: var2 (copy), var5 (ref), var3 (copy)
				local var7 = var5.triggerToast({
					title = var2.generateFailedTitle,
					text = var2.generateFailedBody
				})
				
				if var3 ~= nil then
					table.insert(var3.current, var7)
				end
			end else nil,
			onGenerateTextFiltered = if var6 then function()
				-- upvalues: var2 (copy), var5 (ref), var3 (copy)
				local var7 = var5.triggerToast({
					title = var2.generateFilteredTitle,
					text = var2.generateFilteredBody
				})
				
				if var3 ~= nil then
					table.insert(var3.current, var7)
				end
			end else nil,
			onGenerateTextWillReplaceInput = if var6 then function()
				-- upvalues: var2 (copy), var5 (ref), var3 (copy)
				local var7 = var5.triggerToast({
					title = var2.generateOverrideTitle,
					text = var2.generateOverrideBody
				})
				
				if var3 ~= nil then
					table.insert(var3.current, var7)
				end
			end else nil,
			dismissGenerationToasts = if var6 then function()
				-- upvalues: var3 (copy), var5 (ref)
				if var3 ~= nil then
					for i, v in var3.current do
						var5.dismissToast(v)
					end
					var3.current = {}
				end
			end else nil,
			isTextFiltered = momentsCreationModule.isTextFiltered,
			createMoment = if var1 then function(_, _, p2, _, _)
				print(`[moments-creation] dev publish (not uploaded): "{p25}"`)
			end else function(p2, p3, p4, p5, p6, p7)
				-- upvalues: publishMomentWithUpload (copy), var2 (copy), makeUploadStore (copy), var4 (ref), var5 (ref)
				publishMomentWithUpload(p2, p3, p4, {
					localizations = var2,
					uploadStore = makeUploadStore(var4, p2, p3, p4, p6),
					toastStore = var5,
					creationSessionId = p5,
					resolvedTimeLength = p6,
					commentsEnabled = p7
				})
			end
		}
	end, { onExit, captureSource, var2 })
end