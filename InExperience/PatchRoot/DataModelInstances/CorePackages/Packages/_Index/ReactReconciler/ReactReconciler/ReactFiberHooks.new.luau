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
		-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), mountPassiveDev (ref), passive (ref), mountLayoutDev (ref), update (ref), removeLanes (ref)
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
local var6 = false
local var7 = false
local var8 = nil
local var9 = nil
local var10 = 0
local t_3 = nil
local t_4 = nil
local t_5 = nil
local t_6 = nil
local t_7 = nil
local t_8 = nil
local t_9 = nil

local _ = function(p1)
	local var11 = 0
	
	for i, v in p1 do
		if var11 < i then
			var11 = i
		end
	end
	return var11
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
	-- upvalues: dEV (ref), var8 (write), var9 (write)
	if dEV then
		local var12 = var8
		
		if var9 == nil then
			var9 = { var12 }
			
			return
		end
		table.insert(var9, var12)
	end
end

function updateHookTypesDev()
	-- upvalues: dEV (ref), var8 (write), var9 (write), var10 (write)
	if dEV then
		local var12 = var8
		
		if var9 ~= nil then
			var10 += 1
			
			if var9[var10] ~= var12 then
				warnOnHookMismatchInDev(var12)
			end
		end
	end
end

local _ = function(p3)
	-- upvalues: dEV (ref), console (ref), var8 (write)
	if dEV and p3 ~= nil then
		local var12
		if type(p3) == "table" then
			for i, v in p3 do
				if type(i) ~= "number" then
					var12 = false
				end
			end
			var12 = true
		else
			var12 = false
		end
		if not var12 then
			console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var8, type(p3))
		end
	end
end

function warnOnHookMismatchInDev(p4)
	-- upvalues: dEV (ref), getComponentName (ref), var3 (write), t (write), var9 (write), var10 (write), console (ref)
	if dEV then
		local type = getComponentName(var3.type) or "Component"
		
		if not t[type] then
			t[type] = true
			
			if var9 ~= nil then
				local var13 = ""
				
				for i = 1, var10 do
					local var14 = var9[i]
					local var15 = if i == var10 then p4 else var14
					local text = tostring(i) .. ". " .. (var14 or "undefined")
				end
				console.error("React has detected a change in the order of Hooks called by %s. This will lead to bugs and errors if not fixed. For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n   Previous render            Next render\n   ------------------------------------------------------\n%s   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", type, var13)
			end
		end
	end
end

