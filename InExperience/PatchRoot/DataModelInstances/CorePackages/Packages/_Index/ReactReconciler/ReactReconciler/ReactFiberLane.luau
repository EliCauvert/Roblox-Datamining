local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local _ = require(script.Parent.ReactInternalTypes)
local console = require(parent.Shared).console
local unknownModule = require(script.Parent["ReactFiberSchedulerPriorities.roblox"])
local var1 = require(parent.SafeFlags).createGetFFlag("ReactInlineMergeLanes")()
local invariant = require(parent.Shared).invariant
local immediatePriority = unknownModule.ImmediatePriority
local userBlockingPriority = unknownModule.UserBlockingPriority
local normalPriority = unknownModule.NormalPriority
local lowPriority = unknownModule.LowPriority
local idlePriority = unknownModule.IdlePriority
local noPriority = unknownModule.NoPriority
local t = {
	SyncLanePriority = 15,
	SyncBatchedLanePriority = 14,
	InputDiscreteLanePriority = 12,
	InputContinuousLanePriority = 10,
	DefaultLanePriority = 8,
	TransitionPriority = 6,
	NoLanePriority = 0,
	NoLanes = 0,
	NoLane = 0,
	SyncLane = 1,
	SyncBatchedLane = 2,
	InputDiscreteHydrationLane = 4,
	DefaultHydrationLane = 256,
	DefaultLanes = 3584,
	RetryLanes = 62914560,
	SomeRetryLane = 33554432,
	SelectiveHydrationLane = 67108864,
	IdleHydrationLane = 134217728,
	OffscreenLane = 1073741824,
	NoTimestamp = -1
}
local noLanePriority = t.NoLanePriority

function t.getCurrentUpdateLanePriority()
	-- upvalues: noLanePriority (write)
	return noLanePriority
end

function t.setCurrentUpdateLanePriority(p1)
	-- upvalues: noLanePriority (write)
	noLanePriority = p1
end

local defaultLanePriority = t.DefaultLanePriority

local function getHighestPriorityLanes(p1)
	-- upvalues: defaultLanePriority (write), reactGlobalsModule (ref), console (ref)
	if bit32.band(1, p1) ~= 0 then
		defaultLanePriority = 15
		
		return 1
	elseif bit32.band(2, p1) ~= 0 then
		defaultLanePriority = 14
		
		return 2
	elseif bit32.band(4, p1) ~= 0 then
		defaultLanePriority = 13
		
		return 4
	end
	local bits = bit32.band(24, p1)
	
	if bits ~= 0 then
		defaultLanePriority = 12
		
		return bits
	elseif bit32.band(p1, 32) ~= 0 then
		defaultLanePriority = 11
		
		return 32
	end
	local bits_1 = bit32.band(192, p1)
	
	if bits_1 ~= 0 then
		defaultLanePriority = 10
		
		return bits_1
	elseif bit32.band(p1, 256) ~= 0 then
		defaultLanePriority = 9
		
		return 256
	end
	local bits_2 = bit32.band(3584, p1)
	
	if bits_2 ~= 0 then
		defaultLanePriority = 8
		
		return bits_2
	elseif bit32.band(p1, 4096) ~= 0 then
		defaultLanePriority = 7
		
		return 4096
	end
	local bits_3 = bit32.band(4186112, p1)
	
	if bits_3 ~= 0 then
		defaultLanePriority = 6
		
		return bits_3
	end
	local bits_4 = bit32.band(62914560, p1)
	
	if bits_4 ~= 0 then
		defaultLanePriority = 5
		
		return bits_4
	elseif bit32.band(p1, 67108864) ~= 0 then
		defaultLanePriority = 4
		
		return 67108864
	elseif bit32.band(p1, 134217728) ~= 0 then
		defaultLanePriority = 3
		
		return 134217728
	end
	local bits_5 = bit32.band(805306368, p1)
	
	if bits_5 ~= 0 then
		defaultLanePriority = 2
		
		return bits_5
	elseif bit32.band(1073741824, p1) ~= 0 then
		defaultLanePriority = 1
		
		return 1073741824
	elseif reactGlobalsModule.__DEV__ then
		console.error("Should have found matching lanes. This is a bug in React.")
	end
	defaultLanePriority = 8
	
	return p1
