local parent = script.Parent.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local object = luauPolyfillModule.Object
local sharedModule = require(parent.Shared)
local console = sharedModule.console
local errorToString = sharedModule.errorToString
local describeError = sharedModule.describeError
local safeFlagsModule = require(parent.SafeFlags)

local var4 = function() --[[ line: 22 ]]
	return os.clock() * 1000
end

local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout
local var5 = false
local var6 = nil
local none = object.None
local reactSchedulerYieldInterval2 = safeFlagsModule.createGetFInt("ReactSchedulerYieldInterval2", 15)
local var8 = safeFlagsModule.createGetFInt("ReactSchedulerDesiredFrameRate", 60)()
local var9 = safeFlagsModule.createGetFInt("ReactSchedulerMinFrameRate", 30)()
local var10 = safeFlagsModule.createGetFFlag("ReactSchedulerEnableDeferredWork")()
local var11 = safeFlagsModule.createGetFFlag("ReactSchedulerSetFrameMarkerOnHeartbeatEnd")()
local var12 = safeFlagsModule.createGetFFlag("ReactSchedulerSetTargetMsByHeartbeatDelta")()
local var13 = safeFlagsModule.createGetFInt("ReactSchedulerNumberOfLookbackFrames", 1)()
local var14 = safeFlagsModule.createGetFFlag("ReactSchedulerLookbackUseRingBuffer")()
local var15 = false
local var16 = 0
local var17 = 1000 / var8
local var18 = 1000 / var9
local var19 = var17
local var20 = var19
local heartbeatConnection = nil
local var22 = if var14 then table.create(var13) else nil
local var23 = 1

local function _() --[[ line: 71 | named "resetFrameBudgets" ]]
	-- upvalues: var17 (write), var8 (write), var18 (write), var9 (write), var19 (write), var20 (write)
	var17 = 1000 / var8
	var18 = 1000 / var9
	var19 = var17
	var20 = var19
end

local _ = function() --[[ line: 78 | named "createHeartbeatConnection" ]]
	-- upvalues: heartbeatConnection (write), var13 (write), var14 (write), var22 (ref), var23 (write), var20 (write), var19 (write), var17 (write), var18 (write)
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
	end
	heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(p0) --[[ line: 83 ]]
		-- upvalues: var13 (copy), var14 (copy), var22 (copy), var23 (copy), var20 (copy), var19 (copy), var17 (copy), var18 (copy)
		if var13 <= 1 then
			var19 = math.clamp(p0 * 1000, var17, var18)
			
			return
		elseif var14 then
			var22[var23] = p0 * 1000
			var23 = var23 % var13 + 1
			local var35 = 0
			local var36 = var13
			
			for i = 1, var36 do
				if var22[i] ~= nil then
					var36 = i - 1
					break
				end
				var35 += var22[i]
			end
			var20 = var35 / var36
		else
			local var37 = var13
			var20 = (var20 * (var37 - 1) + p0 * 1000) / var37
		end
		var19 = math.clamp(var20, var17, var18)
	end)
end

if var12 then
	heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(p1) --[[ line: 83 ]]
		-- upvalues: var13 (write), var14 (write), var22 (ref), var23 (write), var20 (write), var19 (write), var17 (write), var18 (write)
		if var13 <= 1 then
			var19 = math.clamp(p1 * 1000, var17, var18)
			
			return
		elseif var14 then
			var22[var23] = p1 * 1000
			var23 = var23 % var13 + 1
			local var35 = 0
			
			for i = 1, var13 do
				if var22[i] == nil then
					local var36 = i - 1
					break
				end
				var35 += var22[i]
			end
			var20 = var35 / var36
			var19 = math.clamp(var20, var17, var18)
			
			return
		else
			local var37 = var13
			var20 = (var20 * (var37 - 1) + p1 * 1000) / var37
		end
	end)
end
local function setFrameMarker() --[[ line: 125 ]]
	-- upvalues: var16 (write)
	var16 = os.clock() * 1000
end

local var25 = reactSchedulerYieldInterval2()
local var26 = 0

