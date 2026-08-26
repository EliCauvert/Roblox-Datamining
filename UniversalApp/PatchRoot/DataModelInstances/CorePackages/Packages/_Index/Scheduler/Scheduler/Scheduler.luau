return function(p1)
	local parent = script.Parent.Parent
	local reactGlobalsModule = require(parent.ReactGlobals)
	local sharedModule = require(parent.Shared)
	local describeError = sharedModule.describeError
	local reactFeatureFlags = sharedModule.ReactFeatureFlags
	local schedulerFeatureFlagsModule = require(script.Parent.SchedulerFeatureFlags)
	local enableSchedulerDebugging = schedulerFeatureFlagsModule.enableSchedulerDebugging
	local enableProfiling = schedulerFeatureFlagsModule.enableProfiling
	p1 = p1 or require(script.Parent.SchedulerHostConfig)
	local requestHostCallback = p1.requestHostCallback
	local requestHostTimeout = p1.requestHostTimeout
	local cancelHostTimeout = p1.cancelHostTimeout
	local shouldYieldToHost = p1.shouldYieldToHost
	local getCurrentTime = p1.getCurrentTime
	local forceFrameRate = p1.forceFrameRate
	local requestPaint = p1.requestPaint
	local setSchedulerFlags = p1.setSchedulerFlags
	local getSchedulerFlags = p1.getSchedulerFlags
	local noYieldModule = require(script.Parent.NoYield)
	local var1 = nil
	local var2 = nil
	local var3 = nil
	
	local _ = function(p2, p3)
		-- upvalues: var2 (write)
		local var4 = #p2 + 1
		p2[var4] = p3
		var2(p2, p3, var4)
	end
	
	local _ = function(p2)
		return p2[1]
	end
	
	local _ = function(p2)
		-- upvalues: var3 (write)
		local var4 = p2[1]
		
		if var4 == nil then
			return nil
		end
		local var5 = p2[#p2]
		p2[#p2] = nil
		
		if var5 ~= var4 then
			p2[1] = var5
			var3(p2, var5, 1)
		end
		return var4
	end
	
	var2 = function(p2, p3, p4)
		-- upvalues: var1 (write)
		local floored, var4
		while true do
			floored = math.floor(p4 / 2)
			var4 = p2[floored]
			if var4 ~= nil and var1(var4, p3) > 0 then
				return
			end
			p2[floored] = p3
			p2[p4] = var4
			_ = floored
		end
	end
	
	var3 = function(p5, p6, p7)
		-- upvalues: var1 (write)
		local var5, var6
		local p8Count = #p5
		while p7 < p8Count do
			local var7 = p7 * 2
			local var8 = p5[var7]
			var5 = var7 + 1
			var6 = p5[var5]
			
			if var8 == nil or var1(var8, p6) >= 0 then
				if var6 ~= nil and var1(var6, p6) < 0 then
					return
				end
				p5[p7] = var6
				p5[var5] = p6
				p7 = var5
			elseif var6 == nil or var1(var6, var8) >= 0 then
				p5[p7] = var8
				p5[var7] = p6
				p7 = var7
			else
				p5[p7] = var6
				p5[var5] = p6
				p7 = var5
			end
		end
	end
	
	var1 = function(p8, p9)
		local var9 = p8.sortIndex - p9.sortIndex
		
		return if var9 == 0 then p8.id - p9.id else var9
	end
	
	local schedulerPrioritiesModule = require(script.Parent.SchedulerPriorities)
	local immediatePriority = schedulerPrioritiesModule.ImmediatePriority
	local userBlockingPriority = schedulerPrioritiesModule.UserBlockingPriority
	local normalPriority = schedulerPrioritiesModule.NormalPriority
	local lowPriority = schedulerPrioritiesModule.LowPriority
	local idlePriority = schedulerPrioritiesModule.IdlePriority
	local schedulerProfilingModule = require(script.Parent.SchedulerProfiling)
	local markTaskRun = schedulerProfilingModule.markTaskRun
	local markTaskYield = schedulerProfilingModule.markTaskYield
	local markTaskCompleted = schedulerProfilingModule.markTaskCompleted
	local markTaskCanceled = schedulerProfilingModule.markTaskCanceled
	local markTaskErrored = schedulerProfilingModule.markTaskErrored
	local markSchedulerSuspended = schedulerProfilingModule.markSchedulerSuspended
	local markSchedulerUnsuspended = schedulerProfilingModule.markSchedulerUnsuspended
	local markTaskStart = schedulerProfilingModule.markTaskStart
	local stopLoggingProfilingEvents = schedulerProfilingModule.stopLoggingProfilingEvents
	local startLoggingProfilingEvents = schedulerProfilingModule.startLoggingProfilingEvents
	local t = {}
	local t_1 = {}
	local var9 = 1
	local var10 = false
	local var11 = nil
	local var12 = normalPriority
	local var13 = false
	local var14 = false
	local var15 = false
	local _ = nil
	local var16 = nil
	local var17 = nil
	
	local function advanceTimers(p8)
		-- upvalues: t_1 (ref), var3 (write), t (ref), var2 (write), enableProfiling (ref), markTaskStart (ref)
		local var18 = t_1[1]
		while var18 ~= nil do
			if var18.callback == nil then
				local var19 = t_1
				local var20 = var19[1]
				
				if var20 ~= nil then
					local var21 = var19[#var19]
					var19[#var19] = nil
					
					if var21 ~= var20 then
						var19[1] = var21
						var3(var19, var21, 1)
					end
				end
				var18 = t_1[1]
			end
			if var18.startTime <= p8 then
				local var22 = t_1[1]
				
				if var22 ~= nil then
					local var23 = t_1[#t_1]
					t_1[#t_1] = nil
					
					if var23 ~= var22 then
						t_1[1] = var23
						var3(t_1, var23, 1)
					end
				end
				var18.sortIndex = var18.expirationTime
				local var24 = var18
				local var25 = #t + 1
				t[var25] = var24
				var2(t, var24, var25)
				
				if enableProfiling then
					markTaskStart(var18, p8)
					var18.isQueued = true
				end
			end
			return
		end
	end
	
	local var26 = function(p9)
		-- upvalues: var15 (write), advanceTimers (ref), var14 (write), t (ref), requestHostCallback (ref), var16 (write), t_1 (ref), requestHostTimeout (ref), var26 (write)
		var15 = false
		advanceTimers(p9)
		
		if not var14 then
			if t[1] ~= nil then
				var14 = true
				requestHostCallback(var16)
				
				return
			end
			local var27 = t_1[1]
			
			if var27 ~= nil then
				requestHostTimeout(var26, var27.startTime - p9)
			end
		end
	end
	
	var16 = function(p9, p10)
		-- upvalues: enableProfiling (ref), markSchedulerUnsuspended (ref), var14 (write), var15 (write), cancelHostTimeout (ref), var13 (write), var12 (write), reactGlobalsModule (ref), var17 (write), describeError (ref), var11 (write), getCurrentTime (ref), markTaskErrored (ref), markSchedulerSuspended (ref)
		if enableProfiling then
			markSchedulerUnsuspended(p10)
		end
		var14 = false
		
		if var15 then
			var15 = false
			cancelHostTimeout()
		end
		local var27, var28
		var13 = true
		local _ = nil
		local _ = nil
		
		if reactGlobalsModule.__YOLO__ then
			var27 = true
			var28 = var17(p9, p10)
		elseif enableProfiling then
			local ok, status = xpcall(var17, describeError, p9, p10)
			var27 = ok
			var28 = status
			
			if not var27 and var11 ~= nil then
				markTaskErrored(var11, getCurrentTime())
				var11.isQueued = false
			end
		else
			var27 = true
			var28 = var17(p9, p10)
		end
		var11 = nil
		var12 = var12
		var13 = false
		
		if enableProfiling then
			markSchedulerSuspended(getCurrentTime())
		end
		if not var27 then
			error(var28)
		end
		return var28
	end
	
	var17 = function(p9, p10)
		-- upvalues: reactGlobalsModule (ref), reactFeatureFlags (ref), advanceTimers (ref), var11 (write), t (ref), enableSchedulerDebugging (ref), var10 (write), shouldYieldToHost (ref), var12 (write), markTaskRun (ref), noYieldModule (ref), getCurrentTime (ref), markTaskYield (ref), enableProfiling (ref), markTaskCompleted (ref), var3 (write), t_1 (ref), requestHostTimeout (ref), var26 (write)
		local catchYieldingInDEV = reactGlobalsModule.__DEV__ and reactFeatureFlags.catchYieldingInDEV
		local var27 = p10
		advanceTimers(var27)
		var11 = t[1]
		while var11 ~= nil and (not enableSchedulerDebugging or not var10) and (var27 >= var11.expirationTime or p9 and not shouldYieldToHost()) do
			local callback = var11.callback
			
			if typeof(callback) ~= "function" then
				local var28 = t
				local var29 = var28[1]
				
				if var29 ~= nil then
					local var30 = var28[#var28]
					var28[#var28] = nil
					
					if var30 ~= var29 then
						var28[1] = var30
						var3(var28, var30, 1)
					end
				end
				var11 = t[1]
			end
			var11.callback = nil
			var12 = var11.priorityLevel
			local var31 = var11.expirationTime <= var27
			markTaskRun(var11, var27)
			local var32 = if catchYieldingInDEV then noYieldModule(callback, var31) else callback(var31)
			var27 = getCurrentTime()
			
			if typeof(var32) == "function" then
				var11.callback = var32
				markTaskYield(var11, var27)
			elseif enableProfiling then
				markTaskCompleted(var11, var27)
				var11.isQueued = false
			end
			if var11 == t[1] then
				local var33 = t
				local var34 = var33[1]
				
				if var34 ~= nil then
					local var35 = var33[#var33]
					var33[#var33] = nil
					
					if var35 ~= var34 then
						var33[1] = var35
						var3(var33, var35, 1)
					end
				end
			end
			advanceTimers(var27)
		end
		if var11 ~= nil then
			return true
		end
		local var36 = t_1[1]
		
		if var36 ~= nil then
			requestHostTimeout(var26, var36.startTime - var27)
		end
		return false
	end
	
	return {
		unstable_ImmediatePriority = immediatePriority,
		unstable_UserBlockingPriority = userBlockingPriority,
		unstable_NormalPriority = normalPriority,
		unstable_IdlePriority = idlePriority,
		unstable_LowPriority = lowPriority,
		unstable_runWithPriority = function(p11, p12)
			-- upvalues: immediatePriority (ref), userBlockingPriority (ref), normalPriority (ref), lowPriority (ref), idlePriority (ref), var12 (write), reactGlobalsModule (ref), describeError (ref)
			if p11 ~= immediatePriority and p11 ~= userBlockingPriority and (p11 ~= normalPriority and p11 ~= lowPriority) and p11 ~= idlePriority then
				p11 = normalPriority
			end
			local var37, var38
			var12 = p11
			local _ = nil
			local _ = nil
			
			if reactGlobalsModule.__YOLO__ then
				var37 = true
				var38 = p12()
			else
				local ok, status = xpcall(p12, describeError)
				var37 = ok
				var38 = status
			end
			var12 = var12
			
			if not var37 then
				error(var38)
			end
			return var38
		end,
		unstable_next = function(p11)
			-- upvalues: var12 (write), immediatePriority (ref), userBlockingPriority (ref), normalPriority (ref), reactGlobalsModule (ref), describeError (ref)
			local var37, var38
			local _ = nil
			var12 = if var12 == immediatePriority or var12 == userBlockingPriority or var12 == normalPriority then normalPriority else var12
			local _ = nil
			local _ = nil
			
			if reactGlobalsModule.__YOLO__ then
				var37 = true
				var38 = p11()
			else
				local ok, status = xpcall(p11, describeError)
				var37 = ok
				var38 = status
			end
			var12 = var12
			
			if not var37 then
				error(var38)
			end
			return var38
		end,
		unstable_scheduleCallback = function(p11, p12, p13)
			-- upvalues: getCurrentTime (ref), immediatePriority (ref), userBlockingPriority (ref), idlePriority (ref), lowPriority (ref), var9 (write), enableProfiling (ref), t_1 (ref), var2 (write), t (ref), var15 (write), cancelHostTimeout (ref), requestHostTimeout (ref), var26 (write), markTaskStart (ref), var14 (write), var13 (write), requestHostCallback (ref), var16 (write)
			local var37
			local var38 = getCurrentTime()
			local _ = nil
			
			if typeof(p13) == "table" then
				local delay = p13.delay
				var37 = if typeof(delay) == "number" and delay > 0 then var38 + delay else var38
			else
				var37 = var38
			end
			local var39 = var37 + (if p11 == immediatePriority then -1 elseif p11 == userBlockingPriority then 250 elseif p11 == idlePriority then 1073741823 elseif p11 == lowPriority then 10000 else 5000)
			local t_2 = {
				sortIndex = -1,
				id = var9,
				callback = p12,
				priorityLevel = p11,
				startTime = var37,
				expirationTime = var39
			}
			var9 += 1
			
			if enableProfiling then
				t_2.isQueued = false
			end
			if var38 < var37 then
				t_2.sortIndex = var37
				local var40 = #t_1 + 1
				t_1[var40] = t_2
				var2(t_1, t_2, var40)
				
				if #t ~= 0 or t_2 ~= t_1[1] then
					return t_2
				end
				if var15 then
					cancelHostTimeout()
				else
					var15 = true
				end
				requestHostTimeout(var26, var37 - var38)
				
				return t_2
			else
				t_2.sortIndex = var39
				local var41 = #t + 1
				t[var41] = t_2
				var2(t, t_2, var41)
				
				if enableProfiling then
					markTaskStart(t_2, var38)
					t_2.isQueued = true
				end
				if not var14 and not var13 then
					var14 = true
					requestHostCallback(var16)
				end
			end
		end,
		unstable_cancelCallback = function(p11)
			-- upvalues: enableProfiling (ref), getCurrentTime (ref), markTaskCanceled (ref)
			if enableProfiling and p11.isQueued then
				markTaskCanceled(p11, getCurrentTime())
				p11.isQueued = false
			end
			p11.callback = nil
		end,
		unstable_wrapCallback = function(p11)
			-- upvalues: var12 (write), reactGlobalsModule (ref), describeError (ref)
			return function(...)
				-- upvalues: var12 (copy), var12 (ref), reactGlobalsModule (copy), p11 (ref), describeError (copy)
				local var37, var38
				var12 = var12
				local _ = nil
				local _ = nil
				
				if reactGlobalsModule.__YOLO__ then
					var37 = true
					var38 = p11(...)
				else
					local ok, status = xpcall(p11, describeError, ...)
					var37 = ok
					var38 = status
				end
				var12 = var12
				
				if not var37 then
					error(var38)
				end
				return var38
			end
		end,
		unstable_getCurrentPriorityLevel = function()
			-- upvalues: var12 (write)
			return var12
		end,
		unstable_shouldYield = shouldYieldToHost,
		unstable_requestPaint = requestPaint,
		unstable_continueExecution = function()
			-- upvalues: var10 (write), var14 (write), var13 (write), requestHostCallback (ref), var16 (write)
			var10 = false
			
			if not var14 and not var13 then
				var14 = true
				requestHostCallback(var16)
			end
		end,
		unstable_pauseExecution = function()
			-- upvalues: var10 (write)
			var10 = true
		end,
		unstable_getFirstCallbackNode = function()
			-- upvalues: t (ref)
			return t[1]
		end,
		unstable_now = getCurrentTime,
		unstable_forceFrameRate = forceFrameRate,
		unstable_setSchedulerFlags = setSchedulerFlags,
		unstable_getSchedulerFlags = getSchedulerFlags,
		unstable_Profiling = if enableProfiling then {
			startLoggingProfilingEvents = startLoggingProfilingEvents,
			stopLoggingProfilingEvents = stopLoggingProfilingEvents
		} else nil
	}
end