end

function t.schedulerPriorityToLanePriority(startValue)
	-- upvalues: immediatePriority (ref), userBlockingPriority (ref), normalPriority (ref), lowPriority (ref), idlePriority (ref)
	return if startValue == immediatePriority then 15 elseif startValue == userBlockingPriority then 10 elseif startValue == normalPriority or startValue == lowPriority then 8 elseif startValue == idlePriority then 2 else 0
end

function t.lanePriorityToSchedulerPriority(startValue)
	-- upvalues: immediatePriority (ref), userBlockingPriority (ref), normalPriority (ref), idlePriority (ref), noPriority (ref), invariant (ref)
	if startValue == 15 or startValue == 14 then
		return immediatePriority
	elseif startValue == 13 or startValue == 12 or (startValue == 11 or startValue == 10) then
		return userBlockingPriority
	elseif startValue == 9 or startValue == 8 or (startValue == 7 or startValue == 6) or (startValue == 4 or startValue == 5) then
		return normalPriority
	elseif startValue == 3 or startValue == 2 or startValue == 1 then
		return idlePriority
	elseif startValue == 0 then
		return noPriority
	end
	invariant(false, "Invalid update priority: %s. This is a bug in React.", startValue)
	error("unreachable")
end

local pickArbitraryLaneIndex = nil
local getLowestPriorityLane = nil
local getEqualOrHigherPriorityLanes = nil

function t.getNextLanes(p1, p2)
	-- upvalues: defaultLanePriority (write), getHighestPriorityLanes (ref), getLowestPriorityLane (write), pickArbitraryLaneIndex (write)
	local pendingLanes = p1.pendingLanes
	
	if pendingLanes == 0 then
		defaultLanePriority = 0
		
		return 0
	end
	local var2 = 0
	local var3 = 0
	local expiredLanes = p1.expiredLanes
	local suspendedLanes = p1.suspendedLanes
	local pingedLanes = p1.pingedLanes
	
	if expiredLanes == 0 then
		local bits = bit32.band(pendingLanes, 134217727)
		
		if bits == 0 then
			local bits_1 = bit32.band(pendingLanes, bit32.bnot(suspendedLanes))
			
			if bits_1 ~= 0 then
				var2 = getHighestPriorityLanes(bits_1)
				var3 = defaultLanePriority
			elseif pingedLanes ~= 0 then
				var2 = getHighestPriorityLanes(pingedLanes)
				var3 = defaultLanePriority
			end
		else
			local bits_1 = bit32.band(bits, bit32.bnot(suspendedLanes))
			
			if bits_1 == 0 then
				local bits_2 = bit32.band(bits, pingedLanes)
				
				if bits_2 ~= 0 then
					var2 = getHighestPriorityLanes(bits_2)
					var3 = defaultLanePriority
				end
			else
				var2 = getHighestPriorityLanes(bits_1)
				var3 = defaultLanePriority
			end
		end
	else
		var2 = expiredLanes
		defaultLanePriority = 15
		var3 = 15
	end
	if var2 == 0 then
		return 0
	end
	var2 = bit32.band(pendingLanes, bit32.lshift(getLowestPriorityLane(var2), 1) - 1)
	
	if p2 ~= 0 and p2 ~= var2 and bit32.band(p2, suspendedLanes) == 0 then
		getHighestPriorityLanes(p2)
		
		if var3 <= defaultLanePriority then
			return p2
		end
		defaultLanePriority = var3
	end
	local entangledLanes = p1.entangledLanes
	
	if entangledLanes ~= 0 then
		local entanglements = p1.entanglements
		local bits = bit32.band(var2, entangledLanes)
		while bits > 0 do
			local var4 = pickArbitraryLaneIndex(bits)
			var2 = bit32.bor(var2, entanglements[var4])
			bits = bit32.band(bits, bit32.bnot(bit32.lshift(1, var4)))
		end
	end
	return var2
