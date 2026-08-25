local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useState = reactModule.useState

return function(p0)
	-- upvalues: useState (ref), useEffect (ref), signalsModule (ref), useRef (ref)
	local controller = p0.controller
	local ttsAudio = controller.ttsAudio
	assert(ttsAudio ~= nil, "VoicePreviewLayer requires controller.ttsAudio")
	local var3, var4 = useState(controller.getActiveTool(false))
	local var5, var6 = useState(controller.getEffectiveTTS(false))
	local var7, var8 = useState(ttsAudio.getIsLoaded(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var4 (ref), controller (ref), var6 (ref), var8 (ref), ttsAudio (ref)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var4 (copy), controller (copy), var6 (copy), var8 (copy), ttsAudio (copy)
			var4(controller.getActiveTool(p1))
			var6(controller.getEffectiveTTS(p1))
			var8(ttsAudio.getIsLoaded(p1))
		end)
	end, { controller, ttsAudio })
	local var9 = useRef(false)
	local var10 = useRef(0)
	local var11 = var3 ~= nil and var3.kind == "voice"
	local var12 = not var11 and var5 ~= nil
	local var13 = if var5 ~= nil then "" else `{var5.text}:{var5.voiceId}`
	useEffect(function()
		-- upvalues: var12 (ref), var5 (ref), ttsAudio (ref)
		if var12 and var5 ~= nil then
			ttsAudio.generate(var5.text, var5.voiceId)
			
			return
		end
	end, { var12, var13 })
	useEffect(function()
		-- upvalues: var11 (ref), var9 (ref), ttsAudio (ref)
		if var11 and var9.current then
			ttsAudio.pause()
			var9.current = false
		end
	end, { var11 })
	local var14, var15 = useState(controller.preview.playback.getIsPlaying(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var15 (ref), controller (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var15 (copy), controller (copy)
			var15(controller.preview.playback.getIsPlaying(p2))
		end)
	end, { controller })
	useEffect(function()
		-- upvalues: var12 (ref), var5 (ref), ttsAudio (ref), var14 (ref), controller (ref), var9 (ref)
		if not var12 or var5 == nil then return end
		if not ttsAudio.getIsLoaded(false) then return end
		local timeLength = ttsAudio.getTimeLength(false)
		
		if timeLength <= 0 then return end
		local startTime = var5.startTime or 0
		local var18 = startTime + timeLength
		
		if var14 then
			local position = controller.preview.playback.getPosition(false)
			
			if startTime <= position and position < var18 then
				local var20 = position - startTime
				
				if math.abs(ttsAudio.getTimePosition(false) - var20) > 0.1 then
					ttsAudio.seek(var20)
				end
				ttsAudio.play()
				var9.current = true
			end
		elseif var9.current then
			ttsAudio.pause()
			var9.current = false
		end
		return function()
			-- upvalues: var9 (copy), ttsAudio (copy)
			if var9.current then
				ttsAudio.pause()
				var9.current = false
			end
		end
	end, { var12, var13, var14, var7 })
	useEffect(function()
		-- upvalues: var12 (ref), var5 (ref), signalsModule (copy), controller (ref), var10 (ref), ttsAudio (ref), var9 (ref)
		if var12 and var5 ~= nil then
			local startTime = var5.startTime or 0
			
			return signalsModule.createEffect(function(p3)
				-- upvalues: controller (copy), var10 (copy), ttsAudio (copy), startTime (ref), var9 (copy)
				local position = controller.preview.playback.getPosition(p3)
				local current = var10.current
				var10.current = position
				
				if current - position > 0.5 and ttsAudio.getIsLoaded(false) and controller.preview.playback.getIsPlaying(false) then
					if startTime <= position and position < startTime + ttsAudio.getTimeLength(false) then
						ttsAudio.seek(position - startTime)
						ttsAudio.play()
						var9.current = true
					end
				end
			end)
		end
	end, { var12, var13 })
	
	return nil
end