local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local object = luauPolyfillModule.Object
local array = luauPolyfillModule.Array
local inspect = luauPolyfillModule.util.inspect
local dEV = reactGlobalsModule.__DEV__
local console = require(parent.Shared).console
local _ = require(parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local reactRootTagsModule = require(script.Parent.ReactRootTags)
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local reactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local _ = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent.ReactFiberOffscreenComponent)
local invariant = require(parent.Shared).invariant
local enableProfilerTimer = require(parent.Shared).ReactFeatureFlags.enableProfilerTimer
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local noFlags = reactFiberFlagsModule.NoFlags
local placement = reactFiberFlagsModule.Placement
local staticMask = reactFiberFlagsModule.StaticMask
local concurrentRoot = reactRootTagsModule.ConcurrentRoot
local blockingRoot = reactRootTagsModule.BlockingRoot
local indeterminateComponent = reactWorkTagsModule.IndeterminateComponent
local classComponent = reactWorkTagsModule.ClassComponent
local hostRoot = reactWorkTagsModule.HostRoot
local hostComponent = reactWorkTagsModule.HostComponent
local hostText = reactWorkTagsModule.HostText
local hostPortal = reactWorkTagsModule.HostPortal
local forwardRef = reactWorkTagsModule.ForwardRef
local fragment = reactWorkTagsModule.Fragment
local mode = reactWorkTagsModule.Mode
local contextProvider = reactWorkTagsModule.ContextProvider
local contextConsumer = reactWorkTagsModule.ContextConsumer
local profiler = reactWorkTagsModule.Profiler
local suspenseComponent = reactWorkTagsModule.SuspenseComponent
local suspenseListComponent = reactWorkTagsModule.SuspenseListComponent
local dehydratedFragment = reactWorkTagsModule.DehydratedFragment
local functionComponent = reactWorkTagsModule.FunctionComponent
local memoComponent = reactWorkTagsModule.MemoComponent
local simpleMemoComponent = reactWorkTagsModule.SimpleMemoComponent
local lazyComponent = reactWorkTagsModule.LazyComponent
local fundamentalComponent = reactWorkTagsModule.FundamentalComponent
local scopeComponent = reactWorkTagsModule.ScopeComponent
local offscreenComponent = reactWorkTagsModule.OffscreenComponent
local legacyHiddenComponent = reactWorkTagsModule.LegacyHiddenComponent
local getComponentName = require(parent.Shared).getComponentName
local isDevToolsPresent = require(script.Parent["ReactFiberDevToolsHook.new"]).isDevToolsPresent
local unknownModule = require(script.Parent["ReactFiberHotReloading.new"])
local resolveClassForHotReloading = unknownModule.resolveClassForHotReloading
local resolveFunctionForHotReloading = unknownModule.resolveFunctionForHotReloading
local resolveForwardRefForHotReloading = unknownModule.resolveForwardRefForHotReloading
local noLanes = reactFiberLaneModule.NoLanes
local noMode = reactTypeOfModeModule.NoMode
local concurrentMode = reactTypeOfModeModule.ConcurrentMode
local debugTracingMode = reactTypeOfModeModule.DebugTracingMode
local profileMode = reactTypeOfModeModule.ProfileMode
local strictMode = reactTypeOfModeModule.StrictMode
local blockingMode = reactTypeOfModeModule.BlockingMode
local reactSymbols = require(parent.Shared).ReactSymbols
local REACT_FORWARD_REF_TYPE = reactSymbols.REACT_FORWARD_REF_TYPE
local REACT_FRAGMENT_TYPE = reactSymbols.REACT_FRAGMENT_TYPE
local REACT_ELEMENT_TYPE = reactSymbols.REACT_ELEMENT_TYPE
local REACT_DEBUG_TRACING_MODE_TYPE = reactSymbols.REACT_DEBUG_TRACING_MODE_TYPE
local REACT_STRICT_MODE_TYPE = reactSymbols.REACT_STRICT_MODE_TYPE
local REACT_PROFILER_TYPE = reactSymbols.REACT_PROFILER_TYPE
local REACT_PROVIDER_TYPE = reactSymbols.REACT_PROVIDER_TYPE
local REACT_CONTEXT_TYPE = reactSymbols.REACT_CONTEXT_TYPE
local REACT_SUSPENSE_TYPE = reactSymbols.REACT_SUSPENSE_TYPE
local REACT_SUSPENSE_LIST_TYPE = reactSymbols.REACT_SUSPENSE_LIST_TYPE
local REACT_MEMO_TYPE = reactSymbols.REACT_MEMO_TYPE
local REACT_LAZY_TYPE = reactSymbols.REACT_LAZY_TYPE
local REACT_OFFSCREEN_TYPE = reactSymbols.REACT_OFFSCREEN_TYPE
local REACT_LEGACY_HIDDEN_TYPE = reactSymbols.REACT_LEGACY_HIDDEN_TYPE
local createFiberFromScope = nil
local createFiberFromProfiler = nil
local createFiberFromFragment = nil
local _ = nil
local var1 = nil
local var2 = nil
local var3 = nil
local _ = nil
local var4 = 1

