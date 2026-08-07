local function _(p0) --[[ line: 12 | named "unimplemented" ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. p0)
	error("FIXME (roblox): " .. p0 .. " is unimplemented")
end

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local object = luauPolyfillModule.Object
local dEV = reactGlobalsModule.__DEV__
local createRef = require(parent.React).createRef
local createBinding = require(parent.React).createBinding
local console = require(parent.Shared).console
local _ = require(parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local reactHookEffectTagsModule = require(script.Parent.ReactHookEffectTags)
local reactSharedInternals = require(parent.Shared).ReactSharedInternals
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local enableDebugTracing = reactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = reactFeatureFlags.enableSchedulingProfiler
local enableNewReconciler = reactFeatureFlags.enableNewReconciler
local enableDoubleInvokingEffects = reactFeatureFlags.enableDoubleInvokingEffects
local debugTracingMode = require(script.Parent.ReactTypeOfMode).DebugTracingMode
local noLane = reactFiberLaneModule.NoLane
local noLanes = reactFiberLaneModule.NoLanes
local isSubsetOfLanes = reactFiberLaneModule.isSubsetOfLanes
local mergeLanes = reactFiberLaneModule.mergeLanes
local removeLanes = reactFiberLaneModule.removeLanes
local markRootEntangled = reactFiberLaneModule.markRootEntangled
local markRootMutableRead = reactFiberLaneModule.markRootMutableRead
local readContext = require(script.Parent["ReactFiberNewContext.new"]).readContext
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local update = reactFiberFlagsModule.Update
local passive = reactFiberFlagsModule.Passive
local passiveStatic = reactFiberFlagsModule.PassiveStatic
local mountLayoutDev = reactFiberFlagsModule.MountLayoutDev
local mountPassiveDev = reactFiberFlagsModule.MountPassiveDev
local hasEffect = reactHookEffectTagsModule.HasEffect
local layout = reactHookEffectTagsModule.Layout
local passive_1 = reactHookEffectTagsModule.Passive
local unknownModule = require(script.Parent["ReactFiberWorkLoop.new"])
local warnIfNotCurrentlyActingUpdatesInDEV = unknownModule.warnIfNotCurrentlyActingUpdatesInDEV
local scheduleUpdateOnFiber = unknownModule.scheduleUpdateOnFiber
local warnIfNotScopedWithMatchingAct = unknownModule.warnIfNotScopedWithMatchingAct
local requestEventTime = unknownModule.requestEventTime
local requestUpdateLane = unknownModule.requestUpdateLane
local markSkippedUpdateLanes = unknownModule.markSkippedUpdateLanes
local getWorkInProgressRoot = unknownModule.getWorkInProgressRoot
local warnIfNotCurrentlyActingEffectsInDEV = unknownModule.warnIfNotCurrentlyActingEffectsInDEV
local invariant = require(parent.Shared).invariant
local getComponentName = require(parent.Shared).getComponentName

local _ = function(p1, p2) --[[ line: 117 | named "is" ]]
	local var42
	if p1 == p2 then
		var42 = true
		
		if p1 == 0 then
			var42 = true
			
			if 1 / p1 ~= 1 / p2 then
				var42 = p1 ~= p1 and p2 ~= p2
			end
		end
		return var42
	end
end

local markWorkInProgressReceivedUpdate = require(script.Parent["ReactFiberBeginWork.new"]).markWorkInProgressReceivedUpdate
local getIsHydrating = require(script.Parent["ReactFiberHydrationContext.new"]).getIsHydrating
local makeClientId = require(script.Parent.ReactFiberHostConfig).makeClientId
local unknownModule_1 = require(script.Parent["ReactMutableSource.new"])
local warnAboutMultipleRenderersDEV = unknownModule_1.warnAboutMultipleRenderersDEV
local getWorkInProgressVersion = unknownModule_1.getWorkInProgressVersion
local setWorkInProgressVersion = unknownModule_1.setWorkInProgressVersion
local markSourceAsDirty = unknownModule_1.markSourceAsDirty
local logStateUpdateScheduled = require(script.Parent.DebugTracing).logStateUpdateScheduled
local markStateUpdateScheduled = require(script.Parent.SchedulingProfiler).markStateUpdateScheduled
local reactCurrentDispatcher = reactSharedInternals.ReactCurrentDispatcher
local var7 = require(parent.SafeFlags).createGetFFlag("ReactCleanQueueOnUpdateBailout")()
local t = nil
local t_1 = nil

if dEV then
	t_1 = {}
	t = {}
end
local t_2 = {
	bailoutHooks = function(p3, p4, p5) --[[ line: 460 ]]
		-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), mountPassiveDev (ref), passive (ref), mountLayoutDev (ref), update (ref), removeLanes (ref)
		p4.updateQueue = p3.updateQueue
		
		if dEV and enableDoubleInvokingEffects then
			p4.flags = bit32.band(p4.flags, bit32.bnot(bit32.bor(mountPassiveDev, passive, mountLayoutDev, update)))
		else
			p4.flags = bit32.band(p4.flags, bit32.bnot(bit32.bor(passive, update)))
		end
		p3.lanes = removeLanes(p3.lanes, p5)
	end
}
local var11 = noLanes
local var12 = nil
local var13 = nil
local var14 = nil
local var15 = false
local var16 = false
local var17 = nil
local var18 = nil
local var19 = 0
local t_3 = nil
local t_4 = nil
local t_5 = nil
local t_6 = nil
local t_7 = nil
local t_8 = nil
local t_9 = nil

local _ = function(p6) --[[ line: 265 | named "getHighestIndex" ]]
	local var43 = 0
	
	for i, v in p6 do
		if var43 < i then
			var43 = i
		end
	end
	return var43
end

local _ = function(p7) --[[ line: 275 | named "isArrayOrSparseArray" ]]
	if type(p7) ~= "table" then
		return false
	end
	for i, v in p7 do
		if type(i) ~= "number" then
			return false
		end
	end
	return true
end

local _ = function() --[[ line: 287 | named "mountHookTypesDev" ]]
	-- upvalues: dEV (ref), var17 (write), var18 (write)
	if dEV then
		local var44 = var17
		
		if var18 == nil then
			var18 = { var44 }
			
			return
		end
		table.insert(var18, var44)
	end
end

function updateHookTypesDev() --[[ line: 300 ]]
	-- upvalues: dEV (ref), var17 (write), var18 (write), var19 (write)
	if dEV then
		local var45 = var17
		
		if var18 ~= nil then
			var19 += 1
			
			if var18[var19] ~= var45 then
				warnOnHookMismatchInDev(var45)
			end
		end
	end
end

local _ = function(p8) --[[ line: 314 | named "checkDepsAreArrayDev" ]]
	-- upvalues: dEV (ref), console (ref), var17 (write)
	if dEV and p8 ~= nil then
		local var46
		if type(p8) == "table" then
			for i, v in p8 do
				if type(i) ~= "number" then
					var46 = false
				end
			end
			var46 = true
		else
			var46 = false
		end
		if not var46 then
			console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var17, type(p8))
		end
	end
end

function warnOnHookMismatchInDev(p9) --[[ line: 329 ]]
	-- upvalues: dEV (ref), getComponentName (ref), var12 (write), t (write), var18 (write), var19 (write), console (ref)
	if dEV then
		local type = getComponentName(var12.type) or "Component"
		
		if not t[type] then
			t[type] = true
			
			if var18 ~= nil then
				local var48 = ""
				
				for i = 1, var19 do
					local var49 = var18[i]
					local var50 = if i == var19 then p9 else var49
					local text = tostring(i) .. ". " .. (var49 or "undefined")
				end
				console.error("React has detected a change in the order of Hooks called by %s. This will lead to bugs and errors if not fixed. For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n   Previous render            Next render\n   ------------------------------------------------------\n%s   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", type, var48)
			end
		end
	end
end

