local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local object = require(parent.LuauPolyfill).Object
local dEV = reactGlobalsModule.__DEV__
local yOLO = reactGlobalsModule.__YOLO__
local console = require(parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local noLane = reactFiberLaneModule.NoLane
local noLanes = reactFiberLaneModule.NoLanes
local isSubsetOfLanes = reactFiberLaneModule.isSubsetOfLanes
local mergeLanes = reactFiberLaneModule.mergeLanes
local var1 = nil

local function _()
	-- upvalues: var1 (write)
	if not var1 then
		var1 = require(script.Parent["ReactFiberNewContext.new"])
	end
	var1.enterDisallowedContextReadInDEV()
end

local _ = function()
	-- upvalues: var1 (write)
	if not var1 then
		var1 = require(script.Parent["ReactFiberNewContext.new"])
	end
	var1.exitDisallowedContextReadInDEV()
end

local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local callback = reactFiberFlagsModule.Callback
local shouldCapture = reactFiberFlagsModule.ShouldCapture
local didCapture = reactFiberFlagsModule.DidCapture
local debugRenderPhaseSideEffectsForStrictMode = require(parent.Shared).ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode
local strictMode = require(script.Parent.ReactTypeOfMode).StrictMode
local markSkippedUpdateLanes = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes
local describeError = require(parent.Shared).describeError
local consolePatchingDev = require(parent.Shared).ConsolePatchingDev
local disableLogs = consolePatchingDev.disableLogs
local reenableLogs = consolePatchingDev.reenableLogs
local t = {
	UpdateState = 0,
	ReplaceState = 1,
	ForceUpdate = 2,
	CaptureUpdate = 3
}
local var2 = false
local var3 = nil
local var4 = nil

if dEV then
	var3 = false
	var4 = nil
	
	function t.resetCurrentlyProcessingQueue()
		-- upvalues: var4 (write)
		var4 = nil
	end
end
local list = table.create(210)
local var5 = 210

for i = 1, 210 do
	list[i] = {
		eventTime = -1,
		lane = -1,
		tag = -1,
		payload = nil,
		callback = nil,
		next = nil
	}
end
function t.initializeUpdateQueue(p1)
	p1.updateQueue = {
		firstBaseUpdate = nil,
		lastBaseUpdate = nil,
		effects = nil,
		baseState = p1.memoizedState,
		shared = { pending = nil }
	}
end

function t.cloneUpdateQueue(p1, p2)
	local updateQueue = p1.updateQueue
	
	if p2.updateQueue == updateQueue then
		p2.updateQueue = table.clone(updateQueue)
	end
end

function t.createUpdate(p1, p2, p3, p4)
	-- upvalues: var5 (write), list (ref)
	if var5 > 0 then
		local var6 = list[var5]
		list[var5] = nil
		var5 -= 1
		var6.eventTime = p1
		var6.lane = p2
		var6.tag = 0
		var6.payload = p3
		var6.callback = p4
		
		return var6
	end
	return {
		tag = 0,
		next = nil,
		eventTime = p1,
		lane = p2,
		payload = p3,
		callback = p4
	}
end

function t.enqueueUpdate(p1, p2)
	-- upvalues: dEV (ref), var4 (write), var3 (write), console (ref)
	local updateQueue = p1.updateQueue
	
	if updateQueue == nil then return end
	local shared = updateQueue.shared
	local pending = shared.pending
	
	if pending == nil then
		p2.next = p2
	else
		p2.next = pending.next
		pending.next = p2
	end
	shared.pending = p2
	
	if dEV and var4 == shared and not var3 then
		console.error("An update (setState, replaceState, or forceUpdate) was scheduled from inside an update function. Update functions should be pure, with zero side-effects. Consider using componentDidUpdate or a callback.")
		var3 = true
	end
end

function t.enqueueCapturedUpdate(p1, p2)
	local updateQueue = p1.updateQueue
	local alternate = p1.alternate
	
	if alternate ~= nil then
		local updateQueue_1 = alternate.updateQueue
		
		if updateQueue == updateQueue_1 then
			local var6 = nil
			local var7 = nil
			local firstBaseUpdate = updateQueue.firstBaseUpdate
			
			if firstBaseUpdate == nil then
				var7 = p2
				var6 = p2
			else
				local var8 = firstBaseUpdate
				repeat
					local t = {
						next = nil,
						eventTime = var8.eventTime,
						lane = var8.lane,
						tag = var8.tag,
						payload = var8.payload,
						callback = var8.callback
					}
					if var7 == nil then
						var7 = t
						var6 = t
					else
						var7.next = t
						var7 = t
					end
					var8 = var8.next
				until var8 == nil
				if var7 == nil then
					var7 = p2
					var6 = p2
				else
					var7.next = p2
					var7 = p2
				end
			end
			updateQueue = {
				baseState = updateQueue_1.baseState,
				firstBaseUpdate = var6,
				lastBaseUpdate = var7,
				shared = updateQueue_1.shared,
				effects = updateQueue_1.effects
			}
			p1.updateQueue = updateQueue
			
			return
		else
			local lastBaseUpdate = updateQueue.lastBaseUpdate
			
			if lastBaseUpdate == nil then
				updateQueue.firstBaseUpdate = p2
			else
				lastBaseUpdate.next = p2
			end
			updateQueue.lastBaseUpdate = p2
		end
	end
end

local function getStateFromUpdate(p1, _, p2, p3, p4, _)
	-- upvalues: dEV (ref), var1 (write), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), yOLO (ref), describeError (ref), reenableLogs (ref), shouldCapture (ref), didCapture (ref), object (ref), var2 (write)
	local tag = p2.tag
	
	if tag == 1 then
		local payload = p2.payload
		
		if type(payload) == "function" then
			if dEV then
				if not var1 then
					var1 = require(script.Parent["ReactFiberNewContext.new"])
				end
				var1.enterDisallowedContextReadInDEV()
			end
			local var6 = payload(p3, p4)
			
			if dEV then
				if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, strictMode) ~= 0 then
					local var7
					disableLogs()
					local _ = nil
					local var8 = nil
					
					if yOLO then
						var7 = true
						payload(p3, p4)
					else
						local ok, status = xpcall(payload, describeError, p3, p4)
						var7 = ok
						var8 = status
					end
					reenableLogs()
					
					if not var7 then
						error(var8)
					end
				end
				if not var1 then
					var1 = require(script.Parent["ReactFiberNewContext.new"])
				end
				var1.exitDisallowedContextReadInDEV()
			end
			return var6
		else
			return payload
		end
	elseif tag == 3 or tag == 0 then
		if tag == 3 then
			p1.flags = bit32.bor(bit32.band(p1.flags, bit32.bnot(shouldCapture)), didCapture)
		end
		local var9
		local payload = p2.payload
		local _ = nil
		
		if type(payload) == "function" then
			if dEV then
				if not var1 then
					var1 = require(script.Parent["ReactFiberNewContext.new"])
				end
				var1.enterDisallowedContextReadInDEV()
			end
			var9 = payload(p3, p4)
			
			if dEV then
				if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, strictMode) ~= 0 then
					local var10
					disableLogs()
					local _ = nil
					local var11 = nil
					
					if yOLO then
						var10 = true
						payload(p3, p4)
					else
						local ok, status = xpcall(payload, describeError, p3, p4)
						var10 = ok
						var11 = status
					end
					reenableLogs()
					
					if not var10 then
						error(var11)
					end
				end
				var1 = var1 or require(script.Parent["ReactFiberNewContext.new"])
				var1.exitDisallowedContextReadInDEV()
			end
		else
			var9 = payload
		end
		return if var9 == nil then p3 else object.assign({}, p3, var9)
	elseif tag == 2 then
		var2 = true
		
		return p3
	end
	return p3
