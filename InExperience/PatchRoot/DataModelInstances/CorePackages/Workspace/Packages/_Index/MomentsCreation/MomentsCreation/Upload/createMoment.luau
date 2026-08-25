local captureService = game:GetService("CaptureService")
local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local eventNames = momentsCommonModule.Analytics.EventNames
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local normalizeMomentMetadataModule = require(momentsCreation.Utils.normalizeMomentMetadata)
local getFFlagMomentsCreationNormalizeMetadataEnumsModule = require(momentsCreation.Flags.GetFFlagMomentsCreationNormalizeMetadataEnums)
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local getFFlagMomentsUseUploadPostAsync = momentsCommonModule.Flags.GetFFlagMomentsUseUploadPostAsync
local makePostMetadataModule = require(momentsCreation.Utils.makePostMetadata)
local _game = game
local captureServiceUploadUniverseIdOverrideEngineFeature = game:GetEngineFeature("CaptureServiceUploadUniverseIdOverride")
game:DefineFastString("MomentsUploadUniverseId", "8357232245")

local function _(p0)
	-- upvalues: _game (ref)
	local gameId = _game.GameId
	
	if gameId == nil or gameId <= 0 then
		local cloned = table.clone(p0)
		cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
		
		return cloned
	end
	return p0
end

return function(p1, p2, p3, p4)
	-- upvalues: captureServiceUploadUniverseIdOverrideEngineFeature (ref), _game (ref), getFFlagMomentsCreationNormalizeMetadataEnumsModule (ref), normalizeMomentMetadataModule (ref), getFFlagMomentsUseUploadPostAsync (ref), makePostMetadataModule (ref), captureService (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), makeCreationEventFieldsModule (ref), fireAnalyticsEventModule (ref), eventNames (ref)
	local gameId, var11
	if captureServiceUploadUniverseIdOverrideEngineFeature then
		gameId = _game.GameId
		
		if gameId == nil or gameId <= 0 then
			local cloned = table.clone(p2)
			cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
			var11 = cloned
		else
			var11 = p2
		end
	else
		var11 = p2
	end
	if getFFlagMomentsCreationNormalizeMetadataEnumsModule() then
		var11 = normalizeMomentMetadataModule(var11)
	end
	local var14
	gameId = nil
	local _ = nil
	
	if getFFlagMomentsUseUploadPostAsync() then
		local var13 = makePostMetadataModule(p2)
		local ok, status = pcall(function()
			-- upvalues: captureService (copy), p1 (ref), var13 (ref)
			captureService:UploadPostAsync(p1, var13)
		end)
		gameId = ok
		var14 = status
	else
		local ok, status = pcall(function()
			-- upvalues: captureService (copy), p1 (ref), var11 (write), p3 (ref)
			captureService:UploadCaptureAndPostMoment(p1, var11, p3)
		end)
		gameId = ok
		var14 = status
	end
	if getFFlagMomentsAnalyticsProducerPrereqs() and not gameId then
		local t = {
			status = "GenericFailure",
			captureType = makeCreationEventFieldsModule.enumName(p1.CaptureType),
			localId = tostring(p1.LocalId),
			error = tostring(var14)
		}
		
		for i, v in makeCreationEventFieldsModule.makeCreationBaseFields(p4) do
			t[i] = v
		end
		fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
		
		return
	else
		local var16 = makeCreationEventFieldsModule.makeCaptureDescriptorFields(p1)
		
		for i, v in makeCreationEventFieldsModule.makeCreationBaseFields(p4) do
			var16[i] = v
		end
		fireAnalyticsEventModule(eventNames.EditingFlowMomentPublished, var16)
	end
end