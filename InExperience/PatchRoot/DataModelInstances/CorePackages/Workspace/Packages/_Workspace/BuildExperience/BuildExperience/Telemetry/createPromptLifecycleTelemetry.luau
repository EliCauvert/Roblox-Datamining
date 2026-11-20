local BuildExperience = script:FindFirstAncestor("BuildExperience")
local FFlagBuildExperiencePromptIsInExperienceTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperiencePromptIsInExperienceTelemetry)
local ChatConstantsModule = require(BuildExperience.Chat.chatConstants)
local ReportPromptFirstResponseLatencyModule = require(BuildExperience.Telemetry.reportPromptFirstResponseLatency)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

return function(Callback)
	-- upvalues: FFlagBuildExperiencePromptIsInExperienceTelemetryModule (copy), SendBuildExperienceEventModule (copy), ChatConstantsModule (copy), ReportPromptFirstResponseLatencyModule (copy)
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
	
	local function reportStall(PROMPTSTALLSECONDS)
		-- upvalues: Flag (ref), getLifecycleParameters (copy), v1 (ref), ClockTime1 (ref), FFlagBuildExperiencePromptIsInExperienceTelemetryModule (upval), SendBuildExperienceEventModule (upval), Callback (copy)
		Flag = true
		local LifecycleParameters = getLifecycleParameters()
		LifecycleParameters.stage = if v1 == nil then "first_response" else "mid_turn"
		local ClockTime = ClockTime1
		LifecycleParameters.idleMs = tostring(if ClockTime == nil then 0 else math.max(0, (math.round((os.clock() - ClockTime) * 1000))))
		LifecycleParameters.thresholdSeconds = tostring(PROMPTSTALLSECONDS)
		
		if FFlagBuildExperiencePromptIsInExperienceTelemetryModule then
			LifecycleParameters.isInExperience = if game.GameId == 0 then "false" else "true"
		end
		SendBuildExperienceEventModule("SEND_PROMPT_STALLED", Callback(), LifecycleParameters)
	end
	
	local function scheduleStallCheck(Delay)
		-- upvalues: DelayedThread (ref), Flag1 (ref), IsWaitingOnUser (ref), ClockTime1 (ref), ChatConstantsModule (upval), scheduleStallCheck (copy), reportStall (copy)
		DelayedThread = task.delay(Delay, function()
			-- upvalues: DelayedThread (upval), Flag1 (upval), IsWaitingOnUser (upval), ClockTime1 (upval), ChatConstantsModule (upval), scheduleStallCheck (upval), reportStall (upval)
			DelayedThread = nil
			
			if Flag1 or IsWaitingOnUser or ClockTime1 == nil then return end
			local PROMPTSTALLSECONDS = ChatConstantsModule.PROMPT_STALL_SECONDS
			local PROMPTSTALLSECONDSDelta = PROMPTSTALLSECONDS - (os.clock() - ClockTime1)
			
			if PROMPTSTALLSECONDSDelta > 0 then
				scheduleStallCheck(PROMPTSTALLSECONDSDelta)
				
				return
			else
				reportStall(PROMPTSTALLSECONDS)
			end
		end)
	end
	
	return {
		start = function()
			-- upvalues: ClockTime (ref), Flag1 (ref), ClockTime1 (ref), SendBuildExperienceEventModule (upval), Callback (copy), FFlagBuildExperiencePromptIsInExperienceTelemetryModule (upval), ChatConstantsModule (upval), DelayedThread (ref), IsWaitingOnUser (ref), scheduleStallCheck (copy), reportStall (copy)
			if ClockTime == nil and not Flag1 then
				ClockTime = os.clock()
				ClockTime1 = ClockTime
				SendBuildExperienceEventModule("SEND_PROMPT_START", Callback(), if FFlagBuildExperiencePromptIsInExperienceTelemetryModule then {
					isInExperience = if game.GameId == 0 then "false" else "true"
				} else nil)
				DelayedThread = task.delay(ChatConstantsModule.PROMPT_STALL_SECONDS, function()
					-- upvalues: DelayedThread (upval), Flag1 (upval), IsWaitingOnUser (upval), ClockTime1 (upval), ChatConstantsModule (upval), scheduleStallCheck (upval), reportStall (upval)
					DelayedThread = nil
					
					if Flag1 or IsWaitingOnUser or ClockTime1 == nil then return end
					local PROMPTSTALLSECONDS = ChatConstantsModule.PROMPT_STALL_SECONDS
					local PROMPTSTALLSECONDSDelta = PROMPTSTALLSECONDS - (os.clock() - ClockTime1)
					
					if PROMPTSTALLSECONDSDelta > 0 then
						scheduleStallCheck(PROMPTSTALLSECONDSDelta)
						
						return
					else
						reportStall(PROMPTSTALLSECONDS)
					end
				end)
				
				return
			end
		end,
		markActivity = function(p1)
			-- upvalues: ClockTime (ref), Flag1 (ref), ClockTime1 (ref), IsWaitingOnUser (ref), v1 (ref), ReportPromptFirstResponseLatencyModule (upval), Flag (ref), DelayedThread (ref), ChatConstantsModule (upval), scheduleStallCheck (copy), reportStall (copy)
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
					-- upvalues: DelayedThread (upval), Flag1 (upval), IsWaitingOnUser (upval), ClockTime1 (upval), ChatConstantsModule (upval), scheduleStallCheck (upval), reportStall (upval)
					DelayedThread = nil
					
					if Flag1 or IsWaitingOnUser or ClockTime1 == nil then return end
					local PROMPTSTALLSECONDS = ChatConstantsModule.PROMPT_STALL_SECONDS
					local PROMPTSTALLSECONDSDelta = PROMPTSTALLSECONDS - (os.clock() - ClockTime1)
					
					if PROMPTSTALLSECONDSDelta > 0 then
						scheduleStallCheck(PROMPTSTALLSECONDSDelta)
						
						return
					else
						reportStall(PROMPTSTALLSECONDS)
					end
				end)
			end
		end,
		reportUserStop = function()
			-- upvalues: ClockTime (ref), Flag1 (ref), getLifecycleParameters (copy), FFlagBuildExperiencePromptIsInExperienceTelemetryModule (upval), SendBuildExperienceEventModule (upval), Callback (copy), DelayedThread (ref)
			if ClockTime == nil or Flag1 then return end
			local LifecycleParameters = getLifecycleParameters()
			
			if FFlagBuildExperiencePromptIsInExperienceTelemetryModule then
				LifecycleParameters.isInExperience = if game.GameId == 0 then "false" else "true"
			end
			SendBuildExperienceEventModule("SEND_PROMPT_STOPPED", Callback(), LifecycleParameters)
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