end

t.getStateFromUpdate = getStateFromUpdate

function t.processUpdateQueue(p1, p2, p3, p4)
	-- upvalues: var2 (write), dEV (ref), var4 (write), noLanes (ref), isSubsetOfLanes (ref), mergeLanes (ref), noLane (ref), getStateFromUpdate (ref), callback (ref), markSkippedUpdateLanes (ref)
	local updateQueue = p1.updateQueue
	var2 = false
	
	if dEV then
		var4 = updateQueue.shared
	end
	local firstBaseUpdate = updateQueue.firstBaseUpdate
	local lastBaseUpdate = updateQueue.lastBaseUpdate
	local pending = updateQueue.shared.pending
	
	if pending ~= nil then
		updateQueue.shared.pending = nil
		local var6 = pending
		local next = var6.next
		var6.next = nil
		
		if lastBaseUpdate == nil then
			firstBaseUpdate = next
		else
			lastBaseUpdate.next = next
		end
		local var7 = var6
		local alternate = p1.alternate
		
		if alternate ~= nil then
			local updateQueue_1 = alternate.updateQueue
			local lastBaseUpdate_1 = updateQueue_1.lastBaseUpdate
			
			if lastBaseUpdate_1 ~= var7 then
				if lastBaseUpdate_1 == nil then
					updateQueue_1.firstBaseUpdate = next
				else
					lastBaseUpdate_1.next = next
				end
				updateQueue_1.lastBaseUpdate = var6
			end
		end
	end
	if firstBaseUpdate ~= nil then
		local baseState = updateQueue.baseState
		local var8 = noLanes
		local var9 = nil
		local var10 = nil
		local var11 = nil
		local var12 = firstBaseUpdate
		while true do
			local lane = var12.lane
			local eventTime = var12.eventTime
			if isSubsetOfLanes(p4, lane) then
				if var11 ~= nil then
					local t = {
						next = nil,
						eventTime = eventTime,
						lane = noLane,
						tag = var12.tag,
						payload = var12.payload,
						callback = var12.callback
					}
					var11.next = t
					var11 = t
				end
				baseState = getStateFromUpdate(p1, updateQueue, var12, baseState, p2, p3)
				
				if var12.callback ~= nil and var12.lane ~= noLane then
					p1.flags = bit32.bor(p1.flags, callback)
					local effects = updateQueue.effects
					
					if effects == nil then
						updateQueue.effects = { var12 }
					else
						table.insert(effects, var12)
					end
				end
				var12 = var12.next
				
				if var12 ~= nil then continue end
				local pending_1 = updateQueue.shared.pending
				
				if pending_1 == nil then break end
				local var13 = pending_1
				local next = var13.next
				var13.next = nil
				var12 = next
				updateQueue.lastBaseUpdate = var13
				updateQueue.shared.pending = nil
			end
			local t = {
				next = nil,
				eventTime = eventTime,
				lane = lane,
				tag = var12.tag,
				payload = var12.payload,
				callback = var12.callback
			}
			
			if var11 == nil then
				var10 = t
				var11 = t
				var9 = baseState
			else
				var11.next = t
				var11 = t
			end
			var8 = mergeLanes(var8, lane)
		end
		if var11 == nil then
			var9 = baseState
		end
		updateQueue.baseState = var9
		updateQueue.firstBaseUpdate = var10
		updateQueue.lastBaseUpdate = var11
		markSkippedUpdateLanes(var8)
		p1.lanes = var8
		p1.memoizedState = baseState
	end
	if dEV then
		var4 = nil
	end
end

local _ = function(p5, p6)
	if type(p5) ~= "function" then
		error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", tostring(p5)))
	end
	p5(p6)
end

function t.resetHasForceUpdateBeforeProcessing()
	-- upvalues: var2 (write)
	var2 = false
end

function t.checkHasForceUpdateAfterProcessing()
	-- upvalues: var2 (write)
	return var2
end

function t.commitUpdateQueue(_, p5, p6)
	-- upvalues: list (ref), var5 (write)
	local effects = p5.effects
	p5.effects = nil
	
	if effects ~= nil then
		for i, v in effects do
			local callback = v.callback
			
			if callback ~= nil then
				if type(callback) ~= "function" then
					error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", tostring(callback)))
				end
				callback(p6)
			end
			table.clear(v)
			table.insert(list, v)
			var5 += 1
		end
	end
end

return t