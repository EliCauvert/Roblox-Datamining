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
local var2 = nil

local function _() --[[ line: 115 | named "enterDisallowedContextReadInDEV" ]]
	-- upvalues: var2 (write)
	if not var2 then
		var2 = require(script.Parent["ReactFiberNewContext.new"])
	end
	var2.enterDisallowedContextReadInDEV()
end

local _ = function() --[[ line: 121 | named "exitDisallowedContextReadInDEV" ]]
	-- upvalues: var2 (write)
	if not var2 then
		var2 = require(script.Parent["ReactFiberNewContext.new"])
	end
	var2.exitDisallowedContextReadInDEV()
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
local var5 = false
local var6 = nil
local var7 = nil

if dEV then
	var6 = false
	var7 = nil
	
	function t.resetCurrentlyProcessingQueue() --[[ line: 181 ]]
		-- upvalues: var7 (write)
		var7 = nil
	end
end
local list = table.create(210)
local var9 = 210

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
function t.initializeUpdateQueue(p0) --[[ line: 202 ]]
	p0.updateQueue = {
		firstBaseUpdate = nil,
		lastBaseUpdate = nil,
		effects = nil,
		baseState = p0.memoizedState,
		shared = { pending = nil }
	}
end

function t.cloneUpdateQueue(p1, p2) --[[ line: 216 ]]
	local updateQueue = p1.updateQueue
	
	if p2.updateQueue == updateQueue then
		p2.updateQueue = table.clone(updateQueue)
	end
end

function t.createUpdate(p3, p4, p5, p6) --[[ line: 230 ]]
	-- upvalues: var9 (write), list (ref)
	if var9 > 0 then
		local var11 = list[var9]
		list[var9] = nil
		var9 -= 1
		var11.eventTime = p3
		var11.lane = p4
		var11.tag = 0
		var11.payload = p5
		var11.callback = p6
		
		return var11
	end
	return {
		tag = 0,
		next = nil,
		eventTime = p3,
		lane = p4,
		payload = p5,
		callback = p6
	}
end

function t.enqueueUpdate(p7, p8) --[[ line: 280 ]]
	-- upvalues: dEV (ref), var7 (write), var6 (write), console (ref)
	local updateQueue = p7.updateQueue
	
	if updateQueue == nil then return end
	local shared = updateQueue.shared
	local pending = shared.pending
	
	if pending == nil then
		p8.next = p8
	else
		p8.next = pending.next
		pending.next = p8
	end
	shared.pending = p8
	
	if dEV and var7 == shared and not var6 then
		console.error("An update (setState, replaceState, or forceUpdate) was scheduled from inside an update function. Update functions should be pure, with zero side-effects. Consider using componentDidUpdate or a callback.")
		var6 = true
	end
end

function t.enqueueCapturedUpdate(p9, p10) --[[ line: 312 ]]
	local updateQueue = p9.updateQueue
	local alternate = p9.alternate
	
	if alternate ~= nil then
		local updateQueue_1 = alternate.updateQueue
		
		if updateQueue == updateQueue_1 then
			local var12 = nil
			local var13 = nil
			local firstBaseUpdate = updateQueue.firstBaseUpdate
			
			if firstBaseUpdate == nil then
				var13 = p10
				var12 = p10
			else
				local var14 = firstBaseUpdate
				repeat
					local t = {
						next = nil,
						eventTime = var14.eventTime,
						lane = var14.lane,
						tag = var14.tag,
						payload = var14.payload,
						callback = var14.callback
					}
					if var13 == nil then
						var13 = t
						var12 = t
					else
						var13.next = t
						var13 = t
					end
					var14 = var14.next
				until var14 == nil
				if var13 == nil then
					var13 = p10
					var12 = p10
				else
					var13.next = p10
					var13 = p10
				end
			end
			updateQueue = {
				baseState = updateQueue_1.baseState,
				firstBaseUpdate = var12,
				lastBaseUpdate = var13,
				shared = updateQueue_1.shared,
				effects = updateQueue_1.effects
			}
			p9.updateQueue = updateQueue
			
			return
		else
			local lastBaseUpdate = updateQueue.lastBaseUpdate
			
			if lastBaseUpdate == nil then
				updateQueue.firstBaseUpdate = p10
			else
				lastBaseUpdate.next = p10
			end
			updateQueue.lastBaseUpdate = p10
		end
	end
