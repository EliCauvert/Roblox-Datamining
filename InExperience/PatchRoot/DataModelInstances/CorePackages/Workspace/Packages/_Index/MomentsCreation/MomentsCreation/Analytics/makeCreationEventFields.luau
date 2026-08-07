local momentsCommonModule = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsCommon)
local eventNames = momentsCommonModule.Analytics.EventNames
local getFFlagMomentsAnalyticsProducerPrereqs = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsProducerPrereqs
local creationFlowSteps = momentsCommonModule.Analytics.FunnelEventNames.CreationFlowSteps
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
	makeStepField = function(p0) --[[ line: 79 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref), t (ref)
		if not getFFlagMomentsAnalyticsProducerPrereqs() then
			return {}
		end
		local var3 = t[p0]
		
		return if var3 == nil then {} else { step = var3 }
	end,
	makeStepFieldFromState = function(p1) --[[ line: 92 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref), t_1 (ref)
		if not getFFlagMomentsAnalyticsProducerPrereqs() then
			return {}
		end
		local var4 = if p1 ~= nil then nil else t_1[p1]
		
		return if var4 == nil then {} else { step = var4 }
	end,
	makeToolField = function(p2) --[[ line: 104 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then if p2 == nil or p2.kind == nil then {} else { tool = p2.kind } else {}
	end,
	makeToolFieldFromKind = function(p3) --[[ line: 116 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then if p3 == nil then {} else { tool = p3 } else {}
	end,
	makeCreationBaseFields = function(p4) --[[ line: 133 ]]
		-- upvalues: getFFlagMomentsAnalyticsProducerPrereqs (ref)
		return if getFFlagMomentsAnalyticsProducerPrereqs() then if p4 == nil then {} else { creationSessionId = p4 } else {}
	end,
	makeCaptureDescriptorFields = function(p5) --[[ line: 167 ]]
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
	enumName = function(p6) --[[ line: 148 ]]
		return if typeof(p6) == "EnumItem" then p6.Name elseif p6 == nil then nil else tostring(p6)
	end
}