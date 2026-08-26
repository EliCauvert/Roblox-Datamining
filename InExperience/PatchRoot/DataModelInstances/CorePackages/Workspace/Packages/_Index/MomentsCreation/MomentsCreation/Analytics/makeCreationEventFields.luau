local momentsCommonModule = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsCommon)
local eventNames = momentsCommonModule.Analytics.EventNames
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local getFFlagEnableMomentTextGeneration = momentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local creationFlowSteps = funnelEventNames.CreationFlowSteps
local t = {
	[eventNames.MomentsEditingFlowContinueToEditButtonPressed] = creationFlowSteps.GalleryItemSelectedContinuePressed,
	[eventNames.MomentsEditingFlowContinueToDescriptionButtonPressed] = creationFlowSteps.EditingScreenContinuePressed,
	[eventNames.MomentsEditingFlowPublished] = creationFlowSteps.Published,
	[eventNames.EditingFlowGalleryPageAppear] = creationFlowSteps.CreateIntent,
	[eventNames.EditingFlowEditPageAppear] = creationFlowSteps.GalleryItemSelectedContinuePressed,
	[eventNames.EditingFlowPreviewPageAppear] = creationFlowSteps.EditingScreenContinuePressed,
	[eventNames.MomentsEditingFlowExited] = creationFlowSteps.CreateIntent
}
local t_1 = {
	Gallery = creationFlowSteps.GalleryItemSelectedContinuePressed,
	Preview = creationFlowSteps.EditingScreenContinuePressed,
	Description = creationFlowSteps.EditingScreenContinuePressed
}

return {
	makeStepField = function(p1)
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref), t (ref)
		if not getFFlagMomentsAnalyticsProducerPrereqs() then
			return {}
		end
		local var1 = t[p1]
		
		return if var1 == nil then {} else { step = var1 }
	end,
	makeStepFieldFromState = function(p1)
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref), t_1 (ref)
		if not getFFlagMomentsAnalyticsProducerPrereqs() then
			return {}
		end
		local var1 = if p1 ~= nil then nil else t_1[p1]
		
		return if var1 == nil then {} else { step = var1 }
	end,
	makeToolField = function(p1)
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then if p1 == nil or p1.kind == nil then {} else { tool = p1.kind } else {}
	end,
	makeToolFieldFromKind = function(p1)
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then if p1 == nil then {} else { tool = p1 } else {}
	end,
	makeCreationBaseFields = function(p1)
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then if p1 == nil then {} else { creationSessionId = p1 } else {}
	end,
	makeCaptureDescriptorFields = function(p1)
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref)
		local t = {
			sourcePlaceId = tostring(p1.SourcePlaceId),
			localId = tostring(p1.LocalId)
		}
		local captureType = p1.CaptureType
		t.captureType = if typeof(captureType) == "EnumItem" then captureType.Name elseif captureType == nil then nil else tostring(captureType)
		
		if getFFlagMomentsAnalyticsProducerPrereqs() then
			t.universeId = tostring(p1.SourceUniverseId)
		end
		return t
	end,
	makeGeneratedTextOutcomeFields = function(p1, p2, p3, p4)
		-- upvalues: getFFlagEnableMomentTextGeneration (ref)
		return if getFFlagEnableMomentTextGeneration() then {
			generatedDescriptionOutcome = if p1 == nil then "none" elseif p2 == p1 then "verbatim" elseif p2 == nil or p2 == "" then "discarded" else "edited",
			generatedSummaryOutcome = if p3 == nil then "none" elseif p4 == p3 then "verbatim" elseif p4 == nil or p4 == "" then "discarded" else "edited"
		} else {}
	end,
	classifyGeneratedTextOutcome = function(p1, p2)
		return if p1 == nil then "none" elseif p2 == p1 then "verbatim" elseif p2 == nil or p2 == "" then "discarded" else "edited"
	end,
	enumName = function(p1)
		return if typeof(p1) == "EnumItem" then p1.Name elseif p1 == nil then nil else tostring(p1)
	end
}