local function throwInvalidHookError()
	-- upvalues: error (ref)
	error(error.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."))
end

local function areHookInputsEqual(p5, p6)
	-- upvalues: dEV (ref), console (ref), var8 (write)
	if p6 == nil then
		if dEV then
			console.error("%s received a final argument during this render, but not during the previous render. Even though the final argument is optional, its type cannot change between renders.", var8)
		end
		return false
	else
		local var16 = 0
		
		for i, v in p5 do
			if var16 < i then
				var16 = i
			end
		end
		local var17 = 0
		
		for i_1, v_1 in p6 do
			if var17 < i_1 then
				var17 = i_1
			end
		end
		if var16 ~= var17 then
			return false
		end
		for i_2 = 1, math.min(var17, var16) do
			local var18
			local var19 = p5[i_2]
			local var20 = p6[i_2]
			
			if var19 == var20 then
				var18 = true
				
				if var19 == 0 then
					var18 = true
					
					if 1 / var19 ~= 1 / var20 then
						var18 = var19 ~= var19 and var20 ~= var20
					end
				end
				if var18 then
					continue
				end
				return false
			end
		end
		return true
	end
end

local var21 = false

function t_2.resetHooksAfterThrow()
	-- upvalues: reactCurrentDispatcher (ref), t_2 (ref), var6 (write), var3 (write), var2 (write), noLanes (ref), var4 (write), var5 (write), dEV (ref), var9 (write), var10 (write), var8 (write), var21 (write), var7 (write)
	reactCurrentDispatcher.current = t_2.ContextOnlyDispatcher
	
	if var6 then
		local memoizedState = var3.memoizedState
		while memoizedState ~= nil do
			local queue = memoizedState.queue
			
			if queue ~= nil then
				queue.pending = nil
			end
			memoizedState = memoizedState.next
		end
		var6 = false
	end
	var2 = noLanes
	var3 = nil
	var4 = nil
	var5 = nil
	
	if dEV then
		var9 = nil
		var10 = 0
		var8 = nil
		var21 = false
	end
	var7 = false
end

local _ = function()
	-- upvalues: var5 (write), var3 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var5 == nil then
		var3.memoizedState = t
		var5 = t
	else
		var5.next = t
		var5 = t
	end
	return var5
end

local function updateWorkInProgressHook()
	-- upvalues: var4 (write), var3 (write), var5 (write), error (ref)
	local var22
	local _ = nil
	
	if var4 == nil then
		local alternate = var3.alternate
		var22 = if alternate ~= nil then nil else alternate.memoizedState
	else
		var22 = var4.next
	end
	local var23 = if var5 == nil then var3.memoizedState else var5.next
	
	if var23 == nil then
		if var22 == nil then
			error(error.new("Rendered more hooks than during the previous render."))
		end
		var4 = var22
		local t = {
			next = nil,
			memoizedState = var4.memoizedState,
			baseState = var4.baseState,
			baseQueue = var4.baseQueue,
			queue = var4.queue
		}
		
		if var5 == nil then
			var5 = t
			var3.memoizedState = t
		else
			var5.next = t
			var5 = t
		end
	else
		var5 = var23
		var23 = var5.next
		var4 = var22
	end
	return var5
end

function basicStateReducer(p7, p8)
	return if type(p8) == "function" then p8(p7) else p8
end

function mountReducer(p7, p8, p9)
	-- upvalues: var5 (write), var3 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var5 == nil then
		var3.memoizedState = t
		var5 = t
	else
		var5.next = t
		var5 = t
	end
	local var22 = var5
	local var23 = if p9 ~= nil then p8 else p9(p8)
	var22.baseState = var23
	var22.memoizedState = var22.baseState
	local t_1 = {
		pending = nil,
		dispatch = nil,
		lastRenderedReducer = p7,
		lastRenderedState = var23
	}
	var22.queue = t_1
	
	local var24 = function(p10, ...)
		-- upvalues: var3 (ref), t_1 (ref)
		dispatchAction(var3, t_1, p10, ...)
	end
	
	t_1.dispatch = var24
	
	return var22.memoizedState, var24
end

function updateReducer(p7, _, _)
	-- upvalues: updateWorkInProgressHook (ref), var4 (write), var2 (write), var3 (write), mergeLanes (ref), markSkippedUpdateLanes (ref), noLane (ref), markWorkInProgressReceivedUpdate (ref)
	local var22 = updateWorkInProgressHook()
	local queue = var22.queue
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
		local var23 = nil
		local var24 = nil
		local next_1 = nil
		local var25 = next
		repeat
			local lane = var25.lane
			if bit32.band(var2, lane) == lane then
				if next_1 ~= nil then
					next_1.next = {
						next = nil,
						lane = noLane,
						action = var25.action,
						eagerReducer = var25.eagerReducer,
						eagerState = var25.eagerState
					}
					next_1 = next_1.next
				end
				baseState = if var25.eagerReducer == p7 then var25.eagerState else p7(baseState, var25.action)
				var25 = var25.next
			end
			local t = {
				next = nil,
				lane = lane,
				action = var25.action,
				eagerReducer = var25.eagerReducer,
				eagerState = var25.eagerState
			}
			
			if next_1 == nil then
				next_1 = t
				var24 = next_1
				var23 = baseState
			else
				next_1.next = t
				next_1 = next_1.next
			end
			var3.lanes = mergeLanes(var3.lanes, lane)
			markSkippedUpdateLanes(lane)
		until var25 == nil or var25 == next
		if next_1 == nil then
			var23 = baseState
		else
			next_1.next = var24
		end
		local var26
		local var27 = baseState
		local memoizedState = var22.memoizedState
		
		if var27 == memoizedState then
			var26 = true
			
			if var27 == 0 then
				var26 = true
				
				if 1 / var27 ~= 1 / memoizedState then
					var26 = var27 ~= var27 and memoizedState ~= memoizedState
				end
			end
			if not var26 then
				markWorkInProgressReceivedUpdate()
			end
			var22.memoizedState = baseState
			var22.baseState = var23
			var22.baseQueue = next_1
			queue.lastRenderedState = baseState
		end
	end
	return var22.memoizedState, queue.dispatch
end

function rerenderReducer(p7, _, _)
	-- upvalues: updateWorkInProgressHook (ref), markWorkInProgressReceivedUpdate (ref)
	local var22 = updateWorkInProgressHook()
	local queue = var22.queue
	assert(queue ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.")
	queue.lastRenderedReducer = p7
	local dispatch = queue.dispatch
	local pending = queue.pending
	local memoizedState = var22.memoizedState
	
	if pending ~= nil then
		queue.pending = nil
		local next = pending.next
		local var23 = next
		repeat
			memoizedState = p7(memoizedState, var23.action)
			var23 = var23.next
		until var23 == next
		local var24
		local var25 = memoizedState
		local memoizedState_1 = var22.memoizedState
		
		if var25 == memoizedState_1 then
			var24 = true
			
			if var25 == 0 then
				var24 = true
				
				if 1 / var25 ~= 1 / memoizedState_1 then
					var24 = var25 ~= var25 and memoizedState_1 ~= memoizedState_1
				end
			end
			if not var24 then
				markWorkInProgressReceivedUpdate()
			end
			var22.memoizedState = memoizedState
			
			if var22.baseQueue == nil then
				var22.baseState = memoizedState
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
	local var22
	local version = p8._getVersion(p8._source)
	local _ = false
	local var23 = getWorkInProgressVersion(p8)
	
	if var23 == nil then
		var22 = isSubsetOfLanes(var2, p7.mutableReadLanes)
		
		if var22 then
			setWorkInProgressVersion(p8, version)
		end
	else
		local _ = var23 == version
	end
	if not var22 then
		markSourceAsDirty(p8)
		error(error.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."))
		
		return
	end
	local var24 = p9(p8._source)
	
	if dEV and type(var24) == "function" then
		console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
	end
	return var24
end

function useMutableSource(p7, p8, p9, p10)
	-- upvalues: getWorkInProgressRoot (ref), invariant (ref), reactCurrentDispatcher (ref), var5 (write), var3 (write), dEV (ref), console (ref), requestUpdateLane (ref), markRootMutableRead (ref), markRootEntangled (ref)
	local var22 = getWorkInProgressRoot()
	invariant(var22 ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.")
	local getVersion = p8._getVersion
	local var23 = getVersion(p8._source)
	local current = reactCurrentDispatcher.current
	assert(current ~= nil, "dispatcher was nil, this is a bug in React")
	local var24, var25 = current.useState(function()
		-- upvalues: var22 (ref), p8 (ref), p9 (ref)
		return readFromUnsubcribedMutableSource(var22, p8, p9)
	end)
	local var26 = var24
	local memoizedState = p7.memoizedState
	
	if memoizedState.refs == nil then
		error(tostring(debug.traceback()))
	end
	local var27
	local refs = memoizedState.refs
	local getSnapshot = refs.getSnapshot
	local source = memoizedState.source
	local subscribe = memoizedState.subscribe
	p7.memoizedState = { refs = refs, source = p8, subscribe = p10 }
	current.useEffect(function()
		-- upvalues: refs (ref), p9 (ref), var25 (write), getVersion (ref), p8 (ref), var23 (ref), dEV (copy), console (copy), var26 (write), requestUpdateLane (copy), var3 (ref), markRootMutableRead (copy), var22 (ref), markRootEntangled (copy)
		local var28
		refs.getSnapshot = p9
		refs.setSnapshot = var25
		local var29 = getVersion(p8._source)
		local var30 = var23
		
		if var30 == var29 then
			var28 = true
			
			if var30 == 0 then
				var28 = true
				
				if 1 / var30 ~= 1 / var29 then
					var28 = var30 ~= var30 and var29 ~= var29
				end
			end
			if not var28 then
				var28 = p9(p8._source)
				
				if dEV and type(var28) == "function" then
					console.error("Mutable source should not return a function as the snapshot value. Functions may close over mutable values and cause tearing.")
				end
				local var31 = var26
				
				if var31 == var28 then
					var30 = true
					
					if var31 == 0 then
						var30 = true
						
						if 1 / var31 ~= 1 / var28 then
							var30 = var31 ~= var31 and var28 ~= var28
						end
					end
					if not var30 then
						var25(var28)
						markRootMutableRead(var22, requestUpdateLane(var3))
					end
					markRootEntangled(var22, var22.mutableReadLanes)
				end
			end
		end
	end, { p9, p8, p10 })
	current.useEffect(function()
		-- upvalues: refs (ref), p8 (ref), requestUpdateLane (copy), var3 (ref), markRootMutableRead (copy), var22 (ref), p10 (ref), dEV (copy), console (copy)
		local var28 = p10(p8._source, function()
			-- upvalues: refs (copy), p8 (copy), requestUpdateLane (copy), var3 (copy), markRootMutableRead (copy), var22 (copy)
			local getSnapshot = refs.getSnapshot
			local setSnapshot = refs.setSnapshot
			local ok, status = pcall(function()
				-- upvalues: setSnapshot (ref), getSnapshot (ref), p8 (copy), requestUpdateLane (copy), var3 (copy), markRootMutableRead (copy), var22 (copy)
				setSnapshot(getSnapshot(p8._source))
				markRootMutableRead(var22, requestUpdateLane(var3))
			end)
			
			if not ok then
				setSnapshot(function()
					-- upvalues: status (ref)
					error(status)
				end)
			end
		end)
		
		if dEV and type(var28) ~= "function" then
			console.error("Mutable source subscribe function must return an unsubscribe function.")
		end
		return var28
	end, { p8, p10 })
	
	if getSnapshot == p9 then
		var27 = true
		
		if getSnapshot == 0 then
			var27 = true
			
			if 1 / getSnapshot ~= 1 / p9 then
				var27 = getSnapshot ~= getSnapshot and p9 ~= p9
			end
		end
		if var27 then
			if source == p8 then
				var27 = true
				
				if source == 0 then
					var27 = true
					
					if 1 / source ~= 1 / p8 then
						var27 = source ~= source and p8 ~= p8
					end
				end
				if var27 then
					if subscribe == p10 then
						var27 = true
						
						if subscribe == 0 then
							var27 = true
							
							if 1 / subscribe ~= 1 / p10 then
								var27 = subscribe ~= subscribe and p10 ~= p10
							end
						end
						if not var27 then
							var27 = {
								pending = nil,
								dispatch = nil,
								lastRenderedReducer = basicStateReducer,
								lastRenderedState = var26
							}
							local var28 = var3
							
							function var86.dispatch(...)
								-- upvalues: var28 (ref), var27 (ref)
								dispatchAction(var28, var27, ...)
							end
							
							var5.queue = var27
							var5.baseQueue = nil
							var26 = readFromUnsubcribedMutableSource(var22, p8, p9)
							var5.baseState = var26
							var5.memoizedState = var5.baseState
						end
						return var26
					end
				end
			end
		end
	end
end

function mountMutableSource(p7, p8, p9)
	-- upvalues: var5 (write), var3 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var5 == nil then
		var3.memoizedState = t
		var5 = t
	else
		var5.next = t
		var5 = t
	end
	local var22 = var5
	var22.memoizedState = {
		refs = { setSnapshot = nil, getSnapshot = p8 },
		source = p7,
		subscribe = p9
	}
	
	return useMutableSource(var22, p7, p8, p9)
end

function updateMutableSource(p7, p8, p9)
	-- upvalues: updateWorkInProgressHook (ref)
	return useMutableSource(updateWorkInProgressHook(), p7, p8, p9)
end

function mountState(p7)
	-- upvalues: var5 (write), var3 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var5 == nil then
		var3.memoizedState = t
		var5 = t
	else
		var5.next = t
		var5 = t
	end
	local var22 = var5
	
	if type(p7) == "function" then
		p7 = p7()
	end
	var22.baseState = p7
	var22.memoizedState = var22.baseState
	local t_1 = {
		pending = nil,
		dispatch = nil,
		lastRenderedReducer = nil,
		lastRenderedState = p7,
		lastRenderedReducer = basicStateReducer
	}
	var22.queue = t_1
	
	local var23 = function(p8, ...)
		-- upvalues: var3 (ref), t_1 (ref)
		dispatchAction(var3, t_1, p8, ...)
	end
	
	t_1.dispatch = var23
	
	return var22.memoizedState, var23
end

function updateState(p7)
	return updateReducer(basicStateReducer, p7)
end

function rerenderState(p7)
	return rerenderReducer(basicStateReducer, p7)
end

local function pushEffect(p7, p8, p9, p10)
	-- upvalues: var3 (write)
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

function mountBinding(p7)
	-- upvalues: var5 (write), var3 (write), createBinding (ref)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var5 == nil then
		var3.memoizedState = t
		var5 = t
	else
		var5.next = t
		var5 = t
	end
	local var22 = var5
	local var23, var24 = createBinding(p7)
	var22.memoizedState = { var23, var24 }
	
	return var23, var24
end

function updateBinding(_)
	-- upvalues: updateWorkInProgressHook (ref)
	return unpack(updateWorkInProgressHook().memoizedState)
end

function mountRef(p7)
	-- upvalues: var5 (write), var3 (write), createRef (ref)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var5 == nil then
		var3.memoizedState = t
		var5 = t
	else
		var5.next = t
		var5 = t
	end
	local var22 = var5
	local var23 = createRef()
	var23.current = p7
	var22.memoizedState = var23
	
	return var23
end

function updateRef(_)
	-- upvalues: updateWorkInProgressHook (ref)
	return updateWorkInProgressHook().memoizedState
end

local function mountEffectImpl(p7, p8, p9, p10)
	-- upvalues: var5 (write), var3 (write), pushEffect (ref), hasEffect (ref)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var5 == nil then
		var3.memoizedState = t
		var5 = t
	else
		var5.next = t
		var5 = t
	end
	local var22 = var5
	var3.flags = bit32.bor(var3.flags, p7)
	var22.memoizedState = pushEffect(bit32.bor(hasEffect, p8), p9, nil, p10)
end

function updateEffectImpl(p7, p8, p9, p10)
	-- upvalues: updateWorkInProgressHook (ref), var4 (write), areHookInputsEqual (ref), pushEffect (ref), var3 (write), hasEffect (ref)
	local var22 = updateWorkInProgressHook()
	local destroy = nil
	
	if var4 ~= nil then
		local memoizedState = var4.memoizedState
		destroy = memoizedState.destroy
		
		if p10 == nil or not areHookInputsEqual(p10, memoizedState.deps) then
			var3.flags = bit32.bor(var3.flags, p7)
			var22.memoizedState = pushEffect(bit32.bor(hasEffect, p8), p9, destroy, p10)
			
			return
		else
			var22.memoizedState = pushEffect(p8, p9, destroy, p10)
		end
	end
end

local function mountEffect(p7, p8)
	-- upvalues: dEV (ref), reactGlobalsModule (ref), warnIfNotCurrentlyActingEffectsInDEV (ref), var3 (write), enableDoubleInvokingEffects (ref), mountPassiveDev (ref), passive (ref), passiveStatic (ref), passive_1 (ref), var5 (write), pushEffect (ref), hasEffect (ref)
	if dEV and (type(_G.jest) ~= "nil" or reactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
		warnIfNotCurrentlyActingEffectsInDEV(var3)
	end
	if dEV and enableDoubleInvokingEffects then
		local bits = bit32.bor(mountPassiveDev, passive, passiveStatic)
		local var22 = passive_1
		local t = {
			memoizedState = nil,
			baseState = nil,
			baseQueue = nil,
			queue = nil,
			next = nil
		}
		
		if var5 == nil then
			var3.memoizedState = t
			var5 = t
		else
			var5.next = t
			var5 = t
		end
		local var23 = var5
		var3.flags = bit32.bor(var3.flags, bits)
		var23.memoizedState = pushEffect(bit32.bor(hasEffect, var22), p7, nil, p8)
		
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
		
		if var5 == nil then
			var3.memoizedState = t
			var5 = t
		else
			var5.next = t
			var5 = t
		end
		local var24 = var5
		var3.flags = bit32.bor(var3.flags, bits)
		var24.memoizedState = pushEffect(bit32.bor(hasEffect, passive_1), p7, nil, p8)
	end
end

local function updateEffect(p7, p8)
	-- upvalues: dEV (ref), reactGlobalsModule (ref), warnIfNotCurrentlyActingEffectsInDEV (ref), var3 (write), passive (ref), passive_1 (ref)
	if dEV and (type(_G.jest) ~= "nil" or reactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
		warnIfNotCurrentlyActingEffectsInDEV(var3)
	end
	updateEffectImpl(passive, passive_1, p7, p8)
end

local function mountLayoutEffect(p7, p8)
	-- upvalues: dEV (ref), enableDoubleInvokingEffects (ref), mountLayoutDev (ref), update (ref), layout (ref), var5 (write), var3 (write), pushEffect (ref), hasEffect (ref)
	if dEV and enableDoubleInvokingEffects then
		local bits = bit32.bor(mountLayoutDev, update)
		local var22 = layout
		local t = {
			memoizedState = nil,
			baseState = nil,
			baseQueue = nil,
			queue = nil,
			next = nil
		}
		
		if var5 == nil then
			var3.memoizedState = t
			var5 = t
		else
			var5.next = t
			var5 = t
		end
		local var23 = var5
		var3.flags = bit32.bor(var3.flags, bits)
		var23.memoizedState = pushEffect(bit32.bor(hasEffect, var22), p7, nil, p8)
		
		return
	else
		local t = {
			memoizedState = nil,
			baseState = nil,
			baseQueue = nil,
			queue = nil,
			next = nil
		}
		
		if var5 == nil then
			var3.memoizedState = t
			var5 = t
		else
			var5.next = t
			var5 = t
		end
		local var24 = var5
		var3.flags = bit32.bor(var3.flags, update)
		var24.memoizedState = pushEffect(bit32.bor(hasEffect, layout), p7, nil, p8)
	end
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
	local var22 = if p9 ~= nil then nil else array.concat(p9, { p7 })
	
	return if dEV and enableDoubleInvokingEffects then mountEffectImpl(bit32.bor(mountLayoutDev, update), layout, function()
		-- upvalues: p8 (ref), p7 (ref)
		return imperativeHandleEffect(p8, p7)
	end, var22) else mountEffectImpl(update, layout, function()
		-- upvalues: p8 (ref), p7 (ref)
		return imperativeHandleEffect(p8, p7)
	end, var22)
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
	-- upvalues: var5 (write), var3 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var5 == nil then
		var3.memoizedState = t
		var5 = t
	else
		var5.next = t
		var5 = t
	end
	var5.memoizedState = { p7, p8 }
	
	return p7
end

function updateCallback(p7, p8)
	-- upvalues: updateWorkInProgressHook (ref), areHookInputsEqual (ref)
	local var22 = updateWorkInProgressHook()
	local memoizedState = var22.memoizedState
	
	if memoizedState == nil or p8 == nil or not areHookInputsEqual(p8, memoizedState[2]) then
		var22.memoizedState = { p7, p8 }
		
		return p7
	end
	return memoizedState[1]
end

function mountMemo(p7, p8)
	-- upvalues: var5 (write), var3 (write)
	local t = {
		memoizedState = nil,
		baseState = nil,
		baseQueue = nil,
		queue = nil,
		next = nil
	}
	
	if var5 == nil then
		var3.memoizedState = t
		var5 = t
	else
		var5.next = t
		var5 = t
	end
	local list = { p7() }
	var5.memoizedState = { list, p8 }
	
	return unpack(list)
end

function updateMemo(p7, p8)
	-- upvalues: updateWorkInProgressHook (ref), areHookInputsEqual (ref)
	local var22 = updateWorkInProgressHook()
	local memoizedState = var22.memoizedState
	
	if memoizedState == nil or p8 == nil or not areHookInputsEqual(p8, memoizedState[2]) then
		local list = { p7() }
		var22.memoizedState = { list, p8 }
		
		return unpack(list)
	end
	return unpack(memoizedState[1])
end

function t_2.getIsUpdatingOpaqueValueInRenderPhaseInDEV()
	-- upvalues: dEV (ref)
	return if dEV then false else nil
end

function mountOpaqueIdentifier()
	-- upvalues: dEV (ref), console (ref), makeClientId (ref), getIsHydrating (ref)
	local var22 = nil
	
	if dEV then
		console.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV")
	else
		var22 = makeClientId
	end
	if getIsHydrating() then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: ReactFiberHooks: getIsHydrating() true")
		error("FIXME (roblox): ReactFiberHooks: getIsHydrating() true is unimplemented")
		
		return nil
	end
	local var23 = var22()
	mountState(var23)
	
	return var23
end

function updateOpaqueIdentifier()
	local var22, _ = updateState(nil)
	
	return var22
end

function rerenderOpaqueIdentifier()
	local var22, _ = rerenderState(nil)
	
	return var22
end

function dispatchAction(p7, p8, p9, ...)
	-- upvalues: dEV (ref), console (ref), requestEventTime (ref), requestUpdateLane (ref), var3 (write), var6 (write), var7 (write), noLanes (ref), reactCurrentDispatcher (ref), t_8 (write), var1 (ref), reactGlobalsModule (ref), warnIfNotScopedWithMatchingAct (ref), warnIfNotCurrentlyActingUpdatesInDEV (ref), scheduleUpdateOnFiber (ref), enableDebugTracing (ref), debugTracingMode (ref), getComponentName (ref), logStateUpdateScheduled (ref), enableSchedulingProfiler (ref), markStateUpdateScheduled (ref)
	if dEV and type(if select("#", ...) == 1 then select(1, ...) else nil) == "function" then
		console.error("State updates from the useState() and useReducer() Hooks don't support the second callback argument. To execute a side effect after rendering, declare it in the component body with useEffect().")
	end
	local var22 = requestEventTime()
	local var23 = requestUpdateLane(p7)
	local t = {
		eagerReducer = nil,
		eagerState = nil,
		next = nil,
		lane = var23,
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
		var6 = true
		var7 = true
	elseif p7.lanes == noLanes and (alternate == nil or alternate.lanes == noLanes) then
		local lastRenderedReducer = p8.lastRenderedReducer
		
		if lastRenderedReducer ~= nil then
			local current = nil
			
			if dEV then
				current = reactCurrentDispatcher.current
				reactCurrentDispatcher.current = t_8
			end
			local var24
			local lastRenderedState = p8.lastRenderedState
			local ok, status = pcall(lastRenderedReducer, lastRenderedState, p9)
			
			if ok then
				t.eagerReducer = lastRenderedReducer
				t.eagerState = status
			end
			if dEV then
				reactCurrentDispatcher.current = current
			end
			if status == lastRenderedState then
				var24 = true
				
				if status == 0 then
					var24 = true
					
					if 1 / status ~= 1 / lastRenderedState then
						var24 = status ~= status and lastRenderedState ~= lastRenderedState
					end
				end
				if var24 then
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
	if dEV and (type(_G.jest) ~= "nil" or reactGlobalsModule.__TESTEZ_RUNNING_TEST__) then
		warnIfNotScopedWithMatchingAct(p7)
		warnIfNotCurrentlyActingUpdatesInDEV(p7)
	end
	scheduleUpdateOnFiber(p7, var23, var22)
	if dEV and enableDebugTracing and bit32.band(p7.mode, debugTracingMode) ~= 0 then
		logStateUpdateScheduled(getComponentName(p7.type) or "Unknown", var23, p9)
	end
	if enableSchedulingProfiler then
		markStateUpdateScheduled(p7, var23)
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
	
	local _ = function()
		-- upvalues: console (ref)
		console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
	end
	
	t_3 = {
		readContext = function(p7, p8)
			-- upvalues: readContext (ref)
			return readContext(p7, p8)
		end,
		useCallback = function(p7, p8)
			-- upvalues: var8 (write), dEV (ref), var9 (write), console (ref)
			var8 = "useCallback"
			
			if dEV then
				local var22 = var8
				
				if var9 == nil then
					var9 = { var22 }
				else
					table.insert(var9, var22)
				end
			end
			if dEV and p8 ~= nil then
				local var23
				if type(p8) == "table" then
					for i, v in p8 do
						if type(i) ~= "number" then
							var23 = false
						end
					end
					var23 = true
				else
					var23 = false
				end
				if not var23 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var8, type(p8))
				end
			end
			return mountCallback(p7, p8)
		end,
		useContext = function(p9, p10)
			-- upvalues: var8 (write), dEV (ref), var9 (write), readContext (ref)
			var8 = "useContext"
			
			if dEV then
				local var24 = var8
				
				if var9 == nil then
					var9 = { var24 }
				else
					table.insert(var9, var24)
				end
			end
			return readContext(p9, p10)
		end,
		useEffect = function(p9, p10)
			-- upvalues: var8 (write), dEV (ref), var9 (write), console (ref), mountEffect (ref)
			var8 = "useEffect"
			
			if dEV then
				local var24 = var8
				
				if var9 == nil then
					var9 = { var24 }
				else
					table.insert(var9, var24)
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
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var8, type(p10))
				end
			end
			return mountEffect(p9, p10)
		end,
		useImperativeHandle = function(p11, p12, p13)
			-- upvalues: var8 (write), dEV (ref), var9 (write), console (ref)
			var8 = "useImperativeHandle"
			
			if dEV then
				local var26 = var8
				
				if var9 == nil then
					var9 = { var26 }
				else
					table.insert(var9, var26)
				end
			end
			if dEV and p13 ~= nil then
				local var27
				if type(p13) == "table" then
					for i, v in p13 do
						if type(i) ~= "number" then
							var27 = false
						end
					end
					var27 = true
				else
					var27 = false
				end
				if not var27 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var8, type(p13))
				end
			end
			return mountImperativeHandle(p11, p12, p13)
		end,
		useLayoutEffect = function(p14, p15)
			-- upvalues: var8 (write), dEV (ref), var9 (write), console (ref), mountLayoutEffect (ref)
			var8 = "useLayoutEffect"
			
			if dEV then
				local var28 = var8
				
				if var9 == nil then
					var9 = { var28 }
				else
					table.insert(var9, var28)
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
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var8, type(p15))
				end
			end
			return mountLayoutEffect(p14, p15)
		end,
		useMemo = function(p16, p17)
			-- upvalues: var8 (write), dEV (ref), var9 (write), console (ref), reactCurrentDispatcher (ref), t_7 (write)
			var8 = "useMemo"
			
			if dEV then
				local var30 = var8
				
				if var9 == nil then
					var9 = { var30 }
				else
					table.insert(var9, var30)
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
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var8, type(p17))
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local list = { pcall(mountMemo, p16, p17) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p18, p19, p20)
			-- upvalues: var8 (write), dEV (ref), var9 (write), reactCurrentDispatcher (ref), t_7 (write)
			var8 = "useReducer"
			
			if dEV then
				local var32 = var8
				
				if var9 == nil then
					var9 = { var32 }
				else
					table.insert(var9, var32)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var33 = pcall(mountReducer, p18, p19, p20)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useRef = function(p18)
			-- upvalues: var8 (write), dEV (ref), var9 (write)
			var8 = "useRef"
			
			if dEV then
				local var32 = var8
				
				if var9 == nil then
					var9 = { var32 }
				else
					table.insert(var9, var32)
				end
			end
			return mountRef(p18)
		end,
		useBinding = function(p18)
			-- upvalues: var8 (write), dEV (ref), var9 (write)
			var8 = "useBinding"
			
			if dEV then
				local var32 = var8
				
				if var9 == nil then
					var9 = { var32 }
				else
					table.insert(var9, var32)
				end
			end
			return mountBinding(p18)
		end,
		useState = function(p18)
			-- upvalues: var8 (write), dEV (ref), var9 (write), reactCurrentDispatcher (ref), t_7 (write)
			var8 = "useState"
			
			if dEV then
				local var32 = var8
				
				if var9 == nil then
					var9 = { var32 }
				else
					table.insert(var9, var32)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var33 = pcall(mountState, p18)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useDebugValue = function(p18, p19)
			-- upvalues: var8 (write), dEV (ref), var9 (write)
			var8 = "useDebugValue"
			
			if dEV then
				local var32 = var8
				
				if var9 == nil then
					var9 = { var32 }
				else
					table.insert(var9, var32)
				end
			end
			return mountDebugValue(p18, p19)
		end,
		useMutableSource = function(p18, p19, p20)
			-- upvalues: var8 (write), dEV (ref), var9 (write)
			var8 = "useMutableSource"
			
			if dEV then
				local var32 = var8
				
				if var9 == nil then
					var9 = { var32 }
				else
					table.insert(var9, var32)
				end
			end
			return mountMutableSource(p18, p19, p20)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var8 (write), dEV (ref), var9 (write)
			var8 = "useOpaqueIdentifier"
			
			if dEV then
				local var32 = var8
				
				if var9 == nil then
					var9 = { var32 }
				else
					table.insert(var9, var32)
				end
			end
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_4 = {
		readContext = function(p18, p19)
			-- upvalues: readContext (ref)
			return readContext(p18, p19)
		end,
		useCallback = function(p18, p19)
			-- upvalues: var8 (write), dEV (ref), console (ref)
			var8 = "useCallback"
			updateHookTypesDev()
			
			if dEV and p19 ~= nil then
				local var32
				if type(p19) == "table" then
					for i, v in p19 do
						if type(i) ~= "number" then
							var32 = false
						end
					end
					var32 = true
				else
					var32 = false
				end
				if not var32 then
					console.error("%s received a final argument that is not an array (instead, received `%s`). When specified, the final argument must be an array.", var8, type(p19))
				end
			end
			return mountCallback(p18, p19)
		end,
		useContext = function(p20, p21)
			-- upvalues: var8 (write), readContext (ref)
			var8 = "useContext"
			updateHookTypesDev()
			
			return readContext(p20, p21)
		end,
		useEffect = function(p20, p21)
			-- upvalues: var8 (write), mountEffect (ref)
			var8 = "useEffect"
			updateHookTypesDev()
			
			return mountEffect(p20, p21)
		end,
		useImperativeHandle = function(p20, p21, p22)
			-- upvalues: var8 (write)
			var8 = "useImperativeHandle"
			updateHookTypesDev()
			
			return mountImperativeHandle(p20, p21, p22)
		end,
		useLayoutEffect = function(p20, p21)
			-- upvalues: var8 (write), mountLayoutEffect (ref)
			var8 = "useLayoutEffect"
			updateHookTypesDev()
			
			return mountLayoutEffect(p20, p21)
		end,
		useMemo = function(p20, p21)
			-- upvalues: var8 (write), reactCurrentDispatcher (ref), t_7 (write)
			var8 = "useMemo"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local list = { pcall(mountMemo, p20, p21) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p20, p21, p22)
			-- upvalues: var8 (write), reactCurrentDispatcher (ref), t_7 (write)
			var8 = "useReducer"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var33 = pcall(mountReducer, p20, p21, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useRef = function(p20)
			-- upvalues: var8 (write)
			var8 = "useRef"
			updateHookTypesDev()
			
			return mountRef(p20)
		end,
		useBinding = function(p20)
			-- upvalues: var8 (write)
			var8 = "useBinding"
			updateHookTypesDev()
			
			return mountBinding(p20)
		end,
		useState = function(p20)
			-- upvalues: var8 (write), reactCurrentDispatcher (ref), t_7 (write)
			var8 = "useState"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var33 = pcall(mountState, p20)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useDebugValue = function(p20, p21)
			-- upvalues: var8 (write)
			var8 = "useDebugValue"
			updateHookTypesDev()
			
			return mountDebugValue(p20, p21)
		end,
		useMutableSource = function(p20, p21, p22)
			-- upvalues: var8 (write)
			var8 = "useMutableSource"
			updateHookTypesDev()
			
			return mountMutableSource(p20, p21, p22)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var8 (write)
			var8 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_5 = {
		readContext = function(p20, p21)
			-- upvalues: readContext (ref)
			return readContext(p20, p21)
		end,
		useCallback = function(p20, p21)
			-- upvalues: var8 (write)
			var8 = "useCallback"
			updateHookTypesDev()
			
			return updateCallback(p20, p21)
		end,
		useContext = function(p20, p21)
			-- upvalues: var8 (write), readContext (ref)
			var8 = "useContext"
			updateHookTypesDev()
			
			return readContext(p20, p21)
		end,
		useEffect = function(p20, p21)
			-- upvalues: var8 (write), updateEffect (ref)
			var8 = "useEffect"
			updateHookTypesDev()
			
			return updateEffect(p20, p21)
		end,
		useImperativeHandle = function(p20, p21, p22)
			-- upvalues: var8 (write)
			var8 = "useImperativeHandle"
			updateHookTypesDev()
			
			return updateImperativeHandle(p20, p21, p22)
		end,
		useLayoutEffect = function(p20, p21)
			-- upvalues: var8 (write), updateLayoutEffect (ref)
			var8 = "useLayoutEffect"
			updateHookTypesDev()
			
			return updateLayoutEffect(p20, p21)
		end,
		useMemo = function(p20, p21)
			-- upvalues: var8 (write), reactCurrentDispatcher (ref), t_8 (write)
			var8 = "useMemo"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local list = { pcall(updateMemo, p20, p21) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p20, p21, p22)
			-- upvalues: var8 (write), reactCurrentDispatcher (ref), t_8 (write)
			var8 = "useReducer"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var33 = pcall(updateReducer, p20, p21, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useRef = function(p20)
			-- upvalues: var8 (write)
			var8 = "useRef"
			updateHookTypesDev()
			
			return updateRef(p20)
		end,
		useBinding = function(p20)
			-- upvalues: var8 (write)
			var8 = "useBinding"
			updateHookTypesDev()
			
			return updateBinding(p20)
		end,
		useState = function(p20)
			-- upvalues: var8 (write), reactCurrentDispatcher (ref), t_8 (write)
			var8 = "useState"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var33 = pcall(updateState, p20)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useDebugValue = function(p20, p21)
			-- upvalues: var8 (write), _mountDebugValue (ref)
			var8 = "useDebugValue"
			updateHookTypesDev()
			
			return _mountDebugValue(p20, p21)
		end,
		useMutableSource = function(p20, p21, p22)
			-- upvalues: var8 (write)
			var8 = "useMutableSource"
			updateHookTypesDev()
			
			return updateMutableSource(p20, p21, p22)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var8 (write)
			var8 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return updateOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_6 = {
		readContext = function(p20, p21)
			-- upvalues: readContext (ref)
			return readContext(p20, p21)
		end,
		useCallback = function(p20, p21)
			-- upvalues: var8 (write)
			var8 = "useCallback"
			updateHookTypesDev()
			
			return updateCallback(p20, p21)
		end,
		useContext = function(p20, p21)
			-- upvalues: var8 (write), readContext (ref)
			var8 = "useContext"
			updateHookTypesDev()
			
			return readContext(p20, p21)
		end,
		useEffect = function(p20, p21)
			-- upvalues: var8 (write), updateEffect (ref)
			var8 = "useEffect"
			updateHookTypesDev()
			
			return updateEffect(p20, p21)
		end,
		useImperativeHandle = function(p20, p21, p22)
			-- upvalues: var8 (write)
			var8 = "useImperativeHandle"
			updateHookTypesDev()
			
			return updateImperativeHandle(p20, p21, p22)
		end,
		useLayoutEffect = function(p20, p21)
			-- upvalues: var8 (write), updateLayoutEffect (ref)
			var8 = "useLayoutEffect"
			updateHookTypesDev()
			
			return updateLayoutEffect(p20, p21)
		end,
		useMemo = function(p20, p21)
			-- upvalues: var8 (write), reactCurrentDispatcher (ref), t_9 (write)
			var8 = "useMemo"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_9
			local list = { pcall(updateMemo, p20, p21) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p20, p21, p22)
			-- upvalues: var8 (write), reactCurrentDispatcher (ref), t_9 (write)
			var8 = "useReducer"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_9
			local ok, status, var33 = pcall(rerenderReducer, p20, p21, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useRef = function(p20)
			-- upvalues: var8 (write)
			var8 = "useRef"
			updateHookTypesDev()
			
			return updateRef(p20)
		end,
		useBinding = function(p20)
			-- upvalues: var8 (write)
			var8 = "useBinding"
			updateHookTypesDev()
			
			return updateBinding(p20)
		end,
		useState = function(p20)
			-- upvalues: var8 (write), reactCurrentDispatcher (ref), t_9 (write)
			var8 = "useState"
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_9
			local ok, status, var33 = pcall(rerenderState, p20)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useDebugValue = function(p20, p21)
			-- upvalues: var8 (write), _mountDebugValue (ref)
			var8 = "useDebugValue"
			updateHookTypesDev()
			
			return _mountDebugValue(p20, p21)
		end,
		useMutableSource = function(p20, p21, p22)
			-- upvalues: var8 (write)
			var8 = "useMutableSource"
			updateHookTypesDev()
			
			return updateMutableSource(p20, p21, p22)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var8 (write)
			var8 = "useOpaqueIdentifier"
			updateHookTypesDev()
			
			return rerenderOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_7 = {
		readContext = function(p20, p21)
			-- upvalues: console (ref), readContext (ref)
			console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return readContext(p20, p21)
		end,
		useCallback = function(p20, p21)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write)
			var8 = "useCallback"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			return mountCallback(p20, p21)
		end,
		useContext = function(p20, p21)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write), readContext (ref)
			var8 = "useContext"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			return readContext(p20, p21)
		end,
		useEffect = function(p20, p21)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write), mountEffect (ref)
			var8 = "useEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			return mountEffect(p20, p21)
		end,
		useImperativeHandle = function(p20, p21, p22)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write)
			var8 = "useImperativeHandle"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			return mountImperativeHandle(p20, p21, p22)
		end,
		useLayoutEffect = function(p20, p21)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write), mountLayoutEffect (ref)
			var8 = "useLayoutEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			return mountLayoutEffect(p20, p21)
		end,
		useMemo = function(p20, p21)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write), reactCurrentDispatcher (ref), t_7 (write)
			var8 = "useMemo"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local list = { pcall(mountMemo, p20, p21) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p20, p21, p22)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write), reactCurrentDispatcher (ref), t_7 (write)
			var8 = "useReducer"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var34 = pcall(mountReducer, p20, p21, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var34
		end,
		useRef = function(p20)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write)
			var8 = "useRef"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			return mountRef(p20)
		end,
		useBinding = function(p20)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write)
			var8 = "useBinding"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			return mountBinding(p20)
		end,
		useState = function(p20)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write), reactCurrentDispatcher (ref), t_7 (write)
			var8 = "useState"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_7
			local ok, status, var34 = pcall(mountState, p20)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var34
		end,
		useDebugValue = function(p20, p21)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write)
			var8 = "useDebugValue"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			return mountDebugValue(p20, p21)
		end,
		useMutableSource = function(p20, p21, p22)
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write)
			var8 = "useMutableSource"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			return mountMutableSource(p20, p21, p22)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var8 (write), console (ref), dEV (ref), var9 (write)
			var8 = "useOpaqueIdentifier"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			
			if dEV then
				local var33 = var8
				
				if var9 == nil then
					var9 = { var33 }
				else
					table.insert(var9, var33)
				end
			end
			return mountOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_8 = {
		readContext = function(p20, p21)
			-- upvalues: console (ref), readContext (ref)
			console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return readContext(p20, p21)
		end,
		useCallback = function(p20, p21)
			-- upvalues: var8 (write), console (ref)
			var8 = "useCallback"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return mountCallback(p20, p21)
		end,
		useContext = function(p20, p21)
			-- upvalues: var8 (write), console (ref), readContext (ref)
			var8 = "useContext"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return readContext(p20, p21)
		end,
		useEffect = function(p20, p21)
			-- upvalues: var8 (write), console (ref), updateEffect (ref)
			var8 = "useEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateEffect(p20, p21)
		end,
		useImperativeHandle = function(p20, p21, p22)
			-- upvalues: var8 (write), console (ref)
			var8 = "useImperativeHandle"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateImperativeHandle(p20, p21, p22)
		end,
		useLayoutEffect = function(p20, p21)
			-- upvalues: var8 (write), console (ref), updateLayoutEffect (ref)
			var8 = "useLayoutEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateLayoutEffect(p20, p21)
		end,
		useMemo = function(p20, p21)
			-- upvalues: var8 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var8 = "useMemo"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local list = { pcall(updateMemo, p20, p21) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p20, p21, p22)
			-- upvalues: var8 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var8 = "useReducer"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var33 = pcall(updateReducer, p20, p21, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useRef = function(p20)
			-- upvalues: var8 (write), console (ref)
			var8 = "useRef"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateRef(p20)
		end,
		useBinding = function(p20)
			-- upvalues: var8 (write), console (ref)
			var8 = "useBinding"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateBinding(p20)
		end,
		useState = function(p20)
			-- upvalues: var8 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var8 = "useState"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var33 = pcall(updateState, p20)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useDebugValue = function(p20, p21)
			-- upvalues: var8 (write), console (ref), _mountDebugValue (ref)
			var8 = "useDebugValue"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return _mountDebugValue(p20, p21)
		end,
		useMutableSource = function(p20, p21, p22)
			-- upvalues: var8 (write), console (ref)
			var8 = "useMutableSource"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateMutableSource(p20, p21, p22)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var8 (write), console (ref)
			var8 = "useOpaqueIdentifier"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
	t_9 = {
		readContext = function(p20, p21)
			-- upvalues: console (ref), readContext (ref)
			console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
			
			return readContext(p20, p21)
		end,
		useCallback = function(p20, p21)
			-- upvalues: var8 (write), console (ref)
			var8 = "useCallback"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateCallback(p20, p21)
		end,
		useContext = function(p20, p21)
			-- upvalues: var8 (write), console (ref), readContext (ref)
			var8 = "useContext"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return readContext(p20, p21)
		end,
		useEffect = function(p20, p21)
			-- upvalues: var8 (write), console (ref), updateEffect (ref)
			var8 = "useEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateEffect(p20, p21)
		end,
		useImperativeHandle = function(p20, p21, p22)
			-- upvalues: var8 (write), console (ref)
			var8 = "useImperativeHandle"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateImperativeHandle(p20, p21, p22)
		end,
		useLayoutEffect = function(p20, p21)
			-- upvalues: var8 (write), console (ref), updateLayoutEffect (ref)
			var8 = "useLayoutEffect"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateLayoutEffect(p20, p21)
		end,
		useMemo = function(p20, p21)
			-- upvalues: var8 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var8 = "useMemo"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local list = { pcall(updateMemo, p20, p21) }
			reactCurrentDispatcher.current = current
			
			if not list[1] then
				error(list[2])
			end
			return unpack(list, 2)
		end,
		useReducer = function(p20, p21, p22)
			-- upvalues: var8 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var8 = "useReducer"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var33 = pcall(rerenderReducer, p20, p21, p22)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useRef = function(p20)
			-- upvalues: var8 (write), console (ref)
			var8 = "useRef"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateRef(p20)
		end,
		useBinding = function(p20)
			-- upvalues: var8 (write), console (ref)
			var8 = "useBinding"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateBinding(p20)
		end,
		useState = function(p20)
			-- upvalues: var8 (write), console (ref), reactCurrentDispatcher (ref), t_8 (write)
			var8 = "useState"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			local current = reactCurrentDispatcher.current
			reactCurrentDispatcher.current = t_8
			local ok, status, var33 = pcall(rerenderState, p20)
			reactCurrentDispatcher.current = current
			
			if not ok then
				error(status)
			end
			return status, var33
		end,
		useDebugValue = function(p20, p21)
			-- upvalues: var8 (write), console (ref), _mountDebugValue (ref)
			var8 = "useDebugValue"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return _mountDebugValue(p20, p21)
		end,
		useMutableSource = function(p20, p21, p22)
			-- upvalues: var8 (write), console (ref)
			var8 = "useMutableSource"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return updateMutableSource(p20, p21, p22)
		end,
		useOpaqueIdentifier = function()
			-- upvalues: var8 (write), console (ref)
			var8 = "useOpaqueIdentifier"
			console.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. You can only call Hooks at the top level of your React function. For more information, see https://reactjs.org/link/rules-of-hooks")
			updateHookTypesDev()
			
			return rerenderOpaqueIdentifier()
		end,
		unstable_isNewReconciler = enableNewReconciler
	}
end
function t_2.renderWithHooks(p18, p19, p20, p21, p22, p23)
	-- upvalues: var2 (write), var3 (write), dEV (ref), var9 (write), var10 (write), noLanes (ref), reactCurrentDispatcher (ref), t_5 (write), t_4 (write), t_3 (write), t_11 (ref), t_12 (ref), var7 (write), error (ref), var4 (write), var5 (write), t_6 (write), t_13 (ref), t_10 (ref), var8 (write), var6 (write), getComponentName (ref)
	var2 = p23
	var3 = p19
	
	if dEV then
		var9 = if p18 ~= nil then nil else p18._debugHookTypes
		var10 = 0
	end
	p19.memoizedState = nil
	p19.updateQueue = nil
	p19.lanes = noLanes
	
	if not dEV then
		local t_11_1
		local var32 = reactCurrentDispatcher
		
		if p18 ~= nil then
			t_11_1 = p18.memoizedState == nil and (t_11 or t_12)
		end
		var32.current = t_11_1
	elseif p18 ~= nil and p18.memoizedState ~= nil then
		reactCurrentDispatcher.current = t_5
	elseif var9 == nil then
		reactCurrentDispatcher.current = t_3
	else
		reactCurrentDispatcher.current = t_4
	end
	local var33 = p20(p21, p22)
	
	if var7 then
		local var34 = 0
		var7 = false
		
		if var34 >= 25 then
			error(error.new("Too many re-renders. React limits the number of renders to prevent an infinite loop."))
		end
		var34 += 1
		var4 = nil
		var5 = nil
		p19.updateQueue = nil
		
		if dEV then
			var10 = 0
		end
		reactCurrentDispatcher.current = if dEV then t_6 else t_13
		var33 = p20(p21, p22)
	end
	reactCurrentDispatcher.current = t_10
	
	if dEV then
		p19._debugHookTypes = var9
	end
	local var35 = var4 ~= nil and var4.next ~= nil
	var2 = noLanes
	var3 = nil
	var4 = nil
	var5 = nil
	
	if dEV then
		var8 = nil
		var9 = nil
		var10 = 0
	end
	var6 = false
	
	if var35 then
		local var36 = "unknown"
		
		if var33 and var33.type then
			var36 = getComponentName(var33.type) or var36
		end
		error(error.new("Rendered fewer hooks than expected. This may be caused by an accidental " .. "early return statement. Inside '" .. var197 .. "'"))
	end
	return var33
end

return t_2