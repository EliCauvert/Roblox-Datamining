local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local playersService = game:GetService("Players")
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local momentsTypesModule = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local useLocalization = localizationModule.Hooks.useLocalization
local momentsCreationModule = require(parent.MomentsCreation)
local publishMomentWithUpload = momentsCreationModule.publishMomentWithUpload
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
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
local var12 = require(parent.MomentsCommon.isStudio)()
local momentStatus = momentsTypesModule.Enums.MomentStatus

local function makeUploadedMomentItem(p0, p1, p2, p3, p4) --[[ line: 68 ]]
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

local function makeUploadStore(p5, p6, p7, p8, p9) --[[ line: 98 ]]
	-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (ref), makeUploadedMomentItem (ref)
	return if getFFlagMomentsRefreshFromTopAfterUploadModule() then {
		setUploading = p5.setUploading,
		setFailed = p5.setFailed,
		setSuccess = function(value) --[[ line: 112 ]]
			-- upvalues: p5 (ref), makeUploadedMomentItem (copy), p6 (ref), p7 (ref), p8 (ref), p9 (ref)
			if type(value) == "number" then
				p5.setSuccess(makeUploadedMomentItem(value, p6, p7, p8, p9))
				
				return
			end
			p5.setSuccess(value)
		end
	} else p5
end

return function(p10) --[[ line: 123 | named "useUploadHost" ]]
	-- upvalues: useLocalization (ref), t (ref), getFFlagEnableMomentTextGeneration (ref), reactModule (ref), getUploadStoreModule (ref), getToastStoreModule (ref), generateMomentTextModule (ref), momentsCreationModule (ref), var12 (ref), publishMomentWithUpload (ref), makeUploadStore (ref)
	local onExit = p10.onExit
	local captureSource = p10.captureSource
	local var15 = useLocalization(t)
	local var16 = if getFFlagEnableMomentTextGeneration() then reactModule.useRef({}) else nil
	
	return reactModule.useMemo(function() --[[ line: 139 ]]
		-- upvalues: getUploadStoreModule (copy), getToastStoreModule (copy), getFFlagEnableMomentTextGeneration (copy), var16 (write), onExit (ref), captureSource (ref), generateMomentTextModule (copy), var15 (ref), momentsCreationModule (copy), var12 (copy), publishMomentWithUpload (copy), makeUploadStore (copy)
		local var17 = getUploadStoreModule(false)
		local var18 = getToastStoreModule(false)
		local var19 = getFFlagEnableMomentTextGeneration()
		
		local function _(p11) --[[ line: 149 | named "triggerGenerationToast" ]]
			-- upvalues: var18 (ref), var16 (copy)
			local var20 = var18.triggerToast(p11)
			
			if var16 ~= nil then
				table.insert(var16.current, var20)
			end
		end
		
		return {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			generateMomentText = if var19 then generateMomentTextModule else nil,
			onGenerateTextManualEditBlocked = if var19 then function() --[[ line: 161 ]]
				-- upvalues: var15 (copy), var18 (ref), var16 (copy)
				local var21 = var18.triggerToast({
					title = var15.generateInProgressTitle,
					text = var15.generateInProgressBody
				})
				
				if var16 ~= nil then
					table.insert(var16.current, var21)
				end
			end else nil,
			onGenerateTextSuccess = if var19 then function() --[[ line: 169 ]]
				-- upvalues: var15 (copy), var18 (ref), var16 (copy)
				local var22 = var18.triggerToast({ title = var15.generatedTitle, text = var15.generatedBody })
				
				if var16 ~= nil then
					table.insert(var16.current, var22)
				end
			end else nil,
			onGenerateTextFailure = if var19 then function() --[[ line: 174 ]]
				-- upvalues: var15 (copy), var18 (ref), var16 (copy)
				local var23 = var18.triggerToast({
					title = var15.generateFailedTitle,
					text = var15.generateFailedBody
				})
				
				if var16 ~= nil then
					table.insert(var16.current, var23)
				end
			end else nil,
			onGenerateTextFiltered = if var19 then function() --[[ line: 184 ]]
				-- upvalues: var15 (copy), var18 (ref), var16 (copy)
				local var24 = var18.triggerToast({
					title = var15.generateFilteredTitle,
					text = var15.generateFilteredBody
				})
				
				if var16 ~= nil then
					table.insert(var16.current, var24)
				end
			end else nil,
			onGenerateTextWillReplaceInput = if var19 then function() --[[ line: 192 ]]
				-- upvalues: var15 (copy), var18 (ref), var16 (copy)
				local var25 = var18.triggerToast({
					title = var15.generateOverrideTitle,
					text = var15.generateOverrideBody
				})
				
				if var16 ~= nil then
					table.insert(var16.current, var25)
				end
			end else nil,
			dismissGenerationToasts = if var19 then function() --[[ line: 200 ]]
				-- upvalues: var16 (copy), var18 (ref)
				if var16 ~= nil then
					for i, v in var16.current do
						var18.dismissToast(v)
					end
					var16.current = {}
				end
			end else nil,
			isTextFiltered = momentsCreationModule.isTextFiltered,
			createMoment = if var12 then function(_, _, p17, _, _) --[[ line: 211 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p17}"`)
			end else function(p12, p13, p14, p15, p16) --[[ line: 220 ]]
				-- upvalues: publishMomentWithUpload (copy), var15 (copy), makeUploadStore (copy), var17 (ref), var18 (ref)
				publishMomentWithUpload(p12, p13, p14, {
					localizations = var15,
					uploadStore = makeUploadStore(var17, p12, p13, p14, p16),
					toastStore = var18,
					creationSessionId = p15,
					resolvedTimeLength = p16
				})
			end
		}
	end, { onExit, captureSource, var15 })
end