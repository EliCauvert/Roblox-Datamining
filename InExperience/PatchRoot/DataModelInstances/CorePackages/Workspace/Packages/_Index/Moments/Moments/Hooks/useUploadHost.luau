local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local playersService = game:GetService("Players")
local localizationModule = require(parent.Localization)
local momentsTypesModule = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local useLocalization = localizationModule.Hooks.useLocalization
local momentsCreationModule = require(parent.MomentsCreation)
local sharedFlagsModule = require(parent.SharedFlags)
local publishMomentWithUpload = momentsCreationModule.publishMomentWithUpload
local getFFlagEnableMomentTextGenerationModule = require(moments.Flags.GetFFlagEnableMomentTextGeneration)
local getFFlagMomentsRefreshFromTopAfterUploadModule = require(moments.Flags.GetFFlagMomentsRefreshFromTopAfterUpload)
local generateMomentTextModule = require(moments.generateMomentText)
local refreshOwnMomentsAfterPublishModule = require(moments.Upload.refreshOwnMomentsAfterPublish)
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
	generatedTitle = "Feature.Moments.Label.TextGeneratedTitle",
	generatedBody = "Feature.Moments.Label.TextGeneratedBody",
	generateFailedTitle = "Feature.Moments.Label.TextGenerationFailedTitle",
	generateFailedBody = "Feature.Moments.Label.TextGenerationFailedBody"
}
local var14 = require(parent.MomentsCommon.isStudio)()
local momentStatus = momentsTypesModule.Enums.MomentStatus

local function makeUploadedMomentItem(p0, p1, p2, p3, p4) --[[ line: 65 ]]
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

local function makeUploadStore(p5, p6, p7, p8, p9) --[[ line: 95 ]]
	-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (ref), makeUploadedMomentItem (ref), refreshOwnMomentsAfterPublishModule (ref)
	local var17 = getFFlagMomentsRefreshFromTopAfterUploadModule()
	
	return if var17 or fFlagMomentsRefreshOwnMomentsAfterPublish then {
		setUploading = p5.setUploading,
		setFailed = p5.setFailed,
		setSuccess = function(value) --[[ line: 111 ]]
			-- upvalues: p5 (ref), var17 (ref), makeUploadedMomentItem (copy), p6 (ref), p7 (ref), p8 (ref), p9 (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (copy), refreshOwnMomentsAfterPublishModule (copy)
			if type(value) ~= "number" then
				p5.setSuccess(value)
				
				return
			elseif var17 then
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

return function(p10) --[[ line: 132 | named "useUploadHost" ]]
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), getUploadStoreModule (ref), getToastStoreModule (ref), getFFlagEnableMomentTextGenerationModule (ref), generateMomentTextModule (ref), momentsCreationModule (ref), var14 (ref), publishMomentWithUpload (ref), makeUploadStore (ref)
	local onExit = p10.onExit
	local captureSource = p10.captureSource
	local var18 = useLocalization(t)
	
	return reactModule.useMemo(function() --[[ line: 138 ]]
		-- upvalues: getUploadStoreModule (copy), getToastStoreModule (copy), getFFlagEnableMomentTextGenerationModule (copy), onExit (ref), captureSource (ref), generateMomentTextModule (copy), var18 (ref), momentsCreationModule (copy), var14 (copy), publishMomentWithUpload (copy), makeUploadStore (copy)
		local var19 = getUploadStoreModule(false)
		local var20 = getToastStoreModule(false)
		local captureServiceGenerateMomentText = getFFlagEnableMomentTextGenerationModule() and game:GetEngineFeature("CaptureServiceGenerateMomentText")
		
		return {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			generateMomentText = if captureServiceGenerateMomentText then generateMomentTextModule else nil,
			onGenerateTextSuccess = if captureServiceGenerateMomentText then function() --[[ line: 153 ]]
				-- upvalues: var20 (ref), var18 (copy)
				var20.triggerToast({ title = var18.generatedTitle, text = var18.generatedBody })
			end else nil,
			onGenerateTextFailure = if captureServiceGenerateMomentText then function() --[[ line: 158 ]]
				-- upvalues: var20 (ref), var18 (copy)
				var20.triggerToast({
					title = var18.generateFailedTitle,
					text = var18.generateFailedBody
				})
			end else nil,
			isTextFiltered = momentsCreationModule.isTextFiltered,
			createMoment = if var14 then function(_, _, p16, _, _) --[[ line: 167 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p16}"`)
			end else function(p11, p12, p13, p14, p15) --[[ line: 176 ]]
				-- upvalues: publishMomentWithUpload (copy), var18 (copy), makeUploadStore (copy), var19 (ref), var20 (ref)
				publishMomentWithUpload(p11, p12, p13, {
					localizations = var18,
					uploadStore = makeUploadStore(var19, p11, p12, p13, p15),
					toastStore = var20,
					creationSessionId = p14,
					resolvedTimeLength = p15
				})
			end
		}
	end, { onExit, captureSource, var18 })
end