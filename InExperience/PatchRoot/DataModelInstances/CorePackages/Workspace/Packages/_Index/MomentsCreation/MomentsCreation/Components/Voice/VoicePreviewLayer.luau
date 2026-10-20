local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local GetFFlagMomentsTTSStartTimePositioningModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSStartTimePositioning)
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState

return function(p1)
	-- upvalues: UseStateFunction (copy), UseEffectFunction (copy), SignalsModule (copy), UseRefFunction (copy), GetFFlagMomentsTTSStartTimePositioningModule (copy)
	local Controller = p1.controller
	local TtsAudio = Controller.ttsAudio
	assert(TtsAudio ~= nil, "VoicePreviewLayer requires controller.ttsAudio")
	local UseStateResult, UseStateResult2 = UseStateFunction(Controller.getActiveTool(false))
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(Controller.getEffectiveTTS(false))
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(TtsAudio.getIsLoaded(false))
	UseEffectFunction(function()
		-- upvalues: SignalsModule (upval), UseStateResult2 (copy), Controller (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), TtsAudio (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseStateResult2 (upval), Controller (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), TtsAudio (upval)
			UseStateResult2(Controller.getActiveTool(p2))
			UseStateResult2_1(Controller.getEffectiveTTS(p2))
			UseStateResult2_2(TtsAudio.getIsLoaded(p2))
		end)
	end, { Controller, TtsAudio })
	local UseRefResult = UseRefFunction(false)
	local UseRefResult1 = UseRefFunction(0)
	local IsVoice: boolean = UseStateResult ~= nil and UseStateResult.kind == "voice"
	local HasUseStateResult: boolean = not IsVoice and UseStateResult1 ~= nil
	local Text: string = if UseStateResult1 == nil then "" else `{UseStateResult1.text}:{UseStateResult1.voiceId}`
	local StartTime = if UseStateResult1 == nil then 0 else UseStateResult1.startTime or 0
	UseEffectFunction(function()
		-- upvalues: HasUseStateResult (copy), UseStateResult1 (copy), TtsAudio (copy)
		if HasUseStateResult and UseStateResult1 ~= nil then
			TtsAudio.generate(UseStateResult1.text, UseStateResult1.voiceId)
			
			return
		end
	end, { HasUseStateResult, Text })
	UseEffectFunction(function()
		-- upvalues: IsVoice (copy), UseRefResult (copy), TtsAudio (copy)
		if IsVoice and UseRefResult.current then
			TtsAudio.pause()
			UseRefResult.current = false
		end
	end, { IsVoice })
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(Controller.preview.playback.getIsPlaying(false))
	UseEffectFunction(function()
		-- upvalues: SignalsModule (upval), UseStateResult2_3 (copy), Controller (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseStateResult2_3 (upval), Controller (upval)
			UseStateResult2_3(Controller.preview.playback.getIsPlaying(p2))
		end)
	end, { Controller })
	UseEffectFunction(function()
		-- upvalues: HasUseStateResult (copy), UseStateResult1 (copy), TtsAudio (copy), Controller (copy), UseStateResult4 (copy), UseRefResult (copy), GetFFlagMomentsTTSStartTimePositioningModule (upval)
		if not HasUseStateResult or UseStateResult1 == nil then return end
		if not TtsAudio.getIsLoaded(false) then return end
		local TimeLength: number = TtsAudio.getTimeLength(false)
		
		if TimeLength <= 0 then return end
		local StartTime = UseStateResult1.startTime or 0
		local NewStartTime = StartTime + TimeLength
		local Position: number = Controller.preview.playback.getPosition(false)
		
		if UseStateResult4 and StartTime <= Position and Position < NewStartTime then
			local PositionDelta = Position - StartTime
			
			if math.abs(TtsAudio.getTimePosition(false) - PositionDelta) > 0.1 then
				TtsAudio.seek(PositionDelta)
			end
			TtsAudio.play()
			UseRefResult.current = true
		elseif (not UseStateResult4 or GetFFlagMomentsTTSStartTimePositioningModule) and UseRefResult.current then
			TtsAudio.pause()
			UseRefResult.current = false
		end
		return function()
			-- upvalues: UseRefResult (upval), TtsAudio (upval)
			if UseRefResult.current then
				TtsAudio.pause()
				UseRefResult.current = false
			end
		end
	end, {
		HasUseStateResult,
		Text,
		StartTime,
		UseStateResult4,
		UseStateResult3
	})
	UseEffectFunction(function()
		-- upvalues: HasUseStateResult (copy), UseStateResult1 (copy), SignalsModule (upval), Controller (copy), UseRefResult1 (copy), TtsAudio (copy), UseRefResult (copy), GetFFlagMomentsTTSStartTimePositioningModule (upval)
		if not HasUseStateResult or UseStateResult1 == nil then return end
		local StartTime = UseStateResult1.startTime or 0
		
		return SignalsModule.createEffect(function(p2)
			-- upvalues: Controller (upval), UseRefResult1 (upval), TtsAudio (upval), StartTime (copy), UseRefResult (upval), GetFFlagMomentsTTSStartTimePositioningModule (upval)
			local Position: number = Controller.preview.playback.getPosition(p2)
			local Current: number = UseRefResult1.current
			UseRefResult1.current = Position
			
			if not TtsAudio.getIsLoaded(false) or not Controller.preview.playback.getIsPlaying(false) then return end
			local TimeLength: number = TtsAudio.getTimeLength(false)
			
			if TimeLength <= 0 then return end
			local IsPositionBelow: boolean = StartTime <= Position and Position < StartTime + TimeLength
			
			if Current - Position > 0.5 then
				if IsPositionBelow then
					TtsAudio.seek(Position - StartTime)
					TtsAudio.play()
					UseRefResult.current = true
					
					return
				end
				if GetFFlagMomentsTTSStartTimePositioningModule then
					TtsAudio.pause()
					UseRefResult.current = false
					
					return
				end
			elseif GetFFlagMomentsTTSStartTimePositioningModule and Current < StartTime and IsPositionBelow then
				TtsAudio.seek(Position - StartTime)
				TtsAudio.play()
				UseRefResult.current = true
			end
		end)
	end, { HasUseStateResult, Text, StartTime })
	
	return nil
end