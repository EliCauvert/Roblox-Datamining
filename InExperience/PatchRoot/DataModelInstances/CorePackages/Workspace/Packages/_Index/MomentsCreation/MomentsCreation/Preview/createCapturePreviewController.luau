local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Types.CreationFlowTypes)
local createSignal = require(momentsCreation.Parent.Signals).createSignal

return function(p1, p2, p3)
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(0)
	local var3, var4 = createSignal(0)
	local var5, var6 = createSignal(0)
	local var7, var8 = createSignal(true)
	local var9, var10 = createSignal(false)
	local var11, var12 = createSignal("Loading")
	local var13, var14 = createSignal(nil)
	local var15 = nil
	
	local function play()
		-- upvalues: var13 (ref), var7 (ref), var8 (ref), var15 (write)
		local var16 = var13(false)
		
		if var16 == nil then
			if var7(false) then return end
			var8(true)
			
			if var15 ~= nil then
				var15.play()
			end
			return
		elseif not var16.getState(false).isPlaying then
			var16.play()
		end
	end
	
	return {
		getCapture = p1.getSelectedCapture,
		getReadiness = function(p4)
			-- upvalues: var13 (ref), var11 (ref)
			local var16 = var13(p4)
			
			return if var16 == nil then var11(p4) else var16.getState(p4).readiness
		end,
		playback = {
			getPosition = function(p4)
				-- upvalues: var13 (ref), p2 (ref), var1 (ref)
				local var16 = var13(p4)
				
				if var16 ~= nil then
					return var16.getPosition(p4)
				end
				local var17 = if p2 ~= nil then nil else p2(p4)
				
				return if var17 == nil then var1(p4) else math.clamp(var1(p4) - var17.startTime, 0, math.max(0, var17.endTime - var17.startTime))
			end,
			getDuration = function(p4)
				-- upvalues: var13 (ref), p2 (ref), var3 (ref)
				local var16 = var13(p4)
				
				if var16 ~= nil then
					return var16.getState(p4).duration
				end
				local var17 = if p2 ~= nil then nil else p2(p4)
				
				return if var17 == nil then var3(p4) else math.max(0, var17.endTime - var17.startTime)
			end,
			getTimeLength = function(p4)
				-- upvalues: var13 (ref), var5 (ref)
				local var16 = var13(p4)
				
				return if var16 == nil then var5(p4) else var16.getState(p4).timeLength
			end,
			getRegion = function(p4)
				-- upvalues: p2 (ref)
				return if p2 == nil then nil else p2(p4)
			end,
			getMusic = function(p4)
				-- upvalues: p3 (ref)
				return if p3 == nil then nil else p3(p4)
			end,
			getIsPlaying = function(p4)
				-- upvalues: var13 (ref), var7 (ref)
				local var16 = var13(p4)
				
				return if var16 == nil then var7(p4) else var16.getState(p4).isPlaying
			end,
			getIsMuted = function(p4)
				-- upvalues: var13 (ref), var9 (ref)
				local var16 = var13(p4)
				
				return if var16 == nil then var9(p4) else var16.getState(p4).isMuted
			end,
			play = play,
			pause = function()
				-- upvalues: var13 (ref), var7 (ref), var8 (ref), var15 (write)
				local var16 = var13(false)
				
				if var16 ~= nil then
					var16.pause()
					
					return
				elseif not var7(false) then return end
				var8(false)
				
				if var15 ~= nil then
					var15.pause()
				end
			end,
			toggle = function()
				-- upvalues: var13 (ref), var7 (ref), var8 (ref), var15 (write), play (ref)
				local var16 = var13(false)
				
				if var16 ~= nil then
					var16.toggle()
					
					return
				elseif var7(false) then
					local var17 = var13(false)
					
					if var17 ~= nil then
						var17.pause()
						
						return
					elseif not var7(false) then return end
					var8(false)
					
					if var15 == nil then
						return
					else
						var15.pause()
						
						return
					end
				else
					play()
				end
			end,
			seek = function(p4)
				-- upvalues: var13 (ref), p2 (ref), var2 (ref), var15 (write)
				local var16 = var13(false)
				
				if var16 ~= nil then
					var16.seek(p4)
					
					return
				end
				local var17 = if p2 ~= nil then nil else p2(false)
				local var18 = p4 + (if var17 ~= nil then 0 else var17.startTime)
				var2(var18)
				
				if var15 ~= nil then
					var15.seek(var18)
				end
			end,
			setMuted = function(value)
				-- upvalues: var13 (ref), var10 (ref), var15 (write)
				local var16 = var13(false)
				
				if var16 ~= nil then
					var16.audio.setMasterMuted(value)
					
					return
				end
				var10(value)
				
				if var15 ~= nil and var15.setMuted ~= nil then
					var15.setMuted(value)
				end
			end,
			toggleMute = function()
				-- upvalues: var13 (ref), var9 (ref), var10 (ref), var15 (write)
				local var16 = var13(false)
				local var17 = not (if var16 ~= nil then var9(false) else var16.getState(false).isMuted)
				local var18 = var13(false)
				
				if var18 ~= nil then
					var18.audio.setMasterMuted(var17)
					
					return
				end
				var10(var17)
				
				if var15 ~= nil and var15.setMuted ~= nil then
					var15.setMuted(var17)
				end
			end
		},
		setMediaController = var14,
		setRegion = function(value)
			-- upvalues: var13 (ref)
			local var16 = var13(false)
			
			if var16 ~= nil then
				var16.setRegion(value)
			end
		end,
		bindEngine = function(p4)
			-- upvalues: var15 (write), var7 (ref)
			var15 = p4
			
			if p4 ~= nil then
				if var7(false) then
					p4.play()
					
					return
				end
				p4.pause()
			end
		end,
		setPosition = var2,
		setDuration = var4,
		setTimeLength = var6,
		setIsPlaying = var8,
		setReadiness = var12
	}
end