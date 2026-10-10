local buildExperience = script:FindFirstAncestor("BuildExperience")
local chatConstantsModule = require(buildExperience.Chat.chatConstants)
local reportPromptFirstResponseLatencyModule = require(buildExperience.Telemetry.reportPromptFirstResponseLatency)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local t = { FirstResponse = "first_response", MidTurn = "mid_turn" }

return function(p1)
	-- upvalues: sendBuildExperienceEventModule (ref), chatConstantsModule (ref), t (ref), reportPromptFirstResponseLatencyModule (ref)
	local var1 = nil
	local var2 = nil
	local var3 = nil
	local var4 = false
	local var5 = false
	local var6 = false
	local var7 = nil
	
	local function _()
		-- upvalues: var7 (write)
		if var7 ~= nil then
			task.cancel(var7)
			var7 = nil
		end
	end
	
	local _ = function(p2)
		return if p2 == nil then 0 else math.max(0, math.round((os.clock() - p2) * 1000))
	end
	
	local function getLifecycleParameters()
		-- upvalues: var1 (write), var3 (write), var4 (write)
		local t = {
			elapsedMs = tostring(if var1 == nil then 0 else math.max(0, math.round((os.clock() - var1) * 1000))),
			receivedResponse = tostring(var3 ~= nil),
			stalled = tostring(var4)
		}
		
		if var3 ~= nil then
			t.firstResponseMs = tostring(var3)
		end
		return t
	end
	
	local _ = function(p2)
		-- upvalues: var4 (write), getLifecycleParameters (ref), var3 (write), var2 (write), sendBuildExperienceEventModule (copy), p1 (ref)
		var4 = true
		local var8 = getLifecycleParameters()
		var8.stage = if var3 ~= nil then "first_response" else "mid_turn"
		var8.idleMs = tostring(if var2 == nil then 0 else math.max(0, math.round((os.clock() - var2) * 1000)))
		var8.thresholdSeconds = tostring(p2)
		sendBuildExperienceEventModule("SEND_PROMPT_STALLED", p1(), var8)
	end
	
	local function scheduleStallCheck(p2)
		-- upvalues: var7 (write), var6 (write), var5 (write), var2 (write), chatConstantsModule (copy), scheduleStallCheck (ref), var4 (write), getLifecycleParameters (ref), var3 (write), t (copy), sendBuildExperienceEventModule (copy), p1 (ref)
		var7 = task.delay(p2, function()
			-- upvalues: var7 (copy), var6 (copy), var5 (copy), var2 (copy), chatConstantsModule (copy), scheduleStallCheck (copy), var4 (copy), getLifecycleParameters (copy), var3 (copy), t (copy), sendBuildExperienceEventModule (copy), p1 (copy)
			var7 = nil
			
			if var6 or var5 or var2 == nil then return end
			local PROMPT_STALL_SECONDS = chatConstantsModule.PROMPT_STALL_SECONDS
			local var8 = PROMPT_STALL_SECONDS - (os.clock() - var2)
			
			if var8 > 0 then
				scheduleStallCheck(var8)
				
				return
			end
			var4 = true
			local var9 = getLifecycleParameters()
			var9.stage = if var3 ~= nil then t.FirstResponse else t.MidTurn
			var9.idleMs = tostring(if var2 == nil then 0 else math.max(0, math.round((os.clock() - var2) * 1000)))
			var9.thresholdSeconds = tostring(PROMPT_STALL_SECONDS)
			sendBuildExperienceEventModule("SEND_PROMPT_STALLED", p1(), var9)
		end)
	end
	
	return {
		start = function()
			-- upvalues: var1 (write), var6 (write), var2 (write), sendBuildExperienceEventModule (copy), p1 (ref), chatConstantsModule (copy), var7 (write), var5 (write), scheduleStallCheck (ref), var4 (write), getLifecycleParameters (ref), var3 (write), t (copy)
			if var1 == nil and not var6 then
				var1 = os.clock()
				var2 = var1
				sendBuildExperienceEventModule("SEND_PROMPT_START", p1())
				var7 = task.delay(chatConstantsModule.PROMPT_STALL_SECONDS, function()
					-- upvalues: var7 (copy), var6 (copy), var5 (copy), var2 (copy), chatConstantsModule (copy), scheduleStallCheck (copy), var4 (copy), getLifecycleParameters (copy), var3 (copy), t (copy), sendBuildExperienceEventModule (copy), p1 (copy)
					var7 = nil
					
					if var6 or var5 or var2 == nil then return end
					local PROMPT_STALL_SECONDS = chatConstantsModule.PROMPT_STALL_SECONDS
					local var8 = PROMPT_STALL_SECONDS - (os.clock() - var2)
					
					if var8 > 0 then
						scheduleStallCheck(var8)
						
						return
					end
					var4 = true
					local var9 = getLifecycleParameters()
					var9.stage = if var3 ~= nil then t.FirstResponse else t.MidTurn
					var9.idleMs = tostring(if var2 == nil then 0 else math.max(0, math.round((os.clock() - var2) * 1000)))
					var9.thresholdSeconds = tostring(PROMPT_STALL_SECONDS)
					sendBuildExperienceEventModule("SEND_PROMPT_STALLED", p1(), var9)
				end)
				
				return
			end
		end,
		markActivity = function(p2)
			-- upvalues: var1 (write), var6 (write), var2 (write), var5 (write), var3 (write), reportPromptFirstResponseLatencyModule (copy), var4 (write), var7 (write), chatConstantsModule (copy), scheduleStallCheck (ref), getLifecycleParameters (ref), t (copy), sendBuildExperienceEventModule (copy), p1 (ref)
			if var1 == nil or var6 then return end
			var2 = os.clock()
			var5 = p2.isWaitingOnUser
			
			if p2.hasResponse and var3 == nil then
				local var8 = if var1 == nil then 0 else math.max(0, math.round((os.clock() - var1) * 1000))
				var3 = var8
				reportPromptFirstResponseLatencyModule(var8, var4)
			end
			if var5 then
				if var7 == nil then
					return
				else
					task.cancel(var7)
					var7 = nil
					
					return
				end
			elseif var7 == nil then
				var7 = task.delay(chatConstantsModule.PROMPT_STALL_SECONDS, function()
					-- upvalues: var7 (copy), var6 (copy), var5 (copy), var2 (copy), chatConstantsModule (copy), scheduleStallCheck (copy), var4 (copy), getLifecycleParameters (copy), var3 (copy), t (copy), sendBuildExperienceEventModule (copy), p1 (copy)
					var7 = nil
					
					if var6 or var5 or var2 == nil then return end
					local PROMPT_STALL_SECONDS = chatConstantsModule.PROMPT_STALL_SECONDS
					local var9 = PROMPT_STALL_SECONDS - (os.clock() - var2)
					
					if var9 > 0 then
						scheduleStallCheck(var9)
						
						return
					end
					var4 = true
					local var10 = getLifecycleParameters()
					var10.stage = if var3 ~= nil then t.FirstResponse else t.MidTurn
					var10.idleMs = tostring(if var2 == nil then 0 else math.max(0, math.round((os.clock() - var2) * 1000)))
					var10.thresholdSeconds = tostring(PROMPT_STALL_SECONDS)
					sendBuildExperienceEventModule("SEND_PROMPT_STALLED", p1(), var10)
				end)
			end
		end,
		reportUserStop = function()
			-- upvalues: var1 (write), var6 (write), sendBuildExperienceEventModule (copy), p1 (ref), getLifecycleParameters (ref), var7 (write)
			if var1 == nil or var6 then return end
			sendBuildExperienceEventModule("SEND_PROMPT_STOPPED", p1(), getLifecycleParameters())
			var6 = true
			
			if var7 ~= nil then
				task.cancel(var7)
				var7 = nil
			end
		end,
		finish = function()
			-- upvalues: var6 (write), var7 (write)
			var6 = true
			
			if var7 ~= nil then
				task.cancel(var7)
				var7 = nil
			end
		end,
		getLifecycleParameters = getLifecycleParameters
	}
end