local function setSchedulerFlags(value) --[[ line: 147 ]]
	-- upvalues: var25 (write), var8 (write), var17 (write), var18 (write), var9 (write), var19 (write), var20 (write), var10 (write), var11 (write), var12 (write), heartbeatConnection (write), var13 (write), var14 (write), var22 (ref), var23 (write)
	if value.yieldInterval ~= nil then
		var25 = value.yieldInterval
	end
	if value.desiredFrameRate ~= nil then
		var8 = value.desiredFrameRate
		var17 = 1000 / var8
		var18 = 1000 / var9
		var19 = var17
		var20 = var19
	end
	if value.minimumFrameRate ~= nil then
		var9 = value.minimumFrameRate
		var17 = 1000 / var8
		var18 = 1000 / var9
		var19 = var17
		var20 = var19
	end
	if value.deferredWork ~= nil then
		var10 = value.deferredWork
	end
	if value.heartbeatFrameMarker ~= nil then
		var11 = value.heartbeatFrameMarker
	end
	if value.targetMsByHeartbeatDelta ~= nil then
		var12 = value.targetMsByHeartbeatDelta
		
		if value.targetMsByHeartbeatDelta then
			if heartbeatConnection then
				heartbeatConnection:Disconnect()
			end
			heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(p2) --[[ line: 83 ]]
				-- upvalues: var13 (copy), var14 (copy), var22 (copy), var23 (copy), var20 (copy), var19 (copy), var17 (copy), var18 (copy)
				if var13 <= 1 then
					var19 = math.clamp(p2 * 1000, var17, var18)
					
					return
				elseif var14 then
					var22[var23] = p2 * 1000
					var23 = var23 % var13 + 1
					local var35 = 0
					
					for i = 1, var13 do
						if var22[i] == nil then
							local var36 = i - 1
							break
						end
						var35 += var22[i]
					end
					var20 = var35 / var36
					var19 = math.clamp(var20, var17, var18)
					
					return
				else
					local var37 = var13
					var20 = (var20 * (var37 - 1) + p2 * 1000) / var37
				end
			end)
		elseif heartbeatConnection then
			heartbeatConnection:Disconnect()
			heartbeatConnection = nil
			var19 = var17
		end
	end
	if value.numberOfLookbackFrames ~= nil then
		var13 = value.numberOfLookbackFrames
	end
	if value.lookbackUseRingBuffer ~= nil then
		var14 = value.lookbackUseRingBuffer
	end
end

local function getSchedulerFlags() --[[ line: 185 ]]
	-- upvalues: var25 (write), var8 (write), var9 (write), var10 (write), var11 (write), var12 (write), var13 (write), var14 (write)
	return {
		yieldInterval = var25,
		desiredFrameRate = var8,
		minimumFrameRate = var9,
		deferredWork = var10,
		heartbeatFrameMarker = var11,
		targetMsByHeartbeatDelta = var12,
		numberOfLookbackFrames = var13,
		lookbackUseRingBuffer = var14
	}
end

local _ = function() --[[ line: 198 | named "doesBudgetRemain" ]]
	-- upvalues: var16 (write), var19 (write), var25 (write)
	return var25 < var19 - (os.clock() * 1000 - var16)
end

local function shouldYieldToHost() --[[ line: 206 ]]
	-- upvalues: var26 (write)
	return var26 <= os.clock() * 1000
end

local function requestPaint() --[[ line: 211 ]] end

local function forceFrameRate(p3) --[[ line: 213 ]]
	-- upvalues: console (ref), var25 (write)
	if p3 < 0 or p3 > 125 then
		console.warn("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported")
		
		return
	elseif p3 > 0 then
		var25 = math.floor(1000 / p3)
		
		return
	end
	var25 = 5
end

