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
local _game = game
local captureServiceUploadUniverseIdOverrideEngineFeature = game:GetEngineFeature("CaptureServiceUploadUniverseIdOverride")
game:DefineFastString("MomentsUploadUniverseId", "8357232245")

local function _(p0) --[[ line: 62 | named "injectUniverseIdOverride" ]]
	-- upvalues: _game (ref)
	local gameId = _game.GameId
	
	if gameId == nil or gameId <= 0 then
		local cloned = table.clone(p0)
		cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
		
		return cloned
	end
	return p0
end

return function(p1, p2, p3, p4) --[[ line: 72 | named "createMoment" ]]
	-- upvalues: captureServiceUploadUniverseIdOverrideEngineFeature (ref), _game (ref), getFFlagMomentsCreationNormalizeMetadataEnumsModule (ref), normalizeMomentMetadataModule (ref), captureService (ref), getFFlagMomentsAnalyticsProducerPrereqs (ref), makeCreationEventFieldsModule (ref), fireAnalyticsEventModule (ref), eventNames (ref)
	local ok, var10
	if captureServiceUploadUniverseIdOverrideEngineFeature then
		ok = _game.GameId
		
		if ok == nil or ok <= 0 then
			local cloned = table.clone(p2)
			cloned.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
			var10 = cloned
		else
			var10 = p2
		end
	else
		var10 = p2
	end
	if getFFlagMomentsCreationNormalizeMetadataEnumsModule() then
		var10 = normalizeMomentMetadataModule(var10)
	end
	ok, status = pcall(function() --[[ line: 87 ]]
		-- upvalues: captureService (copy), p1 (ref), var10 (write), p3 (ref)
		captureService:UploadCaptureAndPostMoment(p1, var10, p3)
	end)
	
	if getFFlagMomentsAnalyticsProducerPrereqs() and not ok then
		local t = {
			status = "GenericFailure",
			captureType = makeCreationEventFieldsModule.enumName(p1.CaptureType),
			localId = tostring(p1.LocalId),
			error = tostring(status)
		}
		
		for i, v in makeCreationEventFieldsModule.makeCreationBaseFields(p4) do
			t[i] = v
		end
		fireAnalyticsEventModule(eventNames.UploadCaptureFailed, t)
		
		return
	else
		local var13 = makeCreationEventFieldsModule.makeCaptureDescriptorFields(p1)
		
		for i, v in makeCreationEventFieldsModule.makeCreationBaseFields(p4) do
			var13[i] = v
		end
		fireAnalyticsEventModule(eventNames.EditingFlowMomentPublished, var13)
	end
end