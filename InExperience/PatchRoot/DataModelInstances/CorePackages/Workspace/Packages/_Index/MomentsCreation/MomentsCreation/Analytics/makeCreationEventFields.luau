local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local EventNames = MomentsCommonModule.Analytics.EventNames
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local GetFFlagEnableMomentTextGenerationFunction = MomentsCommonModule.Flags.GetFFlagEnableMomentTextGeneration
local CreationFlowSteps = FunnelEventNames.CreationFlowSteps
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
	makeStepField = function(p1) --[[ Line: 82 ]]
		-- upvalues: config (copy)
		local Entry = config[p1]
		
		return if Entry == nil then {} else { step = Entry }
	end,
	makeStepFieldFromState = function(p1) --[[ Line: 92 ]]
		-- upvalues: config1 (copy)
		local Entry = if p1 == nil then nil else config1[p1]
		
		return if Entry == nil then {} else { step = Entry }
	end,
	makeToolField = function(p1) --[[ Line: 101 ]]
		return if p1 == nil or p1.kind == nil then {} else { tool = p1.kind }
	end,
	makeToolFieldFromKind = function(Tool) --[[ Line: 110 ]]
		return if Tool == nil then {} else { tool = Tool }
	end,
	makeCreationBaseFields = function(CreationSessionId) --[[ Line: 124 ]]
		return if CreationSessionId == nil then {} else { creationSessionId = CreationSessionId }
	end,
	makeVoiceEventFields = function(List) --[[ Line: 134 ]]
		-- upvalues: SessionManager (copy), FunnelEventNames (copy)
		local config = { tool = "voice" }
		local SessionId = SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow)
		local v1 = nil
		local t = nil
		local v2 = nil
		
		if SessionId == nil then
			t = {}
			v1 = nil
			v2 = nil
		else
			t = { creationSessionId = SessionId }
			v1 = nil
			v2 = nil
		end
		for i, value in t, v1, v2 do
			config[i] = value
		end
		if List ~= nil then
			for i1, value1 in List do
				config[i1] = value1
			end
		end
		return config
	end,
	makeTextOverlayEventFields = function(List) --[[ Line: 151 ]]
		-- upvalues: SessionManager (copy), FunnelEventNames (copy)
		local config = { tool = "text" }
		local SessionId = SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow)
		local v3 = nil
		local t = nil
		local v4 = nil
		
		if SessionId == nil then
			t = {}
			v3 = nil
			v4 = nil
		else
			t = { creationSessionId = SessionId }
			v3 = nil
			v4 = nil
		end
		for i, value in t, v3, v4 do
			config[i] = value
		end
		if List ~= nil then
			for i1, value1 in List do
				config[i1] = value1
			end
		end
		return config
	end,
	makeTextOverlayPublishSummaryFields = function(p1) --[[ Line: 174 ]]
		if p1 == nil then
			return {}
		end
		local t = {}
		local TextOverlayStyle = p1.textOverlayStyle
		
		if TextOverlayStyle ~= nil then
			if TextOverlayStyle.font ~= nil then
				t.font = TextOverlayStyle.font.Name
			end
			if TextOverlayStyle.fontSize ~= nil then
				t.fontSize = tostring(TextOverlayStyle.fontSize)
			end
			if TextOverlayStyle.fontColor ~= nil then
				t.color = "#" .. TextOverlayStyle.fontColor:ToHex()
			end
			if TextOverlayStyle.textXAlignment ~= nil then
				t.alignment = TextOverlayStyle.textXAlignment.Name
			end
		end
		if p1.rotation ~= nil then
			t.rotation = tostring(p1.rotation)
		end
		if typeof(p1.position) == "UDim2" then
			t.positionX = tostring(p1.position.X.Scale)
			t.positionY = tostring(p1.position.Y.Scale)
		end
		if p1.scale ~= nil then
			t.scale = tostring(p1.scale)
		end
		return if next(t) == nil then {} else t
	end,
	makeVoicePublishSummaryFields = function(p1, p2: number, p3: number) --[[ Line: 213 ]]
		if p1 == nil then
			return {}
		end
		local t = {}
		
		if p1.voiceId ~= nil then
			t.ttsVoiceId = tostring(p1.voiceId)
		end
		if p1.text ~= nil then
			t.ttsCharCount = tostring(utf8.len(p1.text) or #p1.text)
		end
		if p3 ~= nil and p3 > 0 then
			t.ttsDuration = tostring(p3)
		end
		local StartTime = p1.startTime or 0
		t.ttsStartTimeSeconds = tostring(StartTime)
		
		if p2 ~= nil then
			t.ttsVideoDurationSeconds = tostring(p2)
			t.ttsStartTimeFraction = tostring(if p2 > 0 then StartTime / p2 else 0)
		end
		return t
	end,
	makeCaptureDescriptorFields = function(Capture) --[[ Line: 263 ]]
		local CaptureType = Capture.CaptureType
		
		return {
			sourcePlaceId = tostring(Capture.SourcePlaceId),
			localId = tostring(Capture.LocalId),
			captureType = if typeof(CaptureType) == "EnumItem" then CaptureType.Name elseif CaptureType == nil then nil else tostring(CaptureType),
			universeId = tostring(Capture.SourceUniverseId)
		}
	end,
	makeGeneratedTextOutcomeFields = function(p1, p2, p3, p4) --[[ Line: 293 ]]
		-- upvalues: GetFFlagEnableMomentTextGenerationFunction (copy)
		return if GetFFlagEnableMomentTextGenerationFunction() then {
			generatedDescriptionOutcome = if p1 == nil then "none" elseif p2 == p1 then "verbatim" elseif p2 == nil or p2 == "" then "discarded" else "edited",
			generatedSummaryOutcome = if p3 == nil then "none" elseif p4 == p3 then "verbatim" elseif p4 == nil or p4 == "" then "discarded" else "edited"
		} else {}
	end,
	classifyGeneratedTextOutcome = function(p1, p2): string --[[ Line: 276 ]]
		return if p1 == nil then "none" elseif p2 == p1 then "verbatim" elseif p2 == nil or p2 == "" then "discarded" else "edited"
	end,
	enumName = function(p1) --[[ Line: 245 ]]
		return if typeof(p1) == "EnumItem" then p1.Name elseif p1 == nil then nil else tostring(p1)
	end
}