end

local function getStateFromUpdate(p11, _, p12, p13, p14, _) --[[ line: 393 ]]
	-- upvalues: dEV (ref), var2 (write), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), yOLO (ref), describeError (ref), reenableLogs (ref), shouldCapture (ref), didCapture (ref), object (ref), var5 (write)
	local tag = p12.tag
	
	if tag == 1 then
		local payload = p12.payload
		
		if type(payload) == "function" then
			if dEV then
				if not var2 then
					var2 = require(script.Parent["ReactFiberNewContext.new"])
				end
				var2.enterDisallowedContextReadInDEV()
			end
			local var16 = payload(p13, p14)
			
			if dEV then
				if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p11.mode, strictMode) ~= 0 then
					local var18
					disableLogs()
					local _ = nil
					local var17 = nil
					
					if yOLO then
						var18 = true
						payload(p13, p14)
					else
						local ok, status = xpcall(payload, describeError, p13, p14)
						var18 = ok
						var17 = status
					end
					reenableLogs()
					
					if not var18 then
						error(var17)
					end
				end
				if not var2 then
					var2 = require(script.Parent["ReactFiberNewContext.new"])
				end
				var2.exitDisallowedContextReadInDEV()
			end
			return var16
		else
			return payload
		end
	elseif tag == 3 or tag == 0 then
		if tag == 3 then
			p11.flags = bit32.bor(bit32.band(p11.flags, bit32.bnot(shouldCapture)), didCapture)
		end
		local var19
		local payload = p12.payload
		local _ = nil
		
		if type(payload) == "function" then
			if dEV then
				if not var2 then
					var2 = require(script.Parent["ReactFiberNewContext.new"])
				end
				var2.enterDisallowedContextReadInDEV()
			end
			var19 = payload(p13, p14)
			
			if dEV then
				if debugRenderPhaseSideEffectsForStrictMode and bit32.band(p11.mode, strictMode) ~= 0 then
					local var21
					disableLogs()
					local _ = nil
					local var20 = nil
					
					if yOLO then
						var21 = true
						payload(p13, p14)
					else
						local ok, status = xpcall(payload, describeError, p13, p14)
						var21 = ok
						var20 = status
					end
					reenableLogs()
					
					if not var21 then
						error(var20)
					end
				end
				var2 = var2 or require(script.Parent["ReactFiberNewContext.new"])
				var2.exitDisallowedContextReadInDEV()
			end
		else
			var19 = payload
		end
		return if var19 == nil then p13 else object.assign({}, p13, var19)
	elseif tag == 2 then
		var5 = true
		
		return p13
	end
	return p13
end

t.getStateFromUpdate = getStateFromUpdate