end

function t.getMostRecentEventTime(p3, p4)
	-- upvalues: pickArbitraryLaneIndex (write)
	local eventTimes = p3.eventTimes
	local var5 = -1
	while p4 > 0 do
		local var6 = pickArbitraryLaneIndex(p4)
		local shifted = bit32.lshift(1, var6)
		local var7 = eventTimes[var6]
		
		if var5 < var7 then
			var5 = var7
		end
		p4 = bit32.band(p4, bit32.bnot(shifted))
	end
	return var5
end

function t.computeExpirationTime(p5, p6)
	-- upvalues: getHighestPriorityLanes (ref), defaultLanePriority (write)
	getHighestPriorityLanes(p5)
	
	return if defaultLanePriority >= 10 then p6 + 250 elseif defaultLanePriority >= 6 then p6 + 5000 else -1
end

function t.markStarvedLanesAsExpired(p5, p6)
	-- upvalues: pickArbitraryLaneIndex (write), getHighestPriorityLanes (ref), defaultLanePriority (write)
	local pendingLanes = p5.pendingLanes
	local suspendedLanes = p5.suspendedLanes
	local pingedLanes = p5.pingedLanes
	local expirationTimes = p5.expirationTimes
	local var8 = pendingLanes
	while var8 > 0 do
		local var9 = pickArbitraryLaneIndex(var8)
		local shifted = bit32.lshift(1, var9)
		local var10 = expirationTimes[var9]
		
		if var10 == -1 then
			if bit32.band(shifted, suspendedLanes) == 0 or bit32.band(shifted, pingedLanes) ~= 0 then
				getHighestPriorityLanes(shifted)
				local var11 = defaultLanePriority
				expirationTimes[var9] = if var11 >= 10 then p6 + 250 elseif var11 >= 6 then p6 + 5000 else -1
			end
		elseif var10 <= p6 then
			p5.expiredLanes = bit32.bor(p5.expiredLanes, shifted)
		end
		var8 = bit32.band(var8, bit32.bnot(shifted))
	end
end

function t.getHighestPriorityPendingLanes(p7)
	-- upvalues: getHighestPriorityLanes (ref)
	return getHighestPriorityLanes(p7.pendingLanes)
end

function t.getLanesToRetrySynchronouslyOnError(p7)
	local bits = bit32.band(p7.pendingLanes, 3221225471)
	
	return if bits == 0 then if bit32.band(bits, 1073741824) == 0 then 0 else 1073741824 else bits
end

function t.returnNextLanesPriority()
	-- upvalues: defaultLanePriority (write)
	return defaultLanePriority
end

function t.includesNonIdleWork(p7)
	return bit32.band(p7, 134217727) ~= 0
end

function t.includesOnlyRetries(p7)
	return bit32.band(p7, 62914560) == p7
end

function t.includesOnlyTransitions(p7)
	return bit32.band(p7, 4186112) == p7
end

local var12 = nil

local function findUpdateLane(p7, p8)
	-- upvalues: var12 (write), findUpdateLane (ref), invariant (ref)
	if p7 ~= 0 then
		if p7 == 15 then
			return 1
		elseif p7 == 14 then
			return 2
		elseif p7 == 12 then
			local var13 = var12(bit32.band(24, bit32.bnot(p8)))
			
			return if var13 == 0 then findUpdateLane(10, p8) else var13
		elseif p7 == 10 then
			local var14 = var12(bit32.band(192, bit32.bnot(p8)))
			
			return if var14 == 0 then findUpdateLane(8, p8) else var14
		elseif p7 == 8 then
			local var15 = var12(bit32.band(3584, bit32.bnot(p8)))
			
			if var15 == 0 then
				var15 = var12(bit32.band(4186112, bit32.bnot(p8)))
				
				if var15 == 0 then
					var15 = var12(3584)
				end
			end
			return var15
		elseif p7 == 6 or p7 == 5 or p7 ~= 2 then
			invariant(false, "Invalid update priority: %s. This is a bug in React.", p7)
			error("unreachable")
			
			return
		end
		local var16 = var12(bit32.band(805306368, bit32.bnot(p8)))
		
		if var16 == 0 then
			var16 = var12(805306368)
		end
		return var16
	end
