local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local playersService = game:GetService("Players")
local localizationModule = require(parent.Localization)
local momentsTypesModule = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local useLocalization = localizationModule.Hooks.useLocalization
local momentsCreationModule = require(parent.MomentsCreation)
local publishMomentWithUpload = momentsCreationModule.publishMomentWithUpload
local getFFlagEnableMomentTextGenerationModule = require(moments.Flags.GetFFlagEnableMomentTextGeneration)
local getFFlagMomentsRefreshFromTopAfterUploadModule = require(moments.Flags.GetFFlagMomentsRefreshFromTopAfterUpload)
local generateMomentTextModule = require(moments.generateMomentText)
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
local var12 = require(parent.MomentsCommon.isStudio)()
local momentStatus = momentsTypesModule.Enums.MomentStatus

local function makeUploadedMomentItem(p0, p1, p2, p3, p4) --[[ line: 61 ]]
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

local function makeUploadStore(p5, p6, p7, p8, p9) --[[ line: 91 ]]
	-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (ref), makeUploadedMomentItem (ref)
	return if getFFlagMomentsRefreshFromTopAfterUploadModule() then {
		setUploading = p5.setUploading,
		setFailed = p5.setFailed,
		setSuccess = function(value) --[[ line: 105 ]]
			-- upvalues: p5 (ref), makeUploadedMomentItem (copy), p6 (ref), p7 (ref), p8 (ref), p9 (ref)
			if type(value) == "number" then
				p5.setSuccess(makeUploadedMomentItem(value, p6, p7, p8, p9))
				
				return
			end
			p5.setSuccess(value)
		end
	} else p5
end

return function(p10) --[[ line: 116 | named "useUploadHost" ]]
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), getUploadStoreModule (ref), getToastStoreModule (ref), getFFlagEnableMomentTextGenerationModule (ref), generateMomentTextModule (ref), momentsCreationModule (ref), var12 (ref), publishMomentWithUpload (ref), makeUploadStore (ref)
	local onExit = p10.onExit
	local captureSource = p10.captureSource
	local var15 = useLocalization(t)
	
	return reactModule.useMemo(function() --[[ line: 122 ]]
		-- upvalues: getUploadStoreModule (copy), getToastStoreModule (copy), onExit (ref), captureSource (ref), getFFlagEnableMomentTextGenerationModule (copy), generateMomentTextModule (copy), var15 (ref), momentsCreationModule (copy), var12 (copy), publishMomentWithUpload (copy), makeUploadStore (copy)
		local var16 = getUploadStoreModule(false)
		local var17 = getToastStoreModule(false)
		
		return {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			generateMomentText = if getFFlagEnableMomentTextGenerationModule() then generateMomentTextModule else nil,
			onGenerateTextSuccess = if getFFlagEnableMomentTextGenerationModule() then function() --[[ line: 131 ]]
				-- upvalues: var17 (ref), var15 (copy)
				var17.triggerToast({ title = var15.generatedTitle, text = var15.generatedBody })
			end else nil,
			onGenerateTextFailure = if getFFlagEnableMomentTextGenerationModule() then function() --[[ line: 136 ]]
				-- upvalues: var17 (ref), var15 (copy)
				var17.triggerToast({
					title = var15.generateFailedTitle,
					text = var15.generateFailedBody
				})
			end else nil,
			isTextFiltered = momentsCreationModule.isTextFiltered,
			createMoment = if var12 then function(_, _, p16, _, _) --[[ line: 145 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p16}"`)
			end else function(p11, p12, p13, p14, p15) --[[ line: 154 ]]
				-- upvalues: publishMomentWithUpload (copy), var15 (copy), makeUploadStore (copy), var16 (ref), var17 (ref)
				publishMomentWithUpload(p11, p12, p13, {
					localizations = var15,
					uploadStore = makeUploadStore(var16, p11, p12, p13, p15),
					toastStore = var17,
					creationSessionId = p14,
					resolvedTimeLength = p15
				})
			end
		}
	end, { onExit, captureSource, var15 })
end