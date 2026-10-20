local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ChatConstantsModule = require(BuildExperience.Chat.chatConstants)
local ReportPromptFirstResponseLatencyModule = require(BuildExperience.Telemetry.reportPromptFirstResponseLatency)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local config = { FirstResponse = "first_response", MidTurn = "mid_turn" }

return function(Callback)
	-- upvalues: SendBuildExperienceEventModule (copy), ChatConstantsModule (copy), config (copy), ReportPromptFirstResponseLatencyModule (copy)
	local ClockTime = nil
	local ClockTime1 = nil
	local v1 = nil
	local Flag = false
	local IsWaitingOnUser = false
	local Flag1 = false
	local DelayedThread = nil
	
	local function _()
		-- upvalues: DelayedThread (ref)
		if DelayedThread ~= nil then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
	end
	
	local _ = function(p1): number
		return if p1 == nil then 0 else math.max(0, (math.round((os.clock() - p1) * 1000)))
	end
	
	local function getLifecycleParameters()
		-- upvalues: ClockTime (ref), v1 (ref), Flag (ref)
		local ClockTime1 = ClockTime
		local config = {
			elapsedMs = tostring(if ClockTime1 == nil then 0 else math.max(0, (math.round((os.clock() - ClockTime1) * 1000)))),
			receivedResponse = tostring(v1 ~= nil),
			stalled = tostring(Flag)
		}
		
		if v1 ~= nil then
			config.firstResponseMs = tostring(v1)
		end
		return config
	end
	
	local _ = function(p1)
		-- upvalues: Flag (ref), getLifecycleParameters (copy), v1 (ref), ClockTime1 (ref), SendBuildExperienceEventModule (upval), Callback (copy)
		Flag = true
		local LifecycleParameters = getLifecycleParameters()
		LifecycleParameters.stage = if v1 == nil then "first_response" else "mid_turn"
		local ClockTime = ClockTime1
		LifecycleParameters.idleMs = tostring(if ClockTime == nil then 0 else math.max(0, (math.round((os.clock() - ClockTime) * 1000))))
		LifecycleParameters.thresholdSeconds = tostring(p1)
		SendBuildExperienceEventModule("SEND_PROMPT_STALLED", Callback(), LifecycleParameters)
	end
	
	local function scheduleStallCheck(Delay)
		-- upvalues: DelayedThread (ref), Flag1 (ref), IsWaitingOnUser (ref), ClockTime1 (ref), ChatConstantsModule (upval), scheduleStallCheck (copy), Flag (ref), getLifecycleParameters (copy), v1 (ref), config (upval), SendBuildExperienceEventModule (upval), Callback (copy)
		DelayedThread = task.delay(Delay, function()
			-- upvalues: DelayedThread (upval), Flag1 (upval), IsWaitingOnUser (upval), ClockTime1 (upval), ChatConstantsModule (upval), scheduleStallCheck (upval), Flag (upval), getLifecycleParameters (upval), v1 (upval), config (upval), SendBuildExperienceEventModule (upval), Callback (upval)
			DelayedThread = nil
			
			if Flag1 or IsWaitingOnUser or ClockTime1 == nil then return end
			local PROMPTSTALLSECONDS = ChatConstantsModule.PROMPT_STALL_SECONDS
			local PROMPTSTALLSECONDSDelta = PROMPTSTALLSECONDS - (os.clock() - ClockTime1)
			
			if PROMPTSTALLSECONDSDelta > 0 then
				scheduleStallCheck(PROMPTSTALLSECONDSDelta)
				
				return
			else
				Flag = true
				local v2 = getLifecycleParameters()
				v2.stage = if v1 == nil then config.FirstResponse else config.MidTurn
				local ClockTime = ClockTime1
				v2.idleMs = tostring(if ClockTime == nil then 0 else math.max(0, (math.round((os.clock() - ClockTime) * 1000))))
				v2.thresholdSeconds = tostring(PROMPTSTALLSECONDS)
				SendBuildExperienceEventModule("SEND_PROMPT_STALLED", Callback(), v2)
			end
		end)
	end
	
	return {
		start = function()
			-- upvalues: ClockTime (ref), Flag1 (ref), ClockTime1 (ref), SendBuildExperienceEventModule (upval), Callback (copy), ChatConstantsModule (upval), DelayedThread (ref), IsWaitingOnUser (ref), scheduleStallCheck (copy), Flag (ref), getLifecycleParameters (copy), v1 (ref), config (upval)
			if ClockTime == nil and not Flag1 then
				ClockTime = os.clock()
				ClockTime1 = ClockTime
				SendBuildExperienceEventModule("SEND_PROMPT_START", Callback())
				DelayedThread = task.delay(ChatConstantsModule.PROMPT_STALL_SECONDS, function()
					-- upvalues: DelayedThread (upval), Flag1 (upval), IsWaitingOnUser (upval), ClockTime1 (upval), ChatConstantsModule (upval), scheduleStallCheck (upval), Flag (upval), getLifecycleParameters (upval), v1 (upval), config (upval), SendBuildExperienceEventModule (upval), Callback (upval)
					DelayedThread = nil
					
					if Flag1 or IsWaitingOnUser or ClockTime1 == nil then return end
					local PROMPTSTALLSECONDS = ChatConstantsModule.PROMPT_STALL_SECONDS
					local PROMPTSTALLSECONDSDelta = PROMPTSTALLSECONDS - (os.clock() - ClockTime1)
					
					if PROMPTSTALLSECONDSDelta > 0 then
						scheduleStallCheck(PROMPTSTALLSECONDSDelta)
						
						return
					else
						Flag = true
						local v2 = getLifecycleParameters()
						v2.stage = if v1 == nil then config.FirstResponse else config.MidTurn
						local ClockTime = ClockTime1
						v2.idleMs = tostring(if ClockTime == nil then 0 else math.max(0, (math.round((os.clock() - ClockTime) * 1000))))
						v2.thresholdSeconds = tostring(PROMPTSTALLSECONDS)
						SendBuildExperienceEventModule("SEND_PROMPT_STALLED", Callback(), v2)
					end
				end)
				
				return
			end
		end,
		markActivity = function(p1)
			-- upvalues: ClockTime (ref), Flag1 (ref), ClockTime1 (ref), IsWaitingOnUser (ref), v1 (ref), ReportPromptFirstResponseLatencyModule (upval), Flag (ref), DelayedThread (ref), ChatConstantsModule (upval), scheduleStallCheck (copy), getLifecycleParameters (copy), config (upval), SendBuildExperienceEventModule (upval), Callback (copy)
			if ClockTime == nil or Flag1 then return end
			ClockTime1 = os.clock()
			IsWaitingOnUser = p1.isWaitingOnUser
			
			if p1.hasResponse and v1 == nil then
				local ClockTime2 = ClockTime
				local Largest: number = if ClockTime2 == nil then 0 else math.max(0, (math.round((os.clock() - ClockTime2) * 1000)))
				v1 = Largest
				ReportPromptFirstResponseLatencyModule(Largest, Flag)
			end
			if IsWaitingOnUser then
				if DelayedThread ~= nil then
					task.cancel(DelayedThread)
					DelayedThread = nil
					
					return
				end
			elseif DelayedThread == nil then
				DelayedThread = task.delay(ChatConstantsModule.PROMPT_STALL_SECONDS, function()
					-- upvalues: DelayedThread (upval), Flag1 (upval), IsWaitingOnUser (upval), ClockTime1 (upval), ChatConstantsModule (upval), scheduleStallCheck (upval), Flag (upval), getLifecycleParameters (upval), v1 (upval), config (upval), SendBuildExperienceEventModule (upval), Callback (upval)
					DelayedThread = nil
					
					if Flag1 or IsWaitingOnUser or ClockTime1 == nil then return end
					local PROMPTSTALLSECONDS = ChatConstantsModule.PROMPT_STALL_SECONDS
					local PROMPTSTALLSECONDSDelta = PROMPTSTALLSECONDS - (os.clock() - ClockTime1)
					
					if PROMPTSTALLSECONDSDelta > 0 then
						scheduleStallCheck(PROMPTSTALLSECONDSDelta)
						
						return
					else
						Flag = true
						local v2 = getLifecycleParameters()
						v2.stage = if v1 == nil then config.FirstResponse else config.MidTurn
						local ClockTime = ClockTime1
						v2.idleMs = tostring(if ClockTime == nil then 0 else math.max(0, (math.round((os.clock() - ClockTime) * 1000))))
						v2.thresholdSeconds = tostring(PROMPTSTALLSECONDS)
						SendBuildExperienceEventModule("SEND_PROMPT_STALLED", Callback(), v2)
					end
				end)
			end
		end,
		reportUserStop = function()
			-- upvalues: ClockTime (ref), Flag1 (ref), SendBuildExperienceEventModule (upval), Callback (copy), getLifecycleParameters (copy), DelayedThread (ref)
			if ClockTime == nil or Flag1 then return end
			SendBuildExperienceEventModule("SEND_PROMPT_STOPPED", Callback(), (getLifecycleParameters()))
			Flag1 = true
			
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end,
		finish = function()
			-- upvalues: Flag1 (ref), DelayedThread (ref)
			Flag1 = true
			
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end,
		getLifecycleParameters = getLifecycleParameters
	}
end