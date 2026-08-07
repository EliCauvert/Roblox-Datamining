-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:11 2026 Pacific Standard Time.

return function(p0) --[[ line: 12 ]]
	local parent = script.Parent.Parent
	local reactGlobalsModule = require(parent.ReactGlobals)
	local sharedModule = require(parent.Shared)
	local describeError = sharedModule.describeError
	local reactFeatureFlags = sharedModule.ReactFeatureFlags
	local schedulerFeatureFlagsModule = require(script.Parent.SchedulerFeatureFlags)
	local enableSchedulerDebugging = schedulerFeatureFlagsModule.enableSchedulerDebugging
	local enableProfiling = schedulerFeatureFlagsModule.enableProfiling
	p0 = p0 or require(script.Parent.SchedulerHostConfig)
	local requestHostCallback = p0.requestHostCallback
	local requestHostTimeout = p0.requestHostTimeout
	local cancelHostTimeout = p0.cancelHostTimeout
	local shouldYieldToHost = p0.shouldYieldToHost
	local getCurrentTime = p0.getCurrentTime
	local forceFrameRate = p0.forceFrameRate
	local requestPaint = p0.requestPaint
	local setSchedulerFlags = p0.setSchedulerFlags
	local getSchedulerFlags = p0.getSchedulerFlags
	local noYieldModule = require(script.Parent.NoYield)
	local var5 = nil
	local var6 = nil
	local var7 = nil
	
	local _ = function(p1, p2) --[[ line: 51 ]]
		-- upvalues: var6 (write)
		local var23 = #p1 + 1
		p1[var23] = p2
		var6(p1, p2, var23)
	end
	
	local _ = function(p3) --[[ line: 58 ]]
		return p3[1]
	end
	
	local _ = function(p4) --[[ line: 62 ]]
		-- upvalues: var7 (write)
		local var24 = p4[1]
		
		if var24 == nil then
			return nil
		end
		local var25 = p4[#p4]
		p4[#p4] = nil
		
		if var25 ~= var24 then
			p4[1] = var25
			var7(p4, var25, 1)
		end
		return var24
	end
	
	var6 = function(p5, p6, p7) --[[ line: 78 ]]
		-- upvalues: var5 (write)
		local floored, var27
		while true do
			floored = math.floor(p7 / 2)
			var27 = p5[floored]
			if var27 ~= nil and var5(var27, p6) > 0 then
				return
			end
			p5[floored] = p6
			p5[p7] = var27
			_ = floored
		end
	end
	
	var7 = function(p8, p9, p10) --[[ line: 94 ]]
		-- upvalues: var5 (write)
		local var31, var32
		local p8Count = #p8
		while p10 < p8Count do
			local var29 = p10 * 2
			local var30 = p8[var29]
			var31 = var29 + 1
			var32 = p8[var31]
			
			if var30 == nil or var5(var30, p9) >= 0 then
				if var32 ~= nil and var5(var32, p9) < 0 then
					return
				end
				p8[p10] = var32
				p8[var31] = p9
				p10 = var31
			elseif var32 == nil or var5(var32, var30) >= 0 then
				p8[p10] = var30
				p8[var29] = p9
				p10 = var29
			else
				p8[p10] = var32
				p8[var31] = p9
				p10 = var31
			end
		end
	end
	
	var5 = function(p11, p12) --[[ line: 124 ]]
		local var33 = p11.sortIndex - p12.sortIndex
		
		return if var33 == 0 then p11.id - p12.id else var33
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
	local var12 = 1
	local var13 = false
	local var14 = nil
	local var15 = normalPriority
	local var16 = false
	local var17 = false
	local var18 = false
	local _ = nil
	local var19 = nil
	local var20 = nil
	
	local function advanceTimers(p13) --[[ line: 191 ]]
		-- upvalues: t_1 (ref), var7 (write), t (ref), var6 (write), enableProfiling (ref), markTaskStart (ref)
		local var34 = t_1[1]
		while var34 ~= nil do
			if var34.callback == nil then
				local var35 = t_1
				local var36 = var35[1]
				
				if var36 ~= nil then
					local var37 = var35[#var35]
					var35[#var35] = nil
					
					if var37 ~= var36 then
						var35[1] = var37
						var7(var35, var37, 1)
					end
				end
				var34 = t_1[1]
			end
			if var34.startTime <= p13 then
				local var38 = t_1[1]
				
				if var38 ~= nil then
					local var39 = t_1[#t_1]
					t_1[#t_1] = nil
					
					if var39 ~= var38 then
						t_1[1] = var39
						var7(t_1, var39, 1)
					end
				end
				var34.sortIndex = var34.expirationTime
				local var40 = var34
				local var41 = #t + 1
				t[var41] = var40
				var6(t, var40, var41)
				
				if enableProfiling then
					markTaskStart(var34, p13)
					var34.isQueued = true
				end
			end
			return
		end
	end
	
	local var22 = function(p14) --[[ line: 217 ]]
		-- upvalues: var18 (write), advanceTimers (ref), var17 (write), t (ref), requestHostCallback (ref), var19 (write), t_1 (ref), requestHostTimeout (ref), var22 (write)
		var18 = false
		advanceTimers(p14)
		
		if not var17 then
			if t[1] ~= nil then
				var17 = true
				requestHostCallback(var19)
				
				return
			end
			local var42 = t_1[1]
			
			if var42 ~= nil then
				requestHostTimeout(var22, var42.startTime - p14)
			end
		end
	end
	
	var19 = function(p15, p16) --[[ line: 234 ]]
		-- upvalues: enableProfiling (ref), markSchedulerUnsuspended (ref), var17 (write), var18 (write), cancelHostTimeout (ref), var16 (write), var15 (write), reactGlobalsModule (ref), var20 (write), describeError (ref), var14 (write), getCurrentTime (ref), markTaskErrored (ref), markSchedulerSuspended (ref)
		if enableProfiling then
			markSchedulerUnsuspended(p16)
		end
		var17 = false
		
		if var18 then
			var18 = false
			cancelHostTimeout()
		end
		local var43, var44
		var16 = true
		local _ = nil
		local _ = nil
		
		if reactGlobalsModule.__YOLO__ then
			var43 = true
			var44 = var20(p15, p16)
		elseif enableProfiling then
			local ok, status = xpcall(var20, describeError, p15, p16)
			var43 = ok
			var44 = status
			
			if not var43 and var14 ~= nil then
				markTaskErrored(var14, getCurrentTime())
				var14.isQueued = false
			end
		else
			var43 = true
			var44 = var20(p15, p16)
		end
		var14 = nil
		var15 = var15
		var16 = false
		
		if enableProfiling then
			markSchedulerSuspended(getCurrentTime())
		end
		if not var43 then
			error(var44)
		end
		return var44
	end
	
	var20 = function(p17, p18) --[[ line: 291 ]]
		-- upvalues: reactGlobalsModule (ref), reactFeatureFlags (ref), advanceTimers (ref), var14 (write), t (ref), enableSchedulerDebugging (ref), var13 (write), shouldYieldToHost (ref), var15 (write), markTaskRun (ref), noYieldModule (ref), getCurrentTime (ref), markTaskYield (ref), enableProfiling (ref), markTaskCompleted (ref), var7 (write), t_1 (ref), requestHostTimeout (ref), var22 (write)
		local catchYieldingInDEV = reactGlobalsModule.__DEV__ and reactFeatureFlags.catchYieldingInDEV
		local var46 = p18
		advanceTimers(var46)
		var14 = t[1]
		while var14 ~= nil and (not enableSchedulerDebugging or not var13) and (var46 >= var14.expirationTime or p17 and not shouldYieldToHost()) do
			local callback = var14.callback
			
			if typeof(callback) ~= "function" then
				local var52 = t
				local var53 = var52[1]
				
				if var53 ~= nil then
					local var54 = var52[#var52]
					var52[#var52] = nil
					
					if var54 ~= var53 then
						var52[1] = var54
						var7(var52, var54, 1)
					end
				end
				var14 = t[1]
			end
			var14.callback = nil
			var15 = var14.priorityLevel
			local var47 = var14.expirationTime <= var46
			markTaskRun(var14, var46)
			local var48 = if catchYieldingInDEV then noYieldModule(callback, var47) else callback(var47)
			var46 = getCurrentTime()
			
			if typeof(var48) == "function" then
				var14.callback = var48
				markTaskYield(var14, var46)
			elseif enableProfiling then
				markTaskCompleted(var14, var46)
				var14.isQueued = false
			end
			if var14 == t[1] then
				local var49 = t
				local var50 = var49[1]
				
				if var50 ~= nil then
					local var51 = var49[#var49]
					var49[#var49] = nil
					
					if var51 ~= var50 then
						var49[1] = var51
						var7(var49, var51, 1)
					end
				end
			end
			advanceTimers(var46)
		end
		if var14 ~= nil then
			return true
		end
		local var55 = t_1[1]
		
		if var55 ~= nil then
			requestHostTimeout(var22, var55.startTime - var46)
		end
		return false
	end
	
	return {
		unstable_ImmediatePriority = immediatePriority,
		unstable_UserBlockingPriority = userBlockingPriority,
		unstable_NormalPriority = normalPriority,
		unstable_IdlePriority = idlePriority,
		unstable_LowPriority = lowPriority,
		unstable_runWithPriority = function(p19, p20) --[[ line: 358 ]]
			-- upvalues: immediatePriority (ref), userBlockingPriority (ref), normalPriority (ref), lowPriority (ref), idlePriority (ref), var15 (write), reactGlobalsModule (ref), describeError (ref)
			if p19 ~= immediatePriority and p19 ~= userBlockingPriority and (p19 ~= normalPriority and p19 ~= lowPriority) and p19 ~= idlePriority then
				p19 = normalPriority
			end
			local var56, var57
			var15 = p19
			local _ = nil
			local _ = nil
			
			if reactGlobalsModule.__YOLO__ then
				var56 = true
				var57 = p20()
			else
				local ok, status = xpcall(p20, describeError)
				var56 = ok
				var57 = status
			end
			var15 = var15
			
			if not var56 then
				error(var57)
			end
			return var57
		end,
		unstable_next = function(p21) --[[ line: 393 ]]
			-- upvalues: var15 (write), immediatePriority (ref), userBlockingPriority (ref), normalPriority (ref), reactGlobalsModule (ref), describeError (ref)
			local var58, var59
			local _ = nil
			var15 = if var15 == immediatePriority or var15 == userBlockingPriority or var15 == normalPriority then normalPriority else var15
			local _ = nil
			local _ = nil
			
			if reactGlobalsModule.__YOLO__ then
				var58 = true
				var59 = p21()
			else
				local ok, status = xpcall(p21, describeError)
				var58 = ok
				var59 = status
			end
			var15 = var15
			
			if not var58 then
				error(var59)
			end
			return var59
		end,
		unstable_scheduleCallback = function(p22, p23, p24) --[[ line: 457 ]]
			-- upvalues: getCurrentTime (ref), immediatePriority (ref), userBlockingPriority (ref), idlePriority (ref), lowPriority (ref), var12 (write), enableProfiling (ref), t_1 (ref), var6 (write), t (ref), var18 (write), cancelHostTimeout (ref), requestHostTimeout (ref), var22 (write), markTaskStart (ref), var17 (write), var16 (write), requestHostCallback (ref), var19 (write)
			local var61
			local var60 = getCurrentTime()
			local _ = nil
			
			if typeof(p24) == "table" then
				local delay = p24.delay
				var61 = if typeof(delay) == "number" and delay > 0 then var60 + delay else var60
			else
				var61 = var60
			end
			local var62 = var61 + (if p22 == immediatePriority then -1 elseif p22 == userBlockingPriority then 250 elseif p22 == idlePriority then 1073741823 elseif p22 == lowPriority then 10000 else 5000)
			local t_2 = {
				sortIndex = -1,
				id = var12,
				callback = p23,
				priorityLevel = p22,
				startTime = var61,
				expirationTime = var62
			}
			var12 += 1
			
			if enableProfiling then
				t_2.isQueued = false
			end
			if var60 < var61 then
				t_2.sortIndex = var61
				local var64 = #t_1 + 1
				t_1[var64] = t_2
				var6(t_1, t_2, var64)
				
				if #t ~= 0 or t_2 ~= t_1[1] then
					return t_2
				end
				if var18 then
					cancelHostTimeout()
				else
					var18 = true
				end
				requestHostTimeout(var22, var61 - var60)
				
				return t_2
			else
				t_2.sortIndex = var62
				local var65 = #t + 1
				t[var65] = t_2
				var6(t, t_2, var65)
				
				if enableProfiling then
					markTaskStart(t_2, var60)
					t_2.isQueued = true
				end
				if not var17 and not var16 then
					var17 = true
					requestHostCallback(var19)
				end
			end
		end,
		unstable_cancelCallback = function(p25) --[[ line: 553 ]]
			-- upvalues: enableProfiling (ref), getCurrentTime (ref), markTaskCanceled (ref)
			if enableProfiling and p25.isQueued then
				markTaskCanceled(p25, getCurrentTime())
				p25.isQueued = false
			end
			p25.callback = nil
		end,
		unstable_wrapCallback = function(p26) --[[ line: 429 ]]
			-- upvalues: var15 (write), reactGlobalsModule (ref), describeError (ref)
			return function(...) --[[ line: 432 ]]
				-- upvalues: var15 (copy), var15 (ref), reactGlobalsModule (copy), p26 (ref), describeError (copy)
				local var66, var67
				var15 = var15
				local _ = nil
				local _ = nil
				
				if reactGlobalsModule.__YOLO__ then
					var66 = true
					var67 = p26(...)
				else
					local ok, status = xpcall(p26, describeError, ...)
					var66 = ok
					var67 = status
				end
				var15 = var15
				
				if not var66 then
					error(var67)
				end
				return var67
			end
		end,
		unstable_getCurrentPriorityLevel = function() --[[ line: 568 ]]
			-- upvalues: var15 (write)
			return var15
		end,
		unstable_shouldYield = shouldYieldToHost,
		unstable_requestPaint = requestPaint,
		unstable_continueExecution = function() --[[ line: 541 ]]
			-- upvalues: var13 (write), var17 (write), var16 (write), requestHostCallback (ref), var19 (write)
			var13 = false
			
			if not var17 and not var16 then
				var17 = true
				requestHostCallback(var19)
			end
		end,
		unstable_pauseExecution = function() --[[ line: 537 ]]
			-- upvalues: var13 (write)
			var13 = true
		end,
		unstable_getFirstCallbackNode = function() --[[ line: 549 ]]
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