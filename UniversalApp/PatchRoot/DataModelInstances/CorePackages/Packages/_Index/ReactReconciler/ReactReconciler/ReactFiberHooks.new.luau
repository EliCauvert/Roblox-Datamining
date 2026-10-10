local function _(p1)
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
local memoValues = require(parent.Shared).MemoValues
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
local enableAllocationTrims = reactFeatureFlags.enableAllocationTrims
local enableHookDoubleBuffering = reactFeatureFlags.enableHookDoubleBuffering
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

local _ = function(p1, p2)
	local var1
	if p1 == p2 then
		var1 = true
		
		if p1 == 0 then
			var1 = true
			
			if 1 / p1 ~= 1 / p2 then
				var1 = p1 ~= p1 and p2 ~= p2
			end
		end
		return var1
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
local var1 = require(parent.SafeFlags).createGetFFlag("ReactCleanQueueOnUpdateBailout")()
local t = nil
local t_1 = nil

if dEV then
	t_1 = {}
	t = {}
end
local t_2 = {
	bailoutHooks = function(p1, p2, p3)
		-- upvalues: enableHookDoubleBuffering (ref), dEV (ref), enableDoubleInvokingEffects (ref), mountPassiveDev (ref), passive (ref), mountLayoutDev (ref), update (ref), removeLanes (ref)
		if enableHookDoubleBuffering and p1.updateQueue ~= nil then
			p1.updateQueue.alternate = nil
		end
		p2.updateQueue = p1.updateQueue
		
		if dEV and enableDoubleInvokingEffects then
			p2.flags = bit32.band(p2.flags, bit32.bnot(bit32.bor(mountPassiveDev, passive, mountLayoutDev, update)))
		else
			p2.flags = bit32.band(p2.flags, bit32.bnot(bit32.bor(passive, update)))
		end
		p1.lanes = removeLanes(p1.lanes, p3)
	end
}
local var2 = noLanes
local var3 = nil
local var4 = nil
local var5 = nil
local var6 = nil
local var7 = nil
local var8 = false
local var9 = false
local var10 = nil
local var11 = nil
local var12 = 0
local t_3 = nil
local t_4 = nil
local t_5 = nil
local t_6 = nil
local t_7 = nil
local t_8 = nil
local t_9 = nil

local _ = function(p1)
	local var13 = 0
	
	for i, v in p1 do
		if var13 < i then
			var13 = i
		end
	end
	return var13
end

local _ = function(p2)
	if type(p2) ~= "table" then
		return false
	end
	for i, v in p2 do
		if type(i) ~= "number" then
			return false
		end
	end
	return true
end

local _ = function()
	-- upvalues: dEV (ref), var10 (write), var11 (write)
	if dEV then
		local var14 = var10
		
		if var11 == nil then
			var11 = { var14 }
			
			return
		end
		table.insert(var11, var14)
	end
end

function updateHookTypesDev()
	-- upvalues: dEV (ref), var10 (write), var11 (write), var12 (write)
	if dEV then
		local var14 = var10
		
		if var11 ~= nil then
			var12 += 1
			
			if var11[var12] ~= var14 then
				warnOnHookMismatchInDev(var14)
			end
		end
	end
end

local _ = function(p3)
	-- upvalues: dEV (ref), console (ref), var10 (write)
	if dEV and p3 ~= nil then
		local var14
		if type(p3) == "table" then
			for i, v in p3 do
				if type(i) ~= "number" then
					var14 = false
				end
			end
			var14 = true
		else
			var14 = false
		end
		if not var14 then
			console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var10, type(p3))
		end
	end
end

function warnOnHookMismatchInDev(p4)
	-- upvalues: dEV (ref), getComponentName (ref), var3 (write), t (write), var11 (write), var12 (write), console (ref)
	if dEV then
		local type = getComponentName(var3.type) or "Component"
		
		if not t[type] then
			t[type] = true
			
			if var11 ~= nil then
				local var15 = ""
				
				for i = 1, var12 do
					local var16 = var11[i]
					local var17 = if i == var12 then p4 else var16
					local text = tostring(i) .. ". " .. (var16 or "undefined")
				end
				console.error("React has detected a change in the order of Hooks called by %s. This will lead to bugs and errors if not fixed. For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n   Previous render            Next render\n   ------------------------------------------------------\n%s   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", type, var15)
			end
		end
	end
end

