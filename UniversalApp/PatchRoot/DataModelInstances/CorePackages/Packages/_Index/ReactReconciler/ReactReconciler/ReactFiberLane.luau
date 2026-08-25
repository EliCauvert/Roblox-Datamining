local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local _ = require(script.Parent.ReactInternalTypes)
local console = require(parent.Shared).console
local unknownModule = require(script.Parent["ReactFiberSchedulerPriorities.roblox"])
local var2 = require(parent.SafeFlags).createGetFFlag("ReactInlineMergeLanes")()
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

function t.setCurrentUpdateLanePriority(p0)
	-- upvalues: noLanePriority (write)
	noLanePriority = p0
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

function t.getNextLanes(p2, p3)
	-- upvalues: defaultLanePriority (write), getHighestPriorityLanes (ref), getLowestPriorityLane (write), pickArbitraryLaneIndex (write)
	local pendingLanes = p2.pendingLanes
	
	if pendingLanes == 0 then
		defaultLanePriority = 0
		
		return 0
	end
	local var16 = 0
	local var17 = 0
	local expiredLanes = p2.expiredLanes
	local suspendedLanes = p2.suspendedLanes
	local pingedLanes = p2.pingedLanes
	
	if expiredLanes == 0 then
		local bits = bit32.band(pendingLanes, 134217727)
		
		if bits == 0 then
			local bits_1 = bit32.band(pendingLanes, bit32.bnot(suspendedLanes))
			
			if bits_1 ~= 0 then
				var16 = getHighestPriorityLanes(bits_1)
				var17 = defaultLanePriority
			elseif pingedLanes ~= 0 then
				var16 = getHighestPriorityLanes(pingedLanes)
				var17 = defaultLanePriority
			end
		else
			local bits_1 = bit32.band(bits, bit32.bnot(suspendedLanes))
			
			if bits_1 == 0 then
				local bits_2 = bit32.band(bits, pingedLanes)
				
				if bits_2 ~= 0 then
					var16 = getHighestPriorityLanes(bits_2)
					var17 = defaultLanePriority
				end
			else
				var16 = getHighestPriorityLanes(bits_1)
				var17 = defaultLanePriority
			end
		end
	else
		var16 = expiredLanes
		defaultLanePriority = 15
		var17 = 15
	end
	if var16 == 0 then
		return 0
	end
	var16 = bit32.band(pendingLanes, bit32.lshift(getLowestPriorityLane(var16), 1) - 1)
	
	if p3 ~= 0 and p3 ~= var16 and bit32.band(p3, suspendedLanes) == 0 then
		getHighestPriorityLanes(p3)
		
		if var17 <= defaultLanePriority then
			return p3
		end
		defaultLanePriority = var17
	end
	local entangledLanes = p2.entangledLanes
	
	if entangledLanes ~= 0 then
		local entanglements = p2.entanglements
		local bits = bit32.band(var16, entangledLanes)
		while bits > 0 do
			local var23 = pickArbitraryLaneIndex(bits)
			var16 = bit32.bor(var16, entanglements[var23])
			bits = bit32.band(bits, bit32.bnot(bit32.lshift(1, var23)))
		end
	end
	return var16
end

function t.getMostRecentEventTime(p4, p5)
	-- upvalues: pickArbitraryLaneIndex (write)
	local eventTimes = p4.eventTimes
	local var24 = -1
	while p5 > 0 do
		local var25 = pickArbitraryLaneIndex(p5)
		local shifted = bit32.lshift(1, var25)
		local var27 = eventTimes[var25]
		
		if var24 < var27 then
			var24 = var27
		end
		p5 = bit32.band(p5, bit32.bnot(shifted))
	end
	return var24
end

function t.computeExpirationTime(p6, p7)
	-- upvalues: getHighestPriorityLanes (ref), defaultLanePriority (write)
	getHighestPriorityLanes(p6)
	
	return if defaultLanePriority >= 10 then p7 + 250 elseif defaultLanePriority >= 6 then p7 + 5000 else -1
end

function t.markStarvedLanesAsExpired(p8, p9)
	-- upvalues: pickArbitraryLaneIndex (write), getHighestPriorityLanes (ref), defaultLanePriority (write)
	local pendingLanes = p8.pendingLanes
	local suspendedLanes = p8.suspendedLanes
	local pingedLanes = p8.pingedLanes
	local expirationTimes = p8.expirationTimes
	local var28 = pendingLanes
	while var28 > 0 do
		local var29 = pickArbitraryLaneIndex(var28)
		local shifted = bit32.lshift(1, var29)
		local var31 = expirationTimes[var29]
		
		if var31 == -1 then
			if bit32.band(shifted, suspendedLanes) == 0 or bit32.band(shifted, pingedLanes) ~= 0 then
				getHighestPriorityLanes(shifted)
				local var32 = defaultLanePriority
				expirationTimes[var29] = if var32 >= 10 then p9 + 250 elseif var32 >= 6 then p9 + 5000 else -1
			end
		elseif var31 <= p9 then
			p8.expiredLanes = bit32.bor(p8.expiredLanes, shifted)
		end
		var28 = bit32.band(var28, bit32.bnot(shifted))
	end