local function throwInvalidHookError() --[[ line: 381 ]]
	-- upvalues: error (ref)
	error(error.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."))
end

local function areHookInputsEqual(p10, p11) --[[ line: 396 ]]
	-- upvalues: dEV (ref), console (ref), var17 (write)
	if p11 == nil then
		if dEV then
			console.error("%s received a final argument during this render, but not during the previous render. Even though the final argument is optional, its type cannot change between renders.", var17)
		end
		return false
	else
		local var52 = 0
		
		for i, v in p10 do
			if var52 < i then
				var52 = i
			end
		end
		local var53 = 0
		
		for i_1, v_1 in p11 do
			if var53 < i_1 then
				var53 = i_1
			end
		end
		if var52 ~= var53 then
			return false
		end
		for i_2 = 1, math.min(var53, var52) do
			local var56
			local var54 = p10[i_2]
			local var55 = p11[i_2]
			
			if var54 == var55 then
				var56 = true
				
				if var54 == 0 then
					var56 = true
					
					if 1 / var54 ~= 1 / var55 then
						var56 = var54 ~= var54 and var55 ~= var55
					end
				end
				if var56 then
					continue
				end
				return false
			end
		end
		return true
	end
end

local var29 = false

function t_2.resetHooksAfterThrow() --[[ line: 485 ]]
	-- upvalues: reactCurrentDispatcher (ref), t_2 (ref), var15 (write), var12 (write), var11 (write), noLanes (ref), var13 (write), var14 (write), dEV (ref), var18 (write), var19 (write), var17 (write), var29 (write), var16 (write)
	reactCurrentDispatcher.current = t_2.ContextOnlyDispatcher
	
	if var15 then
		local memoizedState = var12.memoizedState
		while memoizedState ~= nil do
			local queue = memoizedState.queue
			
			if queue ~= nil then
				queue.pending = nil
			end
			memoizedState = memoizedState.next
		end
		var15 = false
	end
	var11 = noLanes
	var12 = nil
	var13 = nil
	var14 = nil
	
	if dEV then
		var18 = nil
		var19 = 0
		var17 = nil
		var29 = false
	end
	var16 = false
end

local _ = function() --[[ line: 530 | named "mountWorkInProgressHook" ]]
	-- upvalues: var14 (write), var12 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var14 == nil then
		var12.memoizedState = t
		var14 = t
	else
		var14.next = t
		var14 = t
	end
	return var14
end

local function updateWorkInProgressHook() --[[ line: 553 ]]
	-- upvalues: var13 (write), var12 (write), var14 (write), error (ref)
	local var58
	local _ = nil
	
	if var13 == nil then
		local alternate = var12.alternate
		var58 = if alternate ~= nil then nil else alternate.memoizedState
	else
		var58 = var13.next
	end
	local var59 = if var14 == nil then var12.memoizedState else var14.next
	
	if var59 == nil then
		if var58 == nil then
			error(error.new("Rendered more hooks than during the previous render."))
		end
		var13 = var58
		local t = {
			next = nil,
			memoizedState = var13.memoizedState,
			baseState = var13.baseState,
			baseQueue = var13.baseQueue,
			queue = var13.queue
		}
		
		if var14 == nil then
			var14 = t
			var12.memoizedState = t
		else
			var14.next = t
			var14 = t
		end
	else
		var14 = var59
		var59 = var14.next
		var13 = var58
	end
	return var14
end

function basicStateReducer(p12, p13) --[[ line: 628 ]]
	return if type(p13) == "function" then p13(p12) else p13
end

function mountReducer(p14, p15, p16) --[[ line: 637 ]]
	-- upvalues: var14 (write), var12 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var14 == nil then
		var12.memoizedState = t
		var14 = t
	else
		var14.next = t
		var14 = t
	end
	local var62 = var14
	local var63 = if p16 ~= nil then p15 else p16(p15)
	var62.baseState = var63
	var62.memoizedState = var62.baseState
	local t_1 = {
		pending = nil,
		dispatch = nil,
		lastRenderedReducer = p14,
		lastRenderedState = var63
	}
	var62.queue = t_1
	
	local var65 = function(p17, ...) --[[ line: 664 ]]
		-- upvalues: var12 (ref), t_1 (ref)
		dispatchAction(var12, t_1, p17, ...)
	end
	
	t_1.dispatch = var65
	
	return var62.memoizedState, var65
end

function updateReducer(p18, _, _) --[[ line: 674 ]]
	-- upvalues: updateWorkInProgressHook (ref), var13 (write), var11 (write), var12 (write), mergeLanes (ref), markSkippedUpdateLanes (ref), noLane (ref), markWorkInProgressReceivedUpdate (ref)
	local var66 = updateWorkInProgressHook()
	local queue = var66.queue
	assert(queue ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.")
	queue.lastRenderedReducer = p18
	local baseQueue = var13.baseQueue
	local pending = queue.pending
	
	if pending ~= nil then
		if baseQueue ~= nil then
			local next = baseQueue.next
			baseQueue.next = pending.next
			pending.next = next
		end
		baseQueue = pending
		var13.baseQueue = baseQueue
		queue.pending = nil
	end
	if baseQueue ~= nil then
		local next = baseQueue.next
		local baseState = var13.baseState
		local var67 = nil
		local var68 = nil
		local next_1 = nil
		local var69 = next
		repeat
			local lane = var69.lane
			if bit32.band(var11, lane) == lane then
				if next_1 ~= nil then
					next_1.next = {
						next = nil,
						lane = noLane,
						action = var69.action,
						eagerReducer = var69.eagerReducer,
						eagerState = var69.eagerState
					}
					next_1 = next_1.next
				end
				baseState = if var69.eagerReducer == p18 then var69.eagerState else p18(baseState, var69.action)
				var69 = var69.next
			end
			local t = {
				next = nil,
				lane = lane,
				action = var69.action,
				eagerReducer = var69.eagerReducer,
				eagerState = var69.eagerState
			}
			
			if next_1 == nil then
				next_1 = t
				var68 = next_1
				var67 = baseState
			else
				next_1.next = t
				next_1 = next_1.next
			end
			var12.lanes = mergeLanes(var12.lanes, lane)
			markSkippedUpdateLanes(lane)
		until var69 == nil or var69 == next
		if next_1 == nil then
			var67 = baseState
		else
			next_1.next = var68
		end
		local var72
		local var71 = baseState
		local memoizedState = var66.memoizedState
		
		if var71 == memoizedState then
			var72 = true
			
			if var71 == 0 then
				var72 = true
				
				if 1 / var71 ~= 1 / memoizedState then
					var72 = var71 ~= var71 and memoizedState ~= memoizedState
				end
			end
			if not var72 then
				markWorkInProgressReceivedUpdate()
			end
			var66.memoizedState = baseState
			var66.baseState = var67
			var66.baseQueue = next_1
			queue.lastRenderedState = baseState
		end
	end
	return var66.memoizedState, queue.dispatch
end

function rerenderReducer(p19, _, _) --[[ line: 815 ]]
	-- upvalues: updateWorkInProgressHook (ref), markWorkInProgressReceivedUpdate (ref)
	local var73 = updateWorkInProgressHook()
	local queue = var73.queue
	assert(queue ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.")
	queue.lastRenderedReducer = p19
	local dispatch = queue.dispatch
	local pending = queue.pending
	local memoizedState = var73.memoizedState
	
	if pending ~= nil then
		queue.pending = nil
		local next = pending.next
		local var74 = next
		repeat
			memoizedState = p19(memoizedState, var74.action)
			var74 = var74.next
		until var74 == next
		local var76
		local var75 = memoizedState
		local memoizedState_1 = var73.memoizedState
		
		if var75 == memoizedState_1 then
			var76 = true
			
			if var75 == 0 then
				var76 = true
				
				if 1 / var75 ~= 1 / memoizedState_1 then
					var76 = var75 ~= var75 and memoizedState_1 ~= memoizedState_1
				end
			end
			if not var76 then
				markWorkInProgressReceivedUpdate()
			end
			var73.memoizedState = memoizedState
			
			if var73.baseQueue == nil then
				var73.baseState = memoizedState
			end
			queue.lastRenderedState = memoizedState
		end
	end
	return memoizedState, dispatch
end

function readFromUnsubcribedMutableSource(p20, p21, p22) --[[ line: 880 ]]
	-- upvalues: dEV (ref), warnAboutMultipleRenderersDEV (ref), getWorkInProgressVersion (ref), isSubsetOfLanes (ref), var11 (write), setWorkInProgressVersion (ref), console (ref), markSourceAsDirty (ref), error (ref)
	if dEV then
		warnAboutMultipleRenderersDEV(p21)
	end
	local var79
	local version = p21._getVersion(p21._source)
	local _ = false
	local var78 = getWorkInProgressVersion(p21)
	
	if var78 == nil then
		var79 = isSubsetOfLanes(var11, p20.mutableReadLanes)
		
		if var79 then
			setWorkInProgressVersion(p21, version)
		end
	else
		local _ = var78 == version
	end
	if not var79 then
		markSourceAsDirty(p21)
		error(error.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."))
		
		return
	end
	local var80 = p22(p21._source)
	
	if dEV and type(var80) == "function" then
		console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
	end
	return var80
end

function useMutableSource(p23, p24, p25, p26) --[[ line: 963 ]]
	-- upvalues: getWorkInProgressRoot (ref), invariant (ref), reactCurrentDispatcher (ref), var14 (write), var12 (write), dEV (ref), console (ref), requestUpdateLane (ref), markRootMutableRead (ref), markRootEntangled (ref)
	local var81 = getWorkInProgressRoot()
	invariant(var81 ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.")
	local getVersion = p24._getVersion
	local var82 = getVersion(p24._source)
	local current = reactCurrentDispatcher.current
	assert(current ~= nil, "dispatcher was nil, this is a bug in React")
	local var83, var84 = current.useState(function() --[[ line: 988 ]]
		-- upvalues: var81 (ref), p24 (ref), p25 (ref)
		return readFromUnsubcribedMutableSource(var81, p24, p25)
	end)
	local var85 = var83
	local memoizedState = p23.memoizedState
	
	if memoizedState.refs == nil then
		error(tostring(debug.traceback()))
	end
	local var86
	local refs = memoizedState.refs
	local getSnapshot = refs.getSnapshot
	local source = memoizedState.source
	local subscribe = memoizedState.subscribe
	p23.memoizedState = { refs = refs, source = p24, subscribe = p26 }
	current.useEffect(function() --[[ line: 1017 ]]
		-- upvalues: refs (ref), p25 (ref), var84 (write), getVersion (ref), p24 (ref), var82 (ref), dEV (copy), console (copy), var85 (write), requestUpdateLane (copy), var12 (ref), markRootMutableRead (copy), var81 (ref), markRootEntangled (copy)
		local var90
		refs.getSnapshot = p25
		refs.setSnapshot = var84
		local var88 = getVersion(p24._source)
		local var89 = var82
		
		if var89 == var88 then
			var90 = true
			
			if var89 == 0 then
				var90 = true
				
				if 1 / var89 ~= 1 / var88 then
					var90 = var89 ~= var89 and var88 ~= var88
				end
			end
			if not var90 then
				var90 = p25(p24._source)
				
				if dEV and type(var90) == "function" then
					console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
				end
				local var91 = var85
				
				if var91 == var90 then
					var89 = true
					
					if var91 == 0 then
						var89 = true
						
						if 1 / var91 ~= 1 / var90 then
							var89 = var91 ~= var91 and var90 ~= var90
						end
					end
					if not var89 then
						var84(var90)
						markRootMutableRead(var81, requestUpdateLane(var12))
					end
					markRootEntangled(var81, var81.mutableReadLanes)
				end
			end
		end
	end, { p25, p24, p26 })
	current.useEffect(function() --[[ line: 1055 ]]
		-- upvalues: refs (ref), p24 (ref), requestUpdateLane (copy), var12 (ref), markRootMutableRead (copy), var81 (ref), p26 (ref), dEV (copy), console (copy)
		local var92 = p26(p24._source, function() --[[ line: 1056 ]]
			-- upvalues: refs (copy), p24 (copy), requestUpdateLane (copy), var12 (copy), markRootMutableRead (copy), var81 (copy)
			local getSnapshot = refs.getSnapshot
			local setSnapshot = refs.setSnapshot
			local ok, status = pcall(function() --[[ line: 1061 ]]
				-- upvalues: setSnapshot (ref), getSnapshot (ref), p24 (copy), requestUpdateLane (copy), var12 (copy), markRootMutableRead (copy), var81 (copy)
				setSnapshot(getSnapshot(p24._source))
				markRootMutableRead(var81, requestUpdateLane(var12))
			end)
			
			if not ok then
				setSnapshot(function() --[[ line: 1075 ]]
					-- upvalues: status (ref)
					error(status)
				end)
			end
		end)
		
		if dEV and type(var92) ~= "function" then
			console.error("Mutable source subscribe function must return an unsubscribe function.")
		end
		return var92
	end, { p24, p26 })
	
	if getSnapshot == p25 then
		var86 = true
		
		if getSnapshot == 0 then
			var86 = true
			
			if 1 / getSnapshot ~= 1 / p25 then
				var86 = getSnapshot ~= getSnapshot and p25 ~= p25
			end
		end
		if var86 then
			if source == p24 then
				var86 = true
				
				if source == 0 then
					var86 = true
					
					if 1 / source ~= 1 / p24 then
						var86 = source ~= source and p24 ~= p24
					end
				end
				if var86 then
					if subscribe == p26 then
						var86 = true
						
						if subscribe == 0 then
							var86 = true
							
							if 1 / subscribe ~= 1 / p26 then
								var86 = subscribe ~= subscribe and p26 ~= p26
							end
						end
						if not var86 then
							var86 = {
								pending = nil,
								dispatch = nil,
								lastRenderedReducer = basicStateReducer,
								lastRenderedState = var85
							}
							local var87 = var12
							
							function var86.dispatch(...) --[[ line: 1124 ]]
								-- upvalues: var87 (ref), var86 (ref)
								dispatchAction(var87, var86, ...)
							end
							
							var14.queue = var86
							var14.baseQueue = nil
							var85 = readFromUnsubcribedMutableSource(var81, p24, p25)
							var14.baseState = var85
							var14.memoizedState = var14.baseState
						end
						return var85
					end
				end
			end
		end
	end
end

function mountMutableSource(p27, p28, p29) --[[ line: 1138 ]]
	-- upvalues: var14 (write), var12 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var14 == nil then
		var12.memoizedState = t
		var14 = t
	else
		var14.next = t
		var14 = t
	end
	local var94 = var14
	var94.memoizedState = {
		refs = { setSnapshot = nil, getSnapshot = p28 },
		source = p27,
		subscribe = p29
	}
	
	return useMutableSource(var94, p27, p28, p29)
end

function updateMutableSource(p30, p31, p32) --[[ line: 1161 ]]
	-- upvalues: updateWorkInProgressHook (ref)
	return useMutableSource(updateWorkInProgressHook(), p30, p31, p32)
end

function mountState(p33) --[[ line: 1176 ]]
	-- upvalues: var14 (write), var12 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var14 == nil then
		var12.memoizedState = t
		var14 = t
	else
		var14.next = t
		var14 = t
	end
	local var96 = var14
	
	if type(p33) == "function" then
		p33 = p33()
	end
	var96.baseState = p33
	var96.memoizedState = var96.baseState
	local t_1 = {
		pending = nil,
		dispatch = nil,
		lastRenderedReducer = nil,
		lastRenderedState = p33,
		lastRenderedReducer = basicStateReducer
	}
	var96.queue = t_1
	
	local var98 = function(p34, ...) --[[ line: 1198 ]]
		-- upvalues: var12 (ref), t_1 (ref)
		dispatchAction(var12, t_1, p34, ...)
	end
	
	t_1.dispatch = var98
	
	return var96.memoizedState, var98
end

function updateState(p35) --[[ line: 1207 ]]
	return updateReducer(basicStateReducer, p35)
end

function rerenderState(p36) --[[ line: 1211 ]]
	return rerenderReducer(basicStateReducer, p36)
end

local function pushEffect(p37, p38, p39, p40) --[[ line: 1215 ]]
	-- upvalues: var12 (write)
	local t = {
		next = nil,
		tag = p37,
		create = p38,
		destroy = p39,
		deps = p40
	}
	local updateQueue = var12.updateQueue
	
	if updateQueue == nil then
		updateQueue = { lastEffect = nil }
		var12.updateQueue = updateQueue
		t.next = t
		updateQueue.lastEffect = t
		
		return t
	end
	local lastEffect = updateQueue.lastEffect
	
	if lastEffect == nil then
		updateQueue.lastEffect = t
		t.next = t
		
		return t
	end
	local next = lastEffect.next
	lastEffect.next = t
	t.next = next
	updateQueue.lastEffect = t
	
	return t
end

function mountBinding(p41) --[[ line: 1251 ]]
	-- upvalues: var14 (write), var12 (write), createBinding (ref)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var14 == nil then
		var12.memoizedState = t
		var14 = t
	else
		var14.next = t
		var14 = t
	end
	local var101 = var14
	local var102, var103 = createBinding(p41)
	var101.memoizedState = { var102, var103 }
	
	return var102, var103
end

function updateBinding(_) --[[ line: 1260 ]]
	-- upvalues: updateWorkInProgressHook (ref)
	return unpack(updateWorkInProgressHook().memoizedState)
end

function mountRef(p42) --[[ line: 1265 ]]
	-- upvalues: var14 (write), var12 (write), createRef (ref)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var14 == nil then
		var12.memoizedState = t
		var14 = t
	else
		var14.next = t
		var14 = t
	end
	local var105 = var14
	local var106 = createRef()
	var106.current = p42
	var105.memoizedState = var106
	
	return var106
end

function updateRef(_) --[[ line: 1277 ]]
	-- upvalues: updateWorkInProgressHook (ref)
	return updateWorkInProgressHook().memoizedState
end

local function mountEffectImpl(p43, p44, p45, p46) --[[ line: 1282 ]]
	-- upvalues: var14 (write), var12 (write), pushEffect (ref), hasEffect (ref)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var14 == nil then
		var12.memoizedState = t
		var14 = t
	else
		var14.next = t
		var14 = t
	end
	local var108 = var14
	var12.flags = bit32.bor(var12.flags, p43)
	var108.memoizedState = pushEffect(bit32.bor(hasEffect, p44), p45, nil, p46)
end

function updateEffectImpl(p47, p48, p49, p50) --[[ line: 1294 ]]
	-- upvalues: updateWorkInProgressHook (ref), var13 (write), areHookInputsEqual (ref), pushEffect (ref), var12 (write), hasEffect (ref)
	local var109 = updateWorkInProgressHook()
	local destroy = nil
	
	if var13 ~= nil then
		local memoizedState = var13.memoizedState
		destroy = memoizedState.destroy
		
		if p50 == nil or not areHookInputsEqual(p50, memoizedState.deps) then
			var12.flags = bit32.bor(var12.flags, p47)
			var109.memoizedState = pushEffect(bit32.bor(hasEffect, p48), p49, destroy, p50)
			
			return
		else
			var109.memoizedState = pushEffect(p48, p49, destroy, p50)
		end
	end
end

local function mountEffect(p51, p52) --[[ line: 1320 ]]
	-- upvalues: dEV (ref), reactGlobalsModule (ref), warnIfNotCurrentlyActingEffectsInDEV (ref), var12 (write), enableDoubleInvokingEffects (ref), mountPassiveDev (ref), passive (ref), passiveStatic (ref), passive_1 (ref), var14 (write), pushEffect (ref), hasEffect (ref)
	if dEV and (type(_G.jest) ~= "nil" or reactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
		warnIfNotCurrentlyActingEffectsInDEV(var12)
	end
	if dEV and enableDoubleInvokingEffects then
		local bits = bit32.bor(mountPassiveDev, passive, passiveStatic)
		local var111 = passive_1
		local t = {
			memoizedState = nil,
			baseState = nil,
			baseQueue = nil,
			queue = nil,
			next = nil
		}
		
		if var14 == nil then
			var12.memoizedState = t
			var14 = t
		else
			var14.next = t
			var14 = t
		end
		local var113 = var14
		var12.flags = bit32.bor(var12.flags, bits)
		var113.memoizedState = pushEffect(bit32.bor(hasEffect, var111), p51, nil, p52)
		
		return
	else
		local bits = bit32.bor(passive, passiveStatic)
		local t = {
			memoizedState = nil,
			baseState = nil,
			baseQueue = nil,
			queue = nil,
			next = nil
		}
		
		if var14 == nil then
			var12.memoizedState = t
			var14 = t
		else
			var14.next = t
			var14 = t
		end
		local var116 = var14
		var12.flags = bit32.bor(var12.flags, bits)
		var116.memoizedState = pushEffect(bit32.bor(hasEffect, passive_1), p51, nil, p52)
	end
end

local function updateEffect(p53, p54) --[[ line: 1350 ]]
	-- upvalues: dEV (ref), reactGlobalsModule (ref), warnIfNotCurrentlyActingEffectsInDEV (ref), var12 (write), passive (ref), passive_1 (ref)
	if dEV and (type(_G.jest) ~= "nil" or reactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
		warnIfNotCurrentlyActingEffectsInDEV(var12)
	end
	updateEffectImpl(passive, passive_1, p53, p54)
end

local function mountLayoutEffect(p55, p56) --[[ line: 1365 ]]
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), mountLayoutDev (ref), update (ref), layout (ref), var14 (write), var12 (write), pushEffect (ref), hasEffect (ref)
	if dEV and enableDoubleInvokingEffects then
		local bits = bit32.bor(mountLayoutDev, update)
		local var118 = layout
		local t = {
			memoizedState = nil,
			baseState = nil,
			baseQueue = nil,
			queue = nil,
			next = nil
		}
		
		if var14 == nil then
			var12.memoizedState = t
			var14 = t
		else
			var14.next = t
			var14 = t
		end
		local var120 = var14
		var12.flags = bit32.bor(var12.flags, bits)
		var120.memoizedState = pushEffect(bit32.bor(hasEffect, var118), p55, nil, p56)
		
		return
	else
		local t = {
			memoizedState = nil,
			baseState = nil,
			baseQueue = nil,
			queue = nil,
			next = nil
		}
		
		if var14 == nil then
			var12.memoizedState = t
			var14 = t
		else
			var14.next = t
			var14 = t
		end
		local var122 = var14
		var12.flags = bit32.bor(var12.flags, update)
		var122.memoizedState = pushEffect(bit32.bor(hasEffect, layout), p55, nil, p56)
	end
end

local function updateLayoutEffect(p57, p58) --[[ line: 1382 ]]
	-- upvalues: update (ref), layout (ref)
	updateEffectImpl(update, layout, p57, p58)
end

function imperativeHandleEffect(p59, p60) --[[ line: 1390 ]]
	-- upvalues: dEV (ref), object (ref), console (ref), array (ref)
	if p60 ~= nil and type(p60) == "function" then
		p60(p59())
		
		return function() --[[ line: 1399 ]]
			-- upvalues: p60 (ref)
			return p60(nil)
		end
	elseif p60 == nil then
		return nil
	elseif dEV then
		if not (getmetatable(p60) ~= nil and #object.keys(p60) == 0) then
			console.error("Expected useImperativeHandle() first argument to either be a ref callback or React.createRef() object. Instead received: %s.", "an object with keys {" .. array.join(object.keys(p60), ", ") .. "}")
		end
	end
	p60.current = p59()
	
	return function() --[[ line: 1424 ]]
		-- upvalues: p60 (ref)
		p60.current = nil
	end
end

function mountImperativeHandle(p61, p62, p63) --[[ line: 1433 ]]
	-- upvalues: dEV (ref), console (ref), array (ref), enableDoubleInvokingEffects (ref), mountEffectImpl (ref), mountLayoutDev (ref), update (ref), layout (ref)
	if dEV and type(p62) ~= "function" then
		console.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", if p62 ~= nil then "nil" else type(p62))
	end
	local var123 = if p63 ~= nil then nil else array.concat(p63, { p61 })
	
	return if dEV and enableDoubleInvokingEffects then mountEffectImpl(bit32.bor(mountLayoutDev, update), layout, function() --[[ line: 1456 ]]
		-- upvalues: p62 (ref), p61 (ref)
		return imperativeHandleEffect(p62, p61)
	end, var123) else mountEffectImpl(update, layout, function() --[[ line: 1462 ]]
		-- upvalues: p62 (ref), p61 (ref)
		return imperativeHandleEffect(p62, p61)
	end, var123)
end

function updateImperativeHandle(p64, p65, p66) --[[ line: 1468 ]]
	-- upvalues: dEV (ref), console (ref), update (ref), layout (ref)
	if dEV and type(p65) ~= "function" then
		console.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", if p65 then type(p65) else "nil")
	end
	local cloned = nil
	
	if p66 ~= nil then
		cloned = table.clone(p66)
		table.insert(cloned, p64)
	end
	return updateEffectImpl(update, layout, function() --[[ line: 1495 ]]
		-- upvalues: p65 (ref), p64 (ref)
		return imperativeHandleEffect(p65, p64)
	end, cloned)
end

function mountDebugValue(_, _) --[[ line: 1500 ]] end

local _mountDebugValue = mountDebugValue

function mountCallback(p67, p68) --[[ line: 1508 ]]
	-- upvalues: var14 (write), var12 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var14 == nil then
		var12.memoizedState = t
		var14 = t
	else
		var14.next = t
		var14 = t
	end
	var14.memoizedState = { p67, p68 }
	
	return p67
end

function updateCallback(p69, p70) --[[ line: 1516 ]]
	-- upvalues: updateWorkInProgressHook (ref), areHookInputsEqual (ref)
	local var126 = updateWorkInProgressHook()
	local memoizedState = var126.memoizedState
	
	if memoizedState == nil or p70 == nil or not areHookInputsEqual(p70, memoizedState[2]) then
		var126.memoizedState = { p69, p70 }
		
		return p69
	end
	return memoizedState[1]
end

function mountMemo(p71, p72) --[[ line: 1535 ]]
	-- upvalues: var14 (write), var12 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var14 == nil then
		var12.memoizedState = t
		var14 = t
	else
		var14.next = t
		var14 = t
	end
	local list = { p71() }
	var14.memoizedState = { list, p72 }
	
	return unpack(list)
end

function updateMemo(p73, p74) --[[ line: 1547 ]]
	-- upvalues: updateWorkInProgressHook (ref), areHookInputsEqual (ref)
	local var129 = updateWorkInProgressHook()
	local memoizedState = var129.memoizedState
	
	if memoizedState == nil or p74 == nil or not areHookInputsEqual(p74, memoizedState[2]) then
		local list = { p73() }
		var129.memoizedState = { list, p74 }
		
		return unpack(list)
	end
	return unpack(memoizedState[1])
end

function t_2.getIsUpdatingOpaqueValueInRenderPhaseInDEV() --[[ line: 1697 ]]
	-- upvalues: dEV (ref)
	return if dEV then false else nil
end

function mountOpaqueIdentifier() --[[ line: 1719 ]]
	-- upvalues: dEV (ref), console (ref), makeClientId (ref), getIsHydrating (ref)
	local var131 = nil
	
	if dEV then
		console.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV")
	else
		var131 = makeClientId
	end
	if getIsHydrating() then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: ReactFiberHooks: getIsHydrating() true")
		error("FIXME (roblox): ReactFiberHooks: getIsHydrating() true is unimplemented")
		
		return nil
	end
	local var132 = var131()
	mountState(var132)
	
	return var132
end

function updateOpaqueIdentifier() --[[ line: 1786 ]]
	local var133, _ = updateState(nil)
	
	return var133
end

function rerenderOpaqueIdentifier() --[[ line: 1791 ]]
	local var134, _ = rerenderState(nil)
	
	return var134
end

function dispatchAction(p75, p76, p77, ...) --[[ line: 1796 ]]
	-- upvalues: dEV (ref), console (ref), requestEventTime (ref), requestUpdateLane (ref), var12 (write), var15 (write), var16 (write), noLanes (ref), reactCurrentDispatcher (ref), t_8 (write), var7 (ref), reactGlobalsModule (ref), warnIfNotScopedWithMatchingAct (ref), warnIfNotCurrentlyActingUpdatesInDEV (ref), scheduleUpdateOnFiber (ref), enableDebugTracing (ref), debugTracingMode (ref), getComponentName (ref), logStateUpdateScheduled (ref), enableSchedulingProfiler (ref), markStateUpdateScheduled (ref)
	if dEV and type(if select("#", ...) == 1 then select(1, ...) else nil) == "function" then
		console.error("State updates from the useState() and useReducer() Hooks don't support the second callback argument. To execute a side effect after rendering, declare it in the component body with useEffect().")
	end
	local var135 = requestEventTime()
	local var136 = requestUpdateLane(p75)
	local t = {
		eagerReducer = nil,
		eagerState = nil,
		next = nil,
		lane = var136,
		action = p77
	}
	local pending = p76.pending
	
	if pending == nil then
		t.next = t
	else
		t.next = pending.next
		pending.next = t
	end
	p76.pending = t
	local alternate = p75.alternate
	
	if p75 == var12 or alternate ~= nil and alternate == var12 then
		var15 = true
		var16 = true
	elseif p75.lanes == noLanes and (alternate == nil or alternate.lanes == noLanes) then
		local lastRenderedReducer = p76.lastRenderedReducer
		
		if lastRenderedReducer ~= nil then
			local current = nil
			
			if dEV then
				current = reactCurrentDispatcher.current
				reactCurrentDispatcher.current = t_8
			end
			local var138
			local lastRenderedState = p76.lastRenderedState
			local ok, status = pcall(lastRenderedReducer, lastRenderedState, p77)
			
			if ok then
				t.eagerReducer = lastRenderedReducer
				t.eagerState = status
			end
			if dEV then
				reactCurrentDispatcher.current = current
			end
			if status == lastRenderedState then
				var138 = true
				
				if status == 0 then
					var138 = true
					
					if 1 / status ~= 1 / lastRenderedState then
						var138 = status ~= status and lastRenderedState ~= lastRenderedState
					end
				end
				if var138 then
					if var7 then
						if pending == nil then
							p76.pending = nil
							
							return
						end
						pending.next = t.next
						p76.pending = pending
					end
					return
				end
			end
		end
	end
	if dEV and (type(_G.jest) ~= "nil" or reactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
		warnIfNotScopedWithMatchingAct(p75)
		warnIfNotCurrentlyActingUpdatesInDEV(p75)
	end
	scheduleUpdateOnFiber(p75, var136, var135)
	if dEV and enableDebugTracing and bit32.band(p75.mode, debugTracingMode) ~= 0 then
		logStateUpdateScheduled(getComponentName(p75.type) or "Unknown", var136, p77)
	end
	if enableSchedulingProfiler then
		markStateUpdateScheduled(p75, var136)
	end
end

local t_10 = {
	readContext = readContext,
	useCallback = throwInvalidHookError,
	useContext = throwInvalidHookError,
	useEffect = throwInvalidHookError,
	useImperativeHandle = throwInvalidHookError,
	useLayoutEffect = throwInvalidHookError,
	useMemo = throwInvalidHookError,
	useReducer = throwInvalidHookError,
	useRef = throwInvalidHookError,
	useBinding = throwInvalidHookError,
	useState = throwInvalidHookError,
	useDebugValue = throwInvalidHookError,
	useMutableSource = throwInvalidHookError,
	useOpaqueIdentifier = throwInvalidHookError,
	unstable_isNewReconciler = enableNewReconciler
}
t_2.ContextOnlyDispatcher = t_10
local t_11 = {
	readContext = readContext,
	useCallback = mountCallback,
	useContext = readContext,
	useEffect = mountEffect,
	useImperativeHandle = mountImperativeHandle,
	useLayoutEffect = mountLayoutEffect,
	useMemo = mountMemo,
	useReducer = mountReducer,
	useRef = mountRef,
	useBinding = mountBinding,
	useState = mountState,
	useDebugValue = mountDebugValue,
	useMutableSource = mountMutableSource,
	useOpaqueIdentifier = mountOpaqueIdentifier,
	unstable_isNewReconciler = enableNewReconciler
}
local t_12 = {
	readContext = readContext,
	useCallback = updateCallback,
	useContext = readContext,
	useEffect = updateEffect,
	useImperativeHandle = updateImperativeHandle,
	useLayoutEffect = updateLayoutEffect,
	useMemo = updateMemo,
	useReducer = updateReducer,
	useRef = updateRef,
	useBinding = updateBinding,
	useState = updateState,
	useDebugValue = _mountDebugValue,
	useMutableSource = updateMutableSource,
	useOpaqueIdentifier = updateOpaqueIdentifier,
	unstable_isNewReconciler = enableNewReconciler
}
local t_13 = {
	readContext = readContext,
	useCallback = updateCallback,
	useContext = readContext,
	useEffect = updateEffect,
	useImperativeHandle = updateImperativeHandle,
	useLayoutEffect = updateLayoutEffect,
	useMemo = updateMemo,
	useReducer = rerenderReducer,
	useRef = updateRef,
	useBinding = updateBinding,
	useState = rerenderState,
	useDebugValue = _mountDebugValue,
	useMutableSource = updateMutableSource,
	useOpaqueIdentifier = rerenderOpaqueIdentifier,
	unstable_isNewReconciler = enableNewReconciler
}

if dEV then
	local _ = function() --[[ line: 2022 ]]
		-- upvalues: console (ref)
		console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
	end
	
	local _ = function() --[[ line: 2031 ]]
		-- upvalues: console (ref)
		console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
	end
	
	t_3 = {
		readContext = function(p78, p79) --[[ line: 2041 ]]
			-- upvalues: readContext (ref)
			return readContext(p78, p79)
		end,
		useCallback = function(p80, p81) --[[ line: 2047 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write), console (ref)
			var17 = "useCallback"
			
			if dEV then
				local var139 = var17
				
				if var18 == nil then
					var18 = { var139 }
				else
					table.insert(var18, var139)
				end
			end
			if dEV and p81 ~= nil then
				local var140
				if type(p81) == "table" then
					for i, v in p81 do
						if type(i) ~= "number" then
							var140 = false
						end
					end
					var140 = true
				else
					var140 = false
				end
				if not var140 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var17, type(p81))
				end
			end
			return mountCallback(p80, p81)
		end,
		useContext = function(p82, p83) --[[ line: 2053 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write), readContext (ref)
			var17 = "useContext"
			
			if dEV then
				local var141 = var17
				
				if var18 == nil then
					var18 = { var141 }
				else
					table.insert(var18, var141)
				end
			end
			return readContext(p82, p83)
		end,
		useEffect = function(p84, p85) --[[ line: 2061 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write), console (ref), mountEffect (ref)
			var17 = "useEffect"
			
			if dEV then
				local var142 = var17
				
				if var18 == nil then
					var18 = { var142 }
				else
					table.insert(var18, var142)
				end
			end
			if dEV and p85 ~= nil then
				local var143
				if type(p85) == "table" then
					for i, v in p85 do
						if type(i) ~= "number" then
							var143 = false
						end
					end
					var143 = true
				else
					var143 = false
				end
				if not var143 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var17, type(p85))
				end
			end
			return mountEffect(p84, p85)
		end,
		useImperativeHandle = function(p86, p87, p88) --[[ line: 2071 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write), console (ref)
			var17 = "useImperativeHandle"
			
			if dEV then
				local var144 = var17
				
				if var18 == nil then
					var18 = { var144 }
				else
					table.insert(var18, var144)
				end
			end
			if dEV and p88 ~= nil then
				local var145
				if type(p88) == "table" then
					for i, v in p88 do
						if type(i) ~= "number" then
							var145 = false
						end
					end
					var145 = true
				else
					var145 = false
				end
				if not var145 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var17, type(p88))
				end
			end
			return mountImperativeHandle(p86, p87, p88)
		end,
		useLayoutEffect = function(p89, p90) --[[ line: 2081 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write), console (ref), mountLayoutEffect (ref)
			var17 = "useLayoutEffect"
			
			if dEV then
				local var146 = var17
				
				if var18 == nil then
					var18 = { var146 }
				else
					table.insert(var18, var146)
				end
			end
			if dEV and p90 ~= nil then
				local var147
				if type(p90) == "table" then
					for i, v in p90 do
						if type(i) ~= "number" then
							var147 = false
						end
					end
					var147 = true
				else
					var147 = false
				end
				if not var147 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var17, type(p90))
				end
			end
			return mountLayoutEffect(p89, p90)
		end,
		useMemo = function(p91, p92) --[[ line: 2092 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write), console (ref), reactCurrentDispatcher (ref), t_7 (write)
			var17 = "useMemo"
			
			if dEV then
				local var148 = var17
				
				if var18 == nil then
					var18 = { var148 }
				else
					table.insert(var18, var148)
				end
			end
			if dEV and p92 ~= nil then
				local var149
				if type(p92) == "table" then
					for i, v in p92 do
						if type(i) ~= "number" then
							var149 = false
						end
					end
					var149 = true
				else
					var149 = false
				end
				if not var149 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var17, type(p92))
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local list = { pcall(mountMemo, p91, p92) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p93, p94, p95) --[[ line: 2110 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write), reactCurrentDispatcher (ref), t_7 (write)
			var17 = "useReducer"
			
			if dEV then
				local var151 = var17
				
				if var18 == nil then
					var18 = { var151 }
				else
					table.insert(var18, var151)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var152 = pcall(mountReducer, p93, p94, p95)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var152
		end,
		useRef = function(p96) --[[ line: 2128 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write)
			var17 = "useRef"
			
			if dEV then
				local var153 = var17
				
				if var18 == nil then
					var18 = { var153 }
				else
					table.insert(var18, var153)
				end
			end
			return mountRef(p96)
		end,
		useBinding = function(p97) --[[ line: 2134 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write)
			var17 = "useBinding"
			
			if dEV then
				local var154 = var17
				
				if var18 == nil then
					var18 = { var154 }
				else
					table.insert(var18, var154)
				end
			end
			return mountBinding(p97)
		end,
		useState = function(p98) --[[ line: 2139 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write), reactCurrentDispatcher (ref), t_7 (write)
			var17 = "useState"
			
			if dEV then
				local var155 = var17
				
				if var18 == nil then
					var18 = { var155 }
				else
					table.insert(var18, var155)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var156 = pcall(mountState, p98)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var156
		end,
		useDebugValue = function(p99, p100) --[[ line: 2155 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write)
			var17 = "useDebugValue"
			
			if dEV then
				local var157 = var17
				
				if var18 == nil then
					var18 = { var157 }
				else
					table.insert(var18, var157)
				end
			end
			return mountDebugValue(p99, p100)
		end,
		useMutableSource = function(p101, p102, p103) --[[ line: 2170 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write)
			var17 = "useMutableSource"
			
			if dEV then
				local var158 = var17
				
				if var18 == nil then
					var18 = { var158 }
				else
					table.insert(var18, var158)
				end
			end
			return mountMutableSource(p101, p102, p103)
		end,
		useOpaqueIdentifier = function() --[[ line: 2185 ]]
			-- upvalues: var17 (write), dEV (ref), var18 (write)
			var17 = "useOpaqueIdentifier"
			
			if dEV then
				local var159 = var17
				
				if var18 == nil then
					var18 = { var159 }
				else
					table.insert(var18, var159)
				end
			end
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_4 = {
		readContext = function(p104, p105) --[[ line: 2195 ]]
			-- upvalues: readContext (ref)
			return readContext(p104, p105)
		end,
		useCallback = function(p106, p107) --[[ line: 2201 ]]
			-- upvalues: var17 (write), dEV (ref), console (ref)
			var17 = "useCallback"
			updateHookTypesDev()
			
			if dEV and p107 ~= nil then
				local var160
				if type(p107) == "table" then
					for i, v in p107 do
						if type(i) ~= "number" then
							var160 = false
						end
					end
					var160 = true
				else
					var160 = false
				end
				if not var160 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var17, type(p107))
				end
			end
			return mountCallback(p106, p107)
		end,
		useContext = function(p108, p109) --[[ line: 2207 ]]
			-- upvalues: var17 (write), readContext (ref)
			var17 = "useContext"
			updateHookTypesDev()
			
			return readContext(p108, p109)
		end,
		useEffect = function(p110, p111) --[[ line: 2215 ]]
			-- upvalues: var17 (write), mountEffect (ref)
			var17 = "useEffect"
			updateHookTypesDev()
			
			return mountEffect(p110, p111)
		end,
		useImperativeHandle = function(p112, p113, p114) --[[ line: 2224 ]]
			-- upvalues: var17 (write)
			var17 = "useImperativeHandle"
			updateHookTypesDev()
			
			return mountImperativeHandle(p112, p113, p114)
		end,
		useLayoutEffect = function(p115, p116) --[[ line: 2233 ]]
			-- upvalues: var17 (write), mountLayoutEffect (ref)
			var17 = "useLayoutEffect"
			updateHookTypesDev()
			
			return mountLayoutEffect(p115, p116)
		end,
		useMemo = function(p117, p118) --[[ line: 2243 ]]
			-- upvalues: var17 (write), reactCurrentDispatcher (ref), t_7 (write)
			var17 = "useMemo"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local list = { pcall(mountMemo, p117, p118) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p119, p120, p121) --[[ line: 2259 ]]
			-- upvalues: var17 (write), reactCurrentDispatcher (ref), t_7 (write)
			var17 = "useReducer"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var162 = pcall(mountReducer, p119, p120, p121)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var162
		end,
		useRef = function(p122) --[[ line: 2277 ]]
			-- upvalues: var17 (write)
			var17 = "useRef"
			updateHookTypesDev()
			
			return mountRef(p122)
		end,
		useBinding = function(p123) --[[ line: 2283 ]]
			-- upvalues: var17 (write)
			var17 = "useBinding"
			updateHookTypesDev()
			
			return mountBinding(p123)
		end,
		useState = function(p124) --[[ line: 2288 ]]
			-- upvalues: var17 (write), reactCurrentDispatcher (ref), t_7 (write)
			var17 = "useState"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var163 = pcall(mountState, p124)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var163
		end,
		useDebugValue = function(p125, p126) --[[ line: 2304 ]]
			-- upvalues: var17 (write)
			var17 = "useDebugValue"
			updateHookTypesDev()
			
			return mountDebugValue(p125, p126)
		end,
		useMutableSource = function(p127, p128, p129) --[[ line: 2319 ]]
			-- upvalues: var17 (write)
			var17 = "useMutableSource"
			updateHookTypesDev()
			
			return mountMutableSource(p127, p128, p129)
		end,
		useOpaqueIdentifier = function() --[[ line: 2334 ]]
			-- upvalues: var17 (write)
			var17 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_5 = {
		readContext = function(p130, p131) --[[ line: 2344 ]]
			-- upvalues: readContext (ref)
			return readContext(p130, p131)
		end,
		useCallback = function(p132, p133) --[[ line: 2350 ]]
			-- upvalues: var17 (write)
			var17 = "useCallback"
			updateHookTypesDev()
			
			return updateCallback(p132, p133)
		end,
		useContext = function(p134, p135) --[[ line: 2355 ]]
			-- upvalues: var17 (write), readContext (ref)
			var17 = "useContext"
			updateHookTypesDev()
			
			return readContext(p134, p135)
		end,
		useEffect = function(p136, p137) --[[ line: 2363 ]]
			-- upvalues: var17 (write), updateEffect (ref)
			var17 = "useEffect"
			updateHookTypesDev()
			
			return updateEffect(p136, p137)
		end,
		useImperativeHandle = function(p138, p139, p140) --[[ line: 2372 ]]
			-- upvalues: var17 (write)
			var17 = "useImperativeHandle"
			updateHookTypesDev()
			
			return updateImperativeHandle(p138, p139, p140)
		end,
		useLayoutEffect = function(p141, p142) --[[ line: 2381 ]]
			-- upvalues: var17 (write), updateLayoutEffect (ref)
			var17 = "useLayoutEffect"
			updateHookTypesDev()
			
			return updateLayoutEffect(p141, p142)
		end,
		useMemo = function(p143, p144) --[[ line: 2391 ]]
			-- upvalues: var17 (write), reactCurrentDispatcher (ref), t_8 (write)
			var17 = "useMemo"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local list = { pcall(updateMemo, p143, p144) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p145, p146, p147) --[[ line: 2407 ]]
			-- upvalues: var17 (write), reactCurrentDispatcher (ref), t_8 (write)
			var17 = "useReducer"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var165 = pcall(updateReducer, p145, p146, p147)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var165
		end,
		useRef = function(p148) --[[ line: 2425 ]]
			-- upvalues: var17 (write)
			var17 = "useRef"
			updateHookTypesDev()
			
			return updateRef(p148)
		end,
		useBinding = function(p149) --[[ line: 2431 ]]
			-- upvalues: var17 (write)
			var17 = "useBinding"
			updateHookTypesDev()
			
			return updateBinding(p149)
		end,
		useState = function(p150) --[[ line: 2436 ]]
			-- upvalues: var17 (write), reactCurrentDispatcher (ref), t_8 (write)
			var17 = "useState"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var166 = pcall(updateState, p150)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var166
		end,
		useDebugValue = function(p151, p152) --[[ line: 2452 ]]
			-- upvalues: var17 (write), _mountDebugValue (ref)
			var17 = "useDebugValue"
			updateHookTypesDev()
			
			return _mountDebugValue(p151, p152)
		end,
		useMutableSource = function(p153, p154, p155) --[[ line: 2467 ]]
			-- upvalues: var17 (write)
			var17 = "useMutableSource"
			updateHookTypesDev()
			
			return updateMutableSource(p153, p154, p155)
		end,
		useOpaqueIdentifier = function() --[[ line: 2482 ]]
			-- upvalues: var17 (write)
			var17 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return updateOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_6 = {
		readContext = function(p156, p157) --[[ line: 2492 ]]
			-- upvalues: readContext (ref)
			return readContext(p156, p157)
		end,
		useCallback = function(p158, p159) --[[ line: 2498 ]]
			-- upvalues: var17 (write)
			var17 = "useCallback"
			updateHookTypesDev()
			
			return updateCallback(p158, p159)
		end,
		useContext = function(p160, p161) --[[ line: 2503 ]]
			-- upvalues: var17 (write), readContext (ref)
			var17 = "useContext"
			updateHookTypesDev()
			
			return readContext(p160, p161)
		end,
		useEffect = function(p162, p163) --[[ line: 2511 ]]
			-- upvalues: var17 (write), updateEffect (ref)
			var17 = "useEffect"
			updateHookTypesDev()
			
			return updateEffect(p162, p163)
		end,
		useImperativeHandle = function(p164, p165, p166) --[[ line: 2520 ]]
			-- upvalues: var17 (write)
			var17 = "useImperativeHandle"
			updateHookTypesDev()
			
			return updateImperativeHandle(p164, p165, p166)
		end,
		useLayoutEffect = function(p167, p168) --[[ line: 2529 ]]
			-- upvalues: var17 (write), updateLayoutEffect (ref)
			var17 = "useLayoutEffect"
			updateHookTypesDev()
			
			return updateLayoutEffect(p167, p168)
		end,
		useMemo = function(p169, p170) --[[ line: 2539 ]]
			-- upvalues: var17 (write), reactCurrentDispatcher (ref), t_9 (write)
			var17 = "useMemo"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_9
			local list = { pcall(updateMemo, p169, p170) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p171, p172, p173) --[[ line: 2555 ]]
			-- upvalues: var17 (write), reactCurrentDispatcher (ref), t_9 (write)
			var17 = "useReducer"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_9
			local ok, status, var168 = pcall(rerenderReducer, p171, p172, p173)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var168
		end,
		useRef = function(p174) --[[ line: 2574 ]]
			-- upvalues: var17 (write)
			var17 = "useRef"
			updateHookTypesDev()
			
			return updateRef(p174)
		end,
		useBinding = function(p175) --[[ line: 2580 ]]
			-- upvalues: var17 (write)
			var17 = "useBinding"
			updateHookTypesDev()
			
			return updateBinding(p175)
		end,
		useState = function(p176) --[[ line: 2585 ]]
			-- upvalues: var17 (write), reactCurrentDispatcher (ref), t_9 (write)
			var17 = "useState"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_9
			local ok, status, var169 = pcall(rerenderState, p176)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var169
		end,
		useDebugValue = function(p177, p178) --[[ line: 2601 ]]
			-- upvalues: var17 (write), _mountDebugValue (ref)
			var17 = "useDebugValue"
			updateHookTypesDev()
			
			return _mountDebugValue(p177, p178)
		end,
		useMutableSource = function(p179, p180, p181) --[[ line: 2616 ]]
			-- upvalues: var17 (write)
			var17 = "useMutableSource"
			updateHookTypesDev()
			
			return updateMutableSource(p179, p180, p181)
		end,
		useOpaqueIdentifier = function() --[[ line: 2631 ]]
			-- upvalues: var17 (write)
			var17 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return rerenderOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_7 = {
		readContext = function(p182, p183) --[[ line: 2641 ]]
			-- upvalues: console (ref), readContext (ref)
			console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return readContext(p182, p183)
		end,
		useCallback = function(p184, p185) --[[ line: 2648 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write)
			var17 = "useCallback"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var170 = var17
				
				if var18 == nil then
					var18 = { var170 }
				else
					table.insert(var18, var170)
				end
			end
			return mountCallback(p184, p185)
		end,
		useContext = function(p186, p187) --[[ line: 2654 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write), readContext (ref)
			var17 = "useContext"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var171 = var17
				
				if var18 == nil then
					var18 = { var171 }
				else
					table.insert(var18, var171)
				end
			end
			return readContext(p186, p187)
		end,
		useEffect = function(p188, p189) --[[ line: 2663 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write), mountEffect (ref)
			var17 = "useEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var172 = var17
				
				if var18 == nil then
					var18 = { var172 }
				else
					table.insert(var18, var172)
				end
			end
			return mountEffect(p188, p189)
		end,
		useImperativeHandle = function(p190, p191, p192) --[[ line: 2673 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write)
			var17 = "useImperativeHandle"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var173 = var17
				
				if var18 == nil then
					var18 = { var173 }
				else
					table.insert(var18, var173)
				end
			end
			return mountImperativeHandle(p190, p191, p192)
		end,
		useLayoutEffect = function(p193, p194) --[[ line: 2683 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write), mountLayoutEffect (ref)
			var17 = "useLayoutEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var174 = var17
				
				if var18 == nil then
					var18 = { var174 }
				else
					table.insert(var18, var174)
				end
			end
			return mountLayoutEffect(p193, p194)
		end,
		useMemo = function(p195, p196) --[[ line: 2694 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write), reactCurrentDispatcher (ref), t_7 (write)
			var17 = "useMemo"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var175 = var17
				
				if var18 == nil then
					var18 = { var175 }
				else
					table.insert(var18, var175)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local list = { pcall(mountMemo, p195, p196) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p197, p198, p199) --[[ line: 2711 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write), reactCurrentDispatcher (ref), t_7 (write)
			var17 = "useReducer"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var177 = var17
				
				if var18 == nil then
					var18 = { var177 }
				else
					table.insert(var18, var177)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var178 = pcall(mountReducer, p197, p198, p199)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var178
		end,
		useRef = function(p200) --[[ line: 2730 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write)
			var17 = "useRef"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var179 = var17
				
				if var18 == nil then
					var18 = { var179 }
				else
					table.insert(var18, var179)
				end
			end
			return mountRef(p200)
		end,
		useBinding = function(p201) --[[ line: 2737 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write)
			var17 = "useBinding"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var180 = var17
				
				if var18 == nil then
					var18 = { var180 }
				else
					table.insert(var18, var180)
				end
			end
			return mountBinding(p201)
		end,
		useState = function(p202) --[[ line: 2743 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write), reactCurrentDispatcher (ref), t_7 (write)
			var17 = "useState"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var181 = var17
				
				if var18 == nil then
					var18 = { var181 }
				else
					table.insert(var18, var181)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var182 = pcall(mountState, p202)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var182
		end,
		useDebugValue = function(p203, p204) --[[ line: 2760 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write)
			var17 = "useDebugValue"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var183 = var17
				
				if var18 == nil then
					var18 = { var183 }
				else
					table.insert(var18, var183)
				end
			end
			return mountDebugValue(p203, p204)
		end,
		useMutableSource = function(p205, p206, p207) --[[ line: 2778 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write)
			var17 = "useMutableSource"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var184 = var17
				
				if var18 == nil then
					var18 = { var184 }
				else
					table.insert(var18, var184)
				end
			end
			return mountMutableSource(p205, p206, p207)
		end,
		useOpaqueIdentifier = function() --[[ line: 2794 ]]
			-- upvalues: var17 (write), console (ref), dEV (ref), var18 (write)
			var17 = "useOpaqueIdentifier"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var185 = var17
				
				if var18 == nil then
					var18 = { var185 }
				else
					table.insert(var18, var185)
				end
			end
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_8 = {
		readContext = function(p208, p209) --[[ line: 2805 ]]
			-- upvalues: console (ref), readContext (ref)
			console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return readContext(p208, p209)
		end,
		useCallback = function(p210, p211) --[[ line: 2812 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useCallback"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return mountCallback(p210, p211)
		end,
		useContext = function(p212, p213) --[[ line: 2818 ]]
			-- upvalues: var17 (write), console (ref), readContext (ref)
			var17 = "useContext"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return readContext(p212, p213)
		end,
		useEffect = function(p214, p215) --[[ line: 2827 ]]
			-- upvalues: var17 (write), console (ref), updateEffect (ref)
			var17 = "useEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateEffect(p214, p215)
		end,
		useImperativeHandle = function(p216, p217, p218) --[[ line: 2837 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useImperativeHandle"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateImperativeHandle(p216, p217, p218)
		end,
		useLayoutEffect = function(p219, p220) --[[ line: 2847 ]]
			-- upvalues: var17 (write), console (ref), updateLayoutEffect (ref)
			var17 = "useLayoutEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateLayoutEffect(p219, p220)
		end,
		useMemo = function(p221, p222) --[[ line: 2858 ]]
			-- upvalues: var17 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var17 = "useMemo"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local list = { pcall(updateMemo, p221, p222) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p223, p224, p225) --[[ line: 2875 ]]
			-- upvalues: var17 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var17 = "useReducer"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var187 = pcall(updateReducer, p223, p224, p225)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var187
		end,
		useRef = function(p226) --[[ line: 2895 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useRef"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateRef(p226)
		end,
		useBinding = function(p227) --[[ line: 2902 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useBinding"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateBinding(p227)
		end,
		useState = function(p228) --[[ line: 2908 ]]
			-- upvalues: var17 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var17 = "useState"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var188 = pcall(updateState, p228)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var188
		end,
		useDebugValue = function(p229, p230) --[[ line: 2925 ]]
			-- upvalues: var17 (write), console (ref), _mountDebugValue (ref)
			var17 = "useDebugValue"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return _mountDebugValue(p229, p230)
		end,
		useMutableSource = function(p231, p232, p233) --[[ line: 2943 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useMutableSource"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateMutableSource(p231, p232, p233)
		end,
		useOpaqueIdentifier = function() --[[ line: 2959 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useOpaqueIdentifier"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_9 = {
		readContext = function(p234, p235) --[[ line: 2970 ]]
			-- upvalues: console (ref), readContext (ref)
			console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return readContext(p234, p235)
		end,
		useCallback = function(p236, p237) --[[ line: 2977 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useCallback"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateCallback(p236, p237)
		end,
		useContext = function(p238, p239) --[[ line: 2983 ]]
			-- upvalues: var17 (write), console (ref), readContext (ref)
			var17 = "useContext"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return readContext(p238, p239)
		end,
		useEffect = function(p240, p241) --[[ line: 2992 ]]
			-- upvalues: var17 (write), console (ref), updateEffect (ref)
			var17 = "useEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateEffect(p240, p241)
		end,
		useImperativeHandle = function(p242, p243, p244) --[[ line: 3002 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useImperativeHandle"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateImperativeHandle(p242, p243, p244)
		end,
		useLayoutEffect = function(p245, p246) --[[ line: 3012 ]]
			-- upvalues: var17 (write), console (ref), updateLayoutEffect (ref)
			var17 = "useLayoutEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateLayoutEffect(p245, p246)
		end,
		useMemo = function(p247, p248) --[[ line: 3023 ]]
			-- upvalues: var17 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var17 = "useMemo"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local list = { pcall(updateMemo, p247, p248) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p249, p250, p251) --[[ line: 3040 ]]
			-- upvalues: var17 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var17 = "useReducer"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var190 = pcall(rerenderReducer, p249, p250, p251)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var190
		end,
		useRef = function(p252) --[[ line: 3060 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useRef"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateRef(p252)
		end,
		useBinding = function(p253) --[[ line: 3067 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useBinding"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateBinding(p253)
		end,
		useState = function(p254) --[[ line: 3073 ]]
			-- upvalues: var17 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var17 = "useState"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var191 = pcall(rerenderState, p254)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var191
		end,
		useDebugValue = function(p255, p256) --[[ line: 3090 ]]
			-- upvalues: var17 (write), console (ref), _mountDebugValue (ref)
			var17 = "useDebugValue"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return _mountDebugValue(p255, p256)
		end,
		useMutableSource = function(p257, p258, p259) --[[ line: 3108 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useMutableSource"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateMutableSource(p257, p258, p259)
		end,
		useOpaqueIdentifier = function() --[[ line: 3124 ]]
			-- upvalues: var17 (write), console (ref)
			var17 = "useOpaqueIdentifier"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return rerenderOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
end
function t_2.renderWithHooks(p260, p261, p262, p263, p264, p265) --[[ line: 3135 ]]
	-- upvalues: var11 (write), var12 (write), dEV (ref), var18 (write), var19 (write), noLanes (ref), reactCurrentDispatcher (ref), t_5 (write), t_4 (write), t_3 (write), t_11 (ref), t_12 (ref), var16 (write), error (ref), var13 (write), var14 (write), t_6 (write), t_13 (ref), t_10 (ref), var17 (write), var15 (write), getComponentName (ref)
	var11 = p265
	var12 = p261
	
	if dEV then
		var18 = if p260 ~= nil then nil else p260._debugHookTypes
		var19 = 0
	end
	p261.memoizedState = nil
	p261.updateQueue = nil
	p261.lanes = noLanes
	
	if not dEV then
		local t_11_1
		local var192 = reactCurrentDispatcher
		
		if p260 ~= nil then
			t_11_1 = p260.memoizedState == nil and (t_11 or t_12)
		end
		var192.current = t_11_1
	elseif p260 ~= nil and p260.memoizedState ~= nil then
		reactCurrentDispatcher.current = t_5
	elseif var18 == nil then
		reactCurrentDispatcher.current = t_3
	else
		reactCurrentDispatcher.current = t_4
	end
	local var194 = p262(p263, p264)
	
	if var16 then
		local var195 = 0
		var16 = false
		
		if var195 >= 25 then
			error(error.new("Too many re-renders. React limits the number of renders to prevent an infinite loop."))
		end
		var195 += 1
		var13 = nil
		var14 = nil
		p261.updateQueue = nil
		
		if dEV then
			var19 = 0
		end
		reactCurrentDispatcher.current = if dEV then t_6 else t_13
		var194 = p262(p263, p264)
	end
	reactCurrentDispatcher.current = t_10
	
	if dEV then
		p261._debugHookTypes = var18
	end
	local var196 = var13 ~= nil and var13.next ~= nil
	var11 = noLanes
	var12 = nil
	var13 = nil
	var14 = nil
	
	if dEV then
		var17 = nil
		var18 = nil
		var19 = 0
	end
	var15 = false
	
	if var196 then
		local var197 = "unknown"
		
		if var194 and var194.type then
			var197 = getComponentName(var194.type) or var197
		end
		error(error.new("Rendered fewer hooks than expected. This may be caused by an accidental " .. "early return statement. Inside '" .. var197 .. "'"))
	end
	return var194
end

return t_2