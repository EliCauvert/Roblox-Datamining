local Total = 0
local Callback = nil
local Callback1: ((any) -> ())? = nil
local v1 = -1
local List = nil
local v2 = -1
local Flag = false
local Flag1 = false
local Flag2 = false
local Flag3 = false
local Parent = script.Parent.Parent.Parent
local Console = require(Parent.Shared).console
local DisabledLog = require(Parent.Shared).ConsolePatchingDev.disabledLog
local SchedulerHostConfig = {
	requestHostCallback = function(p1)
		-- upvalues: Callback (ref)
		Callback = p1
	end,
	cancelHostCallback = function()
		-- upvalues: Callback (ref)
		Callback = nil
	end,
	requestHostTimeout = function(p1, p2)
		-- upvalues: Callback1 (ref), v1 (ref), Total (ref)
		Callback1 = p1
		v1 = Total + p2
	end,
	cancelHostTimeout = function()
		-- upvalues: Callback1 (ref), v1 (ref)
		Callback1 = nil
		v1 = -1
	end,
	shouldYieldToHost = function(): boolean
		-- upvalues: List (ref), v2 (ref), Flag3 (ref), Flag2 (ref), Flag (ref)
		local List1 = List
		
		if (v2 == -1 or List1 == nil or v2 > #List1) and (not Flag3 or not Flag2) then
			return false
		else
			Flag = true
			
			return true
		end
	end,
	getCurrentTime = function()
		-- upvalues: Total (ref)
		return Total
	end,
	forceFrameRate = function() end,
	reset = function()
		-- upvalues: Flag1 (ref), Total (ref), Callback (ref), Callback1 (ref), v1 (ref), List (ref), v2 (ref), Flag (ref), Flag2 (ref)
		if Flag1 then
			error("Cannot reset while already flushing work.")
		end
		Total = 0
		Callback = nil
		Callback1 = nil
		v1 = -1
		List = nil
		v2 = -1
		Flag = false
		Flag1 = false
		Flag2 = false
	end,
	unstable_flushNumberOfYields = function(p1)
		-- upvalues: Flag1 (ref), Callback (ref), v2 (ref), Total (ref), Flag (ref)
		if Flag1 then
			error("Already flushing work.")
		end
		if Callback ~= nil then
			local Callback1 = Callback
			v2 = p1
			Flag1 = true
			local Success, Result = pcall(function()
				-- upvalues: Callback1 (copy), Total (upval), Flag (upval), Callback (upval)
				local CallbackResult = nil
				repeat
					CallbackResult = Callback1(true, Total)
				until not CallbackResult or Flag
				if not CallbackResult then
					Callback = nil
				end
			end)
			v2 = -1
			Flag = false
			Flag1 = false
			
			if not Success then
				error(Result)
			end
		end
	end,
	unstable_flushUntilNextPaint = function()
		-- upvalues: Flag1 (ref), Callback (ref), Flag3 (ref), Flag2 (ref), Total (ref), Flag (ref)
		if Flag1 then
			error("Already flushing work.")
		end
		if Callback ~= nil then
			local Callback1 = Callback
			Flag3 = true
			Flag2 = false
			Flag1 = true
			local Success, Result = pcall(function()
				-- upvalues: Callback1 (copy), Total (upval), Flag (upval), Callback (upval)
				local CallbackResult = nil
				repeat
					CallbackResult = Callback1(true, Total)
				until not CallbackResult or Flag
				if not CallbackResult then
					Callback = nil
				end
			end)
			Flag3 = false
			Flag = false
			Flag1 = false
			
			if not Success then
				error(Result)
			end
		end
	end,
	unstable_flushExpired = function()
		-- upvalues: Flag1 (ref), Callback (ref), Total (ref)
		if Flag1 then
			error("Already flushing work.")
		end
		if Callback ~= nil then
			Flag1 = true
			local Success, Result = pcall(function()
				-- upvalues: Callback (upval), Total (upval)
				if not Callback(false, Total) then
					Callback = nil
				end
			end)
			Flag1 = false
			
			if not Success then
				error(Result)
			end
		end
	end,
	unstable_flushAllWithoutAsserting = function(): boolean
		-- upvalues: Flag1 (ref), Callback (ref), Total (ref)
		if Flag1 then
			error("Already flushing work.")
		end
		if Callback == nil then
			return false
		end
		local Callback1 = Callback
		Flag1 = true
		local Success, Result = pcall(function()
			-- upvalues: Callback1 (copy), Total (upval), Callback (upval)
			local CallbackResult = nil
			repeat
				CallbackResult = Callback1(true, Total)
			until not CallbackResult
			if not CallbackResult then
				Callback = nil
			end
		end)
		Flag1 = false
		
		if not Success then
			error(Result)
		end
		return true
	end,
	unstable_clearYields = function()
		-- upvalues: List (ref)
		if List == nil then
			return {}
		else
			local List1 = List
			List = nil
			
			return List1
		end
	end
}

function SchedulerHostConfig.unstable_flushAll()
	-- upvalues: List (ref), SchedulerHostConfig (copy)
	if List ~= nil then
		error("Log is not empty. Assert on the log of yielded values before flushing additional work.")
	end
	SchedulerHostConfig.unstable_flushAllWithoutAsserting()
	
	if List ~= nil then
		error("While flushing work, something yielded a value. Use an assertion helper to assert on the log of yielded values, e.g. expect(Scheduler).toFlushAndYield([...])")
	end
end

function SchedulerHostConfig.unstable_yieldValue(p1)
	-- upvalues: Console (copy), DisabledLog (copy), List (ref)
	if Console.log == DisabledLog then return end
	if List == nil then
		List = { p1 }
		
		return
	else
		table.insert(List, p1)
	end
end

function SchedulerHostConfig.unstable_advanceTime(Amount)
	-- upvalues: Console (copy), DisabledLog (copy), Total (ref), Callback1 (ref), v1 (ref)
	if Console.log == DisabledLog then return end
	Total += Amount
	
	if Callback1 ~= nil and v1 <= Total then
		Callback1(Total)
		v1 = -1
		Callback1 = nil
	end
end

function SchedulerHostConfig.requestPaint()
	-- upvalues: Flag2 (ref)
	Flag2 = true
end

return SchedulerHostConfig