end

function t.getHighestPriorityPendingLanes(p10)
	-- upvalues: getHighestPriorityLanes (ref)
	return getHighestPriorityLanes(p10.pendingLanes)
end

function t.getLanesToRetrySynchronouslyOnError(p11)
	local bits = bit32.band(p11.pendingLanes, 3221225471)
	
	return if bits == 0 then if bit32.band(bits, 1073741824) == 0 then 0 else 1073741824 else bits
end

function t.returnNextLanesPriority()
	-- upvalues: defaultLanePriority (write)
	return defaultLanePriority
end

function t.includesNonIdleWork(p12)
	return bit32.band(p12, 134217727) ~= 0
end

function t.includesOnlyRetries(p13)
	return bit32.band(p13, 62914560) == p13
end

function t.includesOnlyTransitions(p14)
	return bit32.band(p14, 4186112) == p14
end

local var8 = nil

local function findUpdateLane(p15, p16)
	-- upvalues: var8 (write), findUpdateLane (ref), invariant (ref)
	if p15 ~= 0 then
		if p15 == 15 then
			return 1
		elseif p15 == 14 then
			return 2
		elseif p15 == 12 then
			local var34 = var8(bit32.band(24, bit32.bnot(p16)))
			
			return if var34 == 0 then findUpdateLane(10, p16) else var34
		elseif p15 == 10 then
			local var35 = var8(bit32.band(192, bit32.bnot(p16)))
			
			return if var35 == 0 then findUpdateLane(8, p16) else var35
		elseif p15 == 8 then
			local var36 = var8(bit32.band(3584, bit32.bnot(p16)))
			
			if var36 == 0 then
				var36 = var8(bit32.band(4186112, bit32.bnot(p16)))
				
				if var36 == 0 then
					var36 = var8(3584)
				end
			end
			return var36
		elseif p15 == 6 or p15 == 5 or p15 ~= 2 then
			invariant(false, "Invalid update priority: %s. This is a bug in React.", p15)
			error("unreachable")
			
			return
		end
		local var37 = var8(bit32.band(805306368, bit32.bnot(p16)))
		
		if var37 == 0 then
			var37 = var8(805306368)
		end
		return var37
	end
end

t.findUpdateLane = findUpdateLane

function t.findTransitionLane(p17, p18)
	-- upvalues: var8 (write)
	local var38 = var8(bit32.band(4186112, bit32.bnot(p18)))
	
	if var38 == 0 then
		var38 = var8(bit32.band(4186112, bit32.bnot(p17)))
		
		if var38 == 0 then
			var38 = var8(4186112)
		end
	end
	return var38
end

function t.findRetryLane(p19)
	-- upvalues: var8 (write)
	local var39 = var8(bit32.band(62914560, bit32.bnot(p19)))
	
	if var39 == 0 then
		var39 = var8(62914560)
	end
	return var39
end

local function _(p20)
	return bit32.band(p20, -p20)
end

getLowestPriorityLane = function(p21)
	local var40 = 31 - bit32.countlz(p21)
	
	return if var40 < 0 then 0 else bit32.lshift(1, var40)
end

getEqualOrHigherPriorityLanes = function(p22)
	-- upvalues: getLowestPriorityLane (write)
	return bit32.lshift(getLowestPriorityLane(p22), 1) - 1
end

function t.pickArbitraryLane(p23)
	return bit32.band(p23, -p23)
end

pickArbitraryLaneIndex = function(p24)
	return 31 - bit32.countlz(p24)
end

function t.includesSomeLane(p25, p26)
	return bit32.band(p25, p26) ~= 0
end

function t.isSubsetOfLanes(value, p27)
	return bit32.band(value, p27) == p27
end

t.mergeLanes = if var2 then bit32.bor else function(p28, p29)
	return bit32.bor(p28, p29)
end

function t.removeLanes(p30, p31)
	return bit32.band(p30, bit32.bnot(p31))
end

function t.laneToLanes(p32)
	return p32
end

function t.higherPriorityLane(p33, p34)
	return if p33 == 0 or p34 == 0 then if p33 == 0 then p34 else p33 elseif p33 < p34 then p33 else p34
end

function t.higherLanePriority(p35, p36)
	return if p35 == 0 or p36 >= p35 then p36 else p35
end

function t.createLaneMap(p37)
	return {
		[0] = p37,
		[1] = p37,
		[2] = p37,
		[3] = p37,
		[4] = p37,
		[5] = p37,
		[6] = p37,
		[7] = p37,
		[8] = p37,
		[9] = p37,
		[10] = p37,
		[11] = p37,
		[12] = p37,
		[13] = p37,
		[14] = p37,
		[15] = p37,
		[16] = p37,
		[17] = p37,
		[18] = p37,
		[19] = p37,
		[20] = p37,
		[21] = p37,
		[22] = p37,
		[23] = p37,
		[24] = p37,
		[25] = p37,
		[26] = p37,
		[27] = p37,
		[28] = p37,
		[29] = p37,
		[30] = p37,
		[31] = p37
	}
