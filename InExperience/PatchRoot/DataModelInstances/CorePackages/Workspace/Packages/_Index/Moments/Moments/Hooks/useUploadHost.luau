local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local playersService = game:GetService("Players")
local localizationModule = require(parent.Localization)
local momentsTypesModule = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local useLocalization = localizationModule.Hooks.useLocalization
local momentsCreationModule = require(parent.MomentsCreation)
local publishMomentWithUpload = momentsCreationModule.publishMomentWithUpload
local getFFlagMomentsRefreshFromTopAfterUploadModule = require(moments.Flags.GetFFlagMomentsRefreshFromTopAfterUpload)
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
	uploadQuotaReachedBody = "Feature.Moments.Description.TooManyUploads"
}
local var10 = require(parent.MomentsCommon.isStudio)()
local momentStatus = momentsTypesModule.Enums.MomentStatus

local function makeUploadedMomentItem(p0, p1, p2, p3) --[[ line: 56 ]]
	-- upvalues: playersService (ref), momentStatus (ref)
	local var13 = tostring(p0)
	local localPlayer = playersService.LocalPlayer
	
	return {
		assetId = p0,
		creatorId = if localPlayer ~= nil then 0 else localPlayer.UserId,
		metadata = {
			assetTotalDuration = if p1.CaptureType == Enum.CaptureType.Screenshot then 7 else p1.TimeLength,
			captureType = p1.CaptureType,
			description = p3,
			edits = p2,
			placeId = p1.SourcePlaceId,
			universeId = p1.SourceUniverseId
		},
		momentId = var13,
		recommendationMetadata = { itemId = var13 },
		status = momentStatus.Public
	}
end

local function makeUploadStore(p4, p5, p6, p7) --[[ line: 80 ]]
	-- upvalues: getFFlagMomentsRefreshFromTopAfterUploadModule (ref), makeUploadedMomentItem (ref)
	return if getFFlagMomentsRefreshFromTopAfterUploadModule() then {
		setUploading = p4.setUploading,
		setFailed = p4.setFailed,
		setSuccess = function(value) --[[ line: 88 ]]
			-- upvalues: p4 (ref), makeUploadedMomentItem (copy), p5 (ref), p6 (ref), p7 (ref)
			if type(value) == "number" then
				p4.setSuccess(makeUploadedMomentItem(value, p5, p6, p7))
				
				return
			end
			p4.setSuccess(value)
		end
	} else p4
end

return function(p8) --[[ line: 99 | named "useUploadHost" ]]
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), getUploadStoreModule (ref), getToastStoreModule (ref), momentsCreationModule (ref), var10 (ref), publishMomentWithUpload (ref), makeUploadStore (ref)
	local onExit = p8.onExit
	local captureSource = p8.captureSource
	local var14 = useLocalization(t)
	
	return reactModule.useMemo(function() --[[ line: 105 ]]
		-- upvalues: getUploadStoreModule (copy), getToastStoreModule (copy), onExit (ref), captureSource (ref), momentsCreationModule (copy), var10 (copy), publishMomentWithUpload (copy), var14 (ref), makeUploadStore (copy)
		local var15 = getUploadStoreModule(false)
		local var16 = getToastStoreModule(false)
		
		return {
			exitCreationFlow = onExit,
			captureSource = captureSource,
			isTextFiltered = momentsCreationModule.isTextFiltered,
			createMoment = if var10 then function(_, _, p12) --[[ line: 114 ]]
				print(`[moments-creation] dev publish (not uploaded): "{p12}"`)
			end else function(p9, p10, p11) --[[ line: 117 ]]
				-- upvalues: publishMomentWithUpload (copy), var14 (copy), makeUploadStore (copy), var15 (ref), var16 (ref)
				publishMomentWithUpload(p9, p10, p11, {
					localizations = var14,
					uploadStore = makeUploadStore(var15, p9, p10, p11),
					toastStore = var16
				})
			end
		}
	end, { onExit, captureSource, var14 })
end