end

t.findUpdateLane = findUpdateLane

function t.findTransitionLane(p7, p8)
	-- upvalues: var12 (write)
	local var13 = var12(bit32.band(4186112, bit32.bnot(p8)))
	
	if var13 == 0 then
		var13 = var12(bit32.band(4186112, bit32.bnot(p7)))
		
		if var13 == 0 then
			var13 = var12(4186112)
		end
	end
	return var13
end

function t.findRetryLane(p7)
	-- upvalues: var12 (write)
	local var13 = var12(bit32.band(62914560, bit32.bnot(p7)))
	
	if var13 == 0 then
		var13 = var12(62914560)
	end
	return var13
end

local function _(p7)
	return bit32.band(p7, -p7)
end

getLowestPriorityLane = function(p7)
	local var13 = 31 - bit32.countlz(p7)
	
	return if var13 < 0 then 0 else bit32.lshift(1, var13)
end

getEqualOrHigherPriorityLanes = function(p7)
	-- upvalues: getLowestPriorityLane (write)
	return bit32.lshift(getLowestPriorityLane(p7), 1) - 1
end

function t.pickArbitraryLane(p7)
	return bit32.band(p7, -p7)
end

pickArbitraryLaneIndex = function(p7)
	return 31 - bit32.countlz(p7)
end

function t.includesSomeLane(p7, p8)
	return bit32.band(p7, p8) ~= 0
end

function t.isSubsetOfLanes(value, p7)
	return bit32.band(value, p7) == p7
end

t.mergeLanes = if var1 then bit32.bor else function(p7, p8)
	return bit32.bor(p7, p8)
end

function t.removeLanes(p7, p8)
	return bit32.band(p7, bit32.bnot(p8))
end

function t.laneToLanes(p7)
	return p7
end

function t.higherPriorityLane(p7, p8)
	return if p7 == 0 or p8 == 0 then if p7 == 0 then p8 else p7 elseif p7 < p8 then p7 else p8
end

function t.higherLanePriority(p7, p8)
	return if p7 == 0 or p8 >= p7 then p8 else p7
end

function t.createLaneMap(p7)
	return {
		[0] = p7,
		[1] = p7,
		[2] = p7,
		[3] = p7,
		[4] = p7,
		[5] = p7,
		[6] = p7,
		[7] = p7,
		[8] = p7,
		[9] = p7,
		[10] = p7,
		[11] = p7,
		[12] = p7,
		[13] = p7,
		[14] = p7,
		[15] = p7,
		[16] = p7,
		[17] = p7,
		[18] = p7,
		[19] = p7,
		[20] = p7,
		[21] = p7,
		[22] = p7,
		[23] = p7,
		[24] = p7,
		[25] = p7,
		[26] = p7,
		[27] = p7,
		[28] = p7,
		[29] = p7,
		[30] = p7,
		[31] = p7
	}
end

function t.markRootUpdated(p7, p8, p9)
	p7.pendingLanes = bit32.bor(p7.pendingLanes, p8)
	local var13 = p8 - 1
	p7.suspendedLanes = bit32.band(p7.suspendedLanes, var13)
	p7.pingedLanes = bit32.band(p7.pingedLanes, var13)
	p7.eventTimes[31 - bit32.countlz(p8)] = p9
end

function t.markRootSuspended(p7, p8)
	-- upvalues: pickArbitraryLaneIndex (write)
	p7.suspendedLanes = bit32.bor(p7.suspendedLanes, p8)
	p7.pingedLanes = bit32.band(p7.pingedLanes, bit32.bnot(p8))
	local expirationTimes = p7.expirationTimes
	local var13 = p8
	while var13 > 0 do
		local var14 = pickArbitraryLaneIndex(var13)
		local shifted = bit32.lshift(1, var14)
		expirationTimes[var14] = -1
		var13 = bit32.band(var13, bit32.bnot(shifted))
	end
