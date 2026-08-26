local parent = script.Parent.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local object = luauPolyfillModule.Object
local sharedModule = require(parent.Shared)
local console = sharedModule.console
local errorToString = sharedModule.errorToString
local describeError = sharedModule.describeError
local safeFlagsModule = require(parent.SafeFlags)

local var1 = function()
	return os.clock() * 1000
end

local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout
local var2 = false
local var3 = nil
local none = object.None
local reactSchedulerYieldInterval2 = safeFlagsModule.createGetFInt("ReactSchedulerYieldInterval2", 15)
local var4 = safeFlagsModule.createGetFInt("ReactSchedulerDesiredFrameRate", 60)()
local var5 = safeFlagsModule.createGetFInt("ReactSchedulerMinFrameRate", 30)()
local var6 = safeFlagsModule.createGetFFlag("ReactSchedulerEnableDeferredWork")()
local var7 = safeFlagsModule.createGetFFlag("ReactSchedulerSetFrameMarkerOnHeartbeatEnd")()
local var8 = safeFlagsModule.createGetFFlag("ReactSchedulerSetTargetMsByHeartbeatDelta")()
local var9 = safeFlagsModule.createGetFInt("ReactSchedulerNumberOfLookbackFrames", 1)()
local var10 = safeFlagsModule.createGetFFlag("ReactSchedulerLookbackUseRingBuffer")()
local var11 = false
local var12 = 0
local var13 = 1000 / var4
local var14 = 1000 / var5
local var15 = var13
local var16 = var15
local heartbeatConnection = nil
local var17 = if var10 then table.create(var9) else nil
local var18 = 1

local function _()
	-- upvalues: var13 (write), var4 (write), var14 (write), var5 (write), var15 (write), var16 (write)
	var13 = 1000 / var4
	var14 = 1000 / var5
	var15 = var13
	var16 = var15
end

local _ = function()
	-- upvalues: heartbeatConnection (write), var9 (write), var10 (write), var17 (ref), var18 (write), var16 (write), var15 (write), var13 (write), var14 (write)
	if heartbeatConnection then
		heartbeatConnection:Disconnect()
	end
	heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(p1)
		-- upvalues: var9 (copy), var10 (copy), var17 (copy), var18 (copy), var16 (copy), var15 (copy), var13 (copy), var14 (copy)
		if var9 <= 1 then
			var15 = math.clamp(p1 * 1000, var13, var14)
			
			return
		elseif var10 then
			var17[var18] = p1 * 1000
			var18 = var18 % var9 + 1
			local var19 = 0
			local var20 = var9
			
			for i = 1, var20 do
				if var17[i] ~= nil then
					var20 = i - 1
					break
				end
				var19 += var17[i]
			end
			var16 = var19 / var20
		else
			local var21 = var9
			var16 = (var16 * (var21 - 1) + p1 * 1000) / var21
		end
		var15 = math.clamp(var16, var13, var14)
	end)
end

if var8 then
	heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(p1)
		-- upvalues: var9 (write), var10 (write), var17 (ref), var18 (write), var16 (write), var15 (write), var13 (write), var14 (write)
		if var9 <= 1 then
			var15 = math.clamp(p1 * 1000, var13, var14)
			
			return
		elseif var10 then
			var17[var18] = p1 * 1000
			var18 = var18 % var9 + 1
			local var19 = 0
			
			for i = 1, var9 do
				if var17[i] == nil then
					local var20 = i - 1
					break
				end
				var19 += var17[i]
			end
			var16 = var19 / var20
			var15 = math.clamp(var16, var13, var14)
			
			return
		else
			local var21 = var9
			var16 = (var16 * (var21 - 1) + p1 * 1000) / var21
		end
	end)
end
local function setFrameMarker()
	-- upvalues: var12 (write)
	var12 = os.clock() * 1000
end

local var19 = reactSchedulerYieldInterval2()
local var20 = 0

local function setSchedulerFlags(value)
	-- upvalues: var19 (write), var4 (write), var13 (write), var14 (write), var5 (write), var15 (write), var16 (write), var6 (write), var7 (write), var8 (write), heartbeatConnection (write), var9 (write), var10 (write), var17 (ref), var18 (write)
	if value.yieldInterval ~= nil then
		var19 = value.yieldInterval
	end
	if value.desiredFrameRate ~= nil then
		var4 = value.desiredFrameRate
		var13 = 1000 / var4
		var14 = 1000 / var5
		var15 = var13
		var16 = var15
	end
	if value.minimumFrameRate ~= nil then
		var5 = value.minimumFrameRate
		var13 = 1000 / var4
		var14 = 1000 / var5
		var15 = var13
		var16 = var15
	end
	if value.deferredWork ~= nil then
		var6 = value.deferredWork
	end
	if value.heartbeatFrameMarker ~= nil then
		var7 = value.heartbeatFrameMarker
	end
	if value.targetMsByHeartbeatDelta ~= nil then
		var8 = value.targetMsByHeartbeatDelta
		
		if value.targetMsByHeartbeatDelta then
			if heartbeatConnection then
				heartbeatConnection:Disconnect()
			end
			heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function(p1)
				-- upvalues: var9 (copy), var10 (copy), var17 (copy), var18 (copy), var16 (copy), var15 (copy), var13 (copy), var14 (copy)
				if var9 <= 1 then
					var15 = math.clamp(p1 * 1000, var13, var14)
					
					return
				elseif var10 then
					var17[var18] = p1 * 1000
					var18 = var18 % var9 + 1
					local var21 = 0
					
					for i = 1, var9 do
						if var17[i] == nil then
							local var22 = i - 1
							break
						end
						var21 += var17[i]
					end
					var16 = var21 / var22
					var15 = math.clamp(var16, var13, var14)
					
					return
				else
					local var23 = var9
					var16 = (var16 * (var23 - 1) + p1 * 1000) / var23
				end
			end)
		elseif heartbeatConnection then
			heartbeatConnection:Disconnect()
			heartbeatConnection = nil
			var15 = var13
		end
	end
	if value.numberOfLookbackFrames ~= nil then
		var9 = value.numberOfLookbackFrames
	end
	if value.lookbackUseRingBuffer ~= nil then
		var10 = value.lookbackUseRingBuffer
	end
