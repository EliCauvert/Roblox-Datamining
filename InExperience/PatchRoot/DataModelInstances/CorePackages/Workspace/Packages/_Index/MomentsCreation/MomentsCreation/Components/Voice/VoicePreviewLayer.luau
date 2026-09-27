local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local getFFlagMomentsTTSStartTimePositioningModule = require(momentsCreation.Flags.GetFFlagMomentsTTSStartTimePositioning)
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useState = reactModule.useState

return function(p1)
	-- upvalues: useState (ref), useEffect (ref), signalsModule (ref), useRef (ref), getFFlagMomentsTTSStartTimePositioningModule (ref)
	local controller = p1.controller
	local ttsAudio = controller.ttsAudio
	assert(ttsAudio ~= nil, "VoicePreviewLayer requires controller.ttsAudio")
	local var1, var2 = useState(controller.getActiveTool(false))
	local var3, var4 = useState(controller.getEffectiveTTS(false))
	local var5, var6 = useState(ttsAudio.getIsLoaded(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var2 (ref), controller (ref), var4 (ref), var6 (ref), ttsAudio (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var2 (copy), controller (copy), var4 (copy), var6 (copy), ttsAudio (copy)
			var2(controller.getActiveTool(p2))
			var4(controller.getEffectiveTTS(p2))
			var6(ttsAudio.getIsLoaded(p2))
		end)
	end, { controller, ttsAudio })
	local var7 = useRef(false)
	local var8 = useRef(0)
	local var9 = var1 ~= nil and var1.kind == "voice"
	local var10 = not var9 and var3 ~= nil
	local var11 = if var3 ~= nil then "" else `{var3.text}:{var3.voiceId}`
	local var12 = var3 == nil and ((if var3 == nil then var3.startTime else nil) or 0)
	useEffect(function()
		-- upvalues: var10 (ref), var3 (ref), ttsAudio (ref)
		if var10 and var3 ~= nil then
			ttsAudio.generate(var3.text, var3.voiceId)
			
			return
		end
	end, { var10, var11 })
	useEffect(function()
		-- upvalues: var9 (ref), var7 (ref), ttsAudio (ref)
		if var9 and var7.current then
			ttsAudio.pause()
			var7.current = false
		end
	end, { var9 })
	local var13, var14 = useState(controller.preview.playback.getIsPlaying(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var14 (ref), controller (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var14 (copy), controller (copy)
			var14(controller.preview.playback.getIsPlaying(p2))
		end)
	end, { controller })
	useEffect(function()
		-- upvalues: var10 (ref), var3 (ref), ttsAudio (ref), controller (ref), var13 (ref), var7 (ref), getFFlagMomentsTTSStartTimePositioningModule (copy)
		if not var10 or var3 == nil then return end
		if not ttsAudio.getIsLoaded(false) then return end
		local timeLength = ttsAudio.getTimeLength(false)
		
		if timeLength <= 0 then return end
		local startTime = var3.startTime or 0
		local position = controller.preview.playback.getPosition(false)
		
		if var13 and startTime <= position and position < startTime + timeLength then
			local var15 = position - startTime
			
			if math.abs(ttsAudio.getTimePosition(false) - var15) > 0.1 then
				ttsAudio.seek(var15)
			end
			ttsAudio.play()
			var7.current = true
		elseif (not var13 or getFFlagMomentsTTSStartTimePositioningModule) and var7.current then
			ttsAudio.pause()
			var7.current = false
		end
		return function()
			-- upvalues: var7 (copy), ttsAudio (copy)
			if var7.current then
				ttsAudio.pause()
				var7.current = false
			end
		end
	end, {
		var10,
		var11,
		var12,
		var13,
		var5
	})
	useEffect(function()
		-- upvalues: var10 (ref), var3 (ref), signalsModule (copy), controller (ref), var8 (ref), ttsAudio (ref), var7 (ref), getFFlagMomentsTTSStartTimePositioningModule (copy)
		if var10 and var3 ~= nil then
			local startTime = var3.startTime or 0
			
			return signalsModule.createEffect(function(p2)
				-- upvalues: controller (copy), var8 (copy), ttsAudio (copy), startTime (ref), var7 (copy), getFFlagMomentsTTSStartTimePositioningModule (copy)
				local position = controller.preview.playback.getPosition(p2)
				local current = var8.current
				var8.current = position
				
				if not ttsAudio.getIsLoaded(false) or not controller.preview.playback.getIsPlaying(false) then return end
				local timeLength = ttsAudio.getTimeLength(false)
				
				if timeLength <= 0 then return end
				local var15 = startTime <= position and position < startTime + timeLength
				
				if current - position > 0.5 then
					if var15 then
						ttsAudio.seek(position - startTime)
						ttsAudio.play()
						var7.current = true
						
						return
					elseif getFFlagMomentsTTSStartTimePositioningModule then
						ttsAudio.pause()
						var7.current = false
						
						return
					end
				elseif getFFlagMomentsTTSStartTimePositioningModule and current < startTime and var15 then
					ttsAudio.seek(position - startTime)
					ttsAudio.play()
					var7.current = true
				end
			end)
		end
	end, { var10, var11, var12 })
	
	return nil
end