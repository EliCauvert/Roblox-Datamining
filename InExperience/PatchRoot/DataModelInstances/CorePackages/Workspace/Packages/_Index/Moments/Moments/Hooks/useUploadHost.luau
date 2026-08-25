local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local playersService = game:GetService("Players")
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local momentsTypesModule = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local useLocalization = localizationModule.Hooks.useLocalization
local momentsCreationModule = require(parent.MomentsCreation)
local sharedFlagsModule = require(parent.SharedFlags)
local publishMomentWithUpload = momentsCreationModule.publishMomentWithUpload
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local getFFlagMomentsRefreshFromTopAfterUploadModule = require(moments.Flags.GetFFlagMomentsRefreshFromTopAfterUpload)
local generateMomentTextModule = require(moments.generateMomentText)
local momentGeneratedTextFeedbackModule = require(moments.Feedback.momentGeneratedTextFeedback)
local refreshOwnMomentsAfterPublishModule = require(moments.Upload.refreshOwnMomentsAfterPublish)
local setPublishedMomentOnUploadStoreModule = require(moments.Upload.setPublishedMomentOnUploadStore)
local fFlagMomentsHydratePublishedFeedItemModule = require(moments.Flags.FFlagMomentsHydratePublishedFeedItem)
local fFlagMomentsRefreshOwnMomentsAfterPublish = sharedFlagsModule.FFlagMomentsRefreshOwnMomentsAfterPublish
local getUploadStoreModule = require(moments.Stores.GetUploadStore)
local getToastStoreModule = require(moments.Stores.GetToastStore)
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
local var17 = require(parent.MomentsCommon.isStudio)()
local momentStatus = momentsTypesModule.Enums.MomentStatus

local function makeUploadedMomentItem(p0, p1, p2, p3, p4)
	-- upvalues: playersService (ref), momentsCreationModule (ref), momentStatus (ref)
	local localPlayer = playersService.LocalPlayer
	
	return {
		assetId = p0,
		creatorId = if localPlayer ~= nil then 0 else localPlayer.UserId,
		metadata = {
			assetTotalDuration = if p1.CaptureType == Enum.CaptureType.Screenshot then momentsCreationModule.Constants.ScreenshotMusicDuration elseif p4 == nil or p4 <= 0 then p1.TimeLength else p4,
			captureType = p1.CaptureType,
			description = p3,
			edits = p2,
			placeId = p1.SourcePlaceId,
			universeId = p1.SourceUniverseId
		},
		momentId = tostring(p0),
		recommendationMetadata = {},
		status = momentStatus.Public
	}
end

