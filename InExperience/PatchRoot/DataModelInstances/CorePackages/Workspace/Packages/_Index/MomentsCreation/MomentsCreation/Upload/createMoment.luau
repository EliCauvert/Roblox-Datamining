local CaptureService = game:GetService("CaptureService")
local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local EventNames = MomentsCommonModule.Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local NormalizeMomentMetadataModule = require(MomentsCreation.Utils.normalizeMomentMetadata)
local GetFFlagMomentsUseUploadPostAsyncFunction = MomentsCommonModule.Flags.GetFFlagMomentsUseUploadPostAsync
local GetFFlagMomentsUseMomentsServiceForUploadFunction = MomentsCommonModule.Flags.GetFFlagMomentsUseMomentsServiceForUpload
local MakePostMetadataModule = require(MomentsCreation.Utils.makePostMetadata)
local v1 = game
local CaptureServiceUploadUniverseIdOverrideEngineFeature = game:GetEngineFeature("CaptureServiceUploadUniverseIdOverride")
game:DefineFastString("MomentsUploadUniverseId", "8357232245")

local function _(Tbl)
	-- upvalues: v1 (copy)
	local GameId: number = v1.GameId
	
	if GameId == nil or GameId <= 0 then
		local Copy = table.clone(Tbl)
		Copy.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
		
		return Copy
	else
		return Tbl
	end
end

return function(Capture, Tbl, FeedRegistrationInfo, p1, p2): boolean
	-- upvalues: CaptureServiceUploadUniverseIdOverrideEngineFeature (copy), v1 (copy), NormalizeMomentMetadataModule (copy), GetFFlagMomentsUseUploadPostAsyncFunction (copy), MakePostMetadataModule (copy), GetFFlagMomentsUseMomentsServiceForUploadFunction (copy), CaptureService (copy), MakeCreationEventFieldsModule (copy), FireAnalyticsEventModule (copy), EventNames (copy)
	local Tbl1 = nil
	if CaptureServiceUploadUniverseIdOverrideEngineFeature then
		local GameId: number = v1.GameId
		
		if GameId == nil or GameId <= 0 then
			local Copy = table.clone(Tbl)
			Copy.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
			Tbl1 = Copy
		else
			Tbl1 = Tbl
		end
	else
		Tbl1 = Tbl
	end
	local NormalizeMomentMetadataModuleResult = NormalizeMomentMetadataModule(Tbl1)
	local Success = nil
	local Result = nil
	
	if GetFFlagMomentsUseUploadPostAsyncFunction() then
		local PostMetadataModule = MakePostMetadataModule(Tbl, if GetFFlagMomentsUseMomentsServiceForUploadFunction() then Capture else nil)
		Success, Result = pcall(function()
			-- upvalues: GetFFlagMomentsUseMomentsServiceForUploadFunction (upval), p2 (copy), PostMetadataModule (copy), CaptureService (upval), Capture (copy)
			if GetFFlagMomentsUseMomentsServiceForUploadFunction() then
				(p2 or game:GetService("MomentsService")):CreatePostAsync(PostMetadataModule)
				
				return
			else
				CaptureService:UploadPostAsync(Capture, PostMetadataModule)
			end
		end)
	else
		Success, Result = pcall(function()
			-- upvalues: CaptureService (upval), Capture (copy), NormalizeMomentMetadataModuleResult (ref), FeedRegistrationInfo (copy)
			CaptureService:UploadCaptureAndPostMoment(Capture, NormalizeMomentMetadataModuleResult, FeedRegistrationInfo)
		end)
	end
	if Success then
		local CaptureDescriptorFields = MakeCreationEventFieldsModule.makeCaptureDescriptorFields(Capture)
		
		for i1, value1 in MakeCreationEventFieldsModule.makeCreationBaseFields(p1) do
			CaptureDescriptorFields[i1] = value1
		end
		FireAnalyticsEventModule(EventNames.EditingFlowMomentPublished, CaptureDescriptorFields)
		
		return true
	else
		local config = {
			status = "GenericFailure",
			captureType = MakeCreationEventFieldsModule.enumName(Capture.CaptureType),
			localId = tostring(Capture.LocalId),
			error = tostring(Result)
		}
		
		for i, value in MakeCreationEventFieldsModule.makeCreationBaseFields(p1) do
			config[i] = value
		end
		FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
		
		return false
	end
end