function t.processUpdateQueue(p15, p16, p17, p18) --[[ line: 502 ]]
	-- upvalues: var5 (write), dEV (ref), var7 (write), noLanes (ref), isSubsetOfLanes (ref), mergeLanes (ref), noLane (ref), getStateFromUpdate (ref), callback (ref), markSkippedUpdateLanes (ref)
	local updateQueue = p15.updateQueue
	var5 = false
	
	if dEV then
		var7 = updateQueue.shared
	end
	local firstBaseUpdate = updateQueue.firstBaseUpdate
	local lastBaseUpdate = updateQueue.lastBaseUpdate
	local pending = updateQueue.shared.pending
	
	if pending ~= nil then
		updateQueue.shared.pending = nil
		local var22 = pending
		local next = var22.next
		var22.next = nil
		
		if lastBaseUpdate == nil then
			firstBaseUpdate = next
		else
			lastBaseUpdate.next = next
		end
		local var23 = var22
		local alternate = p15.alternate
		
		if alternate ~= nil then
			local updateQueue_1 = alternate.updateQueue
			local lastBaseUpdate_1 = updateQueue_1.lastBaseUpdate
			
			if lastBaseUpdate_1 ~= var23 then
				if lastBaseUpdate_1 == nil then
					updateQueue_1.firstBaseUpdate = next
				else
					lastBaseUpdate_1.next = next
				end
				updateQueue_1.lastBaseUpdate = var22
			end
		end
	end
	if firstBaseUpdate ~= nil then
		local baseState = updateQueue.baseState
		local var24 = noLanes
		local var25 = nil
		local var26 = nil
		local var27 = nil
		local var28 = firstBaseUpdate
		while true do
			local lane = var28.lane
			local eventTime = var28.eventTime
			if isSubsetOfLanes(p18, lane) then
				if var27 ~= nil then
					local t = {
						next = nil,
						eventTime = eventTime,
						lane = noLane,
						tag = var28.tag,
						payload = var28.payload,
						callback = var28.callback
					}
					var27.next = t
					var27 = t
				end
				baseState = getStateFromUpdate(p15, updateQueue, var28, baseState, p16, p17)
				
				if var28.callback ~= nil and var28.lane ~= noLane then
					p15.flags = bit32.bor(p15.flags, callback)
					local effects = updateQueue.effects
					
					if effects == nil then
						updateQueue.effects = { var28 }
					else
						table.insert(effects, var28)
					end
				end
				var28 = var28.next
				
				if var28 ~= nil then continue end
				local pending_1 = updateQueue.shared.pending
				
				if pending_1 == nil then break end
				local var31 = pending_1
				local next = var31.next
				var31.next = nil
				var28 = next
				updateQueue.lastBaseUpdate = var31
				updateQueue.shared.pending = nil
			end
			local t = {
				next = nil,
				eventTime = eventTime,
				lane = lane,
				tag = var28.tag,
				payload = var28.payload,
				callback = var28.callback
			}
			
			if var27 == nil then
				var26 = t
				var27 = t
				var25 = baseState
			else
				var27.next = t
				var27 = t
			end
			var24 = mergeLanes(var24, lane)
		end
		if var27 == nil then
			var25 = baseState
		end
		updateQueue.baseState = var25
		updateQueue.firstBaseUpdate = var26
		updateQueue.lastBaseUpdate = var27
		markSkippedUpdateLanes(var24)
		p15.lanes = var24
		p15.memoizedState = baseState
	end
	if dEV then
		var7 = nil
	end
end

local _ = function(p19, p20) --[[ line: 694 | named "callCallback" ]]
	if type(p19) ~= "function" then
		error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", tostring(p19)))
	end
	p19(p20)
end

function t.resetHasForceUpdateBeforeProcessing() --[[ line: 709 ]]
	-- upvalues: var5 (write)
	var5 = false
end

function t.checkHasForceUpdateAfterProcessing() --[[ line: 713 ]]
	-- upvalues: var5 (write)
	return var5
end

function t.commitUpdateQueue(_, p21, p22) --[[ line: 717 ]]
	-- upvalues: list (ref), var9 (write)
	local effects = p21.effects
	p21.effects = nil
	
	if effects ~= nil then
		for i, v in effects do
			local callback = v.callback
			
			if callback ~= nil then
				if type(callback) ~= "function" then
					error(string.format("Invalid argument passed as callback. Expected a function. Instead received: %s", tostring(callback)))
				end
				callback(p22)
			end
			table.clear(v)
			table.insert(list, v)
			var9 += 1
		end
	end
end

return t