local function makeUploadStore(p5, p6, p7, p8, p9)
	-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (ref), fFlagMomentsHydratePublishedFeedItemModule (ref), setPublishedMomentOnUploadStoreModule (ref), makeUploadedMomentItem (ref), refreshOwnMomentsAfterPublishModule (ref)
	local var20 = getFFlagMomentsRefreshFromTopAfterUploadModule()
	
	return if var20 or fFlagMomentsRefreshOwnMomentsAfterPublish or fFlagMomentsHydratePublishedFeedItemModule then {
		setUploading = p5.setUploading,
		setFailed = p5.setFailed,
		setSuccess = function(value)
			-- upvalues: p5 (ref), fFlagMomentsHydratePublishedFeedItemModule (copy), setPublishedMomentOnUploadStoreModule (copy), var20 (ref), makeUploadedMomentItem (copy), p6 (ref), p7 (ref), p8 (ref), p9 (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (copy), refreshOwnMomentsAfterPublishModule (copy)
			if type(value) ~= "number" then
				p5.setSuccess(value)
				
				return
			elseif fFlagMomentsHydratePublishedFeedItemModule then
				task.spawn(setPublishedMomentOnUploadStoreModule, value, p5)
				
				return
			elseif var20 then
				p5.setSuccess(makeUploadedMomentItem(value, p6, p7, p8, p9))
			else
				p5.setSuccess(value)
			end
			if fFlagMomentsRefreshOwnMomentsAfterPublish then
				task.spawn(refreshOwnMomentsAfterPublishModule, value)
			end
		end
	} else p5
end

return function(p10)
	-- upvalues: useLocalization (ref), t (ref), getFFlagEnableMomentTextGeneration (ref), reactModule (ref), getUploadStoreModule (ref), getToastStoreModule (ref), generateMomentTextModule (ref), momentGeneratedTextFeedbackModule (ref), momentsCreationModule (ref), var17 (ref), publishMomentWithUpload (ref), makeUploadStore (ref)
	local onExit = p10.onExit
	local captureSource = p10.captureSource
	local var21 = useLocalization(t)
	local var22 = if getFFlagEnableMomentTextGeneration() then reactModule.useRef({}) else nil
	
	return reactModule.useMemo(function()
		-- upvalues: getUploadStoreModule (copy), getToastStoreModule (copy), getFFlagEnableMomentTextGeneration (copy), var22 (write), onExit (ref), captureSource (ref), generateMomentTextModule (copy), momentGeneratedTextFeedbackModule (copy), var21 (ref), momentsCreationModule (copy), var17 (copy), publishMomentWithUpload (copy), makeUploadStore (copy)
		local var23 = getUploadStoreModule(false)
		local var24 = getToastStoreModule(false)
		local var25 = getFFlagEnableMomentTextGeneration()
		
		local function _(p11)
			-- upvalues: var24 (ref), var22 (copy)
			local var26 = var24.triggerToast(p11)
			
			if var22 ~= nil then
				table.insert(var22.current, var26)
			end
		end
		
		return {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			generateMomentText = if var25 then generateMomentTextModule else nil,
			momentGeneratedTextFeedback = if var25 then momentGeneratedTextFeedbackModule else nil,
			onGenerateTextManualEditBlocked = if var25 then function()
				-- upvalues: var21 (copy), var24 (ref), var22 (copy)
				local var27 = var24.triggerToast({
					title = var21.generateInProgressTitle,
					text = var21.generateInProgressBody
				})
				
				if var22 ~= nil then
					table.insert(var22.current, var27)
				end
			end else nil,
			onGenerateTextSuccess = if var25 then function()
				-- upvalues: var21 (copy), var24 (ref), var22 (copy)
				local var28 = var24.triggerToast({ title = var21.generatedTitle, text = var21.generatedBody })
				
				if var22 ~= nil then
					table.insert(var22.current, var28)
				end
			end else nil,
			onGenerateTextFailure = if var25 then function()
				-- upvalues: var21 (copy), var24 (ref), var22 (copy)
				local var29 = var24.triggerToast({
					title = var21.generateFailedTitle,
					text = var21.generateFailedBody
				})
				
				if var22 ~= nil then
					table.insert(var22.current, var29)
				end
			end else nil,
			onGenerateTextFiltered = if var25 then function()
				-- upvalues: var21 (copy), var24 (ref), var22 (copy)
				local var30 = var24.triggerToast({
					title = var21.generateFilteredTitle,
					text = var21.generateFilteredBody
				})
				
				if var22 ~= nil then
					table.insert(var22.current, var30)
				end
			end else nil,
			onGenerateTextWillReplaceInput = if var25 then function()
				-- upvalues: var21 (copy), var24 (ref), var22 (copy)
				local var31 = var24.triggerToast({
					title = var21.generateOverrideTitle,
					text = var21.generateOverrideBody
				})
				
				if var22 ~= nil then
					table.insert(var22.current, var31)
				end
			end else nil,
			dismissGenerationToasts = if var25 then function()
				-- upvalues: var22 (copy), var24 (ref)
				if var22 ~= nil then
					for i, v in var22.current do
						var24.dismissToast(v)
					end
					var22.current = {}
				end
			end else nil,
			isTextFiltered = momentsCreationModule.isTextFiltered,
			createMoment = if var17 then function(_, _, p17, _, _)
				print(`[moments-creation] dev publish (not uploaded): "{p17}"`)
			end else function(p12, p13, p14, p15, p16)
				-- upvalues: publishMomentWithUpload (copy), var21 (copy), makeUploadStore (copy), var23 (ref), var24 (ref)
				publishMomentWithUpload(p12, p13, p14, {
					localizations = var21,
					uploadStore = makeUploadStore(var23, p12, p13, p14, p16),
					toastStore = var24,
					creationSessionId = p15,
					resolvedTimeLength = p16
				})
			end
		}
	end, { onExit, captureSource, var21 })
end