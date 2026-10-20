local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Object = require(Parent.LuauPolyfill).Object
local DEV = ReactGlobalsModule.__DEV__
local YOLO = ReactGlobalsModule.__YOLO__
local Console = require(Parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local ReactFiberLaneModule = require(script.Parent.ReactFiberLane)
local NoLane = ReactFiberLaneModule.NoLane
local NoLanes = ReactFiberLaneModule.NoLanes
local IsSubsetOfLanesFunction = ReactFiberLaneModule.isSubsetOfLanes
local MergeLanesFunction = ReactFiberLaneModule.mergeLanes
local ReactFiberNewContextNewModule = nil

local function _()
	-- upvalues: ReactFiberNewContextNewModule (ref)
	if not ReactFiberNewContextNewModule then
		ReactFiberNewContextNewModule = require(script.Parent["ReactFiberNewContext.new"])
	end
	ReactFiberNewContextNewModule.enterDisallowedContextReadInDEV()
end

local _ = function()
	-- upvalues: ReactFiberNewContextNewModule (ref)
	if not ReactFiberNewContextNewModule then
		ReactFiberNewContextNewModule = require(script.Parent["ReactFiberNewContext.new"])
	end
	ReactFiberNewContextNewModule.exitDisallowedContextReadInDEV()
end

local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local Callback = ReactFiberFlagsModule.Callback
local ShouldCapture = ReactFiberFlagsModule.ShouldCapture
local DidCapture = ReactFiberFlagsModule.DidCapture
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local DebugRenderPhaseSideEffectsForStrictMode = ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode
local EnableAllocationTrims = ReactFeatureFlags.enableAllocationTrims
local StrictMode = require(script.Parent.ReactTypeOfMode).StrictMode
local MarkSkippedUpdateLanesFunction = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes
local DescribeError = require(Parent.Shared).describeError
local ConsolePatchingDev = require(Parent.Shared).ConsolePatchingDev
local DisableLogsFunction = ConsolePatchingDev.disableLogs
local ReenableLogsFunction = ConsolePatchingDev.reenableLogs
local ReactUpdateQueueModule = {
	UpdateState = 0,
	ReplaceState = 1,
	ForceUpdate = 2,
	CaptureUpdate = 3
}
local Flag = false
local Flag1: boolean? = nil
local Shared = nil

if DEV then
	Flag1 = false
	Shared = nil
	
	function ReactUpdateQueueModule.resetCurrentlyProcessingQueue()
		-- upvalues: Shared (ref)
		Shared = nil
	end
end
local Buffer = table.create(210)
local Count = 210

for i = 1, 210 do
	Buffer[i] = {
		eventTime = -1,
		lane = -1,
		tag = -1,
		payload = nil,
		callback = nil,
		next = nil
	}
end
function ReactUpdateQueueModule.initializeUpdateQueue(p1)
	p1.updateQueue = {
		firstBaseUpdate = nil,
		lastBaseUpdate = nil,
		effects = nil,
		baseState = p1.memoizedState,
		shared = { pending = nil }
	}
end

function ReactUpdateQueueModule.cloneUpdateQueue(p1, p2)
	local UpdateQueue = p1.updateQueue
	
	if p2.updateQueue == UpdateQueue then
		p2.updateQueue = table.clone(UpdateQueue)
	end
end

function ReactUpdateQueueModule.createUpdate(EventTime, Lane, Payload, Callback)
	-- upvalues: Count (ref), Buffer (copy)
	if Count > 0 then
		local BufferEntry = Buffer[Count]
		Buffer[Count] = nil
		Count -= 1
		BufferEntry.eventTime = EventTime
		BufferEntry.lane = Lane
		BufferEntry.tag = 0
		BufferEntry.payload = Payload
		BufferEntry.callback = Callback
		
		return BufferEntry
	else
		return {
			tag = 0,
			next = nil,
			eventTime = EventTime,
			lane = Lane,
			payload = Payload,
			callback = Callback
		}
	end
end

function ReactUpdateQueueModule.enqueueUpdate(p1, Pending)
	-- upvalues: DEV (copy), Shared (ref), Flag1 (ref), Console (copy)
	local UpdateQueue = p1.updateQueue
	
	if UpdateQueue == nil then return end
	local Shared1 = UpdateQueue.shared
	local Pending1 = Shared1.pending
	
	if Pending1 == nil then
		Pending.next = Pending
	else
		Pending.next = Pending1.next
		Pending1.next = Pending
	end
	Shared1.pending = Pending
	
	if DEV and Shared == Shared1 and not Flag1 then
		Console.error("An update (setState, replaceState, or forceUpdate) was scheduled from inside an update function. Update functions should be pure, with zero side-effects. Consider using componentDidUpdate or a callback.")
		Flag1 = true
	end
end

function ReactUpdateQueueModule.enqueueCapturedUpdate(p1, LastBaseUpdate)
	local UpdateQueue = p1.updateQueue
	local Alternate = p1.alternate
	
	if Alternate ~= nil then
		local UpdateQueue1 = Alternate.updateQueue
		
		if UpdateQueue == UpdateQueue1 then
			local FirstBaseUpdate = nil
			local v1 = nil
			local FirstBaseUpdate1 = UpdateQueue.firstBaseUpdate
			local LastBaseUpdate2 = nil
			
			if FirstBaseUpdate1 == nil then
				LastBaseUpdate2 = LastBaseUpdate
				FirstBaseUpdate = LastBaseUpdate
			else
				local Next = FirstBaseUpdate1
				repeat
					local config = {
						next = nil,
						eventTime = Next.eventTime,
						lane = Next.lane,
						tag = Next.tag,
						payload = Next.payload,
						callback = Next.callback
					}
					if v1 == nil then
						v1 = config
						FirstBaseUpdate = config
					else
						v1.next = config
						v1 = config
					end
					Next = Next.next
				until Next == nil
				if v1 == nil then
					LastBaseUpdate2 = LastBaseUpdate
					FirstBaseUpdate = LastBaseUpdate
				else
					v1.next = LastBaseUpdate
					LastBaseUpdate2 = LastBaseUpdate
				end
			end
			UpdateQueue = {
				baseState = UpdateQueue1.baseState,
				firstBaseUpdate = FirstBaseUpdate,
				lastBaseUpdate = LastBaseUpdate2,
				shared = UpdateQueue1.shared,
				effects = UpdateQueue1.effects
			}
			p1.updateQueue = UpdateQueue
			
			return
		end
	end
	local LastBaseUpdate1 = UpdateQueue.lastBaseUpdate
	
	if LastBaseUpdate1 == nil then
		UpdateQueue.firstBaseUpdate = LastBaseUpdate
	else
		LastBaseUpdate1.next = LastBaseUpdate
	end
	UpdateQueue.lastBaseUpdate = LastBaseUpdate
end

local function getStateFromUpdate(p1, _, Update, Tbl, p2, _)
	-- upvalues: DEV (copy), ReactFiberNewContextNewModule (ref), DebugRenderPhaseSideEffectsForStrictMode (copy), StrictMode (copy), DisableLogsFunction (copy), YOLO (copy), DescribeError (copy), ReenableLogsFunction (copy), ShouldCapture (copy), DidCapture (copy), EnableAllocationTrims (copy), Object (copy), Flag (ref)
	local Tag = Update.tag
	
	if Tag == 1 then
		local PayloadFunction1 = Update.payload
		
		if type(PayloadFunction1) ~= "function" then
			return PayloadFunction1
		end
		if DEV then
			if not ReactFiberNewContextNewModule then
				ReactFiberNewContextNewModule = require(script.Parent["ReactFiberNewContext.new"])
			end
			ReactFiberNewContextNewModule.enterDisallowedContextReadInDEV()
		end
		local PayloadResult = PayloadFunction1(Tbl, p2)
		
		if DEV then
			if DebugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, StrictMode) ~= 0 then
				DisableLogsFunction()
				local v1 = nil
				local Success = nil
				
				if YOLO then
					Success = true
					PayloadFunction1(Tbl, p2)
				else
					Success, v47 = xpcall(PayloadFunction1, DescribeError, Tbl, p2)
				end
				ReenableLogsFunction()
				
				if not Success then
					error(v1)
				end
			end
			if not ReactFiberNewContextNewModule then
				ReactFiberNewContextNewModule = require(script.Parent["ReactFiberNewContext.new"])
			end
			ReactFiberNewContextNewModule.exitDisallowedContextReadInDEV()
		end
		return PayloadResult
	elseif Tag == 3 or Tag == 0 then
		if Tag == 3 then
			p1.flags = bit32.bor(bit32.band(p1.flags, (bit32.bnot(ShouldCapture))), DidCapture)
		end
		local PayloadFunction = Update.payload
		local Payload = nil
		
		if type(PayloadFunction) == "function" then
			if DEV then
				if not ReactFiberNewContextNewModule then
					ReactFiberNewContextNewModule = require(script.Parent["ReactFiberNewContext.new"])
				end
				ReactFiberNewContextNewModule.enterDisallowedContextReadInDEV()
			end
			Payload = PayloadFunction(Tbl, p2)
			
			if DEV then
				if DebugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, StrictMode) ~= 0 then
					DisableLogsFunction()
					local v2 = nil
					local Success1 = nil
					
					if YOLO then
						Success1 = true
						PayloadFunction(Tbl, p2)
					else
						Success1, v50 = xpcall(PayloadFunction, DescribeError, Tbl, p2)
					end
					ReenableLogsFunction()
					
					if not Success1 then
						error(v2)
					end
				end
				if not ReactFiberNewContextNewModule then
					ReactFiberNewContextNewModule = require(script.Parent["ReactFiberNewContext.new"])
				end
				ReactFiberNewContextNewModule.exitDisallowedContextReadInDEV()
			end
		else
			Payload = PayloadFunction
		end
		return if Payload == nil then Tbl elseif EnableAllocationTrims then Object.assign(if type(Tbl) == "table" and getmetatable(Tbl) == nil then table.clone(Tbl) else Object.assign({}, Tbl), Payload) else Object.assign({}, Tbl, Payload)
	elseif Tag == 2 then
		Flag = true
		
		return Tbl
	else
		return Tbl
	end