local function performWorkUntilDeadline() --[[ line: 229 ]]
	-- upvalues: var6 (write), var26 (write), var25 (write), var10 (write), var11 (write), var15 (write), var16 (write), var19 (write), var5 (write), performWorkUntilDeadline (write), setFrameMarker (ref), reactGlobalsModule (ref), describeError (ref), errorToString (ref)
	if var6 == nil then
		var5 = false
		
		return
	end
	local var38 = os.clock() * 1000
	var26 = var38 + var25
	local var39 = true
	
	if var10 and not var11 and not var15 then
		var16 = var38
	end
	if var11 and var15 and var25 >= var19 - (os.clock() * 1000 - var16) then
		var39 = false
	end
	local var41, var42
	local _ = nil
	local _ = nil
	
	local function doWork() --[[ line: 259 ]]
		-- upvalues: var6 (copy), var39 (write), var38 (ref), var5 (copy), var10 (copy), var16 (copy), var19 (copy), var25 (copy), var15 (copy), performWorkUntilDeadline (copy), var11 (copy), setFrameMarker (copy)
		if not var6(var39, var38) then
			var5 = false
			var6 = nil
		elseif not var10 then
			task.delay(0, performWorkUntilDeadline)
		elseif var25 < var19 - (os.clock() * 1000 - var16) then
			var15 = true
			task.defer(performWorkUntilDeadline)
		else
			var15 = false
			task.delay(0, performWorkUntilDeadline)
			
			if var11 then
				task.defer(setFrameMarker)
			end
		end
		return nil
	end
	
	if reactGlobalsModule.__YOLO__ then
		var42 = doWork()
		var41 = true
	else
		local ok, status = xpcall(doWork, describeError)
		var41 = ok
		var42 = status
	end
	if not var41 then
		task.delay(0, performWorkUntilDeadline)
		
		if var11 then
			task.defer(setFrameMarker)
		end
		error(errorToString(var42))
	end
end

local _ = function(p4) --[[ line: 320 | named "wrapPerformWorkWithCoroutine" ]]
	local thread = coroutine.create(function() --[[ line: 321 ]]
		-- upvalues: p4 (ref)
		while true do
			local ok, status = pcall(coroutine.wrap(p4))
			coroutine.yield(ok, status)
		end
	end)
	
	return function() --[[ line: 331 ]]
		-- upvalues: thread (ref)
		local _, var44, var45 = coroutine.resume(thread)
		
		if not var44 then
			error(var45)
		end
	end
end

local var33 = performWorkUntilDeadline
local thread = coroutine.create(function() --[[ line: 321 ]]
	-- upvalues: var33 (ref)
	while true do
		local ok, status = pcall(coroutine.wrap(var33))
		coroutine.yield(ok, status)
	end
end)

performWorkUntilDeadline = function() --[[ line: 331 ]]
	-- upvalues: thread (ref)
	local _, var44, var45 = coroutine.resume(thread)
	
	if not var44 then
		error(var45)
	end
end

return {
	requestHostCallback = function(p5) --[[ line: 341 ]]
		-- upvalues: var6 (write), var5 (write), performWorkUntilDeadline (write), var11 (write), setFrameMarker (ref)
		var6 = p5
		
		if not var5 then
			var5 = true
			task.delay(0, performWorkUntilDeadline)
			
			if var11 then
				task.defer(setFrameMarker)
			end
		end
	end,
	cancelHostCallback = function() --[[ line: 353 ]]
		-- upvalues: var6 (write)
		var6 = nil
	end,
	requestHostTimeout = function(p6, p7) --[[ line: 357 ]]
		-- upvalues: none (write), setTimeout (ref)
		none = setTimeout(function() --[[ line: 358 ]]
			-- upvalues: p6 (ref)
			p6(os.clock() * 1000)
		end, p7)
	end,
	cancelHostTimeout = function() --[[ line: 363 ]]
		-- upvalues: clearTimeout (ref), none (write), object (ref)
		clearTimeout(none)
		none = object.None
	end,
	shouldYieldToHost = shouldYieldToHost,
	requestPaint = requestPaint,
	getCurrentTime = var4,
	forceFrameRate = forceFrameRate,
	setSchedulerFlags = setSchedulerFlags,
	getSchedulerFlags = getSchedulerFlags
}