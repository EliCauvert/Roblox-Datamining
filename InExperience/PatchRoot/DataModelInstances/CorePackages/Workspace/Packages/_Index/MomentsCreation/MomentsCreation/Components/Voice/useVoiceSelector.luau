local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local VoiceCatalogModule = require(MomentsCreation.Components.Voice.voiceCatalog)
local CreateTTSAudioManagerModule = require(MomentsCreation.Audio.createTTSAudioManager)
local DialogTypeModule = require(MomentsCreation.Enums.DialogType)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local EventNames = require(Parent.MomentsCommon).Analytics.EventNames
local FStringMomentsTTSPreviewTextModule = require(MomentsCreation.Flags.FStringMomentsTTSPreviewText)

local function _(Text: string): string
	return (Text:gsub("^%s*(.-)%s*$", "%1"))
end

return function(p1)
	-- upvalues: CreateTTSAudioManagerModule (copy), ReactModule (copy), UseMemoFunction (copy), SignalsModule (copy), UseEffectFunction (copy), UseCallbackFunction (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy), FStringMomentsTTSPreviewTextModule (copy), DialogTypeModule (copy), VoiceCatalogModule (copy)
	local Controller = p1.controller
	local Playback = Controller.preview.playback
	local TtsAudio = Controller.ttsAudio
	assert(TtsAudio ~= nil, "useVoiceSelector requires controller.ttsAudio")
	local SetSelectedVoiceIdFunction = Controller.setSelectedVoiceId
	local SelectedVoiceId = p1.selectedVoiceId
	local Text = p1.text
	local CanGenerate = p1.canGenerate
	local OnCreateVoiceoverFunction = p1.onCreateVoiceover
	local LastGeneratedTextRef = p1.lastGeneratedTextRef
	local CreatePreviewAudio = p1.createPreviewAudio or function()
		-- upvalues: CreateTTSAudioManagerModule (upval), Controller (copy)
		return CreateTTSAudioManagerModule(nil, Controller.ttsAudioParent)
	end
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		
		return { get = Signal, set = Signal2 }
	end, {})
	
	local function _()
		-- upvalues: UseRefResult (copy), CreatePreviewAudio (copy), UseRefResult1 (copy), SignalsModule (upval), UseRefResult2 (copy), UseMemoResult (copy)
		local Current = UseRefResult.current
		
		if Current == nil then
			local PreviewAudio = CreatePreviewAudio()
			UseRefResult.current = PreviewAudio
			UseRefResult1.current = SignalsModule.createEffect(function(p2)
				-- upvalues: PreviewAudio (copy), UseRefResult2 (upval), UseMemoResult (upval)
				local State = PreviewAudio.getState(p2)
				
				if State == "ready" and UseRefResult2.current then
					UseRefResult2.current = false
					PreviewAudio.seek(0)
					PreviewAudio.play()
				end
				if State ~= "loading" then
					UseMemoResult.set(nil)
				end
			end)
			
			return PreviewAudio
		else
			return Current
		end
	end
	
	UseEffectFunction(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult1 (upval), UseRefResult (upval)
			if UseRefResult1.current ~= nil then
				UseRefResult1.current()
				UseRefResult1.current = nil
			end
			if UseRefResult.current ~= nil then
				UseRefResult.current.destroy()
				UseRefResult.current = nil
			end
		end
	end, {})
	local UseCallbackResult = UseCallbackFunction(function(LoadedVoiceId)
		-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), Text (copy), FStringMomentsTTSPreviewTextModule (upval), TtsAudio (copy), UseRefResult (copy), CreatePreviewAudio (copy), UseRefResult1 (copy), SignalsModule (upval), UseRefResult2 (copy), UseMemoResult (copy)
		FireAnalyticsEventModule(EventNames.EditingFlowVoicePreviewPlayed, MakeCreationEventFieldsModule.makeVoiceEventFields({ voice_id = tostring(LoadedVoiceId) }))
		local SS = Text:gsub("^%s*(.-)%s*$", "%1")
		
		if SS == "" then
			SS = FStringMomentsTTSPreviewTextModule
		end
		TtsAudio.pause()
		local Current = UseRefResult.current
		local Current1 = nil
		
		if Current == nil then
			local PreviewAudio = CreatePreviewAudio()
			UseRefResult.current = PreviewAudio
			UseRefResult1.current = SignalsModule.createEffect(function(p2)
				-- upvalues: PreviewAudio (copy), UseRefResult2 (upval), UseMemoResult (upval)
				local State = PreviewAudio.getState(p2)
				
				if State == "ready" and UseRefResult2.current then
					UseRefResult2.current = false
					PreviewAudio.seek(0)
					PreviewAudio.play()
				end
				if State ~= "loading" then
					UseMemoResult.set(nil)
				end
			end)
			Current1 = PreviewAudio
		else
			Current1 = Current
		end
		if Current1.getState(false) == "loading" or Current1.getLoadedVoiceId(false) ~= LoadedVoiceId or Current1.getLoadedText(false) ~= SS then
			UseRefResult2.current = true
			UseMemoResult.set(LoadedVoiceId)
			Current1.generate(SS, LoadedVoiceId)
			
			return
		else
			Current1.seek(0)
			Current1.play()
		end
	end, { Text })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult (copy), UseMemoResult (copy)
		UseRefResult2.current = false
		
		if UseRefResult.current ~= nil then
			UseRefResult.current.pause()
		end
		UseMemoResult.set(nil)
	end, { UseMemoResult })
	local UseRefResult3 = ReactModule.useRef(false)
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: UseCallbackResult1 (copy), Controller (copy), UseRefResult3 (copy), Playback (copy)
		UseCallbackResult1()
		Controller.dismissModal()
		
		if UseRefResult3.current then
			UseRefResult3.current = false
			Playback.play()
		end
	end, { Controller, Playback, UseCallbackResult1 })
	local UseCallbackResult3 = UseCallbackFunction(function(SelectedVoiceId1)
		-- upvalues: SelectedVoiceId (copy), SetSelectedVoiceIdFunction (copy), FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), CanGenerate (copy), Text (copy), UseCallbackResult1 (copy), Controller (copy), UseRefResult3 (copy), OnCreateVoiceoverFunction (copy), LastGeneratedTextRef (copy), UseCallbackResult2 (copy)
		local IsNotSelectedVoiceIdMatch = SelectedVoiceId1 ~= SelectedVoiceId
		
		if IsNotSelectedVoiceIdMatch then
			SetSelectedVoiceIdFunction(SelectedVoiceId1)
			FireAnalyticsEventModule(EventNames.EditingFlowVoiceSelected, MakeCreationEventFieldsModule.makeVoiceEventFields({ voice_id = tostring(SelectedVoiceId1) }))
		end
		if CanGenerate and Text:gsub("^%s*(.-)%s*$", "%1") ~= "" then
			UseCallbackResult1()
			Controller.dismissModal()
			UseRefResult3.current = false
			OnCreateVoiceoverFunction(SelectedVoiceId1, UseRefResult3.current)
			
			return
		end
		if IsNotSelectedVoiceIdMatch and LastGeneratedTextRef.current ~= "" then
			UseCallbackResult1()
			Controller.dismissModal()
			UseRefResult3.current = false
			OnCreateVoiceoverFunction(SelectedVoiceId1, false, LastGeneratedTextRef.current, true)
			
			return
		else
			UseCallbackResult2()
		end
	end, {
		Controller, CanGenerate, SelectedVoiceId, UseCallbackResult2,
		OnCreateVoiceoverFunction, UseCallbackResult1, Text
	})
	
	return {
		onOpenVoiceSelector = UseCallbackFunction(function()
			-- upvalues: FireAnalyticsEventModule (upval), EventNames (upval), MakeCreationEventFieldsModule (upval), Playback (copy), UseRefResult3 (copy), Controller (copy), DialogTypeModule (upval), VoiceCatalogModule (upval), SelectedVoiceId (copy), UseCallbackResult3 (copy), UseCallbackResult2 (copy), UseCallbackResult (copy), UseMemoResult (copy)
			FireAnalyticsEventModule(EventNames.EditingFlowVoiceSelectorOpened, MakeCreationEventFieldsModule.makeVoiceEventFields())
			
			if Playback.getIsPlaying(false) then
				UseRefResult3.current = true
				Playback.pause()
			else
				UseRefResult3.current = false
			end
			Controller.showModal({
				modalType = DialogTypeModule.VoiceSelector,
				modalProps = {
					voices = VoiceCatalogModule.getOrderedVoices(),
					selectedVoiceId = SelectedVoiceId,
					onSelect = UseCallbackResult3,
					onClose = UseCallbackResult2,
					onAudition = UseCallbackResult,
					getAuditioningVoiceId = UseMemoResult.get
				}
			})
		end, {
			Controller, Playback, SelectedVoiceId, UseCallbackResult3, UseCallbackResult,
			UseCallbackResult2
		})
	}
end