end

local function getSchedulerFlags()
	-- upvalues: var19 (write), var4 (write), var5 (write), var6 (write), var7 (write), var8 (write), var9 (write), var10 (write)
	return {
		yieldInterval = var19,
		desiredFrameRate = var4,
		minimumFrameRate = var5,
		deferredWork = var6,
		heartbeatFrameMarker = var7,
		targetMsByHeartbeatDelta = var8,
		numberOfLookbackFrames = var9,
		lookbackUseRingBuffer = var10
	}
end

local _ = function()
	-- upvalues: var12 (write), var15 (write), var19 (write)
	return var19 < var15 - (os.clock() * 1000 - var12)
end

local function shouldYieldToHost()
	-- upvalues: var20 (write)
	return var20 <= os.clock() * 1000
end

local function requestPaint() end

local function forceFrameRate(p1)
	-- upvalues: console (ref), var19 (write)
	if p1 < 0 or p1 > 125 then
		console.warn("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported")
		
		return
	elseif p1 > 0 then
		var19 = math.floor(1000 / p1)
		
		return
	end
	var19 = 5
end

local function performWorkUntilDeadline()
	-- upvalues: var3 (write), var20 (write), var19 (write), var6 (write), var7 (write), var11 (write), var12 (write), var15 (write), var2 (write), performWorkUntilDeadline (write), setFrameMarker (ref), reactGlobalsModule (ref), describeError (ref), errorToString (ref)
	if var3 == nil then
		var2 = false
		
		return
	end
	local var21 = os.clock() * 1000
	var20 = var21 + var19
	local var22 = true
	
	if var6 and not var7 and not var11 then
		var12 = var21
	end
	if var7 and var11 and var19 >= var15 - (os.clock() * 1000 - var12) then
		var22 = false
	end
	local var23, var24
	local _ = nil
	local _ = nil
	
	local function doWork()
		-- upvalues: var3 (copy), var22 (write), var21 (ref), var2 (copy), var6 (copy), var12 (copy), var15 (copy), var19 (copy), var11 (copy), performWorkUntilDeadline (copy), var7 (copy), setFrameMarker (copy)
		if not var3(var22, var21) then
			var2 = false
			var3 = nil
		elseif not var6 then
			task.delay(0, performWorkUntilDeadline)
		elseif var19 < var15 - (os.clock() * 1000 - var12) then
			var11 = true
			task.defer(performWorkUntilDeadline)
		else
			var11 = false
			task.delay(0, performWorkUntilDeadline)
			
			if var7 then
				task.defer(setFrameMarker)
			end
		end
		return nil
	end
	
	if reactGlobalsModule.__YOLO__ then
		var24 = doWork()
		var23 = true
	else
		local ok, status = xpcall(doWork, describeError)
		var23 = ok
		var24 = status
	end
	if not var23 then
		task.delay(0, performWorkUntilDeadline)
		
		if var7 then
			task.defer(setFrameMarker)
		end
		error(errorToString(var24))
	end
end

local _ = function(p1)
	local thread = coroutine.create(function()
		-- upvalues: p1 (ref)
		while true do
			local ok, status = pcall(coroutine.wrap(p1))
			coroutine.yield(ok, status)
		end
	end)
	
	return function()
		-- upvalues: thread (ref)
		local _, var21, var22 = coroutine.resume(thread)
		
		if not var21 then
			error(var22)
		end
	end
end

local var21 = performWorkUntilDeadline
local thread = coroutine.create(function()
	-- upvalues: var21 (ref)
	while true do
		local ok, status = pcall(coroutine.wrap(var21))
		coroutine.yield(ok, status)
	end
end)

performWorkUntilDeadline = function()
	-- upvalues: thread (ref)
	local _, var22, var23 = coroutine.resume(thread)
	
	if not var22 then
		error(var23)
	end
end

return {
	requestHostCallback = function(p2)
		-- upvalues: var3 (write), var2 (write), performWorkUntilDeadline (write), var7 (write), setFrameMarker (ref)
		var3 = p2
		
		if not var2 then
			var2 = true
			task.delay(0, performWorkUntilDeadline)
			
			if var7 then
				task.defer(setFrameMarker)
			end
		end
	end,
	cancelHostCallback = function()
		-- upvalues: var3 (write)
		var3 = nil
	end,
	requestHostTimeout = function(p2, p3)
		-- upvalues: none (write), setTimeout (ref)
		none = setTimeout(function()
			-- upvalues: p2 (ref)
			p2(os.clock() * 1000)
		end, p3)
	end,
	cancelHostTimeout = function()
		-- upvalues: clearTimeout (ref), none (write), object (ref)
		clearTimeout(none)
		none = object.None
	end,
	shouldYieldToHost = shouldYieldToHost,
	requestPaint = requestPaint,
	getCurrentTime = var1,
	forceFrameRate = forceFrameRate,
	setSchedulerFlags = setSchedulerFlags,
	getSchedulerFlags = getSchedulerFlags
}