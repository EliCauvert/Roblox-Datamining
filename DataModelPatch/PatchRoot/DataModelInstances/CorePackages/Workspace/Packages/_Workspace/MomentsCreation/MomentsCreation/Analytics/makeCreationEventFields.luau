local MomentsCommonModule = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsCommon)
local EventNames = MomentsCommonModule.Analytics.EventNames
local GetFFlagMomentsAnalyticsProducerPrereqsFunction = MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local CreationFlowSteps = MomentsCommonModule.Analytics.FunnelEventNames.CreationFlowSteps
local config = {
	[EventNames.MomentsEditingFlowContinueToEditButtonPressed] = CreationFlowSteps.GalleryItemSelectedContinuePressed,
	[EventNames.MomentsEditingFlowContinueToDescriptionButtonPressed] = CreationFlowSteps.EditingScreenContinuePressed,
	[EventNames.MomentsEditingFlowPublished] = CreationFlowSteps.Published,
	[EventNames.EditingFlowGalleryPageAppear] = CreationFlowSteps.CreateIntent,
	[EventNames.EditingFlowEditPageAppear] = CreationFlowSteps.GalleryItemSelectedContinuePressed,
	[EventNames.EditingFlowPreviewPageAppear] = CreationFlowSteps.EditingScreenContinuePressed,
	[EventNames.MomentsEditingFlowExited] = CreationFlowSteps.CreateIntent
}
local config1 = {
	Gallery = CreationFlowSteps.GalleryItemSelectedContinuePressed,
	Preview = CreationFlowSteps.EditingScreenContinuePressed,
	Description = CreationFlowSteps.EditingScreenContinuePressed
}

return {
	makeStepField = function(p1)
		-- upvalues: GetFFlagMomentsAnalyticsProducerPrereqsFunction (copy), config (copy)
		if GetFFlagMomentsAnalyticsProducerPrereqsFunction() then
			local Entry = config[p1]
			
			return if Entry == nil then {} else { step = Entry }
		else
			return {}
		end
	end,
	makeStepFieldFromState = function(p1)
		-- upvalues: GetFFlagMomentsAnalyticsProducerPrereqsFunction (copy), config1 (copy)
		if GetFFlagMomentsAnalyticsProducerPrereqsFunction() then
			local Entry = if p1 == nil then nil else config1[p1]
			
			return if Entry == nil then {} else { step = Entry }
		else
			return {}
		end
	end,
	makeToolField = function(p1)
		-- upvalues: GetFFlagMomentsAnalyticsProducerPrereqsFunction (copy)
		return if GetFFlagMomentsAnalyticsProducerPrereqsFunction() then if p1 == nil or p1.kind == nil then {} else { tool = p1.kind } else {}
	end,
	makeToolFieldFromKind = function(Tool)
		-- upvalues: GetFFlagMomentsAnalyticsProducerPrereqsFunction (copy)
		return if GetFFlagMomentsAnalyticsProducerPrereqsFunction() then if Tool == nil then {} else { tool = Tool } else {}
	end,
	makeCreationBaseFields = function(CreationSessionId)
		-- upvalues: GetFFlagMomentsAnalyticsProducerPrereqsFunction (copy)
		return if GetFFlagMomentsAnalyticsProducerPrereqsFunction() then if CreationSessionId == nil then {} else { creationSessionId = CreationSessionId } else {}
	end,
	makeCaptureDescriptorFields = function(Capture)
		-- upvalues: GetFFlagMomentsAnalyticsProducerPrereqsFunction (copy)
		local CaptureType = Capture.CaptureType
		local config = {
			sourcePlaceId = tostring(Capture.SourcePlaceId),
			localId = tostring(Capture.LocalId),
			captureType = if typeof(CaptureType) == "EnumItem" then CaptureType.Name elseif CaptureType == nil then nil else tostring(CaptureType)
		}
		
		if GetFFlagMomentsAnalyticsProducerPrereqsFunction() then
			config.universeId = tostring(Capture.SourceUniverseId)
		end
		return config
	end,
	enumName = function(p1)
		return if typeof(p1) == "EnumItem" then p1.Name elseif p1 == nil then nil else tostring(p1)
	end
}