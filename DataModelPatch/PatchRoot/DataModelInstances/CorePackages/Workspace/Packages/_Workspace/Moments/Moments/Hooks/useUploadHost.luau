local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MomentsCreationModule = require(Parent.MomentsCreation)
local PublishMomentWithUploadFunction = MomentsCreationModule.publishMomentWithUpload
local GetFFlagMomentsRefreshFromTopAfterUploadModule = require(Moments.Flags.GetFFlagMomentsRefreshFromTopAfterUpload)
local GetUploadStoreModule = require(Moments.Stores.GetUploadStore)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local config = {
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
local v1 = require(Parent.MomentsCommon.isStudio)()
local MomentStatus = require(Parent.MomentsTypes).Enums.MomentStatus

local function makeUploadedMomentItem(AssetId, Sound, Edits, Description)
	-- upvalues: Players (copy), MomentStatus (copy)
	local Text = tostring(AssetId)
	local LocalPlayer = Players.LocalPlayer
	
	return {
		assetId = AssetId,
		creatorId = if LocalPlayer == nil then 0 else LocalPlayer.UserId,
		metadata = {
			assetTotalDuration = if Sound.CaptureType == Enum.CaptureType.Screenshot then 7 else Sound.TimeLength,
			captureType = Sound.CaptureType,
			description = Description,
			edits = Edits,
			placeId = Sound.SourcePlaceId,
			universeId = Sound.SourceUniverseId
		},
		momentId = Text,
		recommendationMetadata = { itemId = Text },
		status = MomentStatus.Public
	}
end

local function makeUploadStore(p1, Sound, Edits, Description)
	-- upvalues: GetFFlagMomentsRefreshFromTopAfterUploadModule (copy), makeUploadedMomentItem (copy)
	return if GetFFlagMomentsRefreshFromTopAfterUploadModule() then {
		setUploading = p1.setUploading,
		setFailed = p1.setFailed,
		setSuccess = function(AssetId)
			-- upvalues: p1 (copy), makeUploadedMomentItem (upval), Sound (copy), Edits (copy), Description (copy)
			if type(AssetId) == "number" then
				p1.setSuccess((makeUploadedMomentItem(AssetId, Sound, Edits, Description)))
				
				return
			else
				p1.setSuccess(AssetId)
			end
		end
	} else p1
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), GetUploadStoreModule (copy), GetToastStoreModule (copy), MomentsCreationModule (copy), v1 (copy), PublishMomentWithUploadFunction (copy), makeUploadStore (copy)
	local OnExit = p1.onExit
	local CaptureSource = p1.captureSource
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return (ReactModule.useMemo(function()
		-- upvalues: GetUploadStoreModule (upval), GetToastStoreModule (upval), OnExit (copy), CaptureSource (copy), MomentsCreationModule (upval), v1 (upval), PublishMomentWithUploadFunction (upval), UseLocalizationResult (copy), makeUploadStore (upval)
		local UploadStoreModule = GetUploadStoreModule(false)
		local ToastStoreModule = GetToastStoreModule(false)
		
		return {
			exitCreationFlow = OnExit,
			captureSource = CaptureSource,
			isTextFiltered = MomentsCreationModule.isTextFiltered,
			createMoment = if v1 then function(_, _, p2, _)
				print(`[moments-creation] dev publish (not uploaded): "{p12}"`)
			end else function(p2, p3, p4, CreationSessionId)
				-- upvalues: PublishMomentWithUploadFunction (upval), UseLocalizationResult (upval), makeUploadStore (upval), UploadStoreModule (copy), ToastStoreModule (copy)
				PublishMomentWithUploadFunction(p2, p3, p4, {
					localizations = UseLocalizationResult,
					uploadStore = makeUploadStore(UploadStoreModule, p2, p3, p4),
					toastStore = ToastStoreModule,
					creationSessionId = CreationSessionId
				})
			end
		}
	end, { OnExit, CaptureSource, UseLocalizationResult }))
end