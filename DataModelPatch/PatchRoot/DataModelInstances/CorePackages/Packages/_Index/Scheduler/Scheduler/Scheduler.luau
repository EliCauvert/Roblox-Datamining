return function(p1)
	local Parent = script.Parent.Parent
	local ReactGlobalsModule = require(Parent.ReactGlobals)
	local SharedModule = require(Parent.Shared)
	local DescribeError = SharedModule.describeError
	local ReactFeatureFlags = SharedModule.ReactFeatureFlags
	local SchedulerFeatureFlagsModule = require(script.Parent.SchedulerFeatureFlags)
	local EnableSchedulerDebugging = SchedulerFeatureFlagsModule.enableSchedulerDebugging
	local EnableProfiling = SchedulerFeatureFlagsModule.enableProfiling
	local P0 = p1 or require(script.Parent.SchedulerHostConfig)
	local RequestHostCallbackFunction = P0.requestHostCallback
	local RequestHostTimeoutFunction = P0.requestHostTimeout
	local CancelHostTimeoutFunction = P0.cancelHostTimeout
	local ShouldYieldToHost = P0.shouldYieldToHost
	local GetCurrentTimeFunction = P0.getCurrentTime
	local NoYieldModule = require(script.Parent.NoYield)
	local Callback2 = nil
	local Callback = nil
	local Callback1 = nil
	
	local function _(p2, p3)
		-- upvalues: Callback (ref)
		local v1 = #p2 + 1
		p2[v1] = p3
		Callback(p2, p3, v1)
	end
	
	local _ = function(Entry)
		return Entry[1]
	end
	
	local _ = function(Entry)
		-- upvalues: Callback1 (ref)
		local Entry1 = Entry[1]
		
		if Entry1 == nil then
			return nil
		end
		local Entry2 = Entry[#Entry]
		Entry[#Entry] = nil
		
		if Entry2 ~= Entry1 then
			Entry[1] = Entry2
			Callback1(Entry, Entry2, 1)
		end
		return Entry1
	end
	
	Callback = function(p2, p3, Floored: number)
		-- upvalues: Callback2 (ref)
		while true do
			local Floored1 = math.floor(Floored / 2)
			local v1 = p2[Floored1]
			if v1 == nil or Callback2(v1, p3) <= 0 then return end
			p2[Floored1] = p3
			p2[Floored] = v1
			Floored = Floored1
		end
	end
	
	Callback1 = function(p4, p5, Key: number)
		-- upvalues: Callback2 (ref)
		local CountP6 = #p4
		while Key < CountP6 do
			local ScaledKey = Key * 2
			local v2 = p4[ScaledKey]
			local NewScaledKey = ScaledKey + 1
			local v3 = p4[NewScaledKey]
			
			if v2 == nil or Callback2(v2, p5) >= 0 then
				if v3 == nil or Callback2(v3, p5) >= 0 then break end
				p4[Key] = v3
				p4[NewScaledKey] = p5
				Key = NewScaledKey
			elseif v3 == nil or Callback2(v3, v2) >= 0 then
				p4[Key] = v2
				p4[ScaledKey] = p5
				Key = ScaledKey
			else
				p4[Key] = v3
				p4[NewScaledKey] = p5
				Key = NewScaledKey
			end
		end
	end
	
	Callback2 = function(p6, p7)
		local SortIndexDelta = p6.sortIndex - p7.sortIndex
		
		return if SortIndexDelta == 0 then p6.id - p7.id else SortIndexDelta
	end
	
	local SchedulerPrioritiesModule = require(script.Parent.SchedulerPriorities)
	local ImmediatePriority = SchedulerPrioritiesModule.ImmediatePriority
	local UserBlockingPriority = SchedulerPrioritiesModule.UserBlockingPriority
	local NormalPriority = SchedulerPrioritiesModule.NormalPriority
	local LowPriority = SchedulerPrioritiesModule.LowPriority
	local IdlePriority = SchedulerPrioritiesModule.IdlePriority
	local SchedulerProfilingModule = require(script.Parent.SchedulerProfiling)
	local MarkTaskRunFunction = SchedulerProfilingModule.markTaskRun
	local MarkTaskYieldFunction = SchedulerProfilingModule.markTaskYield
	local MarkTaskCompletedFunction = SchedulerProfilingModule.markTaskCompleted
	local MarkTaskCanceledFunction = SchedulerProfilingModule.markTaskCanceled
	local MarkTaskErroredFunction = SchedulerProfilingModule.markTaskErrored
	local MarkSchedulerSuspendedFunction = SchedulerProfilingModule.markSchedulerSuspended
	local MarkSchedulerUnsuspendedFunction = SchedulerProfilingModule.markSchedulerUnsuspended
	local MarkTaskStartFunction = SchedulerProfilingModule.markTaskStart
	local StopLoggingProfilingEvents = SchedulerProfilingModule.stopLoggingProfilingEvents
	local StartLoggingProfilingEvents = SchedulerProfilingModule.startLoggingProfilingEvents
	local t = {}
	local t1 = {}
	local Id = 1
	local Flag = false
	local v4 = nil
	local PriorityLevel = NormalPriority
	local Flag1 = false
	local Flag2 = false
	local Flag3 = false
	local _ = nil
	local v5 = nil
	local Callback3 = nil
	
	local function advanceTimers(p6)
		-- upvalues: t1 (copy), Callback1 (ref), t (copy), Callback (ref), EnableProfiling (copy), MarkTaskStartFunction (copy)
		local Entry = t1[1]
		while Entry ~= nil do
			if Entry.callback == nil then
				local Entry1 = t1[1]
				local NoEntry = Entry1 == nil
				local Entry2 = nil
				
				if not NoEntry then
					Entry2 = t1[#t1]
					t1[#t1] = nil
					NoEntry = Entry2 == Entry1
				end
				if not NoEntry then
					t1[1] = Entry2
					Callback1(t1, Entry2, 1)
				end
			else
				if Entry.startTime > p6 then break end
				local Entry3 = t1[1]
				local NoEntry1 = Entry3 == nil
				local Entry4 = nil
				
				if not NoEntry1 then
					Entry4 = t1[#t1]
					t1[#t1] = nil
					NoEntry1 = Entry4 == Entry3
				end
				if not NoEntry1 then
					t1[1] = Entry4
					Callback1(t1, Entry4, 1)
				end
				Entry.sortIndex = Entry.expirationTime
				local v6 = #t + 1
				t[v6] = Entry
				Callback(t, Entry, v6)
				
				if EnableProfiling then
					MarkTaskStartFunction(Entry, p6)
					Entry.isQueued = true
				end
			end
			Entry = t1[1]
		end
	end
	
	local function v35(p7)
		-- upvalues: Flag3 (ref), advanceTimers (copy), Flag2 (ref), t (copy), RequestHostCallbackFunction (copy), v5 (ref), t1 (copy), RequestHostTimeoutFunction (copy), v35 (ref)
		Flag3 = false
		advanceTimers(p7)
		
		if not Flag2 then
			if t[1] ~= nil then
				Flag2 = true
				RequestHostCallbackFunction(v5)
				
				return
			end
			local Entry = t1[1]
			
			if Entry ~= nil then
				RequestHostTimeoutFunction(v35, Entry.startTime - p7)
			end
		end
	end
	
	v5 = function(p7, p8)
		-- upvalues: EnableProfiling (copy), MarkSchedulerUnsuspendedFunction (copy), Flag2 (ref), Flag3 (ref), CancelHostTimeoutFunction (copy), Flag1 (ref), PriorityLevel (ref), ReactGlobalsModule (copy), Callback3 (ref), DescribeError (copy), v4 (ref), GetCurrentTimeFunction (copy), MarkTaskErroredFunction (copy), MarkSchedulerSuspendedFunction (copy)
		if EnableProfiling then
			MarkSchedulerUnsuspendedFunction(p8)
		end
		Flag2 = false
		
		if Flag3 then
			Flag3 = false
			CancelHostTimeoutFunction()
		end
		Flag1 = true
		local PriorityLevel1 = PriorityLevel
		local CallbackResult = nil
		local Flag = nil
		
		if ReactGlobalsModule.__YOLO__ then
			Flag = true
			CallbackResult = Callback3(p7, p8)
		elseif EnableProfiling then
			Flag, CallbackResult = xpcall(Callback3, DescribeError, p7, p8)
			
			if not Flag and v4 ~= nil then
				MarkTaskErroredFunction(v4, (GetCurrentTimeFunction()))
				v4.isQueued = false
			end
		else
			Flag = true
			CallbackResult = Callback3(p7, p8)
		end
		v4 = nil
		PriorityLevel = PriorityLevel1
		Flag1 = false
		
		if EnableProfiling then
			MarkSchedulerSuspendedFunction((GetCurrentTimeFunction()))
		end
		if not Flag then
			error(CallbackResult)
		end
		return CallbackResult
	end
	
	Callback3 = function(p7, p8): boolean
		-- upvalues: ReactGlobalsModule (copy), ReactFeatureFlags (copy), advanceTimers (copy), v4 (ref), t (copy), EnableSchedulerDebugging (copy), Flag (ref), ShouldYieldToHost (copy), PriorityLevel (ref), MarkTaskRunFunction (copy), NoYieldModule (copy), GetCurrentTimeFunction (copy), MarkTaskYieldFunction (copy), EnableProfiling (copy), MarkTaskCompletedFunction (copy), Callback1 (ref), t1 (copy), RequestHostTimeoutFunction (copy), v35 (ref)
		local CatchYieldingInDEV = ReactGlobalsModule.__DEV__ and ReactFeatureFlags.catchYieldingInDEV
		local v7 = p8
		advanceTimers(v7)
		v4 = t[1]
		while v4 ~= nil and (not EnableSchedulerDebugging or not Flag) and (v7 >= v4.expirationTime or p7 and not ShouldYieldToHost()) do
			local CallbackFunction = v4.callback
			
			if typeof(CallbackFunction) == "function" then
				v4.callback = nil
				PriorityLevel = v4.priorityLevel
				local IsExpirationTimeBelow = v4.expirationTime <= v7
				MarkTaskRunFunction(v4, v7)
				local NoYieldModuleResult = if CatchYieldingInDEV then NoYieldModule(CallbackFunction, IsExpirationTimeBelow) else CallbackFunction(IsExpirationTimeBelow)
				v7 = GetCurrentTimeFunction()
				
				if typeof(NoYieldModuleResult) == "function" then
					v4.callback = NoYieldModuleResult
					MarkTaskYieldFunction(v4, v7)
				else
					if EnableProfiling then
						MarkTaskCompletedFunction(v4, v7)
						v4.isQueued = false
					end
					if v4 == t[1] then
						local Entry1 = t[1]
						local NoEntry1 = Entry1 == nil
						local Entry2 = nil
						
						if not NoEntry1 then
							Entry2 = t[#t]
							t[#t] = nil
							NoEntry1 = Entry2 == Entry1
						end
						if not NoEntry1 then
							t[1] = Entry2
							Callback1(t, Entry2, 1)
						end
					end
				end
				advanceTimers(v7)
			else
				local Entry = t[1]
				local NoEntry = Entry == nil
				local Entry3 = nil
				
				if not NoEntry then
					Entry3 = t[#t]
					t[#t] = nil
					NoEntry = Entry3 == Entry
				end
				if not NoEntry then
					t[1] = Entry3
					Callback1(t, Entry3, 1)
				end
			end
			v4 = t[1]
		end
		if v4 ~= nil then
			return true
		end
		local Entry = t1[1]
		
		if Entry ~= nil then
			RequestHostTimeoutFunction(v35, Entry.startTime - v7)
		end
		return false
	end
	
	return {
		unstable_ImmediatePriority = ImmediatePriority,
		unstable_UserBlockingPriority = UserBlockingPriority,
		unstable_NormalPriority = NormalPriority,
		unstable_IdlePriority = IdlePriority,
		unstable_LowPriority = LowPriority,
		unstable_runWithPriority = function(NormalPriority1, Callback)
			-- upvalues: ImmediatePriority (copy), UserBlockingPriority (copy), NormalPriority (copy), LowPriority (copy), IdlePriority (copy), PriorityLevel (ref), ReactGlobalsModule (copy), DescribeError (copy)
			if NormalPriority1 ~= ImmediatePriority and NormalPriority1 ~= UserBlockingPriority and NormalPriority1 ~= NormalPriority and NormalPriority1 ~= LowPriority and NormalPriority1 ~= IdlePriority then
				NormalPriority1 = NormalPriority
			end
			local PriorityLevel1 = PriorityLevel
			PriorityLevel = NormalPriority1
			local Success = nil
			local Result = nil
			
			if ReactGlobalsModule.__YOLO__ then
				Success = true
				Result = Callback()
			else
				Success, Result = xpcall(Callback, DescribeError)
			end
			PriorityLevel = PriorityLevel1
			
			if not Success then
				error(Result)
			end
			return Result
		end,
		unstable_next = function(Callback)
			-- upvalues: PriorityLevel (ref), ImmediatePriority (copy), UserBlockingPriority (copy), NormalPriority (copy), ReactGlobalsModule (copy), DescribeError (copy)
			local PriorityLevel1 = PriorityLevel
			PriorityLevel = if PriorityLevel == ImmediatePriority or PriorityLevel == UserBlockingPriority or PriorityLevel == NormalPriority then NormalPriority else PriorityLevel
			local Success = nil
			local Result = nil
			
			if ReactGlobalsModule.__YOLO__ then
				Success = true
				Result = Callback()
			else
				Success, Result = xpcall(Callback, DescribeError)
			end
			PriorityLevel = PriorityLevel1
			
			if not Success then
				error(Result)
			end
			return Result
		end,
		unstable_scheduleCallback = function(PriorityLevel, Callback1, p9)
			-- upvalues: GetCurrentTimeFunction (copy), ImmediatePriority (copy), UserBlockingPriority (copy), IdlePriority (copy), LowPriority (copy), Id (ref), EnableProfiling (copy), t1 (copy), Callback (ref), t (copy), Flag3 (ref), CancelHostTimeoutFunction (copy), RequestHostTimeoutFunction (copy), v35 (ref), MarkTaskStartFunction (copy), Flag2 (ref), Flag1 (ref), RequestHostCallbackFunction (copy), v5 (ref)
			local CurrentTime: number = GetCurrentTimeFunction()
			local NewCurrentTime = nil
			
			if typeof(p9) == "table" then
				local Delay: number = p9.delay
				NewCurrentTime = if typeof(Delay) == "number" and Delay > 0 then CurrentTime + Delay else CurrentTime
			else
				NewCurrentTime = CurrentTime
			end
			local NewNewCurrentTime = NewCurrentTime + (if PriorityLevel == ImmediatePriority then -1 elseif PriorityLevel == UserBlockingPriority then 250 elseif PriorityLevel == IdlePriority then 1073741823 elseif PriorityLevel == LowPriority then 10000 else 5000)
			local config = {
				sortIndex = -1,
				id = Id,
				callback = Callback1,
				priorityLevel = PriorityLevel,
				startTime = NewCurrentTime,
				expirationTime = NewNewCurrentTime
			}
			Id += 1
			
			if EnableProfiling then
				config.isQueued = false
			end
			if CurrentTime < NewCurrentTime then
				config.sortIndex = NewCurrentTime
				local v8 = #t1 + 1
				t1[v8] = config
				Callback(t1, config, v8)
				
				if #t == 0 and config == t1[1] then
					if Flag3 then
						CancelHostTimeoutFunction()
					else
						Flag3 = true
					end
					RequestHostTimeoutFunction(v35, NewCurrentTime - CurrentTime)
					
					return config
				end
			else
				config.sortIndex = NewNewCurrentTime
				local v9 = #t + 1
				t[v9] = config
				Callback(t, config, v9)
				
				if EnableProfiling then
					MarkTaskStartFunction(config, CurrentTime)
					config.isQueued = true
				end
				if not Flag2 and not Flag1 then
					Flag2 = true
					RequestHostCallbackFunction(v5)
				end
			end
			return config
		end,
		unstable_cancelCallback = function(p9)
			-- upvalues: EnableProfiling (copy), GetCurrentTimeFunction (copy), MarkTaskCanceledFunction (copy)
			if EnableProfiling and p9.isQueued then
				MarkTaskCanceledFunction(p9, (GetCurrentTimeFunction()))
				p9.isQueued = false
			end
			p9.callback = nil
		end,
		unstable_wrapCallback = function(Callback)
			-- upvalues: PriorityLevel (ref), ReactGlobalsModule (copy), DescribeError (copy)
			local PriorityLevel1 = PriorityLevel
			
			return function(...)
				-- upvalues: PriorityLevel (upval), PriorityLevel1 (copy), ReactGlobalsModule (upval), Callback (copy), DescribeError (upval)
				local PriorityLevel2 = PriorityLevel
				PriorityLevel = PriorityLevel1
				local Success = nil
				local Result = nil
				
				if ReactGlobalsModule.__YOLO__ then
					Success = true
					Result = Callback(...)
				else
					Success, Result = xpcall(Callback, DescribeError, ...)
				end
				PriorityLevel = PriorityLevel2
				
				if not Success then
					error(Result)
				end
				return Result
			end
		end,
		unstable_getCurrentPriorityLevel = function()
			-- upvalues: PriorityLevel (ref)
			return PriorityLevel
		end,
		unstable_shouldYield = ShouldYieldToHost,
		unstable_requestPaint = P0.requestPaint,
		unstable_continueExecution = function()
			-- upvalues: Flag (ref), Flag2 (ref), Flag1 (ref), RequestHostCallbackFunction (copy), v5 (ref)
			Flag = false
			
			if not Flag2 and not Flag1 then
				Flag2 = true
				RequestHostCallbackFunction(v5)
			end
		end,
		unstable_pauseExecution = function()
			-- upvalues: Flag (ref)
			Flag = true
		end,
		unstable_getFirstCallbackNode = function()
			-- upvalues: t (copy)
			return t[1]
		end,
		unstable_now = GetCurrentTimeFunction,
		unstable_forceFrameRate = P0.forceFrameRate,
		unstable_setSchedulerFlags = P0.setSchedulerFlags,
		unstable_getSchedulerFlags = P0.getSchedulerFlags,
		unstable_Profiling = if EnableProfiling then {
			startLoggingProfilingEvents = StartLoggingProfilingEvents,
			stopLoggingProfilingEvents = StopLoggingProfilingEvents
		} else nil
	}
end