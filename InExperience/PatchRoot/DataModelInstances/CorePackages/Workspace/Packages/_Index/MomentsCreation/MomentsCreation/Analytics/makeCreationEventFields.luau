local parent = script:FindFirstAncestor("MomentsCreation").Parent
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
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
	makeTextOverlayEventFields = function(p2)
		-- upvalues: sessionManager (ref), funnelEventNames (ref)
		local t_1, var3, var4
		local t = { tool = "text" }
		local sessionId = sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)
		
		if sessionId == nil then
			t_1 = {}
			var3 = nil
			var4 = nil
		else
			t_1 = { creationSessionId = sessionId }
			var3 = nil
			var4 = nil
		end
		for i, v in t_1, var3, var4 do
			t[i] = v
		end
		if p2 ~= nil then
			for i_1, v_1 in p2 do
				t[i_1] = v_1
			end
		end
		return t
	end,
	makeTextOverlayPublishSummaryFields = function(p3)
		if p3 == nil then
			return {}
		end
		local t = {}
		local textOverlayStyle = p3.textOverlayStyle
		
		if textOverlayStyle ~= nil then
			if textOverlayStyle.font ~= nil then
				t.font = textOverlayStyle.font.Name
			end
			if textOverlayStyle.fontSize ~= nil then
				t.fontSize = tostring(textOverlayStyle.fontSize)
			end
			if textOverlayStyle.fontColor ~= nil then
				t.color = "#" .. textOverlayStyle.fontColor:ToHex()
			end
			if textOverlayStyle.textXAlignment ~= nil then
				t.alignment = textOverlayStyle.textXAlignment.Name
			end
		end
		if p3.rotation ~= nil then
			t.rotation = tostring(p3.rotation)
		end
		if typeof(p3.position) == "UDim2" then
			t.positionX = tostring(p3.position.X.Scale)
			t.positionY = tostring(p3.position.Y.Scale)
		end
		if p3.scale ~= nil then
			t.scale = tostring(p3.scale)
		end
		return if next(t) == nil then {} else t
	end,
	makeVoicePublishSummaryFields = function(p3, p4, p5)
		if p3 == nil then
			return {}
		end
		local t = {}
		
		if p3.voiceId ~= nil then
			t.ttsVoiceId = tostring(p3.voiceId)
		end
		if p3.text ~= nil then
			t.ttsCharCount = tostring(utf8.len(p3.text) or #p3.text)
		end
		if p5 ~= nil and p5 > 0 then
			t.ttsDuration = tostring(p5)
		end
		local startTime = p3.startTime or 0
		t.ttsStartTimeSeconds = tostring(startTime)
		
		if p4 ~= nil then
			t.ttsVideoDurationSeconds = tostring(p4)
			t.ttsStartTimeFraction = tostring(if p4 > 0 then startTime / p4 else 0)
		end
		return t
	end,
	makeCaptureDescriptorFields = function(p3)
		local t = {
			sourcePlaceId = tostring(p3.SourcePlaceId),
			localId = tostring(p3.LocalId)
		}
		local captureType = p3.CaptureType
		t.captureType = if typeof(captureType) == "EnumItem" then captureType.Name elseif captureType == nil then nil else tostring(captureType)
		t.universeId = tostring(p3.SourceUniverseId)
		
		return t
	end,
	makeGeneratedTextOutcomeFields = function(p3, p4, p5, p6)
		-- upvalues: getFFlagEnableMomentTextGeneration (ref)
		return if getFFlagEnableMomentTextGeneration() then {
			generatedDescriptionOutcome = if p3 == nil then "none" elseif p4 == p3 then "verbatim" elseif p4 == nil or p4 == "" then "discarded" else "edited",
			generatedSummaryOutcome = if p5 == nil then "none" elseif p6 == p5 then "verbatim" elseif p6 == nil or p6 == "" then "discarded" else "edited"
		} else {}
	end,
	classifyGeneratedTextOutcome = function(p3, p4)
		return if p3 == nil then "none" elseif p4 == p3 then "verbatim" elseif p4 == nil or p4 == "" then "discarded" else "edited"
	end,
	enumName = function(p3)
		return if typeof(p3) == "EnumItem" then p3.Name elseif p3 == nil then nil else tostring(p3)
	end
}