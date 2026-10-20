local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local _ = require(script.Parent.ReactInternalTypes)
local Console = require(Parent.Shared).console
local ReactFiberSchedulerPrioritiesRobloxModule = require(script.Parent["ReactFiberSchedulerPriorities.roblox"])
local v1 = require(Parent.SafeFlags).createGetFFlag("ReactInlineMergeLanes")()
local InvariantFunction = require(Parent.Shared).invariant
local ImmediatePriority = ReactFiberSchedulerPrioritiesRobloxModule.ImmediatePriority
local UserBlockingPriority = ReactFiberSchedulerPrioritiesRobloxModule.UserBlockingPriority
local NormalPriority = ReactFiberSchedulerPrioritiesRobloxModule.NormalPriority
local LowPriority = ReactFiberSchedulerPrioritiesRobloxModule.LowPriority
local IdlePriority = ReactFiberSchedulerPrioritiesRobloxModule.IdlePriority
local NoPriority = ReactFiberSchedulerPrioritiesRobloxModule.NoPriority
local ReactFiberLaneModule = {
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
local NoLanePriority = ReactFiberLaneModule.NoLanePriority

function ReactFiberLaneModule.getCurrentUpdateLanePriority()
	-- upvalues: NoLanePriority (ref)
	return NoLanePriority
end

function ReactFiberLaneModule.setCurrentUpdateLanePriority(Value)
	-- upvalues: NoLanePriority (ref)
	NoLanePriority = Value
end

local DefaultLanePriority = ReactFiberLaneModule.DefaultLanePriority

local function getHighestPriorityLanes(Mask: number): number
	-- upvalues: DefaultLanePriority (ref), ReactGlobalsModule (copy), Console (copy)
	if bit32.band(1, Mask) ~= 0 then
		DefaultLanePriority = 15
		
		return 1
	end
	if bit32.band(2, Mask) ~= 0 then
		DefaultLanePriority = 14
		
		return 2
	end
	if bit32.band(4, Mask) ~= 0 then
		DefaultLanePriority = 13
		
		return 4
	end
	local Bits = bit32.band(24, Mask)
	
	if Bits ~= 0 then
		DefaultLanePriority = 12
		
		return Bits
	end
	if bit32.band(Mask, 32) ~= 0 then
		DefaultLanePriority = 11
		
		return 32
	end
	local Bits1 = bit32.band(192, Mask)
	
	if Bits1 ~= 0 then
		DefaultLanePriority = 10
		
		return Bits1
	end
	if bit32.band(Mask, 256) ~= 0 then
		DefaultLanePriority = 9
		
		return 256
	end
	local Bits2 = bit32.band(3584, Mask)
	
	if Bits2 ~= 0 then
		DefaultLanePriority = 8
		
		return Bits2
	end
	if bit32.band(Mask, 4096) ~= 0 then
		DefaultLanePriority = 7
		
		return 4096
	end
	local Bits3 = bit32.band(4186112, Mask)
	
	if Bits3 ~= 0 then
		DefaultLanePriority = 6
		
		return Bits3
	end
	local Bits4 = bit32.band(62914560, Mask)
	
	if Bits4 ~= 0 then
		DefaultLanePriority = 5
		
		return Bits4
	end
	if bit32.band(Mask, 67108864) ~= 0 then
		DefaultLanePriority = 4
		
		return 67108864
	end
	if bit32.band(Mask, 134217728) ~= 0 then
		DefaultLanePriority = 3
		
		return 134217728
	end
	local Bits5 = bit32.band(805306368, Mask)
	
	if Bits5 ~= 0 then
		DefaultLanePriority = 2
		
		return Bits5
	end
	if bit32.band(1073741824, Mask) ~= 0 then
		DefaultLanePriority = 1
		
		return 1073741824
	end
	if ReactGlobalsModule.__DEV__ then
		Console.error("Should have found matching lanes. This is a bug in React.")
	end
	DefaultLanePriority = 8
	
	return Mask
end

function ReactFiberLaneModule.schedulerPriorityToLanePriority(IdlePriority1): number
	-- upvalues: ImmediatePriority (copy), UserBlockingPriority (copy), NormalPriority (copy), LowPriority (copy), IdlePriority (copy)
	return if IdlePriority1 == ImmediatePriority then 15 elseif IdlePriority1 == UserBlockingPriority then 10 elseif IdlePriority1 == NormalPriority or IdlePriority1 == LowPriority then 8 elseif IdlePriority1 == IdlePriority then 2 else 0
end

function ReactFiberLaneModule.lanePriorityToSchedulerPriority(p1)
	-- upvalues: ImmediatePriority (copy), UserBlockingPriority (copy), NormalPriority (copy), IdlePriority (copy), NoPriority (copy), InvariantFunction (copy)
	if p1 == 15 or p1 == 14 then
		return ImmediatePriority
	elseif p1 == 13 or p1 == 12 or p1 == 11 or p1 == 10 then
		return UserBlockingPriority
	elseif p1 == 9 or p1 == 8 or p1 == 7 or p1 == 6 or p1 == 4 or p1 == 5 then
		return NormalPriority
	elseif p1 == 3 or p1 == 2 or p1 == 1 then
		return IdlePriority
	elseif p1 == 0 then
		return NoPriority
	else
		InvariantFunction(false, "Invalid update priority: %s. This is a bug in React.", p1)
		error("unreachable")
	end
end

local Callback2 = nil
local Callback1 = nil

function ReactFiberLaneModule.getNextLanes(p1, Value: number): number
	-- upvalues: DefaultLanePriority (ref), getHighestPriorityLanes (copy), Callback1 (ref), Callback2 (ref)
	local PendingLanes: number = p1.pendingLanes
	
	if PendingLanes == 0 then
		DefaultLanePriority = 0
		
		return 0
	end
	local v2 = 0
	local v3 = 0
	local ExpiredLanes = p1.expiredLanes
	local SuspendedLanes: number = p1.suspendedLanes
	local PingedLanes: number = p1.pingedLanes
	
	if ExpiredLanes == 0 then
		local Bits = bit32.band(PendingLanes, 134217727)
		
		if Bits == 0 then
			local Bits2 = bit32.band(PendingLanes, (bit32.bnot(SuspendedLanes)))
			
			if Bits2 == 0 then
				if PingedLanes ~= 0 then
					v2 = getHighestPriorityLanes(PingedLanes)
					v3 = DefaultLanePriority
				end
			else
				v2 = getHighestPriorityLanes(Bits2)
				v3 = DefaultLanePriority
			end
		else
			local Bits1 = bit32.band(Bits, (bit32.bnot(SuspendedLanes)))
			
			if Bits1 == 0 then
				local Bits3 = bit32.band(Bits, PingedLanes)
				
				if Bits3 ~= 0 then
					v2 = getHighestPriorityLanes(Bits3)
					v3 = DefaultLanePriority
				end
			else
				v2 = getHighestPriorityLanes(Bits1)
				v3 = DefaultLanePriority
			end
		end
	else
		v2 = ExpiredLanes
		DefaultLanePriority = 15
		v3 = 15
	end
	if v2 == 0 then
		return 0
	end
	local Bits = bit32.band(PendingLanes, bit32.lshift(Callback1(v2), 1) - 1)
	
	if Value ~= 0 and Value ~= Bits and bit32.band(Value, SuspendedLanes) == 0 then
		getHighestPriorityLanes(Value)
		
		if v3 <= DefaultLanePriority then
			return Value
		end
		DefaultLanePriority = v3
	end
	local EntangledLanes: number = p1.entangledLanes
	
	if EntangledLanes ~= 0 then
		local Entanglements = p1.entanglements
		local Bits4 = bit32.band(Bits, EntangledLanes)
		while Bits4 > 0 do
			local CallbackResult: number = Callback2(Bits4)
			Bits = bit32.bor(Bits, Entanglements[CallbackResult])
			Bits4 = bit32.band(Bits4, (bit32.bnot((bit32.lshift(1, CallbackResult)))))
		end
	end
	return Bits
end

function ReactFiberLaneModule.getMostRecentEventTime(p2, Value: number): number
	-- upvalues: Callback2 (ref)
	local EventTimes = p2.eventTimes
	local v4 = -1
	while Value > 0 do
		local CallbackResult: number = Callback2(Value)
		local Shifted = bit32.lshift(1, CallbackResult)
		local EventTime = EventTimes[CallbackResult]
		
		if v4 < EventTime then
			v4 = EventTime
		end
		Value = bit32.band(Value, (bit32.bnot(Shifted)))
	end
	return v4
end

function ReactFiberLaneModule.computeExpirationTime(Mask, p3: number): number
	-- upvalues: getHighestPriorityLanes (copy), DefaultLanePriority (ref)
	getHighestPriorityLanes(Mask)
	local DefaultLanePriority1: number = DefaultLanePriority
	
	return if DefaultLanePriority1 >= 10 then p3 + 250 elseif DefaultLanePriority1 >= 6 then p3 + 5000 else -1
end

function ReactFiberLaneModule.markStarvedLanesAsExpired(p3, p4: number)
	-- upvalues: Callback2 (ref), getHighestPriorityLanes (copy), DefaultLanePriority (ref)
	local SuspendedLanes: number = p3.suspendedLanes
	local PingedLanes: number = p3.pingedLanes
	local ExpirationTimes = p3.expirationTimes
	local PendingLanes = p3.pendingLanes
	while PendingLanes > 0 do
		local CallbackResult: number = Callback2(PendingLanes)
		local Shifted = bit32.lshift(1, CallbackResult)
		local ExpirationTime = ExpirationTimes[CallbackResult]
		
		if ExpirationTime == -1 then
			if bit32.band(Shifted, SuspendedLanes) == 0 or bit32.band(Shifted, PingedLanes) ~= 0 then
				getHighestPriorityLanes(Shifted)
				local DefaultLanePriority1: number = DefaultLanePriority
				ExpirationTimes[CallbackResult] = if DefaultLanePriority1 >= 10 then p4 + 250 elseif DefaultLanePriority1 >= 6 then p4 + 5000 else -1
			end
		elseif ExpirationTime <= p4 then
			p3.expiredLanes = bit32.bor(p3.expiredLanes, Shifted)
		end
		PendingLanes = bit32.band(PendingLanes, (bit32.bnot(Shifted)))
	end
end

function ReactFiberLaneModule.getHighestPriorityPendingLanes(p5)
	-- upvalues: getHighestPriorityLanes (copy)
	return (getHighestPriorityLanes(p5.pendingLanes))
end

function ReactFiberLaneModule.getLanesToRetrySynchronouslyOnError(p5): number
	local Bits = bit32.band(p5.pendingLanes, 3221225471)
	
	return if Bits == 0 then if bit32.band(Bits, 1073741824) == 0 then 0 else 1073741824 else Bits
end

function ReactFiberLaneModule.returnNextLanesPriority()
	-- upvalues: DefaultLanePriority (ref)
	return DefaultLanePriority
end

function ReactFiberLaneModule.includesNonIdleWork(Value: number): boolean
	return bit32.band(Value, 134217727) ~= 0
end

function ReactFiberLaneModule.includesOnlyRetries(Value: number): boolean
	return bit32.band(Value, 62914560) == Value
end

function ReactFiberLaneModule.includesOnlyTransitions(Value: number): boolean
	return bit32.band(Value, 4186112) == Value
end

local Callback = nil

local function findUpdateLane(p5, p6: number)
	-- upvalues: Callback (ref), findUpdateLane (copy), InvariantFunction (copy)
	if p5 ~= 0 then
		if p5 == 15 then
			return 1
		end
		if p5 == 14 then
			return 2
		end
		if p5 == 12 then
			local CallbackResult = Callback((bit32.band(24, (bit32.bnot(p6)))))
			
			return if CallbackResult == 0 then findUpdateLane(10, p6) else CallbackResult
		end
		if p5 == 10 then
			local CallbackResult = Callback((bit32.band(192, (bit32.bnot(p6)))))
			
			return if CallbackResult == 0 then findUpdateLane(8, p6) else CallbackResult
		end
		if p5 == 8 then
			local CallbackResult = Callback((bit32.band(3584, (bit32.bnot(p6)))))
			
			if CallbackResult == 0 then
				CallbackResult = Callback((bit32.band(4186112, (bit32.bnot(p6)))))
				
				if CallbackResult == 0 then
					CallbackResult = Callback(3584)
				end
			end
			return CallbackResult
		elseif p5 ~= 6 and p5 ~= 5 and p5 == 2 then
			local CallbackResult = Callback((bit32.band(805306368, (bit32.bnot(p6)))))
			
			if CallbackResult == 0 then
				CallbackResult = Callback(805306368)
			end
			return CallbackResult
		end
	end
	InvariantFunction(false, "Invalid update priority: %s. This is a bug in React.", p5)
	error("unreachable")
end

ReactFiberLaneModule.findUpdateLane = findUpdateLane

function ReactFiberLaneModule.findTransitionLane(p5: number, p6: number)
	-- upvalues: Callback (ref)
	local CallbackResult = Callback((bit32.band(4186112, (bit32.bnot(p6)))))
	
	if CallbackResult == 0 then
		CallbackResult = Callback((bit32.band(4186112, (bit32.bnot(p5)))))
		
		if CallbackResult == 0 then
			CallbackResult = Callback(4186112)
		end
	end
	return CallbackResult
end

function ReactFiberLaneModule.findRetryLane(p5: number)
	-- upvalues: Callback (ref)
	local CallbackResult = Callback((bit32.band(62914560, (bit32.bnot(p5)))))
	
	if CallbackResult == 0 then
		CallbackResult = Callback(62914560)
	end
	return CallbackResult
end

local function _(Value: number): number
	return (bit32.band(Value, -Value))
end

Callback1 = function(p5: number): number
	local Shift = 31 - bit32.countlz(p5)
	
	return if Shift < 0 then 0 else bit32.lshift(1, Shift)
end

local _ = function(p5): number
	-- upvalues: Callback1 (ref)
	return bit32.lshift(Callback1(p5), 1) - 1
end

Callback = function(Value: number): number
	return (bit32.band(Value, -Value))
end

ReactFiberLaneModule.pickArbitraryLane = Callback

Callback2 = function(Bits: number): number
	return 31 - bit32.countlz(Bits)
end

function ReactFiberLaneModule.includesSomeLane(Value: number, Mask: number): boolean
	return bit32.band(Value, Mask) ~= 0
end

function ReactFiberLaneModule.isSubsetOfLanes(Value: number, Mask: number): boolean
	return bit32.band(Value, Mask) == Mask
end

local function mergeLanes(Value: number, Mask: number): number
	return (bit32.bor(Value, Mask))
end

ReactFiberLaneModule.mergeLanes = if v1 then bit32.bor else mergeLanes

function ReactFiberLaneModule.removeLanes(Value: number, p5: number): number
	return (bit32.band(Value, (bit32.bnot(p5))))
end

function ReactFiberLaneModule.laneToLanes(p5)
	return p5
end

function ReactFiberLaneModule.higherPriorityLane(p5, p6)
	return if p5 == 0 or p6 == 0 then if p5 == 0 then p6 else p5 elseif p5 < p6 then p5 else p6
end

function ReactFiberLaneModule.higherLanePriority(p5, p6)
	return if p5 == 0 or p6 >= p5 then p6 else p5
end

function ReactFiberLaneModule.createLaneMap(p5)
	return {
		[0] = p5,
		[1] = p5,
		[2] = p5,
		[3] = p5,
		[4] = p5,
		[5] = p5,
		[6] = p5,
		[7] = p5,
		[8] = p5,
		[9] = p5,
		[10] = p5,
		[11] = p5,
		[12] = p5,
		[13] = p5,
		[14] = p5,
		[15] = p5,
		[16] = p5,
		[17] = p5,
		[18] = p5,
		[19] = p5,
		[20] = p5,
		[21] = p5,
		[22] = p5,
		[23] = p5,
		[24] = p5,
		[25] = p5,
		[26] = p5,
		[27] = p5,
		[28] = p5,
		[29] = p5,
		[30] = p5,
		[31] = p5
	}
end

function ReactFiberLaneModule.markRootUpdated(p5, Mask: number, p6)
	p5.pendingLanes = bit32.bor(p5.pendingLanes, Mask)
	local MaskDelta = Mask - 1
	p5.suspendedLanes = bit32.band(p5.suspendedLanes, MaskDelta)
	p5.pingedLanes = bit32.band(p5.pingedLanes, MaskDelta)
	p5.eventTimes[31 - bit32.countlz(Mask)] = p6
end

function ReactFiberLaneModule.markRootSuspended(p5, Mask: number)
	-- upvalues: Callback2 (ref)
	p5.suspendedLanes = bit32.bor(p5.suspendedLanes, Mask)
	p5.pingedLanes = bit32.band(p5.pingedLanes, (bit32.bnot(Mask)))
	local ExpirationTimes = p5.expirationTimes
	local Value: number = Mask
	while Value > 0 do
		local CallbackResult: number = Callback2(Value)
		ExpirationTimes[CallbackResult] = -1
		Value = bit32.band(Value, (bit32.bnot((bit32.lshift(1, CallbackResult)))))
	end
end

function ReactFiberLaneModule.markRootPinged(p6, Mask: number, _)
	p6.pingedLanes = bit32.bor(p6.pingedLanes, (bit32.band(p6.suspendedLanes, Mask)))
end

function ReactFiberLaneModule.markRootExpired(p6, Value: number)
	p6.expiredLanes = bit32.bor(p6.expiredLanes, (bit32.band(Value, p6.pendingLanes)))
end

function ReactFiberLaneModule.markDiscreteUpdatesExpired(p6)
	p6.expiredLanes = bit32.bor(p6.expiredLanes, (bit32.band(24, p6.pendingLanes)))
end

function ReactFiberLaneModule.hasDiscreteLanes(Value: number): boolean
	return bit32.band(Value, 24) ~= 0
end

function ReactFiberLaneModule.markRootMutableRead(p6, Value: number)
	p6.mutableReadLanes = bit32.bor(p6.mutableReadLanes, (bit32.band(Value, p6.pendingLanes)))
end

function ReactFiberLaneModule.markRootFinished(p6, Mask: number)
	-- upvalues: Callback2 (ref)
	local Bits = bit32.band(p6.pendingLanes, (bit32.bnot(Mask)))
	p6.pendingLanes = Mask
	p6.suspendedLanes = 0
	p6.pingedLanes = 0
	p6.expiredLanes = bit32.band(p6.expiredLanes, Mask)
	p6.mutableReadLanes = bit32.band(p6.mutableReadLanes, Mask)
	p6.entangledLanes = bit32.band(p6.entangledLanes, Mask)
	local Entanglements = p6.entanglements
	local EventTimes = p6.eventTimes
	local ExpirationTimes = p6.expirationTimes
	local Value: number = Bits
	while Value > 0 do
		local CallbackResult: number = Callback2(Value)
		Entanglements[CallbackResult] = 0
		EventTimes[CallbackResult] = -1
		ExpirationTimes[CallbackResult] = -1
		Value = bit32.band(Value, (bit32.bnot((bit32.lshift(1, CallbackResult)))))
	end
end

function ReactFiberLaneModule.markRootEntangled(p7, Mask: number)
	-- upvalues: Callback2 (ref)
	p7.entangledLanes = bit32.bor(p7.entangledLanes, Mask)
	local Entanglements = p7.entanglements
	local Value: number = Mask
	while Value > 0 do
		local CallbackResult: number = Callback2(Value)
		local Shifted = bit32.lshift(1, CallbackResult)
		Entanglements[CallbackResult] = bit32.bor(Entanglements[CallbackResult], Mask)
		Value = bit32.band(Value, (bit32.bnot(Shifted)))
	end
end

function ReactFiberLaneModule.getBumpedLaneForHydration(p8, Mask: number): number
	-- upvalues: getHighestPriorityLanes (copy), DefaultLanePriority (ref), InvariantFunction (copy)
	getHighestPriorityLanes(Mask)
	local DefaultLanePriority1 = DefaultLanePriority
	local Value: number? = nil
	
	if DefaultLanePriority1 == 15 or DefaultLanePriority1 == 14 then
		Value = 0
	elseif DefaultLanePriority1 == 13 or DefaultLanePriority1 == 12 then
		Value = 4
	elseif DefaultLanePriority1 == 11 or DefaultLanePriority1 == 10 then
		Value = 32
	elseif DefaultLanePriority1 == 9 or DefaultLanePriority1 == 8 then
		Value = 256
	elseif DefaultLanePriority1 == 7 or DefaultLanePriority1 == 6 then
		Value = 4096
	elseif DefaultLanePriority1 == 5 then
		Value = 4096
	elseif DefaultLanePriority1 == 4 then
		Value = 67108864
	elseif DefaultLanePriority1 == 3 or DefaultLanePriority1 == 2 then
		Value = 134217728
	elseif DefaultLanePriority1 == 1 or DefaultLanePriority1 == 0 then
		Value = 0
	else
		InvariantFunction(false, "Invalid lane: %s. This is a bug in React.", (tostring(Value)))
	end
	return if bit32.band(Value, (bit32.bor(p8.suspendedLanes, Mask))) == 0 then Value else 0
end

return ReactFiberLaneModule