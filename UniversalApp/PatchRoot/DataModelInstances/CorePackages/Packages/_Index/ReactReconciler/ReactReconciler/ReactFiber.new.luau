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
local var11 = nil
local var12 = nil
local var13 = nil
local _ = nil
local var14 = 1

local function createFiber(p0, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: noFlags (ref), noLanes (ref), enableProfilerTimer (ref), dEV (ref), var14 (write)
	local t = {
		index = 1,
		tag = p0,
		key = p2,
		elementType = p4,
		type = p5,
		stateNode = p6,
		pendingProps = p1,
		mode = p3,
		flags = noFlags,
		subtreeFlags = noFlags,
		lanes = p7 or noLanes,
		childLanes = noLanes
	}
	
	if enableProfilerTimer then
		t.actualDuration = 0
		t.actualStartTime = -1
		t.selfBaseDuration = 0
		t.treeBaseDuration = 0
	end
	if dEV then
		t._debugID = var14
		var14 += 1
		t._debugSource = nil
		t._debugOwner = nil
		t._debugNeedsRemount = false
		t._debugHookTypes = nil
	end
	return t
end

function _shouldConstruct(p8)
	return type(p8) ~= "function" and not not p8.isReactComponent
end

local function isSimpleFunctionComponent(p9)
	return type(p9) == "function"
end

local function resolveLazyComponentTag(p10)
	-- upvalues: functionComponent (ref), classComponent (ref), REACT_FORWARD_REF_TYPE (ref), forwardRef (ref), REACT_MEMO_TYPE (ref), memoComponent (ref), indeterminateComponent (ref)
	local var25 = typeof(p10)
	
	if var25 == "function" then
		return functionComponent
	elseif var25 == "table" then
		if p10.isReactComponent then
			return classComponent
		end
		local var26 = p10["$$typeof"]
		
		return if var26 == REACT_FORWARD_REF_TYPE then forwardRef elseif var26 == REACT_MEMO_TYPE then memoComponent else indeterminateComponent
	end
end

local function createWorkInProgress(p11, p12)
	-- upvalues: createFiber (ref), dEV (ref), noFlags (ref), enableProfilerTimer (ref), staticMask (ref), indeterminateComponent (ref), functionComponent (ref), simpleMemoComponent (ref), resolveFunctionForHotReloading (ref), classComponent (ref), resolveClassForHotReloading (ref), forwardRef (ref), resolveForwardRefForHotReloading (ref)
	local alternate = p11.alternate
	
	if alternate == nil then
		alternate = createFiber(p11.tag, p12, p11.key, p11.mode, p11.elementType, p11.type, p11.stateNode)
		
		if dEV then
			alternate._debugID = p11._debugID
			alternate._debugSource = p11._debugSource
			alternate._debugOwner = p11._debugOwner
			alternate._debugHookTypes = p11._debugHookTypes
		end
		alternate.alternate = p11
		p11.alternate = alternate
	else
		alternate.pendingProps = p12
		alternate.type = p11.type
		alternate.flags = noFlags
		alternate.subtreeFlags = noFlags
		alternate.deletions = nil
		
		if enableProfilerTimer then
			alternate.actualDuration = 0
			alternate.actualStartTime = -1
		end
	end
	alternate.flags = bit32.band(p11.flags, staticMask)
	alternate.childLanes = p11.childLanes
	alternate.lanes = p11.lanes
	alternate.child = p11.child
	alternate.memoizedProps = p11.memoizedProps
	alternate.memoizedState = p11.memoizedState
	alternate.updateQueue = p11.updateQueue
	local dependencies = p11.dependencies
	
	if dependencies == nil then
		alternate.dependencies = nil
	else
		alternate.dependencies = {
			lanes = dependencies.lanes,
			firstContext = dependencies.firstContext
		}
	end
	alternate.sibling = p11.sibling
	alternate.index = p11.index
	alternate.ref = p11.ref
	
	if enableProfilerTimer then
		alternate.selfBaseDuration = p11.selfBaseDuration
		alternate.treeBaseDuration = p11.treeBaseDuration
	end
	if dEV then
		alternate._debugNeedsRemount = p11._debugNeedsRemount
		
		if alternate.tag == indeterminateComponent or alternate.tag == functionComponent or alternate.tag == simpleMemoComponent then
			alternate.type = resolveFunctionForHotReloading(p11.type)
			
			return alternate
		elseif alternate.tag == classComponent then
			alternate.type = resolveClassForHotReloading(p11.type)
			
			return alternate
		elseif alternate.tag == forwardRef then
			alternate.type = resolveForwardRefForHotReloading(p11.type)
		end
	end
	return alternate
end

local function resetWorkInProgress(value, p13)
	-- upvalues: staticMask (ref), placement (ref), noLanes (ref), noFlags (ref), enableProfilerTimer (ref)
	value.flags = bit32.band(value.flags, bit32.bor(staticMask, placement))
	local alternate = value.alternate
	
	if alternate == nil then
		value.childLanes = noLanes
		value.lanes = p13
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

local function createHostRootFiber(p14)
	-- upvalues: concurrentRoot (ref), concurrentMode (ref), blockingMode (ref), strictMode (ref), blockingRoot (ref), noMode (ref), enableProfilerTimer (ref), isDevToolsPresent (ref), profileMode (ref), createFiber (ref), hostRoot (ref)
	local var27 = if p14 == concurrentRoot then bit32.bor(concurrentMode, blockingMode, strictMode) elseif p14 == blockingRoot then bit32.bor(blockingMode, strictMode) else noMode
	
	if enableProfilerTimer and isDevToolsPresent() then
		var27 = bit32.bor(var27, profileMode)
	end
	return createFiber(hostRoot, nil, nil, var27)
end

local function createFiberFromTypeAndProps(p15, p16, p17, p18, p19, p20)
	-- upvalues: indeterminateComponent (ref), dEV (ref), resolveFunctionForHotReloading (ref), classComponent (ref), resolveClassForHotReloading (ref), hostComponent (ref), REACT_FRAGMENT_TYPE (ref), createFiberFromFragment (write), REACT_DEBUG_TRACING_MODE_TYPE (ref), mode (ref), debugTracingMode (ref), REACT_STRICT_MODE_TYPE (ref), strictMode (ref), REACT_PROFILER_TYPE (ref), createFiberFromProfiler (write), REACT_SUSPENSE_TYPE (ref), var11 (write), REACT_OFFSCREEN_TYPE (ref), var12 (write), REACT_LEGACY_HIDDEN_TYPE (ref), var13 (write), REACT_PROVIDER_TYPE (ref), contextProvider (ref), REACT_CONTEXT_TYPE (ref), contextConsumer (ref), REACT_FORWARD_REF_TYPE (ref), forwardRef (ref), resolveForwardRefForHotReloading (ref), REACT_MEMO_TYPE (ref), memoComponent (ref), REACT_LAZY_TYPE (ref), lazyComponent (ref), object (ref), inspect (ref), getComponentName (ref), array (ref), REACT_ELEMENT_TYPE (ref), invariant (ref), createFiber (ref)
	local var28 = indeterminateComponent
	local var29 = p15
	local var30 = type(p15)
	
	if var30 == "function" then
		if dEV then
			var29 = resolveFunctionForHotReloading(var29)
		end
	elseif var30 == "table" and p15.isReactComponent then
		var28 = classComponent
		
		if dEV then
			var29 = resolveClassForHotReloading(var29)
		end
	elseif var30 == "string" then
		var28 = hostComponent
	elseif p15 == REACT_FRAGMENT_TYPE then
		return createFiberFromFragment(p17.children, p19, p20, p16)
	elseif p15 == REACT_DEBUG_TRACING_MODE_TYPE then
		var28 = mode
		p19 = bit32.bor(p19, debugTracingMode)
	elseif p15 == REACT_STRICT_MODE_TYPE then
		var28 = mode
		p19 = bit32.bor(p19, strictMode)
	elseif p15 == REACT_PROFILER_TYPE then
		return createFiberFromProfiler(p17, p19, p20, p16)
	elseif p15 == REACT_SUSPENSE_TYPE then
		return var11(p17, p19, p20, p16)
	elseif p15 == REACT_OFFSCREEN_TYPE then
		return var12(p17, p19, p20, p16)
	elseif p15 == REACT_LEGACY_HIDDEN_TYPE then
		return var13(p17, p19, p20, p16)
	end
	local var31 = false
	local var32 = nil
	
	if var30 == "table" then
		var32 = p15["$$typeof"]
		
		if var32 == REACT_PROVIDER_TYPE then
			var28 = contextProvider
			var31 = true
		elseif var32 == REACT_CONTEXT_TYPE then
			var28 = contextConsumer
			var31 = true
		elseif var32 == REACT_FORWARD_REF_TYPE then
			var28 = forwardRef
			
			if dEV then
				var29 = resolveForwardRefForHotReloading(var29)
			end
			var31 = true
		elseif var32 == REACT_MEMO_TYPE then
			var28 = memoComponent
			var31 = true
		elseif var32 == REACT_LAZY_TYPE then
			var28 = lazyComponent
			var29 = nil
			var31 = true
		end
	end
	if not var31 then
		local var34
		local var33 = ""
		
		if dEV then
			if p15 == nil or var30 == "table" and #object.keys(p15) == 0 then
				var33 ..= " You likely forgot to export your component from the file " .. "it's defined in, or you might have mixed up default and " .. "named imports."
			elseif p15 ~= nil and var30 == "table" then
				var33 ..= "\n" .. inspect(p15)
			end
			var34 = if p18 then getComponentName(p18.type) else nil
			
			if var34 ~= nil and var34 ~= "" then
				var33 ..= "\n\nCheck the render method of `" .. var34 .. "`."
			elseif p18 then
				var33 ..= "\n" .. inspect(p18)
			end
		end
		var34 = nil
		
		if p15 == nil then
			var34 = "nil"
		elseif array.isArray(p15) then
			var34 = "array"
		elseif var30 == "table" and var32 == REACT_ELEMENT_TYPE then
			var34 = string.format("<%s />", getComponentName(p15.type) or "Unknown")
			var33 = " Did you accidentally export a JSX literal or Element instead of a component?"
		else
			var34 = var30
		end
		invariant(false, "Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", var34, var33)
	end
	local var35 = createFiber(var28, p17, p16, p19, p15, var29, nil, p20)
	
	if dEV then
		var35._debugOwner = p18
	end
	return var35
end

local function createFiberFromElement(p21, p22, p23)
	-- upvalues: dEV (ref), createFiberFromTypeAndProps (ref)
	local var36 = createFiberFromTypeAndProps(p21.type, p21.key, p21.props, if dEV then p21._owner else nil, p22, p23)
	
	if dEV then
		var36._debugSource = p21._source
		var36._debugOwner = p21._owner
	end
	return var36
end

createFiberFromFragment = function(p24, p25, p26, p27)
	-- upvalues: createFiber (ref), fragment (ref)
	return createFiber(fragment, p24, p27, p25, nil, nil, nil, p26)
end

local function createFiberFromFundamental(p28, p29, p30, p31, p32)
	-- upvalues: createFiber (ref), fundamentalComponent (ref)
	return createFiber(fundamentalComponent, p29, p32, p30, p28, p28, nil, p31)
end

createFiberFromScope = function(p33, p34, p35, p36, p37)
	-- upvalues: createFiber (ref), scopeComponent (ref)
	return createFiber(scopeComponent, p34, p37, p35, p33, p33, nil, p36)
end

createFiberFromProfiler = function(p38, p39, p40, p41)
	-- upvalues: dEV (ref), console (ref), createFiber (ref), profiler (ref), profileMode (ref), REACT_PROFILER_TYPE (ref), enableProfilerTimer (ref)
	if dEV and typeof(p38.id) ~= "string" then
		console.error("Profiler must specify an \"id\" as a prop")
	end
	return createFiber(profiler, p38, p41, bit32.bor(p39, profileMode), REACT_PROFILER_TYPE, REACT_PROFILER_TYPE, if enableProfilerTimer then { effectDuration = 0, passiveEffectDuration = 0 } else nil, p40)
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
	createFiberFromSuspense = function(p42, p43, p44, p45)
		-- upvalues: createFiber (ref), suspenseComponent (ref), REACT_SUSPENSE_TYPE (ref)
		return createFiber(suspenseComponent, p42, p45, p43, REACT_SUSPENSE_TYPE, REACT_SUSPENSE_TYPE, nil, p44)
	end,
	createFiberFromSuspenseList = function(p46, p47, p48, p49)
		-- upvalues: createFiber (ref), suspenseListComponent (ref), REACT_SUSPENSE_LIST_TYPE (ref), dEV (ref)
		return createFiber(suspenseListComponent, p46, p49, p47, REACT_SUSPENSE_LIST_TYPE, if dEV then REACT_SUSPENSE_LIST_TYPE else nil, nil, p48)
	end,
	createFiberFromOffscreen = function(p50, p51, p52, p53)
		-- upvalues: createFiber (ref), offscreenComponent (ref), REACT_OFFSCREEN_TYPE (ref), dEV (ref)
		return createFiber(offscreenComponent, p50, p53, p51, REACT_OFFSCREEN_TYPE, if dEV then REACT_OFFSCREEN_TYPE else nil, nil, p52)
	end,
	createFiberFromLegacyHidden = function(p54, p55, p56, p57)
		-- upvalues: createFiber (ref), legacyHiddenComponent (ref), REACT_LEGACY_HIDDEN_TYPE (ref), dEV (ref)
		return createFiber(legacyHiddenComponent, p54, p57, p55, REACT_LEGACY_HIDDEN_TYPE, if dEV then REACT_LEGACY_HIDDEN_TYPE else nil, nil, p56)
	end,
	createFiberFromText = function(p58, p59, p60)
		-- upvalues: createFiber (ref), hostText (ref)
		return createFiber(hostText, p58, nil, p59, nil, nil, nil, p60)
	end,
	createFiberFromHostInstanceForDeletion = function()
		-- upvalues: createFiber (ref), hostComponent (ref), noMode (ref)
		return createFiber(hostComponent, nil, nil, noMode, "DELETED", "DELETED")
	end,
	createFiberFromDehydratedFragment = function(p61)
		-- upvalues: createFiber (ref), dehydratedFragment (ref), noMode (ref)
		return createFiber(dehydratedFragment, nil, nil, noMode, nil, nil, p61)
	end,
	createFiberFromPortal = function(p62, p63, p64)
		-- upvalues: createFiber (ref), hostPortal (ref)
		return createFiber(hostPortal, if p62.children ~= nil then {} else p62.children, p62.key, p63, nil, nil, {
			pendingChildren = nil,
			containerInfo = p62.containerInfo,
			implementation = p62.implementation
		}, p64)
	end,
	assignFiberPropertiesInDEV = function(value, p65)
		-- upvalues: createFiber (ref), indeterminateComponent (ref), noMode (ref), enableProfilerTimer (ref)
		if value == nil then
			value = createFiber(indeterminateComponent, nil, nil, noMode)
		end
		value.tag = p65.tag
		value.key = p65.key
		value.elementType = p65.elementType
		value.type = p65.type
		value.stateNode = p65.stateNode
		value.return_ = p65.return_
		value.child = p65.child
		value.sibling = p65.sibling
		value.index = p65.index
		value.ref = p65.ref
		value.pendingProps = p65.pendingProps
		value.memoizedProps = p65.memoizedProps
		value.updateQueue = p65.updateQueue
		value.memoizedState = p65.memoizedState
		value.dependencies = p65.dependencies
		value.mode = p65.mode
		value.flags = p65.flags
		value.subtreeFlags = p65.subtreeFlags
		value.deletions = p65.deletions
		value.lanes = p65.lanes
		value.childLanes = p65.childLanes
		value.alternate = p65.alternate
		
		if enableProfilerTimer then
			value.actualDuration = p65.actualDuration
			value.actualStartTime = p65.actualStartTime
			value.selfBaseDuration = p65.selfBaseDuration
			value.treeBaseDuration = p65.treeBaseDuration
		end
		value._debugID = p65._debugID
		value._debugSource = p65._debugSource
		value._debugOwner = p65._debugOwner
		value._debugNeedsRemount = p65._debugNeedsRemount
		value._debugHookTypes = p65._debugHookTypes
		
		return value
	end
}