end

function t.markRootUpdated(p38, p39, p40)
	p38.pendingLanes = bit32.bor(p38.pendingLanes, p39)
	local var41 = p39 - 1
	p38.suspendedLanes = bit32.band(p38.suspendedLanes, var41)
	p38.pingedLanes = bit32.band(p38.pingedLanes, var41)
	p38.eventTimes[31 - bit32.countlz(p39)] = p40
end

function t.markRootSuspended(p41, p42)
	-- upvalues: pickArbitraryLaneIndex (write)
	p41.suspendedLanes = bit32.bor(p41.suspendedLanes, p42)
	p41.pingedLanes = bit32.band(p41.pingedLanes, bit32.bnot(p42))
	local expirationTimes = p41.expirationTimes
	local var42 = p42
	while var42 > 0 do
		local var43 = pickArbitraryLaneIndex(var42)
		local shifted = bit32.lshift(1, var43)
		expirationTimes[var43] = -1
		var42 = bit32.band(var42, bit32.bnot(shifted))
	end
end

function t.markRootPinged(p43, p44, _)
	p43.pingedLanes = bit32.bor(p43.pingedLanes, bit32.band(p43.suspendedLanes, p44))
end

function t.markRootExpired(p45, p46)
	p45.expiredLanes = bit32.bor(p45.expiredLanes, bit32.band(p46, p45.pendingLanes))
end

function t.markDiscreteUpdatesExpired(p47)
	p47.expiredLanes = bit32.bor(p47.expiredLanes, bit32.band(24, p47.pendingLanes))
end

function t.hasDiscreteLanes(p48)
	return bit32.band(p48, 24) ~= 0
end

function t.markRootMutableRead(p49, p50)
	p49.mutableReadLanes = bit32.bor(p49.mutableReadLanes, bit32.band(p50, p49.pendingLanes))
end

function t.markRootFinished(p51, p52)
	-- upvalues: pickArbitraryLaneIndex (write)
	local bits = bit32.band(p51.pendingLanes, bit32.bnot(p52))
	p51.pendingLanes = p52
	p51.suspendedLanes = 0
	p51.pingedLanes = 0
	p51.expiredLanes = bit32.band(p51.expiredLanes, p52)
	p51.mutableReadLanes = bit32.band(p51.mutableReadLanes, p52)
	p51.entangledLanes = bit32.band(p51.entangledLanes, p52)
	local entanglements = p51.entanglements
	local eventTimes = p51.eventTimes
	local expirationTimes = p51.expirationTimes
	local var46 = bits
	while var46 > 0 do
		local var47 = pickArbitraryLaneIndex(var46)
		local shifted = bit32.lshift(1, var47)
		entanglements[var47] = 0
		eventTimes[var47] = -1
		expirationTimes[var47] = -1
		var46 = bit32.band(var46, bit32.bnot(shifted))
	end
end

function t.markRootEntangled(vectorA, vectorB)
	-- upvalues: pickArbitraryLaneIndex (write)
	vectorA.entangledLanes = bit32.bor(vectorA.entangledLanes, vectorB)
	local entanglements = vectorA.entanglements
	local var49 = vectorB
	while var49 > 0 do
		local var50 = pickArbitraryLaneIndex(var49)
		local shifted = bit32.lshift(1, var50)
		entanglements[var50] = bit32.bor(entanglements[var50], vectorB)
		var49 = bit32.band(var49, bit32.bnot(shifted))
	end
end

function t.getBumpedLaneForHydration(p53, p54)
	-- upvalues: getHighestPriorityLanes (ref), defaultLanePriority (write), invariant (ref)
	getHighestPriorityLanes(p54)
	local var52 = nil
	
	if defaultLanePriority == 15 or defaultLanePriority == 14 then
		var52 = 0
	elseif defaultLanePriority == 13 or defaultLanePriority == 12 then
		var52 = 4
	elseif defaultLanePriority == 11 or defaultLanePriority == 10 then
		var52 = 32
	elseif defaultLanePriority == 9 or defaultLanePriority == 8 then
		var52 = 256
	elseif defaultLanePriority == 7 or defaultLanePriority == 6 then
		var52 = 4096
	elseif defaultLanePriority == 5 then
		var52 = 4096
	elseif defaultLanePriority == 4 then
		var52 = 67108864
	elseif defaultLanePriority == 3 or defaultLanePriority == 2 then
		var52 = 134217728
	elseif defaultLanePriority == 1 or defaultLanePriority == 0 then
		var52 = 0
	else
		invariant(false, "Invalid lane: %s. This is a bug in React.", tostring(var52))
	end
	return if bit32.band(var52, bit32.bor(p53.suspendedLanes, p54)) == 0 then var52 else 0
end

return t