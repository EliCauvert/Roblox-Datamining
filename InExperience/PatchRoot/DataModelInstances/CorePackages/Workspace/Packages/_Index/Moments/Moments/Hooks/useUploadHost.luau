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
local var16 = require(parent.MomentsCommon.isStudio)()
local momentStatus = momentsTypesModule.Enums.MomentStatus

local function makeUploadedMomentItem(p0, p1, p2, p3, p4) --[[ line: 74 ]]
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

local function makeUploadStore(p5, p6, p7, p8, p9) --[[ line: 104 ]]
	-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (ref), fFlagMomentsHydratePublishedFeedItemModule (ref), setPublishedMomentOnUploadStoreModule (ref), makeUploadedMomentItem (ref), refreshOwnMomentsAfterPublishModule (ref)
	local var19 = getFFlagMomentsRefreshFromTopAfterUploadModule()
	
	return if var19 or fFlagMomentsRefreshOwnMomentsAfterPublish or fFlagMomentsHydratePublishedFeedItemModule then {
		setUploading = p5.setUploading,
		setFailed = p5.setFailed,
		setSuccess = function(value) --[[ line: 124 ]]
			-- upvalues: p5 (ref), fFlagMomentsHydratePublishedFeedItemModule (copy), setPublishedMomentOnUploadStoreModule (copy), var19 (ref), makeUploadedMomentItem (copy), p6 (ref), p7 (ref), p8 (ref), p9 (ref), fFlagMomentsRefreshOwnMomentsAfterPublish (copy), refreshOwnMomentsAfterPublishModule (copy)
			if type(value) ~= "number" then
				p5.setSuccess(value)
				
				return
			elseif fFlagMomentsHydratePublishedFeedItemModule then
				task.spawn(setPublishedMomentOnUploadStoreModule, value, p5)
				
				return
			elseif var19 then
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

return function(p10) --[[ line: 152 | named "useUploadHost" ]]
	-- upvalues: useLocalization (ref), t (ref), getFFlagEnableMomentTextGeneration (ref), reactModule (ref), getUploadStoreModule (ref), getToastStoreModule (ref), generateMomentTextModule (ref), momentsCreationModule (ref), var16 (ref), publishMomentWithUpload (ref), makeUploadStore (ref)
	local onExit = p10.onExit
	local captureSource = p10.captureSource
	local var20 = useLocalization(t)
	local var21 = if getFFlagEnableMomentTextGeneration() then reactModule.useRef({}) else nil
	
	return reactModule.useMemo(function() --[[ line: 168 ]]
		-- upvalues: getUploadStoreModule (copy), getToastStoreModule (copy), getFFlagEnableMomentTextGeneration (copy), var21 (write), onExit (ref), captureSource (ref), generateMomentTextModule (copy), var20 (ref), momentsCreationModule (copy), var16 (copy), publishMomentWithUpload (copy), makeUploadStore (copy)
		local var22 = getUploadStoreModule(false)
		local var23 = getToastStoreModule(false)
		local var24 = getFFlagEnableMomentTextGeneration()
		
		local function _(p11) --[[ line: 178 | named "triggerGenerationToast" ]]
			-- upvalues: var23 (ref), var21 (copy)
			local var25 = var23.triggerToast(p11)
			
			if var21 ~= nil then
				table.insert(var21.current, var25)
			end
		end
		
		return {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			generateMomentText = if var24 then generateMomentTextModule else nil,
			onGenerateTextManualEditBlocked = if var24 then function() --[[ line: 190 ]]
				-- upvalues: var20 (copy), var23 (ref), var21 (copy)
				local var26 = var23.triggerToast({
					title = var20.generateInProgressTitle,
					text = var20.generateInProgressBody
				})
				
				if var21 ~= nil then
					table.insert(var21.current, var26)
				end
			end else nil,
			onGenerateTextSuccess = if var24 then function() --[[ line: 198 ]]
				-- upvalues: var20 (copy), var23 (ref), var21 (copy)
				local var27 = var23.triggerToast({ title = var20.generatedTitle, text = var20.generatedBody })
				
				if var21 ~= nil then
					table.insert(var21.current, var27)
				end
			end else nil,
			onGenerateTextFailure = if var24 then function() --[[ line: 203 ]]
				-- upvalues: var20 (copy), var23 (ref), var21 (copy)
				local var28 = var23.triggerToast({
					title = var20.generateFailedTitle,
					text = var20.generateFailedBody
				})
				
				if var21 ~= nil then
					table.insert(var21.current, var28)
				end
			end else nil,
			onGenerateTextFiltered = if var24 then function() --[[ line: 213 ]]
				-- upvalues: var20 (copy), var23 (ref), var21 (copy)
				local var29 = var23.triggerToast({
					title = var20.generateFilteredTitle,
					text = var20.generateFilteredBody
				})
				
				if var21 ~= nil then
					table.insert(var21.current, var29)
				end
			end else nil,
			onGenerateTextWillReplaceInput = if var24 then function() --[[ line: 221 ]]
				-- upvalues: var20 (copy), var23 (ref), var21 (copy)
				local var30 = var23.triggerToast({
					title = var20.generateOverrideTitle,
					text = var20.generateOverrideBody
				})
				
				if var21 ~= nil then
					table.insert(var21.current, var30)
				end
			end else nil,
			dismissGenerationToasts = if var24 then function() --[[ line: 229 ]]
				-- upvalues: var21 (copy), var23 (ref)
				if var21 ~= nil then
					for i, v in var21.current do
						var23.dismissToast(v)
					end
					var21.current = {}
				end
			end else nil,
			isTextFiltered = momentsCreationModule.isTextFiltered,
			createMoment = if var16 then function(_, _, p17, _, _) --[[ line: 240 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p17}"`)
			end else function(p12, p13, p14, p15, p16) --[[ line: 249 ]]
				-- upvalues: publishMomentWithUpload (copy), var20 (copy), makeUploadStore (copy), var22 (ref), var23 (ref)
				publishMomentWithUpload(p12, p13, p14, {
					localizations = var20,
					uploadStore = makeUploadStore(var22, p12, p13, p14, p16),
					toastStore = var23,
					creationSessionId = p15,
					resolvedTimeLength = p16
				})
			end
		}
	end, { onExit, captureSource, var20 })
end