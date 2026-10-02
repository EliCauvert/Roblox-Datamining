local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local voiceCatalogModule = require(momentsCreation.Components.Voice.voiceCatalog)
local createTTSAudioManagerModule = require(momentsCreation.Audio.createTTSAudioManager)
local dialogTypeModule = require(momentsCreation.Enums.DialogType)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local eventNames = momentsCommonModule.Analytics.EventNames
local fStringMomentsTTSPreviewTextModule = require(momentsCreation.Flags.FStringMomentsTTSPreviewText)

local function _(p1)
	return p1:gsub("^%s*(.-)%s*$", "%1")
end

return function(p1)
	-- upvalues: createTTSAudioManagerModule (ref), reactModule (ref), useMemo (ref), signalsModule (ref), useEffect (ref), useCallback (ref), fireAnalyticsEventModule (ref), eventNames (ref), makeCreationEventFieldsModule (ref), fStringMomentsTTSPreviewTextModule (ref), dialogTypeModule (ref), voiceCatalogModule (ref)
	local controller = p1.controller
	local playback = controller.preview.playback
	local ttsAudio = controller.ttsAudio
	assert(ttsAudio ~= nil, "useVoiceSelector requires controller.ttsAudio")
	local setSelectedVoiceId = controller.setSelectedVoiceId
	local selectedVoiceId = p1.selectedVoiceId
	local text = p1.text
	local canGenerate = p1.canGenerate
	local onCreateVoiceover = p1.onCreateVoiceover
	local lastGeneratedTextRef = p1.lastGeneratedTextRef
	local createPreviewAudio = p1.createPreviewAudio or createTTSAudioManagerModule
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(false)
	local var4 = useMemo(function()
		-- upvalues: signalsModule (copy)
		local var5, var6 = signalsModule.createSignal(nil)
		
		return { get = var5, set = var6 }
	end, {})
	
	local function _()
		-- upvalues: var1 (ref), createPreviewAudio (ref), var2 (ref), signalsModule (copy), var3 (ref), var4 (ref)
		local current = var1.current
		
		if current == nil then
			local var5 = createPreviewAudio()
			var1.current = var5
			var2.current = signalsModule.createEffect(function(p2)
				-- upvalues: var5 (ref), var3 (copy), var4 (copy)
				local state = var5.getState(p2)
				
				if state == "ready" and var3.current then
					var3.current = false
					var5.seek(0)
					var5.play()
				end
				if state ~= "loading" then
					var4.set(nil)
				end
			end)
			
			return var5
		end
		return current
	end
	
	useEffect(function()
		-- upvalues: var2 (ref), var1 (ref)
		return function()
			-- upvalues: var2 (copy), var1 (copy)
			if var2.current ~= nil then
				var2.current()
				var2.current = nil
			end
			if var1.current ~= nil then
				var1.current.destroy()
				var1.current = nil
			end
		end
	end, {})
	local var5 = useCallback(function(p2)
		-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), text (ref), fStringMomentsTTSPreviewTextModule (copy), ttsAudio (ref), var1 (ref), createPreviewAudio (ref), var2 (ref), signalsModule (copy), var3 (ref), var4 (ref)
		fireAnalyticsEventModule(eventNames.EditingFlowVoicePreviewPlayed, makeCreationEventFieldsModule.makeVoiceEventFields({ voice_id = tostring(p2) }))
		local var6 = text:gsub("^%s*(.-)%s*$", "%1")
		
		if var6 == "" then
			var6 = fStringMomentsTTSPreviewTextModule
		end
		local var7
		ttsAudio.pause()
		local current = var1.current
		
		if current == nil then
			local var8 = createPreviewAudio()
			var1.current = var8
			var2.current = signalsModule.createEffect(function(p3)
				-- upvalues: var8 (ref), var3 (copy), var4 (copy)
				local state = var8.getState(p3)
				
				if state == "ready" and var3.current then
					var3.current = false
					var8.seek(0)
					var8.play()
				end
				if state ~= "loading" then
					var4.set(nil)
				end
			end)
			var7 = var8
		else
			var7 = current
		end
		if var7.getState(false) == "loading" or var7.getLoadedVoiceId(false) ~= p2 or var7.getLoadedText(false) ~= var6 then
			var3.current = true
			var4.set(p2)
			var7.generate(var6, p2)
			
			return
		end
		var7.seek(0)
		var7.play()
	end, { text })
	local var6 = useCallback(function()
		-- upvalues: var3 (ref), var1 (ref), var4 (ref)
		var3.current = false
		
		if var1.current ~= nil then
			var1.current.pause()
		end
		var4.set(nil)
	end, { var4 })
	local var7 = reactModule.useRef(false)
	local var8 = useCallback(function()
		-- upvalues: var6 (ref), controller (ref), var7 (ref), playback (ref)
		var6()
		controller.dismissModal()
		
		if var7.current then
			var7.current = false
			playback.play()
		end
	end, { controller, playback, var6 })
	local var9 = useCallback(function(p2)
		-- upvalues: selectedVoiceId (ref), setSelectedVoiceId (ref), fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), canGenerate (ref), text (ref), var6 (ref), controller (ref), var7 (ref), onCreateVoiceover (ref), lastGeneratedTextRef (ref), var8 (ref)
		local var10 = p2 ~= selectedVoiceId
		
		if var10 then
			setSelectedVoiceId(p2)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceSelected, makeCreationEventFieldsModule.makeVoiceEventFields({ voice_id = tostring(p2) }))
		end
		if canGenerate and text:gsub("^%s*(.-)%s*$", "%1") ~= "" then
			var6()
			controller.dismissModal()
			local current = var7.current
			var7.current = false
			onCreateVoiceover(p2, current)
			
			return
		elseif var10 and lastGeneratedTextRef.current ~= "" then
			var6()
			controller.dismissModal()
			var7.current = false
			onCreateVoiceover(p2, false, lastGeneratedTextRef.current, true)
			
			return
		end
		var8()
	end, {
		controller, canGenerate, selectedVoiceId, var8, onCreateVoiceover, var6, text
	})
	
	return {
		onOpenVoiceSelector = useCallback(function()
			-- upvalues: fireAnalyticsEventModule (copy), eventNames (copy), makeCreationEventFieldsModule (copy), playback (ref), var7 (ref), controller (ref), dialogTypeModule (copy), voiceCatalogModule (copy), selectedVoiceId (ref), var9 (ref), var8 (ref), var5 (ref), var4 (ref)
			fireAnalyticsEventModule(eventNames.EditingFlowVoiceSelectorOpened, makeCreationEventFieldsModule.makeVoiceEventFields())
			
			if playback.getIsPlaying(false) then
				var7.current = true
				playback.pause()
			else
				var7.current = false
			end
			controller.showModal({
				modalType = dialogTypeModule.VoiceSelector,
				modalProps = {
					voices = voiceCatalogModule.getOrderedVoices(),
					selectedVoiceId = selectedVoiceId,
					onSelect = var9,
					onClose = var8,
					onAudition = var5,
					getAuditioningVoiceId = var4.get
				}
			})
		end, {
			controller, playback, selectedVoiceId, var9, var5, var8
		})
	}
end