end

function t.markRootPinged(p9, p10, _)
	p9.pingedLanes = bit32.bor(p9.pingedLanes, bit32.band(p9.suspendedLanes, p10))
end

function t.markRootExpired(p9, p10)
	p9.expiredLanes = bit32.bor(p9.expiredLanes, bit32.band(p10, p9.pendingLanes))
end

function t.markDiscreteUpdatesExpired(p9)
	p9.expiredLanes = bit32.bor(p9.expiredLanes, bit32.band(24, p9.pendingLanes))
end

function t.hasDiscreteLanes(p9)
	return bit32.band(p9, 24) ~= 0
end

function t.markRootMutableRead(p9, p10)
	p9.mutableReadLanes = bit32.bor(p9.mutableReadLanes, bit32.band(p10, p9.pendingLanes))
end

function t.markRootFinished(p9, p10)
	-- upvalues: pickArbitraryLaneIndex (write)
	local bits = bit32.band(p9.pendingLanes, bit32.bnot(p10))
	p9.pendingLanes = p10
	p9.suspendedLanes = 0
	p9.pingedLanes = 0
	p9.expiredLanes = bit32.band(p9.expiredLanes, p10)
	p9.mutableReadLanes = bit32.band(p9.mutableReadLanes, p10)
	p9.entangledLanes = bit32.band(p9.entangledLanes, p10)
	local entanglements = p9.entanglements
	local eventTimes = p9.eventTimes
	local expirationTimes = p9.expirationTimes
	local var15 = bits
	while var15 > 0 do
		local var16 = pickArbitraryLaneIndex(var15)
		local shifted = bit32.lshift(1, var16)
		entanglements[var16] = 0
		eventTimes[var16] = -1
		expirationTimes[var16] = -1
		var15 = bit32.band(var15, bit32.bnot(shifted))
	end
end

function t.markRootEntangled(vectorA, vectorB)
	-- upvalues: pickArbitraryLaneIndex (write)
	vectorA.entangledLanes = bit32.bor(vectorA.entangledLanes, vectorB)
	local entanglements = vectorA.entanglements
	local var17 = vectorB
	while var17 > 0 do
		local var18 = pickArbitraryLaneIndex(var17)
		local shifted = bit32.lshift(1, var18)
		entanglements[var18] = bit32.bor(entanglements[var18], vectorB)
		var17 = bit32.band(var17, bit32.bnot(shifted))
	end
end

function t.getBumpedLaneForHydration(p11, p12)
	-- upvalues: getHighestPriorityLanes (ref), defaultLanePriority (write), invariant (ref)
	getHighestPriorityLanes(p12)
	local var19 = nil
	
	if defaultLanePriority == 15 or defaultLanePriority == 14 then
		var19 = 0
	elseif defaultLanePriority == 13 or defaultLanePriority == 12 then
		var19 = 4
	elseif defaultLanePriority == 11 or defaultLanePriority == 10 then
		var19 = 32
	elseif defaultLanePriority == 9 or defaultLanePriority == 8 then
		var19 = 256
	elseif defaultLanePriority == 7 or defaultLanePriority == 6 then
		var19 = 4096
	elseif defaultLanePriority == 5 then
		var19 = 4096
	elseif defaultLanePriority == 4 then
		var19 = 67108864
	elseif defaultLanePriority == 3 or defaultLanePriority == 2 then
		var19 = 134217728
	elseif defaultLanePriority == 1 or defaultLanePriority == 0 then
		var19 = 0
	else
		invariant(false, "Invalid lane: %s. This is a bug in React.", tostring(var19))
	end
	return if bit32.band(var19, bit32.bor(p11.suspendedLanes, p12)) == 0 then var19 else 0
end

return t