end

ReactUpdateQueueModule.getStateFromUpdate = getStateFromUpdate

function ReactUpdateQueueModule.processUpdateQueue(p1, p2, p3, p4)
	-- upvalues: Flag (ref), DEV (copy), Shared (ref), NoLanes (copy), IsSubsetOfLanesFunction (copy), MergeLanesFunction (copy), NoLane (copy), getStateFromUpdate (copy), Callback (copy), MarkSkippedUpdateLanesFunction (copy)
	local UpdateQueue = p1.updateQueue
	Flag = false
	
	if DEV then
		Shared = UpdateQueue.shared
	end
	local FirstBaseUpdate = UpdateQueue.firstBaseUpdate
	local LastBaseUpdate = UpdateQueue.lastBaseUpdate
	local Pending = UpdateQueue.shared.pending
	
	if Pending ~= nil then
		UpdateQueue.shared.pending = nil
		local Next = Pending.next
		Pending.next = nil
		
		if LastBaseUpdate == nil then
			FirstBaseUpdate = Next
		else
			LastBaseUpdate.next = Next
		end
		local Alternate = p1.alternate
		
		if Alternate ~= nil then
			local UpdateQueue1 = Alternate.updateQueue
			local LastBaseUpdate1 = UpdateQueue1.lastBaseUpdate
			
			if LastBaseUpdate1 ~= Pending then
				if LastBaseUpdate1 == nil then
					UpdateQueue1.firstBaseUpdate = Next
				else
					LastBaseUpdate1.next = Next
				end
				UpdateQueue1.lastBaseUpdate = Pending
			end
		end
	end
	repeat
		if FirstBaseUpdate == nil then break end
		local BaseState = UpdateQueue.baseState
		local Lanes = NoLanes
		local BaseState1 = nil
		local FirstBaseUpdate1 = nil
		local LastBaseUpdate2 = nil
		local Next = FirstBaseUpdate
		while true do
			local Lane = Next.lane
			local EventTime = Next.eventTime
			if IsSubsetOfLanesFunction(p4, Lane) then
				if LastBaseUpdate2 ~= nil then
					local config = {
						next = nil,
						eventTime = EventTime,
						lane = NoLane,
						tag = Next.tag,
						payload = Next.payload,
						callback = Next.callback
					}
					LastBaseUpdate2.next = config
					LastBaseUpdate2 = config
				end
				BaseState = getStateFromUpdate(p1, UpdateQueue, Next, BaseState, p2, p3)
				
				if Next.callback ~= nil and Next.lane ~= NoLane then
					p1.flags = bit32.bor(p1.flags, Callback)
					local Effects = UpdateQueue.effects
					
					if Effects == nil then
						UpdateQueue.effects = { Next }
					else
						table.insert(Effects, Next)
					end
				end
			else
				local config = {
					next = nil,
					eventTime = EventTime,
					lane = Lane,
					tag = Next.tag,
					payload = Next.payload,
					callback = Next.callback
				}
				
				if LastBaseUpdate2 == nil then
					FirstBaseUpdate1 = config
					LastBaseUpdate2 = config
					BaseState1 = BaseState
				else
					LastBaseUpdate2.next = config
					LastBaseUpdate2 = config
				end
				Lanes = MergeLanesFunction(Lanes, Lane)
			end
			Next = Next.next
			
			if Next ~= nil then continue end
			local Pending1 = UpdateQueue.shared.pending
			
			if Pending1 == nil then break end
			Pending1.next = nil
			Next = Pending1.next
			UpdateQueue.lastBaseUpdate = Pending1
			UpdateQueue.shared.pending = nil
		end
		if LastBaseUpdate2 == nil then
			BaseState1 = BaseState
		end
		UpdateQueue.baseState = BaseState1
		UpdateQueue.firstBaseUpdate = FirstBaseUpdate1
		UpdateQueue.lastBaseUpdate = LastBaseUpdate2
		MarkSkippedUpdateLanesFunction(Lanes)
		p1.lanes = Lanes
		p1.memoizedState = BaseState
	until true
	if DEV then
		Shared = nil
	end
end

local _ = function(Callback: (any) -> (), p1)
	if type(Callback) ~= "function" then
		error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", (tostring(Callback))))
	end
	Callback(p1)
end

function ReactUpdateQueueModule.resetHasForceUpdateBeforeProcessing()
	-- upvalues: Flag (ref)
	Flag = false
end

function ReactUpdateQueueModule.checkHasForceUpdateAfterProcessing()
	-- upvalues: Flag (ref)
	return Flag
end

function ReactUpdateQueueModule:commitUpdateQueue(p1, p2)
	-- upvalues: Buffer (copy), Count (ref)
	local Effects = p1.effects
	p1.effects = nil
	
	if Effects ~= nil then
		for _, effect in Effects do
			local CallbackFunction: (any) -> () = effect.callback
			
			if CallbackFunction ~= nil then
				if type(CallbackFunction) ~= "function" then
					error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", (tostring(CallbackFunction))))
				end
				CallbackFunction(p2)
			end
			table.clear(effect)
			table.insert(Buffer, effect)
			Count += 1
		end
	end
end

return ReactUpdateQueueModule