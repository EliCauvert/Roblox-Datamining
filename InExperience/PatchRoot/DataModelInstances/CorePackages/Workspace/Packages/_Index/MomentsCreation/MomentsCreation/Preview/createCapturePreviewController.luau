local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local CreateSignalFunction = require(MomentsCreation.Parent.Signals).createSignal

return function(p1, Callback, Callback1) --[[ Line: 63 | Named "createCapturePreviewController" ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(0)
	local Signal1, Signal2_1 = CreateSignalFunction(0)
	local Signal3, Signal2_2 = CreateSignalFunction(0)
	local Signal4, Signal2_3 = CreateSignalFunction(true)
	local Signal5, Signal2_4 = CreateSignalFunction(false)
	local Loading, Loading2 = CreateSignalFunction("Loading")
	local Signal6, Signal2_5 = CreateSignalFunction(nil)
	local v1 = nil
	
	local function play() --[[ Line: 168 ]]
		-- upvalues: Signal6 (copy), Signal4 (copy), Signal2_3 (copy), v1 (ref)
		local SignalResult = Signal6(false)
		
		if SignalResult == nil then
			if Signal4(false) then return end
			Signal2_3(true)
			
			if v1 ~= nil then
				v1.play()
			end
			return
		elseif not SignalResult.getState(false).isPlaying then
			SignalResult.play()
		end
	end
	
	return {
		getCapture = p1.getSelectedCapture,
		getReadiness = function(p2) --[[ Line: 160 ]]
			-- upvalues: Signal6 (copy), Loading (copy)
			local SignalResult = Signal6(p2)
			
			return if SignalResult == nil then Loading(p2) else SignalResult.getState(p2).readiness
		end,
		playback = {
			getPosition = function(p2) --[[ Line: 131 ]]
				-- upvalues: Signal6 (copy), Callback (copy), Signal (copy)
				local SignalResult = Signal6(p2)
				
				if SignalResult == nil then
					local CallbackResult = if Callback == nil then nil else Callback(p2)
					
					return if CallbackResult == nil then Signal(p2) else math.clamp(Signal(p2) - CallbackResult.startTime, 0, (math.max(0, CallbackResult.endTime - CallbackResult.startTime)))
				else
					return SignalResult.getPosition(p2)
				end
			end,
			getDuration = function(p2) --[[ Line: 108 ]]
				-- upvalues: Signal6 (copy), Callback (copy), Signal1 (copy)
				local SignalResult = Signal6(p2)
				
				if SignalResult == nil then
					local CallbackResult = if Callback == nil then nil else Callback(p2)
					
					return if CallbackResult == nil then Signal1(p2) else math.max(0, CallbackResult.endTime - CallbackResult.startTime)
				else
					return SignalResult.getState(p2).duration
				end
			end,
			getTimeLength = function(p2) --[[ Line: 121 ]]
				-- upvalues: Signal6 (copy), Signal3 (copy)
				local SignalResult = Signal6(p2)
				
				return if SignalResult == nil then Signal3(p2) else SignalResult.getState(p2).timeLength
			end,
			getRegion = function(p2) --[[ Line: 97 ]]
				-- upvalues: Callback (copy)
				return if Callback == nil then nil else Callback(p2)
			end,
			getMusic = function(p2) --[[ Line: 102 ]]
				-- upvalues: Callback1 (copy)
				return if Callback1 == nil then nil else Callback1(p2)
			end,
			getIsPlaying = function(p2) --[[ Line: 144 ]]
				-- upvalues: Signal6 (copy), Signal4 (copy)
				local SignalResult = Signal6(p2)
				
				return if SignalResult == nil then Signal4(p2) else SignalResult.getState(p2).isPlaying
			end,
			getIsMuted = function(p2) --[[ Line: 152 ]]
				-- upvalues: Signal6 (copy), Signal5 (copy)
				local SignalResult = Signal6(p2)
				
				return if SignalResult == nil then Signal5(p2) else SignalResult.getState(p2).isMuted
			end,
			play = play,
			pause = function() --[[ Line: 187 ]]
				-- upvalues: Signal6 (copy), Signal4 (copy), Signal2_3 (copy), v1 (ref)
				local SignalResult = Signal6(false)
				
				if SignalResult ~= nil then
					SignalResult.pause()
					
					return
				end
				if not Signal4(false) then return end
				Signal2_3(false)
				
				if v1 ~= nil then
					v1.pause()
				end
			end,
			toggle = function() --[[ Line: 202 ]]
				-- upvalues: Signal6 (copy), Signal4 (copy), Signal2_3 (copy), v1 (ref), play (copy)
				local SignalResult = Signal6(false)
				
				if SignalResult ~= nil then
					SignalResult.toggle()
					
					return
				end
				if Signal4(false) then
					local SignalResult1 = Signal6(false)
					
					if SignalResult1 ~= nil then
						SignalResult1.pause()
						
						return
					end
					if not Signal4(false) then return end
					Signal2_3(false)
					
					if v1 ~= nil then
						v1.pause()
						
						return
					end
				else
					play()
				end
			end,
			seek = function(p2) --[[ Line: 231 ]]
				-- upvalues: Signal6 (copy), Callback (copy), Signal2 (copy), v1 (ref)
				local SignalResult = Signal6(false)
				
				if SignalResult ~= nil then
					SignalResult.seek(p2)
					
					return
				end
				local CallbackResult = if Callback == nil then nil else Callback(false)
				local v2 = p2 + (if CallbackResult == nil then 0 else CallbackResult.startTime)
				Signal2(v2)
				
				if v1 ~= nil then
					v1.seek(v2)
				end
			end,
			setMuted = function(p2) --[[ Line: 215 ]]
				-- upvalues: Signal6 (copy), Signal2_4 (copy), v1 (ref)
				local SignalResult = Signal6(false)
				
				if SignalResult ~= nil then
					SignalResult.audio.setMasterMuted(p2)
					
					return
				end
				Signal2_4(p2)
				
				if v1 ~= nil and v1.setMuted ~= nil then
					v1.setMuted(p2)
				end
			end,
			toggleMute = function() --[[ Line: 227 ]]
				-- upvalues: Signal6 (copy), Signal5 (copy), Signal2_4 (copy), v1 (ref)
				local SignalResult = Signal6(false)
				local Inverted = not (if SignalResult == nil then Signal5(false) else SignalResult.getState(false).isMuted)
				local SignalResult1 = Signal6(false)
				
				if SignalResult1 ~= nil then
					SignalResult1.audio.setMasterMuted(Inverted)
					
					return
				end
				Signal2_4(Inverted)
				
				if v1 ~= nil and v1.setMuted ~= nil then
					v1.setMuted(Inverted)
				end
			end
		},
		setMediaController = Signal2_5,
		setRegion = function(p2) --[[ Line: 252 ]]
			-- upvalues: Signal6 (copy)
			local SignalResult = Signal6(false)
			
			if SignalResult ~= nil then
				SignalResult.setRegion(p2)
			end
		end,
		bindEngine = function(p2) --[[ Line: 85 ]]
			-- upvalues: v1 (ref), Signal4 (copy)
			v1 = p2
			
			if p2 ~= nil then
				if Signal4(false) then
					p2.play()
					
					return
				end
				p2.pause()
			end
		end,
		setPosition = Signal2,
		setDuration = Signal2_1,
		setTimeLength = Signal2_2,
		setIsPlaying = Signal2_3,
		setReadiness = Loading2
	}
end