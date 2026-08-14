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
	generateInProgressTitle = "Feature.Moments.Label.TextGenerateInProgressTitle",
	generateInProgressBody = "Feature.Moments.Label.TextGenerateInProgressBody",
	generatedTitle = "Feature.Moments.Label.TextGeneratedTitle",
	generatedBody = "Feature.Moments.Label.TextGeneratedBody",
	generateFailedTitle = "Feature.Moments.Label.TextGenerationFailedTitle",
	generateFailedBody = "Feature.Moments.Label.TextGenerationFailedBody",
	generateOverrideTitle = "Feature.Moments.Label.TextGenerateOverrideTitle",
	generateOverrideBody = "Feature.Moments.Label.TextGenerateOverrideBody"
}
local var14 = require(parent.MomentsCommon.isStudio)()
local momentStatus = momentsTypesModule.Enums.MomentStatus

local function makeUploadedMomentItem(p0, p1, p2, p3, p4) --[[ line: 70 ]]
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

local function makeUploadStore(p5, p6, p7, p8, p9) --[[ line: 100 ]]
	-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (ref), makeUploadedMomentItem (ref), refreshOwnMomentsAfterPublishModule (ref)
	local var17 = getFFlagMomentsRefreshFromTopAfterUploadModule()
	
	return if var17 or fFlagMomentsRefreshOwnMomentsAfterPublish then {
		setUploading = p5.setUploading,
		setFailed = p5.setFailed,
		setSuccess = function(value) --[[ line: 116 ]]
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

return function(p10) --[[ line: 137 | named "useUploadHost" ]]
	-- upvalues: useLocalization (ref), t (ref), getFFlagEnableMomentTextGeneration (ref), reactModule (ref), getUploadStoreModule (ref), getToastStoreModule (ref), generateMomentTextModule (ref), momentsCreationModule (ref), var14 (ref), publishMomentWithUpload (ref), makeUploadStore (ref)
	local onExit = p10.onExit
	local captureSource = p10.captureSource
	local var18 = useLocalization(t)
	local var19 = if getFFlagEnableMomentTextGeneration() then reactModule.useRef({}) else nil
	
	return reactModule.useMemo(function() --[[ line: 153 ]]
		-- upvalues: getUploadStoreModule (copy), getToastStoreModule (copy), getFFlagEnableMomentTextGeneration (copy), var19 (write), onExit (ref), captureSource (ref), generateMomentTextModule (copy), var18 (ref), momentsCreationModule (copy), var14 (copy), publishMomentWithUpload (copy), makeUploadStore (copy)
		local var20 = getUploadStoreModule(false)
		local var21 = getToastStoreModule(false)
		local var22 = getFFlagEnableMomentTextGeneration()
		
		local function _(p11) --[[ line: 163 | named "triggerGenerationToast" ]]
			-- upvalues: var21 (ref), var19 (copy)
			local var23 = var21.triggerToast(p11)
			
			if var19 ~= nil then
				table.insert(var19.current, var23)
			end
		end
		
		return {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			generateMomentText = if var22 then generateMomentTextModule else nil,
			onGenerateTextManualEditBlocked = if var22 then function() --[[ line: 175 ]]
				-- upvalues: var18 (copy), var21 (ref), var19 (copy)
				local var24 = var21.triggerToast({
					title = var18.generateInProgressTitle,
					text = var18.generateInProgressBody
				})
				
				if var19 ~= nil then
					table.insert(var19.current, var24)
				end
			end else nil,
			onGenerateTextSuccess = if var22 then function() --[[ line: 183 ]]
				-- upvalues: var18 (copy), var21 (ref), var19 (copy)
				local var25 = var21.triggerToast({ title = var18.generatedTitle, text = var18.generatedBody })
				
				if var19 ~= nil then
					table.insert(var19.current, var25)
				end
			end else nil,
			onGenerateTextFailure = if var22 then function() --[[ line: 188 ]]
				-- upvalues: var18 (copy), var21 (ref), var19 (copy)
				local var26 = var21.triggerToast({
					title = var18.generateFailedTitle,
					text = var18.generateFailedBody
				})
				
				if var19 ~= nil then
					table.insert(var19.current, var26)
				end
			end else nil,
			onGenerateTextWillReplaceInput = if var22 then function() --[[ line: 196 ]]
				-- upvalues: var18 (copy), var21 (ref), var19 (copy)
				local var27 = var21.triggerToast({
					title = var18.generateOverrideTitle,
					text = var18.generateOverrideBody
				})
				
				if var19 ~= nil then
					table.insert(var19.current, var27)
				end
			end else nil,
			dismissGenerationToasts = if var22 then function() --[[ line: 204 ]]
				-- upvalues: var19 (copy), var21 (ref)
				if var19 ~= nil then
					for i, v in var19.current do
						var21.dismissToast(v)
					end
					var19.current = {}
				end
			end else nil,
			isTextFiltered = momentsCreationModule.isTextFiltered,
			createMoment = if var14 then function(_, _, p17, _, _) --[[ line: 215 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p17}"`)
			end else function(p12, p13, p14, p15, p16) --[[ line: 224 ]]
				-- upvalues: publishMomentWithUpload (copy), var18 (copy), makeUploadStore (copy), var20 (ref), var21 (ref)
				publishMomentWithUpload(p12, p13, p14, {
					localizations = var18,
					uploadStore = makeUploadStore(var20, p12, p13, p14, p16),
					toastStore = var21,
					creationSessionId = p15,
					resolvedTimeLength = p16
				})
			end
		}
	end, { onExit, captureSource, var18 })
end