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
	makeStepField = function(p0) --[[ line: 80 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref), t (ref)
		if not getFFlagMomentsAnalyticsProducerPrereqs() then
			return {}
		end
		local var3 = t[p0]
		
		return if var3 == nil then {} else { step = var3 }
	end,
	makeStepFieldFromState = function(p1) --[[ line: 93 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref), t_1 (ref)
		if not getFFlagMomentsAnalyticsProducerPrereqs() then
			return {}
		end
		local var4 = if p1 ~= nil then nil else t_1[p1]
		
		return if var4 == nil then {} else { step = var4 }
	end,
	makeToolField = function(p2) --[[ line: 105 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then if p2 == nil or p2.kind == nil then {} else { tool = p2.kind } else {}
	end,
	makeToolFieldFromKind = function(p3) --[[ line: 117 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then if p3 == nil then {} else { tool = p3 } else {}
	end,
	makeCreationBaseFields = function(p4) --[[ line: 134 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then if p4 == nil then {} else { creationSessionId = p4 } else {}
	end,
	makeCaptureDescriptorFields = function(p5) --[[ line: 168 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref)
		local t = {
			sourcePlaceId = tostring(p5.SourcePlaceId),
			localId = tostring(p5.LocalId)
		}
		local captureType = p5.CaptureType
		t.captureType = if typeof(captureType) == "EnumItem" then captureType.Name elseif captureType == nil then nil else tostring(captureType)
		
		if getFFlagMomentsAnalyticsProducerPrereqs() then
			t.universeId = tostring(p5.SourceUniverseId)
		end
		return t
	end,
	makeGeneratedTextOutcomeFields = function(p6, p7, p8, p9) --[[ line: 200 ]]
		-- upvalues: getFFlagEnableMomentTextGeneration (ref)
		return if getFFlagEnableMomentTextGeneration() then {
			generatedDescriptionOutcome = if p6 == nil then "none" elseif p7 == p6 then "verbatim" elseif p7 == nil or p7 == "" then "discarded" else "edited",
			generatedSummaryOutcome = if p8 == nil then "none" elseif p9 == p8 then "verbatim" elseif p9 == nil or p9 == "" then "discarded" else "edited"
		} else {}
	end,
	classifyGeneratedTextOutcome = function(p10, p11) --[[ line: 183 ]]
		return if p10 == nil then "none" elseif p11 == p10 then "verbatim" elseif p11 == nil or p11 == "" then "discarded" else "edited"
	end,
	enumName = function(p12) --[[ line: 149 ]]
		return if typeof(p12) == "EnumItem" then p12.Name elseif p12 == nil then nil else tostring(p12)
	end
}