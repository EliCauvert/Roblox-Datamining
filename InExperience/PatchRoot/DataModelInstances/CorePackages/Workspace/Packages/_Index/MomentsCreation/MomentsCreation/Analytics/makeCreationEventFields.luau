local momentsCommonModule = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsCommon)
local eventNames = momentsCommonModule.Analytics.EventNames
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
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
		-- upvalues: t (ref)
		local var1 = t[p1]
		
		return if var1 == nil then {} else { step = var1 }
	end,
	makeStepFieldFromState = function(p1)
		-- upvalues: t_1 (ref)
		local var1 = if p1 ~= nil then nil else t_1[p1]
		
		return if var1 == nil then {} else { step = var1 }
	end,
	makeToolField = function(p1)
		return if p1 == nil or p1.kind == nil then {} else { tool = p1.kind }
	end,
	makeToolFieldFromKind = function(p1)
		return if p1 == nil then {} else { tool = p1 }
	end,
	makeCreationBaseFields = function(p1)
		return if p1 == nil then {} else { creationSessionId = p1 }
	end,
	makeVoiceEventFields = function(p1)
		-- upvalues: sessionManager (ref), funnelEventNames (ref)
		local t_1, var1, var2
		local t = { tool = "voice" }
		local sessionId = sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)
		
		if sessionId == nil then
			t_1 = {}
			var1 = nil
			var2 = nil
		else
			t_1 = { creationSessionId = sessionId }
			var1 = nil
			var2 = nil
		end
		for i, v in t_1, var1, var2 do
			t[i] = v
		end
		if p1 ~= nil then
			for i_1, v_1 in p1 do
				t[i_1] = v_1
			end
		end
		return t
	end,
	makeCaptureDescriptorFields = function(p2)
		local t = {
			sourcePlaceId = tostring(p2.SourcePlaceId),
			localId = tostring(p2.LocalId)
		}
		local captureType = p2.CaptureType
		t.captureType = if typeof(captureType) == "EnumItem" then captureType.Name elseif captureType == nil then nil else tostring(captureType)
		t.universeId = tostring(p2.SourceUniverseId)
		
		return t
	end,
	makeGeneratedTextOutcomeFields = function(p2, p3, p4, p5)
		-- upvalues: getFFlagEnableMomentTextGeneration (ref)
		return if getFFlagEnableMomentTextGeneration() then {
			generatedDescriptionOutcome = if p2 == nil then "none" elseif p3 == p2 then "verbatim" elseif p3 == nil or p3 == "" then "discarded" else "edited",
			generatedSummaryOutcome = if p4 == nil then "none" elseif p5 == p4 then "verbatim" elseif p5 == nil or p5 == "" then "discarded" else "edited"
		} else {}
	end,
	classifyGeneratedTextOutcome = function(p2, p3)
		return if p2 == nil then "none" elseif p3 == p2 then "verbatim" elseif p3 == nil or p3 == "" then "discarded" else "edited"
	end,
	enumName = function(p2)
		return if typeof(p2) == "EnumItem" then p2.Name elseif p2 == nil then nil else tostring(p2)
	end
}