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
local MakePostMetadataModule = require(MomentsCreation.Utils.makePostMetadata)
local FFlagMomentsCreationSessionIdModule = require(MomentsCreation.Flags.FFlagMomentsCreationSessionId)
local FFlagMomentsCreateMomentOutcomeEventsModule = require(MomentsCreation.Flags.FFlagMomentsCreateMomentOutcomeEvents)
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

local _ = function(p1, p2)
	-- upvalues: MakeCreationEventFieldsModule (copy)
	local CaptureDescriptorFields = MakeCreationEventFieldsModule.makeCaptureDescriptorFields(p1)
	
	for i, value in MakeCreationEventFieldsModule.makeCreationBaseFields(p2) do
		CaptureDescriptorFields[i] = value
	end
	return CaptureDescriptorFields
end

return function(Capture, Tbl, FeedRegistrationInfo, p3, p4): boolean
	-- upvalues: CaptureServiceUploadUniverseIdOverrideEngineFeature (copy), v1 (copy), NormalizeMomentMetadataModule (copy), GetFFlagMomentsUseUploadPostAsyncFunction (copy), MakePostMetadataModule (copy), FFlagMomentsCreationSessionIdModule (copy), FFlagMomentsCreateMomentOutcomeEventsModule (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), CaptureService (copy)
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
	local FFlagMomentsUseUploadPostAsync = GetFFlagMomentsUseUploadPostAsyncFunction()
	local Success = nil
	local Result = nil
	
	if FFlagMomentsUseUploadPostAsync then
		local PostMetadataModule = MakePostMetadataModule(Tbl, Capture, if FFlagMomentsCreationSessionIdModule then p3 else nil)
		
		if FFlagMomentsCreateMomentOutcomeEventsModule then
			local EditingFlowMomentPublished = EventNames.EditingFlowMomentPublished
			local CaptureDescriptorFields = MakeCreationEventFieldsModule.makeCaptureDescriptorFields(Capture)
			
			for i, value in MakeCreationEventFieldsModule.makeCreationBaseFields(p3) do
				CaptureDescriptorFields[i] = value
			end
			FireAnalyticsEventModule(EditingFlowMomentPublished, CaptureDescriptorFields)
			Success, Result = pcall(function()
				-- upvalues: p4 (copy), PostMetadataModule (copy)
				return (p4 or game:GetService("MomentsService")):CreatePostAsync(PostMetadataModule)
			end)
		else
			Success, Result = pcall(function()
				-- upvalues: p4 (copy), PostMetadataModule (copy)
				(p4 or game:GetService("MomentsService")):CreatePostAsync(PostMetadataModule)
			end)
		end
	else
		Success, Result = pcall(function()
			-- upvalues: CaptureService (upval), Capture (copy), NormalizeMomentMetadataModuleResult (ref), FeedRegistrationInfo (copy)
			CaptureService:UploadCaptureAndPostMoment(Capture, NormalizeMomentMetadataModuleResult, FeedRegistrationInfo)
		end)
	end
	if Success then
		if FFlagMomentsCreateMomentOutcomeEventsModule and FFlagMomentsUseUploadPostAsync then
			local AssetId = if Result == nil then nil else Result.assetId
			local OperationId = if Result == nil then nil else Result.operationId
			local config = {
				assetId = if AssetId == nil or AssetId == 0 then nil else tostring(AssetId),
				localId = tostring(Capture.LocalId),
				captureType = MakeCreationEventFieldsModule.enumName(Capture.CaptureType)
			}
			
			if FFlagMomentsCreationSessionIdModule and OperationId ~= nil and OperationId ~= "" then
				config.correlationId = OperationId
			end
			for i2, value2 in MakeCreationEventFieldsModule.makeCreationBaseFields(p3) do
				config[i2] = value2
			end
			FireAnalyticsEventModule(EventNames.EditingFlowMomentPostedToFeed, config)
			
			return true
		else
			local CaptureDescriptorFields = MakeCreationEventFieldsModule.makeCaptureDescriptorFields(Capture)
			
			for i3, value3 in MakeCreationEventFieldsModule.makeCreationBaseFields(p3) do
				CaptureDescriptorFields[i3] = value3
			end
			FireAnalyticsEventModule(EventNames.EditingFlowMomentPublished, CaptureDescriptorFields)
			
			return true
		end
	else
		local config = {
			status = "GenericFailure",
			captureType = MakeCreationEventFieldsModule.enumName(Capture.CaptureType),
			localId = tostring(Capture.LocalId),
			error = tostring(Result)
		}
		
		for i1, value1 in MakeCreationEventFieldsModule.makeCreationBaseFields(p3) do
			config[i1] = value1
		end
		FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
		
		return false
	end
end