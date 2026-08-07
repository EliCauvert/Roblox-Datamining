local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Types.CreationFlowTypes)
local createSignal = require(momentsCreation.Parent.Signals).createSignal

return function(p0, p1, p2) --[[ line: 63 | named "createCapturePreviewController" ]]
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(0)
	local var3, var4 = createSignal(0)
	local var5, var6 = createSignal(0)
	local var7, var8 = createSignal(true)
	local var9, var10 = createSignal(false)
	local var11, var12 = createSignal("Loading")
	local var13, var14 = createSignal(nil)
	local var15 = nil
	
	local function play() --[[ line: 168 ]]
		-- upvalues: var13 (ref), var7 (ref), var8 (ref), var15 (write)
		local var17 = var13(false)
		
		if var17 == nil then
			if var7(false) then return end
			var8(true)
			
			if var15 ~= nil then
				var15.play()
			end
			return
		elseif not var17.getState(false).isPlaying then
			var17.play()
		end
	end
	
	return {
		getCapture = p0.getSelectedCapture,
		getReadiness = function(p3) --[[ line: 160 ]]
			-- upvalues: var13 (ref), var11 (ref)
			local var18 = var13(p3)
			
			return if var18 == nil then var11(p3) else var18.getState(p3).readiness
		end,
		playback = {
			getPosition = function(p4) --[[ line: 131 ]]
				-- upvalues: var13 (ref), p1 (ref), var1 (ref)
				local var19 = var13(p4)
				
				if var19 ~= nil then
					return var19.getPosition(p4)
				end
				local var20 = if p1 ~= nil then nil else p1(p4)
				
				return if var20 == nil then var1(p4) else math.clamp(var1(p4) - var20.startTime, 0, math.max(0, var20.endTime - var20.startTime))
			end,
			getDuration = function(p5) --[[ line: 108 ]]
				-- upvalues: var13 (ref), p1 (ref), var3 (ref)
				local var21 = var13(p5)
				
				if var21 ~= nil then
					return var21.getState(p5).duration
				end
				local var22 = if p1 ~= nil then nil else p1(p5)
				
				return if var22 == nil then var3(p5) else math.max(0, var22.endTime - var22.startTime)
			end,
			getTimeLength = function(p6) --[[ line: 121 ]]
				-- upvalues: var13 (ref), var5 (ref)
				local var23 = var13(p6)
				
				return if var23 == nil then var5(p6) else var23.getState(p6).timeLength
			end,
			getRegion = function(p7) --[[ line: 97 ]]
				-- upvalues: p1 (ref)
				return if p1 == nil then nil else p1(p7)
			end,
			getMusic = function(p8) --[[ line: 102 ]]
				-- upvalues: p2 (ref)
				return if p2 == nil then nil else p2(p8)
			end,
			getIsPlaying = function(p9) --[[ line: 144 ]]
				-- upvalues: var13 (ref), var7 (ref)
				local var24 = var13(p9)
				
				return if var24 == nil then var7(p9) else var24.getState(p9).isPlaying
			end,
			getIsMuted = function(p10) --[[ line: 152 ]]
				-- upvalues: var13 (ref), var9 (ref)
				local var25 = var13(p10)
				
				return if var25 == nil then var9(p10) else var25.getState(p10).isMuted
			end,
			play = play,
			pause = function() --[[ line: 187 ]]
				-- upvalues: var13 (ref), var7 (ref), var8 (ref), var15 (write)
				local var26 = var13(false)
				
				if var26 ~= nil then
					var26.pause()
					
					return
				elseif not var7(false) then return end
				var8(false)
				
				if var15 ~= nil then
					var15.pause()
				end
			end,
			toggle = function() --[[ line: 202 ]]
				-- upvalues: var13 (ref), var7 (ref), var8 (ref), var15 (write), play (ref)
				local var27 = var13(false)
				
				if var27 ~= nil then
					var27.toggle()
					
					return
				elseif var7(false) then
					local var28 = var13(false)
					
					if var28 ~= nil then
						var28.pause()
						
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
			seek = function(p11) --[[ line: 231 ]]
				-- upvalues: var13 (ref), p1 (ref), var2 (ref), var15 (write)
				local var29 = var13(false)
				
				if var29 ~= nil then
					var29.seek(p11)
					
					return
				end
				local var30 = if p1 ~= nil then nil else p1(false)
				local var31 = p11 + (if var30 ~= nil then 0 else var30.startTime)
				var2(var31)
				
				if var15 ~= nil then
					var15.seek(var31)
				end
			end,
			setMuted = function(value) --[[ line: 215 ]]
				-- upvalues: var13 (ref), var10 (ref), var15 (write)
				local var32 = var13(false)
				
				if var32 ~= nil then
					var32.audio.setMasterMuted(value)
					
					return
				end
				var10(value)
				
				if var15 ~= nil and var15.setMuted ~= nil then
					var15.setMuted(value)
				end
			end,
			toggleMute = function() --[[ line: 227 ]]
				-- upvalues: var13 (ref), var9 (ref), var10 (ref), var15 (write)
				local var33 = var13(false)
				local var34 = not (if var33 ~= nil then var9(false) else var33.getState(false).isMuted)
				local var35 = var13(false)
				
				if var35 ~= nil then
					var35.audio.setMasterMuted(var34)
					
					return
				end
				var10(var34)
				
				if var15 ~= nil and var15.setMuted ~= nil then
					var15.setMuted(var34)
				end
			end
		},
		setMediaController = var14,
		setRegion = function(value) --[[ line: 252 ]]
			-- upvalues: var13 (ref)
			local var36 = var13(false)
			
			if var36 ~= nil then
				var36.setRegion(value)
			end
		end,
		bindEngine = function(p12) --[[ line: 85 ]]
			-- upvalues: var15 (write), var7 (ref)
			var15 = p12
			
			if p12 ~= nil then
				if var7(false) then
					p12.play()
					
					return
				end
				p12.pause()
			end
		end,
		setPosition = var2,
		setDuration = var4,
		setTimeLength = var6,
		setIsPlaying = var8,
		setReadiness = var12
	}
end