local function createFiber(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: noFlags (ref), noLanes (ref), enableProfilerTimer (ref), dEV (ref), var4 (write)
	local t = {
		index = 1,
		tag = p1,
		key = p3,
		elementType = p5,
		type = p6,
		stateNode = p7,
		pendingProps = p2,
		mode = p4,
		flags = noFlags,
		subtreeFlags = noFlags,
		lanes = p8 or noLanes,
		childLanes = noLanes
	}
	
	if enableProfilerTimer then
		t.actualDuration = 0
		t.actualStartTime = -1
		t.selfBaseDuration = 0
		t.treeBaseDuration = 0
	end
	if dEV then
		t._debugID = var4
		var4 += 1
		t._debugSource = nil
		t._debugOwner = nil
		t._debugNeedsRemount = false
		t._debugHookTypes = nil
	end
	return t
end

function _shouldConstruct(p1)
	return type(p1) ~= "function" and not not p1.isReactComponent
end

local function isSimpleFunctionComponent(p1)
	return type(p1) == "function"
end

local function resolveLazyComponentTag(p1)
	-- upvalues: functionComponent (ref), classComponent (ref), REACT_FORWARD_REF_TYPE (ref), forwardRef (ref), REACT_MEMO_TYPE (ref), memoComponent (ref), indeterminateComponent (ref)
	local var5 = typeof(p1)
	
	if var5 == "function" then
		return functionComponent
	elseif var5 == "table" then
		if p1.isReactComponent then
			return classComponent
		end
		local var6 = p1["$$typeof"]
		
		return if var6 == REACT_FORWARD_REF_TYPE then forwardRef elseif var6 == REACT_MEMO_TYPE then memoComponent else indeterminateComponent
	end
end

local function createWorkInProgress(p1, p2)
	-- upvalues: createFiber (ref), dEV (ref), noFlags (ref), enableProfilerTimer (ref), staticMask (ref), indeterminateComponent (ref), functionComponent (ref), simpleMemoComponent (ref), resolveFunctionForHotReloading (ref), classComponent (ref), resolveClassForHotReloading (ref), forwardRef (ref), resolveForwardRefForHotReloading (ref)
	local alternate = p1.alternate
	
	if alternate == nil then
		alternate = createFiber(p1.tag, p2, p1.key, p1.mode, p1.elementType, p1.type, p1.stateNode)
		
		if dEV then
			alternate._debugID = p1._debugID
			alternate._debugSource = p1._debugSource
			alternate._debugOwner = p1._debugOwner
			alternate._debugHookTypes = p1._debugHookTypes
		end
		alternate.alternate = p1
		p1.alternate = alternate
	else
		alternate.pendingProps = p2
		alternate.type = p1.type
		alternate.flags = noFlags
		alternate.subtreeFlags = noFlags
		alternate.deletions = nil
		
		if enableProfilerTimer then
			alternate.actualDuration = 0
			alternate.actualStartTime = -1
		end
	end
	alternate.flags = bit32.band(p1.flags, staticMask)
	alternate.childLanes = p1.childLanes
	alternate.lanes = p1.lanes
	alternate.child = p1.child
	alternate.memoizedProps = p1.memoizedProps
	alternate.memoizedState = p1.memoizedState
	alternate.updateQueue = p1.updateQueue
	local dependencies = p1.dependencies
	
	if dependencies == nil then
		alternate.dependencies = nil
	else
		alternate.dependencies = {
			lanes = dependencies.lanes,
			firstContext = dependencies.firstContext
		}
	end
	alternate.sibling = p1.sibling
	alternate.index = p1.index
	alternate.ref = p1.ref
	
	if enableProfilerTimer then
		alternate.selfBaseDuration = p1.selfBaseDuration
		alternate.treeBaseDuration = p1.treeBaseDuration
	end
	if dEV then
		alternate._debugNeedsRemount = p1._debugNeedsRemount
		
		if alternate.tag == indeterminateComponent or alternate.tag == functionComponent or alternate.tag == simpleMemoComponent then
			alternate.type = resolveFunctionForHotReloading(p1.type)
			
			return alternate
		elseif alternate.tag == classComponent then
			alternate.type = resolveClassForHotReloading(p1.type)
			
			return alternate
		elseif alternate.tag == forwardRef then
			alternate.type = resolveForwardRefForHotReloading(p1.type)
		end
	end
	return alternate
end

local function resetWorkInProgress(value, p1)
	-- upvalues: staticMask (ref), placement (ref), noLanes (ref), noFlags (ref), enableProfilerTimer (ref)
	value.flags = bit32.band(value.flags, bit32.bor(staticMask, placement))
	local alternate = value.alternate
	
	if alternate == nil then
		value.childLanes = noLanes
		value.lanes = p1
		value.child = nil
		value.subtreeFlags = noFlags
		value.memoizedProps = nil
		value.memoizedState = nil
		value.updateQueue = nil
		value.dependencies = nil
		value.stateNode = nil
		
		if enableProfilerTimer then
			value.selfBaseDuration = 0
			value.treeBaseDuration = 0
			
			return value
		end
	else
		value.childLanes = alternate.childLanes
		value.lanes = alternate.lanes
		value.child = alternate.child
		value.subtreeFlags = alternate.subtreeFlags
		value.deletions = nil
		value.memoizedProps = alternate.memoizedProps
		value.memoizedState = alternate.memoizedState
		value.updateQueue = alternate.updateQueue
		value.type = alternate.type
		local dependencies = alternate.dependencies
		
		if dependencies == nil then
			value.dependencies = nil
		else
			value.dependencies = {
				lanes = dependencies.lanes,
				firstContext = dependencies.firstContext
			}
		end
		if enableProfilerTimer then
			value.selfBaseDuration = alternate.selfBaseDuration
			value.treeBaseDuration = alternate.treeBaseDuration
		end
	end
	return value
end

local function createHostRootFiber(p1)
	-- upvalues: concurrentRoot (ref), concurrentMode (ref), blockingMode (ref), strictMode (ref), blockingRoot (ref), noMode (ref), enableProfilerTimer (ref), isDevToolsPresent (ref), profileMode (ref), createFiber (ref), hostRoot (ref)
	local var5 = if p1 == concurrentRoot then bit32.bor(concurrentMode, blockingMode, strictMode) elseif p1 == blockingRoot then bit32.bor(blockingMode, strictMode) else noMode
	
	if enableProfilerTimer and isDevToolsPresent() then
		var5 = bit32.bor(var5, profileMode)
	end
	return createFiber(hostRoot, nil, nil, var5)
end

local function createFiberFromTypeAndProps(p1, p2, p3, p4, p5, p6)
	-- upvalues: indeterminateComponent (ref), dEV (ref), resolveFunctionForHotReloading (ref), classComponent (ref), resolveClassForHotReloading (ref), hostComponent (ref), REACT_FRAGMENT_TYPE (ref), createFiberFromFragment (write), REACT_DEBUG_TRACING_MODE_TYPE (ref), mode (ref), debugTracingMode (ref), REACT_STRICT_MODE_TYPE (ref), strictMode (ref), REACT_PROFILER_TYPE (ref), createFiberFromProfiler (write), REACT_SUSPENSE_TYPE (ref), var1 (write), REACT_OFFSCREEN_TYPE (ref), var2 (write), REACT_LEGACY_HIDDEN_TYPE (ref), var3 (write), REACT_PROVIDER_TYPE (ref), contextProvider (ref), REACT_CONTEXT_TYPE (ref), contextConsumer (ref), REACT_FORWARD_REF_TYPE (ref), forwardRef (ref), resolveForwardRefForHotReloading (ref), REACT_MEMO_TYPE (ref), memoComponent (ref), REACT_LAZY_TYPE (ref), lazyComponent (ref), object (ref), inspect (ref), getComponentName (ref), array (ref), REACT_ELEMENT_TYPE (ref), invariant (ref), createFiber (ref)
	local var5 = indeterminateComponent
	local var6 = p1
	local var7 = type(p1)
	
	if var7 == "function" then
		if dEV then
			var6 = resolveFunctionForHotReloading(var6)
		end
	elseif var7 == "table" and p1.isReactComponent then
		var5 = classComponent
		
		if dEV then
			var6 = resolveClassForHotReloading(var6)
		end
	elseif var7 == "string" then
		var5 = hostComponent
	elseif p1 == REACT_FRAGMENT_TYPE then
		return createFiberFromFragment(p3.children, p5, p6, p2)
	elseif p1 == REACT_DEBUG_TRACING_MODE_TYPE then
		var5 = mode
		p5 = bit32.bor(p5, debugTracingMode)
	elseif p1 == REACT_STRICT_MODE_TYPE then
		var5 = mode
		p5 = bit32.bor(p5, strictMode)
	elseif p1 == REACT_PROFILER_TYPE then
		return createFiberFromProfiler(p3, p5, p6, p2)
	elseif p1 == REACT_SUSPENSE_TYPE then
		return var1(p3, p5, p6, p2)
	elseif p1 == REACT_OFFSCREEN_TYPE then
		return var2(p3, p5, p6, p2)
	elseif p1 == REACT_LEGACY_HIDDEN_TYPE then
		return var3(p3, p5, p6, p2)
	end
	local var8 = false
	local var9 = nil
	
	if var7 == "table" then
		var9 = p1["$$typeof"]
		
		if var9 == REACT_PROVIDER_TYPE then
			var5 = contextProvider
			var8 = true
		elseif var9 == REACT_CONTEXT_TYPE then
			var5 = contextConsumer
			var8 = true
		elseif var9 == REACT_FORWARD_REF_TYPE then
			var5 = forwardRef
			
			if dEV then
				var6 = resolveForwardRefForHotReloading(var6)
			end
			var8 = true
		elseif var9 == REACT_MEMO_TYPE then
			var5 = memoComponent
			var8 = true
		elseif var9 == REACT_LAZY_TYPE then
			var5 = lazyComponent
			var6 = nil
			var8 = true
		end
	end
	if not var8 then
		local var10
		local var11 = ""
		
		if dEV then
			if p1 == nil or var7 == "table" and #object.keys(p1) == 0 then
				var11 ..= " You likely forgot to export your component from the file " .. "it's defined in, or you might have mixed up default and " .. "named imports."
			elseif p1 ~= nil and var7 == "table" then
				var11 ..= "\n" .. inspect(p1)
			end
			var10 = if p4 then getComponentName(p4.type) else nil
			
			if var10 ~= nil and var10 ~= "" then
				var11 ..= "\n\nCheck the render method of `" .. var34 .. "`."
			elseif p4 then
				var11 ..= "\n" .. inspect(p4)
			end
		end
		var10 = nil
		
		if p1 == nil then
			var10 = "nil"
		elseif array.isArray(p1) then
			var10 = "array"
		elseif var7 == "table" and var9 == REACT_ELEMENT_TYPE then
			var10 = string.format("<%s />", getComponentName(p1.type) or "Unknown")
			var11 = " Did you accidentally export a JSX literal or Element instead of a component?"
		else
			var10 = var7
		end
		invariant(false, "Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", var10, var11)
	end
	local var12 = createFiber(var5, p3, p2, p5, p1, var6, nil, p6)
	
	if dEV then
		var12._debugOwner = p4
	end
	return var12
end

local function createFiberFromElement(p1, p2, p3)
	-- upvalues: dEV (ref), createFiberFromTypeAndProps (ref)
	local var5 = createFiberFromTypeAndProps(p1.type, p1.key, p1.props, if dEV then p1._owner else nil, p2, p3)
	
	if dEV then
		var5._debugSource = p1._source
		var5._debugOwner = p1._owner
	end
	return var5
end

createFiberFromFragment = function(p1, p2, p3, p4)
	-- upvalues: createFiber (ref), fragment (ref)
	return createFiber(fragment, p1, p4, p2, nil, nil, nil, p3)
end

local function createFiberFromFundamental(p1, p2, p3, p4, p5)
	-- upvalues: createFiber (ref), fundamentalComponent (ref)
	return createFiber(fundamentalComponent, p2, p5, p3, p1, p1, nil, p4)
end

createFiberFromScope = function(p1, p2, p3, p4, p5)
	-- upvalues: createFiber (ref), scopeComponent (ref)
	return createFiber(scopeComponent, p2, p5, p3, p1, p1, nil, p4)
end

createFiberFromProfiler = function(p1, p2, p3, p4)
	-- upvalues: dEV (ref), console (ref), createFiber (ref), profiler (ref), profileMode (ref), REACT_PROFILER_TYPE (ref), enableProfilerTimer (ref)
	if dEV and typeof(p1.id) ~= "string" then
		console.error("Profiler must specify an \"id\" as a prop")
	end
	return createFiber(profiler, p1, p4, bit32.bor(p2, profileMode), REACT_PROFILER_TYPE, REACT_PROFILER_TYPE, if enableProfilerTimer then { effectDuration = 0, passiveEffectDuration = 0 } else nil, p3)
end

return {
	isSimpleFunctionComponent = isSimpleFunctionComponent,
	resolveLazyComponentTag = resolveLazyComponentTag,
	createWorkInProgress = createWorkInProgress,
	resetWorkInProgress = resetWorkInProgress,
	createHostRootFiber = createHostRootFiber,
	createFiberFromTypeAndProps = createFiberFromTypeAndProps,
	createFiberFromElement = createFiberFromElement,
	createFiberFromFragment = createFiberFromFragment,
	createFiberFromFundamental = createFiberFromFundamental,
	createFiberFromSuspense = function(p1, p2, p3, p4)
		-- upvalues: createFiber (ref), suspenseComponent (ref), REACT_SUSPENSE_TYPE (ref)
		return createFiber(suspenseComponent, p1, p4, p2, REACT_SUSPENSE_TYPE, REACT_SUSPENSE_TYPE, nil, p3)
	end,
	createFiberFromSuspenseList = function(p1, p2, p3, p4)
		-- upvalues: createFiber (ref), suspenseListComponent (ref), REACT_SUSPENSE_LIST_TYPE (ref), dEV (ref)
		return createFiber(suspenseListComponent, p1, p4, p2, REACT_SUSPENSE_LIST_TYPE, if dEV then REACT_SUSPENSE_LIST_TYPE else nil, nil, p3)
	end,
	createFiberFromOffscreen = function(p1, p2, p3, p4)
		-- upvalues: createFiber (ref), offscreenComponent (ref), REACT_OFFSCREEN_TYPE (ref), dEV (ref)
		return createFiber(offscreenComponent, p1, p4, p2, REACT_OFFSCREEN_TYPE, if dEV then REACT_OFFSCREEN_TYPE else nil, nil, p3)
	end,
	createFiberFromLegacyHidden = function(p1, p2, p3, p4)
		-- upvalues: createFiber (ref), legacyHiddenComponent (ref), REACT_LEGACY_HIDDEN_TYPE (ref), dEV (ref)
		return createFiber(legacyHiddenComponent, p1, p4, p2, REACT_LEGACY_HIDDEN_TYPE, if dEV then REACT_LEGACY_HIDDEN_TYPE else nil, nil, p3)
	end,
	createFiberFromText = function(p1, p2, p3)
		-- upvalues: createFiber (ref), hostText (ref)
		return createFiber(hostText, p1, nil, p2, nil, nil, nil, p3)
	end,
	createFiberFromHostInstanceForDeletion = function()
		-- upvalues: createFiber (ref), hostComponent (ref), noMode (ref)
		return createFiber(hostComponent, nil, nil, noMode, "DELETED", "DELETED")
	end,
	createFiberFromDehydratedFragment = function(p1)
		-- upvalues: createFiber (ref), dehydratedFragment (ref), noMode (ref)
		return createFiber(dehydratedFragment, nil, nil, noMode, nil, nil, p1)
	end,
	createFiberFromPortal = function(p1, p2, p3)
		-- upvalues: createFiber (ref), hostPortal (ref)
		return createFiber(hostPortal, if p1.children ~= nil then {} else p1.children, p1.key, p2, nil, nil, {
			pendingChildren = nil,
			containerInfo = p1.containerInfo,
			implementation = p1.implementation
		}, p3)
	end,
	assignFiberPropertiesInDEV = function(value, p1)
		-- upvalues: createFiber (ref), indeterminateComponent (ref), noMode (ref), enableProfilerTimer (ref)
		if value == nil then
			value = createFiber(indeterminateComponent, nil, nil, noMode)
		end
		value.tag = p1.tag
		value.key = p1.key
		value.elementType = p1.elementType
		value.type = p1.type
		value.stateNode = p1.stateNode
		value.return_ = p1.return_
		value.child = p1.child
		value.sibling = p1.sibling
		value.index = p1.index
		value.ref = p1.ref
		value.pendingProps = p1.pendingProps
		value.memoizedProps = p1.memoizedProps
		value.updateQueue = p1.updateQueue
		value.memoizedState = p1.memoizedState
		value.dependencies = p1.dependencies
		value.mode = p1.mode
		value.flags = p1.flags
		value.subtreeFlags = p1.subtreeFlags
		value.deletions = p1.deletions
		value.lanes = p1.lanes
		value.childLanes = p1.childLanes
		value.alternate = p1.alternate
		
		if enableProfilerTimer then
			value.actualDuration = p1.actualDuration
			value.actualStartTime = p1.actualStartTime
			value.selfBaseDuration = p1.selfBaseDuration
			value.treeBaseDuration = p1.treeBaseDuration
		end
		value._debugID = p1._debugID
		value._debugSource = p1._debugSource
		value._debugOwner = p1._debugOwner
		value._debugNeedsRemount = p1._debugNeedsRemount
		value._debugHookTypes = p1._debugHookTypes
		
		return value
	end
}