local function throwInvalidHookError()
	-- upvalues: error (ref)
	error(error.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."))
end

local function areHookInputsEqual(p5, p6)
	-- upvalues: dEV (ref), console (ref), var10 (write)
	if p6 == nil then
		if dEV then
			console.error("%s received a final argument during this render, but not during the previous render. Even though the final argument is optional, its type cannot change between renders.", var10)
		end
		return false
	else
		local var18 = 0
		
		for i, v in p5 do
			if var18 < i then
				var18 = i
			end
		end
		local var19 = 0
		
		for i_1, v_1 in p6 do
			if var19 < i_1 then
				var19 = i_1
			end
		end
		if var18 ~= var19 then
			return false
		end
		for i_2 = 1, math.min(var19, var18) do
			local var20
			local var21 = p5[i_2]
			local var22 = p6[i_2]
			
			if var21 == var22 then
				var20 = true
				
				if var21 == 0 then
					var20 = true
					
					if 1 / var21 ~= 1 / var22 then
						var20 = var21 ~= var21 and var22 ~= var22
					end
				end
				if var20 then
					continue
				end
				return false
			end
		end
		return true
	end
end

local var23 = false

function t_2.resetHooksAfterThrow()
	-- upvalues: reactCurrentDispatcher (ref), t_2 (ref), var8 (write), var3 (write), var2 (write), noLanes (ref), var4 (write), var5 (write), enableHookDoubleBuffering (ref), var6 (write), var7 (write), dEV (ref), var11 (write), var12 (write), var10 (write), var23 (write), var9 (write)
	reactCurrentDispatcher.current = t_2.ContextOnlyDispatcher
	
	if var8 then
		local memoizedState = var3.memoizedState
		while memoizedState ~= nil do
			local queue = memoizedState.queue
			
			if queue ~= nil then
				queue.pending = nil
			end
			memoizedState = memoizedState.next
		end
		var8 = false
	end
	var2 = noLanes
	var3 = nil
	var4 = nil
	var5 = nil
	
	if enableHookDoubleBuffering then
		var6 = nil
		var7 = nil
	end
	if dEV then
		var11 = nil
		var12 = 0
		var10 = nil
		var23 = false
	end
	var9 = false
end

local function mountWorkInProgressHook()
	-- upvalues: enableAllocationTrims (ref), var5 (write), var3 (write)
	local var24 = if enableAllocationTrims then {
		memoizedState = nil,
		baseState = nil,
		queue = nil,
		next = nil
	} else {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var5 == nil then
		var3.memoizedState = var24
		var5 = var24
	else
		var5.next = var24
		var5 = var24
	end
	return var5
end

local function updateWorkInProgressHook()
	-- upvalues: var4 (write), var3 (write), var5 (write), error (ref), enableHookDoubleBuffering (ref), enableAllocationTrims (ref)
	local var24
	local _ = nil
	
	if var4 == nil then
		local alternate = var3.alternate
		var24 = if alternate ~= nil then nil else alternate.memoizedState
	else
		var24 = var4.next
	end
	local var25 = if var5 == nil then var3.memoizedState else var5.next
	
	if var25 == nil then
		if var24 == nil then
			error(error.new("Rendered more hooks than during the previous render."))
		end
		local alternate
		var4 = var24
		local _ = nil
		
		if enableHookDoubleBuffering then
			alternate = var4.alternate
			
			if alternate == nil then
				alternate = {
					next = nil,
					memoizedState = var4.memoizedState,
					baseState = var4.baseState,
					baseQueue = var4.baseQueue,
					queue = var4.queue,
					alternate = var4
				}
				var4.alternate = alternate
			else
				local memoizedState = var4.memoizedState
				
				if memoizedState ~= nil or alternate.memoizedState ~= nil then
					alternate.memoizedState = memoizedState
				end
				memoizedState = var4.baseState
				
				if memoizedState ~= nil or alternate.baseState ~= nil then
					alternate.baseState = memoizedState
				end
				memoizedState = var4.baseQueue
				
				if memoizedState ~= nil or alternate.baseQueue ~= nil then
					alternate.baseQueue = memoizedState
				end
				memoizedState = var4.queue
				
				if memoizedState ~= nil or alternate.queue ~= nil then
					alternate.queue = memoizedState
				end
				if alternate.next ~= nil then
					alternate.next = nil
				end
			end
		elseif enableAllocationTrims then
			local baseQueue = var4.baseQueue
			alternate = if baseQueue == nil then {
				next = nil,
				memoizedState = var4.memoizedState,
				baseState = var4.baseState,
				queue = var4.queue
			} else {
				next = nil,
				memoizedState = var4.memoizedState,
				baseState = var4.baseState,
				baseQueue = baseQueue,
				queue = var4.queue
			}
		else
			alternate = {
				next = nil,
				memoizedState = var4.memoizedState,
				baseState = var4.baseState,
				baseQueue = var4.baseQueue,
				queue = var4.queue
			}
		end
		if var5 == nil then
			var5 = alternate
			var3.memoizedState = alternate
		else
			var5.next = alternate
			var5 = alternate
		end
	else
		var5 = var25
		var25 = var5.next
		var4 = var24
	end
	return var5
end

function basicStateReducer(p7, p8)
	return if type(p8) == "function" then p8(p7) else p8
end

function mountReducer(p7, p8, p9)
	-- upvalues: mountWorkInProgressHook (ref), var3 (write)
	local var24 = mountWorkInProgressHook()
	local var25 = if p9 ~= nil then p8 else p9(p8)
	var24.baseState = var25
	var24.memoizedState = var24.baseState
	local t = {
		pending = nil,
		dispatch = nil,
		lastRenderedReducer = p7,
		lastRenderedState = var25
	}
	var24.queue = t
	
	local var26 = function(p10, ...)
		-- upvalues: var3 (ref), t (ref)
		dispatchAction(var3, t, p10, ...)
	end
	
	t.dispatch = var26
	
	return var24.memoizedState, var26
end

function updateReducer(p7, _, _)
	-- upvalues: updateWorkInProgressHook (ref), var4 (write), var2 (write), var3 (write), mergeLanes (ref), markSkippedUpdateLanes (ref), noLane (ref), markWorkInProgressReceivedUpdate (ref)
	local var24 = updateWorkInProgressHook()
	local queue = var24.queue
	assert(queue ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.")
	queue.lastRenderedReducer = p7
	local baseQueue = var4.baseQueue
	local pending = queue.pending
	
	if pending ~= nil then
		if baseQueue ~= nil then
			local next = baseQueue.next
			baseQueue.next = pending.next
			pending.next = next
		end
		baseQueue = pending
		var4.baseQueue = baseQueue
		queue.pending = nil
	end
	if baseQueue ~= nil then
		local next = baseQueue.next
		local baseState = var4.baseState
		local var25 = nil
		local var26 = nil
		local next_1 = nil
		local var27 = next
		repeat
			local lane = var27.lane
			if bit32.band(var2, lane) == lane then
				if next_1 ~= nil then
					next_1.next = {
						next = nil,
						lane = noLane,
						action = var27.action,
						eagerReducer = var27.eagerReducer,
						eagerState = var27.eagerState
					}
					next_1 = next_1.next
				end
				baseState = if var27.eagerReducer == p7 then var27.eagerState else p7(baseState, var27.action)
				var27 = var27.next
			end
			local t = {
				next = nil,
				lane = lane,
				action = var27.action,
				eagerReducer = var27.eagerReducer,
				eagerState = var27.eagerState
			}
			
			if next_1 == nil then
				next_1 = t
				var26 = next_1
				var25 = baseState
			else
				next_1.next = t
				next_1 = next_1.next
			end
			var3.lanes = mergeLanes(var3.lanes, lane)
			markSkippedUpdateLanes(lane)
		until var27 == nil or var27 == next
		if next_1 == nil then
			var25 = baseState
		else
			next_1.next = var26
		end
		local var28
		local var29 = baseState
		local memoizedState = var24.memoizedState
		
		if var29 == memoizedState then
			var28 = true
			
			if var29 == 0 then
				var28 = true
				
				if 1 / var29 ~= 1 / memoizedState then
					var28 = var29 ~= var29 and memoizedState ~= memoizedState
				end
			end
			if not var28 then
				markWorkInProgressReceivedUpdate()
			end
			var24.memoizedState = baseState
			var24.baseState = var25
			var24.baseQueue = next_1
			queue.lastRenderedState = baseState
		end
	end
	return var24.memoizedState, queue.dispatch
end

function rerenderReducer(p7, _, _)
	-- upvalues: updateWorkInProgressHook (ref), markWorkInProgressReceivedUpdate (ref)
	local var24 = updateWorkInProgressHook()
	local queue = var24.queue
	assert(queue ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.")
	queue.lastRenderedReducer = p7
	local dispatch = queue.dispatch
	local pending = queue.pending
	local memoizedState = var24.memoizedState
	
	if pending ~= nil then
		queue.pending = nil
		local next = pending.next
		local var25 = next
		repeat
			memoizedState = p7(memoizedState, var25.action)
			var25 = var25.next
		until var25 == next
		local var26
		local var27 = memoizedState
		local memoizedState_1 = var24.memoizedState
		
		if var27 == memoizedState_1 then
			var26 = true
			
			if var27 == 0 then
				var26 = true
				
				if 1 / var27 ~= 1 / memoizedState_1 then
					var26 = var27 ~= var27 and memoizedState_1 ~= memoizedState_1
				end
			end
			if not var26 then
				markWorkInProgressReceivedUpdate()
			end
			var24.memoizedState = memoizedState
			
			if var24.baseQueue == nil then
				var24.baseState = memoizedState
			end
			queue.lastRenderedState = memoizedState
		end
	end
	return memoizedState, dispatch
end

function readFromUnsubcribedMutableSource(p7, p8, p9)
	-- upvalues: dEV (ref), warnAboutMultipleRenderersDEV (ref), getWorkInProgressVersion (ref), isSubsetOfLanes (ref), var2 (write), setWorkInProgressVersion (ref), console (ref), markSourceAsDirty (ref), error (ref)
	if dEV then
		warnAboutMultipleRenderersDEV(p8)
	end
	local var24
	local version = p8._getVersion(p8._source)
	local _ = false
	local var25 = getWorkInProgressVersion(p8)
	
	if var25 == nil then
		var24 = isSubsetOfLanes(var2, p7.mutableReadLanes)
		
		if var24 then
			setWorkInProgressVersion(p8, version)
		end
	else
		local _ = var25 == version
	end
	if not var24 then
		markSourceAsDirty(p8)
		error(error.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."))
		
		return
	end
	local var26 = p9(p8._source)
	
	if dEV and type(var26) == "function" then
		console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
	end
	return var26
end

function useMutableSource(p7, p8, p9, p10)
	-- upvalues: getWorkInProgressRoot (ref), invariant (ref), reactCurrentDispatcher (ref), var5 (write), var3 (write), dEV (ref), console (ref), requestUpdateLane (ref), markRootMutableRead (ref), markRootEntangled (ref)
	local var24 = getWorkInProgressRoot()
	invariant(var24 ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.")
	local getVersion = p8._getVersion
	local var25 = getVersion(p8._source)
	local current = reactCurrentDispatcher.current
	assert(current ~= nil, "dispatcher was nil, this is a bug in React")
	local var26, var27 = current.useState(function()
		-- upvalues: var24 (ref), p8 (ref), p9 (ref)
		return readFromUnsubcribedMutableSource(var24, p8, p9)
	end)
	local var28 = var26
	local memoizedState = p7.memoizedState
	
	if memoizedState.refs == nil then
		error(tostring(debug.traceback()))
	end
	local var29
	local refs = memoizedState.refs
	local getSnapshot = refs.getSnapshot
	local source = memoizedState.source
	local subscribe = memoizedState.subscribe
	p7.memoizedState = { refs = refs, source = p8, subscribe = p10 }
	current.useEffect(function()
		-- upvalues: refs (ref), p9 (ref), var27 (write), getVersion (ref), p8 (ref), var25 (ref), dEV (copy), console (copy), var28 (write), requestUpdateLane (copy), var3 (ref), markRootMutableRead (copy), var24 (ref), markRootEntangled (copy)
		local var30
		refs.getSnapshot = p9
		refs.setSnapshot = var27
		local var31 = getVersion(p8._source)
		local var32 = var25
		
		if var32 == var31 then
			var30 = true
			
			if var32 == 0 then
				var30 = true
				
				if 1 / var32 ~= 1 / var31 then
					var30 = var32 ~= var32 and var31 ~= var31
				end
			end
			if not var30 then
				var30 = p9(p8._source)
				
				if dEV and type(var30) == "function" then
					console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
				end
				local var33 = var28
				
				if var33 == var30 then
					var32 = true
					
					if var33 == 0 then
						var32 = true
						
						if 1 / var33 ~= 1 / var30 then
							var32 = var33 ~= var33 and var30 ~= var30
						end
					end
					if not var32 then
						var27(var30)
						markRootMutableRead(var24, requestUpdateLane(var3))
					end
					markRootEntangled(var24, var24.mutableReadLanes)
				end
			end
		end
	end, { p9, p8, p10 })
	current.useEffect(function()
		-- upvalues: refs (ref), p8 (ref), requestUpdateLane (copy), var3 (ref), markRootMutableRead (copy), var24 (ref), p10 (ref), dEV (copy), console (copy)
		local var30 = p10(p8._source, function()
			-- upvalues: refs (copy), p8 (copy), requestUpdateLane (copy), var3 (copy), markRootMutableRead (copy), var24 (copy)
			local getSnapshot = refs.getSnapshot
			local setSnapshot = refs.setSnapshot
			local ok, status = pcall(function()
				-- upvalues: setSnapshot (ref), getSnapshot (ref), p8 (copy), requestUpdateLane (copy), var3 (copy), markRootMutableRead (copy), var24 (copy)
				setSnapshot(getSnapshot(p8._source))
				markRootMutableRead(var24, requestUpdateLane(var3))
			end)
			
			if not ok then
				setSnapshot(function()
					-- upvalues: status (ref)
					error(status)
				end)
			end
		end)
		
		if dEV and type(var30) ~= "function" then
			console.error("Mutable source subscribe function must return an unsubscribe function.")
		end
		return var30
	end, { p8, p10 })
	
	if getSnapshot == p9 then
		var29 = true
		
		if getSnapshot == 0 then
			var29 = true
			
			if 1 / getSnapshot ~= 1 / p9 then
				var29 = getSnapshot ~= getSnapshot and p9 ~= p9
			end
		end
		if var29 then
			if source == p8 then
				var29 = true
				
				if source == 0 then
					var29 = true
					
					if 1 / source ~= 1 / p8 then
						var29 = source ~= source and p8 ~= p8
					end
				end
				if var29 then
					if subscribe == p10 then
						var29 = true
						
						if subscribe == 0 then
							var29 = true
							
							if 1 / subscribe ~= 1 / p10 then
								var29 = subscribe ~= subscribe and p10 ~= p10
							end
						end
						if not var29 then
							var29 = {
								pending = nil,
								dispatch = nil,
								lastRenderedReducer = basicStateReducer,
								lastRenderedState = var28
							}
							local var30 = var3
							
							function var89.dispatch(...)
								-- upvalues: var30 (ref), var29 (ref)
								dispatchAction(var30, var29, ...)
							end
							
							var5.queue = var29
							var5.baseQueue = nil
							var28 = readFromUnsubcribedMutableSource(var24, p8, p9)
							var5.baseState = var28
							var5.memoizedState = var5.baseState
						end
						return var28
					end
				end
			end
		end
	end
end

function mountMutableSource(p7, p8, p9)
	-- upvalues: mountWorkInProgressHook (ref)
	local var24 = mountWorkInProgressHook()
	var24.memoizedState = {
		refs = { setSnapshot = nil, getSnapshot = p8 },
		source = p7,
		subscribe = p9
	}
	
	return useMutableSource(var24, p7, p8, p9)
end

function updateMutableSource(p7, p8, p9)
	-- upvalues: updateWorkInProgressHook (ref)
	return useMutableSource(updateWorkInProgressHook(), p7, p8, p9)
end

function mountState(p7)
	-- upvalues: mountWorkInProgressHook (ref), var3 (write)
	local var24 = mountWorkInProgressHook()
	
	if type(p7) == "function" then
		p7 = p7()
	end
	var24.baseState = p7
	var24.memoizedState = var24.baseState
	local t = {
		pending = nil,
		dispatch = nil,
		lastRenderedReducer = nil,
		lastRenderedState = p7,
		lastRenderedReducer = basicStateReducer
	}
	var24.queue = t
	
	local var25 = function(p8, ...)
		-- upvalues: var3 (ref), t (ref)
		dispatchAction(var3, t, p8, ...)
	end
	
	t.dispatch = var25
	
	return var24.memoizedState, var25
end

function updateState(p7)
	return updateReducer(basicStateReducer, p7)
end

function rerenderState(p7)
	return rerenderReducer(basicStateReducer, p7)
end

local function reuseFunctionComponentUpdateQueue()
	-- upvalues: var3 (write), var7 (write), var6 (write)
	local alternate = var3.alternate
	local var24 = if alternate ~= nil then nil else alternate.updateQueue
	local var25 = if var24 ~= nil then nil else var24.alternate
	
	if var25 ~= nil then
		local lastEffect = var25.lastEffect
		var7 = lastEffect
		var6 = if lastEffect ~= nil then nil else lastEffect.next
		var25.lastEffect = nil
		
		return var25
	end
	var6 = nil
	var7 = nil
	local _ = nil
	
	if var24 == nil then
		return { lastEffect = nil }
	end
	local t = { lastEffect = nil, alternate = var24 }
	var24.alternate = t
	
	return t
end

local function pushEffect(p7, p8, p9, p10)
	-- upvalues: enableHookDoubleBuffering (ref), var3 (write), reuseFunctionComponentUpdateQueue (ref), var6 (write), var7 (write)
	if enableHookDoubleBuffering then
		local updateQueue = var3.updateQueue
		
		if updateQueue == nil then
			updateQueue = reuseFunctionComponentUpdateQueue()
			var3.updateQueue = updateQueue
		end
		local var24 = var6
		
		if var24 == nil then
			var24 = {
				next = nil,
				tag = p7,
				create = p8,
				destroy = p9,
				deps = p10
			}
		else
			var6 = if var24 == var7 then nil else var24.next
			var24.tag = p7
			var24.create = p8
			
			if p9 ~= nil or var24.destroy ~= nil then
				var24.destroy = p9
			end
			var24.deps = p10
		end
		local lastEffect = updateQueue.lastEffect
		
		if lastEffect == nil then
			var24.next = var24
		else
			var24.next = lastEffect.next
			lastEffect.next = var24
		end
		updateQueue.lastEffect = var24
		
		return var24
	else
		local t = {
			next = nil,
			tag = p7,
			create = p8,
			destroy = p9,
			deps = p10
		}
		local updateQueue = var3.updateQueue
		
		if updateQueue == nil then
			updateQueue = { lastEffect = nil }
			var3.updateQueue = updateQueue
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
end

function mountBinding(p7)
	-- upvalues: mountWorkInProgressHook (ref), createBinding (ref), enableAllocationTrims (ref)
	local var24 = mountWorkInProgressHook()
	local var25, var26 = createBinding(p7)
	
	if enableAllocationTrims then
		var24.memoizedState = var25
		var24.baseState = var26
		
		return var25, var26
	end
	var24.memoizedState = { var25, var26 }
	
	return var25, var26
end

function updateBinding(_)
	-- upvalues: updateWorkInProgressHook (ref), enableAllocationTrims (ref)
	local var24 = updateWorkInProgressHook()
	
	if enableAllocationTrims then
		return var24.memoizedState, var24.baseState
	end
	return unpack(var24.memoizedState)
end

function mountRef(p7)
	-- upvalues: mountWorkInProgressHook (ref), createRef (ref)
	local var24 = mountWorkInProgressHook()
	local var25 = createRef()
	var25.current = p7
	var24.memoizedState = var25
	
	return var25
end

function updateRef(_)
	-- upvalues: updateWorkInProgressHook (ref)
	return updateWorkInProgressHook().memoizedState
end

local function mountEffectImpl(p7, p8, p9, p10)
	-- upvalues: mountWorkInProgressHook (ref), var3 (write), pushEffect (ref), hasEffect (ref)
	local var24 = mountWorkInProgressHook()
	var3.flags = bit32.bor(var3.flags, p7)
	var24.memoizedState = pushEffect(bit32.bor(hasEffect, p8), p9, nil, p10)
end

function updateEffectImpl(p7, p8, p9, p10)
	-- upvalues: updateWorkInProgressHook (ref), var4 (write), areHookInputsEqual (ref), pushEffect (ref), var3 (write), hasEffect (ref)
	local var24 = updateWorkInProgressHook()
	local destroy = nil
	
	if var4 ~= nil then
		local memoizedState = var4.memoizedState
		destroy = memoizedState.destroy
		
		if p10 == nil or not areHookInputsEqual(p10, memoizedState.deps) then
			var3.flags = bit32.bor(var3.flags, p7)
			var24.memoizedState = pushEffect(bit32.bor(hasEffect, p8), p9, destroy, p10)
			
			return
		else
			var24.memoizedState = pushEffect(p8, p9, destroy, p10)
		end
	end
end

local function mountEffect(p7, p8)
	-- upvalues: dEV (ref), reactGlobalsModule (ref), warnIfNotCurrentlyActingEffectsInDEV (ref), var3 (write), enableDoubleInvokingEffects (ref), mountPassiveDev (ref), passive (ref), passiveStatic (ref), passive_1 (ref), mountWorkInProgressHook (ref), pushEffect (ref), hasEffect (ref)
	if dEV and (type(_G.jest) ~= "nil" or reactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
		warnIfNotCurrentlyActingEffectsInDEV(var3)
	end
	if dEV and enableDoubleInvokingEffects then
		local bits = bit32.bor(mountPassiveDev, passive, passiveStatic)
		local var24 = passive_1
		local var25 = mountWorkInProgressHook()
		var3.flags = bit32.bor(var3.flags, bits)
		var25.memoizedState = pushEffect(bit32.bor(hasEffect, var24), p7, nil, p8)
		
		return
	end
	local var26 = mountWorkInProgressHook()
	var3.flags = bit32.bor(var3.flags, bit32.bor(passive, passiveStatic))
	var26.memoizedState = pushEffect(bit32.bor(hasEffect, passive_1), p7, nil, p8)
end

local function updateEffect(p7, p8)
	-- upvalues: dEV (ref), reactGlobalsModule (ref), warnIfNotCurrentlyActingEffectsInDEV (ref), var3 (write), passive (ref), passive_1 (ref)
	if dEV and (type(_G.jest) ~= "nil" or reactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
		warnIfNotCurrentlyActingEffectsInDEV(var3)
	end
	updateEffectImpl(passive, passive_1, p7, p8)
end

local function mountLayoutEffect(p7, p8)
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), mountLayoutDev (ref), update (ref), layout (ref), mountWorkInProgressHook (ref), var3 (write), pushEffect (ref), hasEffect (ref)
	if dEV and enableDoubleInvokingEffects then
		local bits = bit32.bor(mountLayoutDev, update)
		local var24 = layout
		local var25 = mountWorkInProgressHook()
		var3.flags = bit32.bor(var3.flags, bits)
		var25.memoizedState = pushEffect(bit32.bor(hasEffect, var24), p7, nil, p8)
		
		return
	end
	local var26 = mountWorkInProgressHook()
	var3.flags = bit32.bor(var3.flags, update)
	var26.memoizedState = pushEffect(bit32.bor(hasEffect, layout), p7, nil, p8)
end

local function updateLayoutEffect(p7, p8)
	-- upvalues: update (ref), layout (ref)
	updateEffectImpl(update, layout, p7, p8)
end

function imperativeHandleEffect(p7, p8)
	-- upvalues: dEV (ref), object (ref), console (ref), array (ref)
	if p8 ~= nil and type(p8) == "function" then
		p8(p7())
		
		return function()
			-- upvalues: p8 (ref)
			return p8(nil)
		end
	elseif p8 == nil then
		return nil
	elseif dEV then
		if not (getmetatable(p8) ~= nil and #object.keys(p8) == 0) then
			console.error("Expected useImperativeHandle() first argument to either be a ref callback or React.createRef() object. Instead received: %s.", "an object with keys {" .. array.join(object.keys(p8), ", ") .. "}")
		end
	end
	p8.current = p7()
	
	return function()
		-- upvalues: p8 (ref)
		p8.current = nil
	end
end

function mountImperativeHandle(p7, p8, p9)
	-- upvalues: dEV (ref), console (ref), array (ref), enableDoubleInvokingEffects (ref), mountEffectImpl (ref), mountLayoutDev (ref), update (ref), layout (ref)
	if dEV and type(p8) ~= "function" then
		console.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", if p8 ~= nil then "nil" else type(p8))
	end
	local var24 = if p9 ~= nil then nil else array.concat(p9, { p7 })
	
	return if dEV and enableDoubleInvokingEffects then mountEffectImpl(bit32.bor(mountLayoutDev, update), layout, function()
		-- upvalues: p8 (ref), p7 (ref)
		return imperativeHandleEffect(p8, p7)
	end, var24) else mountEffectImpl(update, layout, function()
		-- upvalues: p8 (ref), p7 (ref)
		return imperativeHandleEffect(p8, p7)
	end, var24)
end

function updateImperativeHandle(p7, p8, p9)
	-- upvalues: dEV (ref), console (ref), update (ref), layout (ref)
	if dEV and type(p8) ~= "function" then
		console.error("Expected useImperativeHandle() second argument to be a function that creates a handle. Instead received: %s.", if p8 then type(p8) else "nil")
	end
	local cloned = nil
	
	if p9 ~= nil then
		cloned = table.clone(p9)
		table.insert(cloned, p7)
	end
	return updateEffectImpl(update, layout, function()
		-- upvalues: p8 (ref), p7 (ref)
		return imperativeHandleEffect(p8, p7)
	end, cloned)
end

function mountDebugValue(_, _) end

local _mountDebugValue = mountDebugValue

function mountCallback(p7, p8)
	-- upvalues: mountWorkInProgressHook (ref), enableAllocationTrims (ref)
	local var24 = mountWorkInProgressHook()
	
	if enableAllocationTrims then
		var24.memoizedState = p7
		var24.baseState = p8
		
		return p7
	end
	var24.memoizedState = { p7, p8 }
	
	return p7
end

function updateCallback(p7, p8)
	-- upvalues: updateWorkInProgressHook (ref), enableAllocationTrims (ref), areHookInputsEqual (ref)
	local var24 = updateWorkInProgressHook()
	
	if enableAllocationTrims then
		if p8 == nil or not areHookInputsEqual(p8, var24.baseState) then
			var24.memoizedState = p7
			var24.baseState = p8
			
			return p7
		end
		return var24.memoizedState
	else
		local memoizedState = var24.memoizedState
		
		if memoizedState == nil or p8 == nil or not areHookInputsEqual(p8, memoizedState[2]) then
			var24.memoizedState = { p7, p8 }
			
			return p7
		end
		return memoizedState[1]
	end
end

function mountMemo(p7, p8)
	-- upvalues: mountWorkInProgressHook (ref), enableAllocationTrims (ref), memoValues (ref)
	local var24 = mountWorkInProgressHook()
	
	if enableAllocationTrims then
		local var25 = memoValues.pack(p7())
		var24.memoizedState = var25
		var24.baseState = p8
		
		return memoValues.unpack(var25)
	end
	local list = { p7() }
	var24.memoizedState = { list, p8 }
	
	return unpack(list)
end

function updateMemo(p7, p8)
	-- upvalues: updateWorkInProgressHook (ref), enableAllocationTrims (ref), areHookInputsEqual (ref), memoValues (ref)
	local var24 = updateWorkInProgressHook()
	
	if enableAllocationTrims then
		if p8 == nil or not areHookInputsEqual(p8, var24.baseState) then
			local var25 = memoValues.pack(p7())
			var24.memoizedState = var25
			var24.baseState = p8
			
			return memoValues.unpack(var25)
		end
		return memoValues.unpack(var24.memoizedState)
	else
		local memoizedState = var24.memoizedState
		
		if memoizedState == nil or p8 == nil or not areHookInputsEqual(p8, memoizedState[2]) then
			local list = { p7() }
			var24.memoizedState = { list, p8 }
			
			return unpack(list)
		end
		return unpack(memoizedState[1])
	end
end

function t_2.getIsUpdatingOpaqueValueInRenderPhaseInDEV()
	-- upvalues: dEV (ref)
	return if dEV then false else nil
end

function mountOpaqueIdentifier()
	-- upvalues: dEV (ref), console (ref), makeClientId (ref), getIsHydrating (ref)
	local var24 = nil
	
	if dEV then
		console.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV")
	else
		var24 = makeClientId
	end
	if getIsHydrating() then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: ReactFiberHooks: getIsHydrating() true")
		error("FIXME (roblox): ReactFiberHooks: getIsHydrating() true is unimplemented")
		
		return nil
	end
	local var25 = var24()
	mountState(var25)
	
	return var25
end

function updateOpaqueIdentifier()
	local var24, _ = updateState(nil)
	
	return var24
end

function rerenderOpaqueIdentifier()
	local var24, _ = rerenderState(nil)
	
	return var24
end

function dispatchAction(p7, p8, p9, ...)
	-- upvalues: dEV (ref), console (ref), requestEventTime (ref), requestUpdateLane (ref), var3 (write), var8 (write), var9 (write), noLanes (ref), reactCurrentDispatcher (ref), t_8 (write), reactFeatureFlags (ref), var1 (ref), reactGlobalsModule (ref), warnIfNotScopedWithMatchingAct (ref), warnIfNotCurrentlyActingUpdatesInDEV (ref), scheduleUpdateOnFiber (ref), enableDebugTracing (ref), debugTracingMode (ref), getComponentName (ref), logStateUpdateScheduled (ref), enableSchedulingProfiler (ref), markStateUpdateScheduled (ref)
	if dEV and type(if select("#", ...) == 1 then select(1, ...) else nil) == "function" then
		console.error("State updates from the useState() and useReducer() Hooks don't support the second callback argument. To execute a side effect after rendering, declare it in the component body with useEffect().")
	end
	local var24 = requestEventTime()
	local var25 = requestUpdateLane(p7)
	local t = {
		eagerReducer = nil,
		eagerState = nil,
		next = nil,
		lane = var25,
		action = p9
	}
	local pending = p8.pending
	
	if pending == nil then
		t.next = t
	else
		t.next = pending.next
		pending.next = t
	end
	p8.pending = t
	local alternate = p7.alternate
	
	if p7 == var3 or alternate ~= nil and alternate == var3 then
		var8 = true
		var9 = true
	elseif p7.lanes == noLanes and (alternate == nil or alternate.lanes == noLanes) then
		local lastRenderedReducer = p8.lastRenderedReducer
		
		if lastRenderedReducer ~= nil then
			local current = nil
			
			if dEV then
				current = reactCurrentDispatcher.current
				reactCurrentDispatcher.current = t_8
			end
			local lastRenderedState = p8.lastRenderedState
			local ok, status = pcall(lastRenderedReducer, lastRenderedState, p9)
			
			if ok then
				t.eagerReducer = lastRenderedReducer
				t.eagerState = status
			end
			if dEV then
				reactCurrentDispatcher.current = current
			end
			if not reactFeatureFlags.fixEagerReducerError then
				local var26
				if status == lastRenderedState then
					var26 = true
					
					if status == 0 then
						var26 = true
						
						if 1 / status ~= 1 / lastRenderedState then
							var26 = status ~= status and lastRenderedState ~= lastRenderedState
						end
					end
					if var26 then
						if var1 then
							if pending == nil then
								p8.pending = nil
								
								return
							end
							pending.next = t.next
							p8.pending = pending
						end
						return
					end
				end
			elseif ok then
				local var27
				if status == lastRenderedState then
					var27 = true
					
					if status == 0 then
						var27 = true
						
						if 1 / status ~= 1 / lastRenderedState then
							var27 = status ~= status and lastRenderedState ~= lastRenderedState
						end
					end
					if var27 then
						if var1 then
							if pending == nil then
								p8.pending = nil
								
								return
							end
							pending.next = t.next
							p8.pending = pending
						end
						return
					end
				end
			end
		end
	end
	if dEV and (type(_G.jest) ~= "nil" or reactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
		warnIfNotScopedWithMatchingAct(p7)
		warnIfNotCurrentlyActingUpdatesInDEV(p7)
	end
	scheduleUpdateOnFiber(p7, var25, var24)
	if dEV and enableDebugTracing and bit32.band(p7.mode, debugTracingMode) ~= 0 then
		logStateUpdateScheduled(getComponentName(p7.type) or "Unknown", var25, p9)
	end
	if enableSchedulingProfiler then
		markStateUpdateScheduled(p7, var25)
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
	local _ = function()
		-- upvalues: console (ref)
		console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
	end
	
	local function restoreDispatcherAndReturn(p7, p8, ...)
		-- upvalues: reactCurrentDispatcher (ref)
		reactCurrentDispatcher.current = p7
		
		if not p8 then
			error(...)
		end
		return ...
	end
	
	local _ = function()
		-- upvalues: console (ref)
		console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
	end
	
	t_3 = {
		readContext = function(p9, p10)
			-- upvalues: readContext (ref)
			return readContext(p9, p10)
		end,
		useCallback = function(p9, p10)
			-- upvalues: var10 (write), dEV (ref), var11 (write), console (ref)
			var10 = "useCallback"
			
			if dEV then
				local var24 = var10
				
				if var11 == nil then
					var11 = { var24 }
				else
					table.insert(var11, var24)
				end
			end
			if dEV and p10 ~= nil then
				local var25
				if type(p10) == "table" then
					for i, v in p10 do
						if type(i) ~= "number" then
							var25 = false
						end
					end
					var25 = true
				else
					var25 = false
				end
				if not var25 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var10, type(p10))
				end
			end
			return mountCallback(p9, p10)
		end,
		useContext = function(p11, p12)
			-- upvalues: var10 (write), dEV (ref), var11 (write), readContext (ref)
			var10 = "useContext"
			
			if dEV then
				local var26 = var10
				
				if var11 == nil then
					var11 = { var26 }
				else
					table.insert(var11, var26)
				end
			end
			return readContext(p11, p12)
		end,
		useEffect = function(p11, p12)
			-- upvalues: var10 (write), dEV (ref), var11 (write), console (ref), mountEffect (ref)
			var10 = "useEffect"
			
			if dEV then
				local var26 = var10
				
				if var11 == nil then
					var11 = { var26 }
				else
					table.insert(var11, var26)
				end
			end
			if dEV and p12 ~= nil then
				local var27
				if type(p12) == "table" then
					for i, v in p12 do
						if type(i) ~= "number" then
							var27 = false
						end
					end
					var27 = true
				else
					var27 = false
				end
				if not var27 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var10, type(p12))
				end
			end
			return mountEffect(p11, p12)
		end,
		useImperativeHandle = function(p13, p14, p15)
			-- upvalues: var10 (write), dEV (ref), var11 (write), console (ref)
			var10 = "useImperativeHandle"
			
			if dEV then
				local var28 = var10
				
				if var11 == nil then
					var11 = { var28 }
				else
					table.insert(var11, var28)
				end
			end
			if dEV and p15 ~= nil then
				local var29
				if type(p15) == "table" then
					for i, v in p15 do
						if type(i) ~= "number" then
							var29 = false
						end
					end
					var29 = true
				else
					var29 = false
				end
				if not var29 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var10, type(p15))
				end
			end
			return mountImperativeHandle(p13, p14, p15)
		end,
		useLayoutEffect = function(p16, p17)
			-- upvalues: var10 (write), dEV (ref), var11 (write), console (ref), mountLayoutEffect (ref)
			var10 = "useLayoutEffect"
			
			if dEV then
				local var30 = var10
				
				if var11 == nil then
					var11 = { var30 }
				else
					table.insert(var11, var30)
				end
			end
			if dEV and p17 ~= nil then
				local var31
				if type(p17) == "table" then
					for i, v in p17 do
						if type(i) ~= "number" then
							var31 = false
						end
					end
					var31 = true
				else
					var31 = false
				end
				if not var31 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var10, type(p17))
				end
			end
			return mountLayoutEffect(p16, p17)
		end,
		useMemo = function(p18, p19)
			-- upvalues: var10 (write), dEV (ref), var11 (write), console (ref), reactCurrentDispatcher (ref), t_7 (write), enableAllocationTrims (ref), restoreDispatcherAndReturn (ref)
			var10 = "useMemo"
			
			if dEV then
				local var32 = var10
				
				if var11 == nil then
					var11 = { var32 }
				else
					table.insert(var11, var32)
				end
			end
			if dEV and p19 ~= nil then
				local var33
				if type(p19) == "table" then
					for i, v in p19 do
						if type(i) ~= "number" then
							var33 = false
						end
					end
					var33 = true
				else
					var33 = false
				end
				if not var33 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var10, type(p19))
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			
			if enableAllocationTrims then
				return restoreDispatcherAndReturn(current, pcall(mountMemo, p18, p19))
			end
			local list = { pcall(mountMemo, p18, p19) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p20, p21, p22)
			-- upvalues: var10 (write), dEV (ref), var11 (write), reactCurrentDispatcher (ref), t_7 (write)
			var10 = "useReducer"
			
			if dEV then
				local var34 = var10
				
				if var11 == nil then
					var11 = { var34 }
				else
					table.insert(var11, var34)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var35 = pcall(mountReducer, p20, p21, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useRef = function(p20)
			-- upvalues: var10 (write), dEV (ref), var11 (write)
			var10 = "useRef"
			
			if dEV then
				local var34 = var10
				
				if var11 == nil then
					var11 = { var34 }
				else
					table.insert(var11, var34)
				end
			end
			return mountRef(p20)
		end,
		useBinding = function(p20)
			-- upvalues: var10 (write), dEV (ref), var11 (write)
			var10 = "useBinding"
			
			if dEV then
				local var34 = var10
				
				if var11 == nil then
					var11 = { var34 }
				else
					table.insert(var11, var34)
				end
			end
			return mountBinding(p20)
		end,
		useState = function(p20)
			-- upvalues: var10 (write), dEV (ref), var11 (write), reactCurrentDispatcher (ref), t_7 (write)
			var10 = "useState"
			
			if dEV then
				local var34 = var10
				
				if var11 == nil then
					var11 = { var34 }
				else
					table.insert(var11, var34)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var35 = pcall(mountState, p20)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useDebugValue = function(p20, p21)
			-- upvalues: var10 (write), dEV (ref), var11 (write)
			var10 = "useDebugValue"
			
			if dEV then
				local var34 = var10
				
				if var11 == nil then
					var11 = { var34 }
				else
					table.insert(var11, var34)
				end
			end
			return mountDebugValue(p20, p21)
		end,
		useMutableSource = function(p20, p21, p22)
			-- upvalues: var10 (write), dEV (ref), var11 (write)
			var10 = "useMutableSource"
			
			if dEV then
				local var34 = var10
				
				if var11 == nil then
					var11 = { var34 }
				else
					table.insert(var11, var34)
				end
			end
			return mountMutableSource(p20, p21, p22)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var10 (write), dEV (ref), var11 (write)
			var10 = "useOpaqueIdentifier"
			
			if dEV then
				local var34 = var10
				
				if var11 == nil then
					var11 = { var34 }
				else
					table.insert(var11, var34)
				end
			end
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_4 = {
		readContext = function(p20, p21)
			-- upvalues: readContext (ref)
			return readContext(p20, p21)
		end,
		useCallback = function(p20, p21)
			-- upvalues: var10 (write), dEV (ref), console (ref)
			var10 = "useCallback"
			updateHookTypesDev()
			
			if dEV and p21 ~= nil then
				local var34
				if type(p21) == "table" then
					for i, v in p21 do
						if type(i) ~= "number" then
							var34 = false
						end
					end
					var34 = true
				else
					var34 = false
				end
				if not var34 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var10, type(p21))
				end
			end
			return mountCallback(p20, p21)
		end,
		useContext = function(p22, p23)
			-- upvalues: var10 (write), readContext (ref)
			var10 = "useContext"
			updateHookTypesDev()
			
			return readContext(p22, p23)
		end,
		useEffect = function(p22, p23)
			-- upvalues: var10 (write), mountEffect (ref)
			var10 = "useEffect"
			updateHookTypesDev()
			
			return mountEffect(p22, p23)
		end,
		useImperativeHandle = function(p22, p23, p24)
			-- upvalues: var10 (write)
			var10 = "useImperativeHandle"
			updateHookTypesDev()
			
			return mountImperativeHandle(p22, p23, p24)
		end,
		useLayoutEffect = function(p22, p23)
			-- upvalues: var10 (write), mountLayoutEffect (ref)
			var10 = "useLayoutEffect"
			updateHookTypesDev()
			
			return mountLayoutEffect(p22, p23)
		end,
		useMemo = function(p22, p23)
			-- upvalues: var10 (write), reactCurrentDispatcher (ref), t_7 (write), enableAllocationTrims (ref), restoreDispatcherAndReturn (ref)
			var10 = "useMemo"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			
			if enableAllocationTrims then
				return restoreDispatcherAndReturn(current, pcall(mountMemo, p22, p23))
			end
			local list = { pcall(mountMemo, p22, p23) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p22, p23, p24)
			-- upvalues: var10 (write), reactCurrentDispatcher (ref), t_7 (write)
			var10 = "useReducer"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var35 = pcall(mountReducer, p22, p23, p24)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useRef = function(p22)
			-- upvalues: var10 (write)
			var10 = "useRef"
			updateHookTypesDev()
			
			return mountRef(p22)
		end,
		useBinding = function(p22)
			-- upvalues: var10 (write)
			var10 = "useBinding"
			updateHookTypesDev()
			
			return mountBinding(p22)
		end,
		useState = function(p22)
			-- upvalues: var10 (write), reactCurrentDispatcher (ref), t_7 (write)
			var10 = "useState"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var35 = pcall(mountState, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useDebugValue = function(p22, p23)
			-- upvalues: var10 (write)
			var10 = "useDebugValue"
			updateHookTypesDev()
			
			return mountDebugValue(p22, p23)
		end,
		useMutableSource = function(p22, p23, p24)
			-- upvalues: var10 (write)
			var10 = "useMutableSource"
			updateHookTypesDev()
			
			return mountMutableSource(p22, p23, p24)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var10 (write)
			var10 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_5 = {
		readContext = function(p22, p23)
			-- upvalues: readContext (ref)
			return readContext(p22, p23)
		end,
		useCallback = function(p22, p23)
			-- upvalues: var10 (write)
			var10 = "useCallback"
			updateHookTypesDev()
			
			return updateCallback(p22, p23)
		end,
		useContext = function(p22, p23)
			-- upvalues: var10 (write), readContext (ref)
			var10 = "useContext"
			updateHookTypesDev()
			
			return readContext(p22, p23)
		end,
		useEffect = function(p22, p23)
			-- upvalues: var10 (write), updateEffect (ref)
			var10 = "useEffect"
			updateHookTypesDev()
			
			return updateEffect(p22, p23)
		end,
		useImperativeHandle = function(p22, p23, p24)
			-- upvalues: var10 (write)
			var10 = "useImperativeHandle"
			updateHookTypesDev()
			
			return updateImperativeHandle(p22, p23, p24)
		end,
		useLayoutEffect = function(p22, p23)
			-- upvalues: var10 (write), updateLayoutEffect (ref)
			var10 = "useLayoutEffect"
			updateHookTypesDev()
			
			return updateLayoutEffect(p22, p23)
		end,
		useMemo = function(p22, p23)
			-- upvalues: var10 (write), reactCurrentDispatcher (ref), t_8 (write), enableAllocationTrims (ref), restoreDispatcherAndReturn (ref)
			var10 = "useMemo"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			
			if enableAllocationTrims then
				return restoreDispatcherAndReturn(current, pcall(updateMemo, p22, p23))
			end
			local list = { pcall(updateMemo, p22, p23) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p22, p23, p24)
			-- upvalues: var10 (write), reactCurrentDispatcher (ref), t_8 (write)
			var10 = "useReducer"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var35 = pcall(updateReducer, p22, p23, p24)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useRef = function(p22)
			-- upvalues: var10 (write)
			var10 = "useRef"
			updateHookTypesDev()
			
			return updateRef(p22)
		end,
		useBinding = function(p22)
			-- upvalues: var10 (write)
			var10 = "useBinding"
			updateHookTypesDev()
			
			return updateBinding(p22)
		end,
		useState = function(p22)
			-- upvalues: var10 (write), reactCurrentDispatcher (ref), t_8 (write)
			var10 = "useState"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var35 = pcall(updateState, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useDebugValue = function(p22, p23)
			-- upvalues: var10 (write), _mountDebugValue (ref)
			var10 = "useDebugValue"
			updateHookTypesDev()
			
			return _mountDebugValue(p22, p23)
		end,
		useMutableSource = function(p22, p23, p24)
			-- upvalues: var10 (write)
			var10 = "useMutableSource"
			updateHookTypesDev()
			
			return updateMutableSource(p22, p23, p24)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var10 (write)
			var10 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return updateOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_6 = {
		readContext = function(p22, p23)
			-- upvalues: readContext (ref)
			return readContext(p22, p23)
		end,
		useCallback = function(p22, p23)
			-- upvalues: var10 (write)
			var10 = "useCallback"
			updateHookTypesDev()
			
			return updateCallback(p22, p23)
		end,
		useContext = function(p22, p23)
			-- upvalues: var10 (write), readContext (ref)
			var10 = "useContext"
			updateHookTypesDev()
			
			return readContext(p22, p23)
		end,
		useEffect = function(p22, p23)
			-- upvalues: var10 (write), updateEffect (ref)
			var10 = "useEffect"
			updateHookTypesDev()
			
			return updateEffect(p22, p23)
		end,
		useImperativeHandle = function(p22, p23, p24)
			-- upvalues: var10 (write)
			var10 = "useImperativeHandle"
			updateHookTypesDev()
			
			return updateImperativeHandle(p22, p23, p24)
		end,
		useLayoutEffect = function(p22, p23)
			-- upvalues: var10 (write), updateLayoutEffect (ref)
			var10 = "useLayoutEffect"
			updateHookTypesDev()
			
			return updateLayoutEffect(p22, p23)
		end,
		useMemo = function(p22, p23)
			-- upvalues: var10 (write), reactCurrentDispatcher (ref), t_9 (write), enableAllocationTrims (ref), restoreDispatcherAndReturn (ref)
			var10 = "useMemo"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_9
			
			if enableAllocationTrims then
				return restoreDispatcherAndReturn(current, pcall(updateMemo, p22, p23))
			end
			local list = { pcall(updateMemo, p22, p23) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p22, p23, p24)
			-- upvalues: var10 (write), reactCurrentDispatcher (ref), t_9 (write)
			var10 = "useReducer"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_9
			local ok, status, var35 = pcall(rerenderReducer, p22, p23, p24)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useRef = function(p22)
			-- upvalues: var10 (write)
			var10 = "useRef"
			updateHookTypesDev()
			
			return updateRef(p22)
		end,
		useBinding = function(p22)
			-- upvalues: var10 (write)
			var10 = "useBinding"
			updateHookTypesDev()
			
			return updateBinding(p22)
		end,
		useState = function(p22)
			-- upvalues: var10 (write), reactCurrentDispatcher (ref), t_9 (write)
			var10 = "useState"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_9
			local ok, status, var35 = pcall(rerenderState, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useDebugValue = function(p22, p23)
			-- upvalues: var10 (write), _mountDebugValue (ref)
			var10 = "useDebugValue"
			updateHookTypesDev()
			
			return _mountDebugValue(p22, p23)
		end,
		useMutableSource = function(p22, p23, p24)
			-- upvalues: var10 (write)
			var10 = "useMutableSource"
			updateHookTypesDev()
			
			return updateMutableSource(p22, p23, p24)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var10 (write)
			var10 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return rerenderOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_7 = {
		readContext = function(p22, p23)
			-- upvalues: console (ref), readContext (ref)
			console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return readContext(p22, p23)
		end,
		useCallback = function(p22, p23)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write)
			var10 = "useCallback"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			return mountCallback(p22, p23)
		end,
		useContext = function(p22, p23)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write), readContext (ref)
			var10 = "useContext"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			return readContext(p22, p23)
		end,
		useEffect = function(p22, p23)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write), mountEffect (ref)
			var10 = "useEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			return mountEffect(p22, p23)
		end,
		useImperativeHandle = function(p22, p23, p24)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write)
			var10 = "useImperativeHandle"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			return mountImperativeHandle(p22, p23, p24)
		end,
		useLayoutEffect = function(p22, p23)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write), mountLayoutEffect (ref)
			var10 = "useLayoutEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			return mountLayoutEffect(p22, p23)
		end,
		useMemo = function(p22, p23)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write), reactCurrentDispatcher (ref), t_7 (write), enableAllocationTrims (ref), restoreDispatcherAndReturn (ref)
			var10 = "useMemo"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			
			if enableAllocationTrims then
				return restoreDispatcherAndReturn(current, pcall(mountMemo, p22, p23))
			end
			local list = { pcall(mountMemo, p22, p23) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p22, p23, p24)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write), reactCurrentDispatcher (ref), t_7 (write)
			var10 = "useReducer"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var36 = pcall(mountReducer, p22, p23, p24)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var36
		end,
		useRef = function(p22)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write)
			var10 = "useRef"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			return mountRef(p22)
		end,
		useBinding = function(p22)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write)
			var10 = "useBinding"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			return mountBinding(p22)
		end,
		useState = function(p22)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write), reactCurrentDispatcher (ref), t_7 (write)
			var10 = "useState"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var36 = pcall(mountState, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var36
		end,
		useDebugValue = function(p22, p23)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write)
			var10 = "useDebugValue"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			return mountDebugValue(p22, p23)
		end,
		useMutableSource = function(p22, p23, p24)
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write)
			var10 = "useMutableSource"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			return mountMutableSource(p22, p23, p24)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var10 (write), console (ref), dEV (ref), var11 (write)
			var10 = "useOpaqueIdentifier"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var35 = var10
				
				if var11 == nil then
					var11 = { var35 }
				else
					table.insert(var11, var35)
				end
			end
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_8 = {
		readContext = function(p22, p23)
			-- upvalues: console (ref), readContext (ref)
			console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return readContext(p22, p23)
		end,
		useCallback = function(p22, p23)
			-- upvalues: var10 (write), console (ref)
			var10 = "useCallback"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return mountCallback(p22, p23)
		end,
		useContext = function(p22, p23)
			-- upvalues: var10 (write), console (ref), readContext (ref)
			var10 = "useContext"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return readContext(p22, p23)
		end,
		useEffect = function(p22, p23)
			-- upvalues: var10 (write), console (ref), updateEffect (ref)
			var10 = "useEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateEffect(p22, p23)
		end,
		useImperativeHandle = function(p22, p23, p24)
			-- upvalues: var10 (write), console (ref)
			var10 = "useImperativeHandle"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateImperativeHandle(p22, p23, p24)
		end,
		useLayoutEffect = function(p22, p23)
			-- upvalues: var10 (write), console (ref), updateLayoutEffect (ref)
			var10 = "useLayoutEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateLayoutEffect(p22, p23)
		end,
		useMemo = function(p22, p23)
			-- upvalues: var10 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write), enableAllocationTrims (ref), restoreDispatcherAndReturn (ref)
			var10 = "useMemo"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			
			if enableAllocationTrims then
				return restoreDispatcherAndReturn(current, pcall(updateMemo, p22, p23))
			end
			local list = { pcall(updateMemo, p22, p23) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p22, p23, p24)
			-- upvalues: var10 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var10 = "useReducer"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var35 = pcall(updateReducer, p22, p23, p24)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useRef = function(p22)
			-- upvalues: var10 (write), console (ref)
			var10 = "useRef"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateRef(p22)
		end,
		useBinding = function(p22)
			-- upvalues: var10 (write), console (ref)
			var10 = "useBinding"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateBinding(p22)
		end,
		useState = function(p22)
			-- upvalues: var10 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var10 = "useState"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var35 = pcall(updateState, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useDebugValue = function(p22, p23)
			-- upvalues: var10 (write), console (ref), _mountDebugValue (ref)
			var10 = "useDebugValue"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return _mountDebugValue(p22, p23)
		end,
		useMutableSource = function(p22, p23, p24)
			-- upvalues: var10 (write), console (ref)
			var10 = "useMutableSource"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateMutableSource(p22, p23, p24)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var10 (write), console (ref)
			var10 = "useOpaqueIdentifier"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_9 = {
		readContext = function(p22, p23)
			-- upvalues: console (ref), readContext (ref)
			console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return readContext(p22, p23)
		end,
		useCallback = function(p22, p23)
			-- upvalues: var10 (write), console (ref)
			var10 = "useCallback"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateCallback(p22, p23)
		end,
		useContext = function(p22, p23)
			-- upvalues: var10 (write), console (ref), readContext (ref)
			var10 = "useContext"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return readContext(p22, p23)
		end,
		useEffect = function(p22, p23)
			-- upvalues: var10 (write), console (ref), updateEffect (ref)
			var10 = "useEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateEffect(p22, p23)
		end,
		useImperativeHandle = function(p22, p23, p24)
			-- upvalues: var10 (write), console (ref)
			var10 = "useImperativeHandle"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateImperativeHandle(p22, p23, p24)
		end,
		useLayoutEffect = function(p22, p23)
			-- upvalues: var10 (write), console (ref), updateLayoutEffect (ref)
			var10 = "useLayoutEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateLayoutEffect(p22, p23)
		end,
		useMemo = function(p22, p23)
			-- upvalues: var10 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write), enableAllocationTrims (ref), restoreDispatcherAndReturn (ref)
			var10 = "useMemo"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			
			if enableAllocationTrims then
				return restoreDispatcherAndReturn(current, pcall(updateMemo, p22, p23))
			end
			local list = { pcall(updateMemo, p22, p23) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p22, p23, p24)
			-- upvalues: var10 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var10 = "useReducer"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var35 = pcall(rerenderReducer, p22, p23, p24)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useRef = function(p22)
			-- upvalues: var10 (write), console (ref)
			var10 = "useRef"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateRef(p22)
		end,
		useBinding = function(p22)
			-- upvalues: var10 (write), console (ref)
			var10 = "useBinding"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateBinding(p22)
		end,
		useState = function(p22)
			-- upvalues: var10 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var10 = "useState"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var35 = pcall(rerenderState, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var35
		end,
		useDebugValue = function(p22, p23)
			-- upvalues: var10 (write), console (ref), _mountDebugValue (ref)
			var10 = "useDebugValue"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return _mountDebugValue(p22, p23)
		end,
		useMutableSource = function(p22, p23, p24)
			-- upvalues: var10 (write), console (ref)
			var10 = "useMutableSource"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateMutableSource(p22, p23, p24)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var10 (write), console (ref)
			var10 = "useOpaqueIdentifier"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return rerenderOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
end
function t_2.renderWithHooks(p20, p21, p22, p23, p24, p25)
	-- upvalues: var2 (write), var3 (write), dEV (ref), var11 (write), var12 (write), reactFeatureFlags (ref), noLanes (ref), reactCurrentDispatcher (ref), t_5 (write), t_4 (write), t_3 (write), t_11 (ref), t_12 (ref), var9 (write), error (ref), var4 (write), var5 (write), t_6 (write), t_13 (ref), t_10 (ref), enableHookDoubleBuffering (ref), var6 (write), var7 (write), var10 (write), var8 (write), getComponentName (ref)
	var2 = p25
	var3 = p21
	
	if dEV then
		var11 = if p20 ~= nil then nil else p20._debugHookTypes
		var12 = 0
	end
	if reactFeatureFlags.enableWorkLoopTrims then
		if p21.memoizedState ~= nil then
			p21.memoizedState = nil
		end
		if p21.updateQueue ~= nil then
			p21.updateQueue = nil
		end
	else
		p21.memoizedState = nil
		p21.updateQueue = nil
	end
	p21.lanes = noLanes
	
	if not dEV then
		local t_11_1
		local var34 = reactCurrentDispatcher
		
		if p20 ~= nil then
			t_11_1 = p20.memoizedState == nil and (t_11 or t_12)
		end
		var34.current = t_11_1
	elseif p20 ~= nil and p20.memoizedState ~= nil then
		reactCurrentDispatcher.current = t_5
	elseif var11 == nil then
		reactCurrentDispatcher.current = t_3
	else
		reactCurrentDispatcher.current = t_4
	end
	local var35 = p22(p23, p24)
	
	if var9 then
		local var36 = 0
		var9 = false
		
		if var36 >= 25 then
			error(error.new("Too many re-renders. React limits the number of renders to prevent an infinite loop."))
		end
		var36 += 1
		var4 = nil
		var5 = nil
		p21.updateQueue = nil
		
		if dEV then
			var12 = 0
		end
		reactCurrentDispatcher.current = if dEV then t_6 else t_13
		var35 = p22(p23, p24)
	end
	reactCurrentDispatcher.current = t_10
	
	if dEV then
		p21._debugHookTypes = var11
	end
	local var37 = var4 ~= nil and var4.next ~= nil
	var2 = noLanes
	var3 = nil
	var4 = nil
	var5 = nil
	
	if enableHookDoubleBuffering then
		var6 = nil
		var7 = nil
	end
	if dEV then
		var10 = nil
		var11 = nil
		var12 = 0
	end
	var8 = false
	
	if var37 then
		local var38 = "unknown"
		
		if var35 and var35.type then
			var38 = getComponentName(var35.type) or var38
		end
		error(error.new("Rendered fewer hooks than expected. This may be caused by an accidental " .. "early return statement. Inside '" .. var198 .. "'"))
	end
	return var35
end

return t_2