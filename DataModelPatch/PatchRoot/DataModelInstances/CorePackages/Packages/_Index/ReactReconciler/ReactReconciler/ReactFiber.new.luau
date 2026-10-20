local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Object = LuauPolyfillModule.Object
local Array = LuauPolyfillModule.Array
local InspectFunction = LuauPolyfillModule.util.inspect
local DEV = require(Parent.ReactGlobals).__DEV__
local Console = require(Parent.Shared).console
local _ = require(Parent.Shared)
local _ = require(script.Parent.ReactInternalTypes)
local ReactRootTagsModule = require(script.Parent.ReactRootTags)
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local ReactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local _ = require(script.Parent.ReactFiberHostConfig)
local _ = require(script.Parent.ReactFiberOffscreenComponent)
local InvariantFunction = require(Parent.Shared).invariant
local EnableProfilerTimer = require(Parent.Shared).ReactFeatureFlags.enableProfilerTimer
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local NoFlags = ReactFiberFlagsModule.NoFlags
local Placement = ReactFiberFlagsModule.Placement
local StaticMask = ReactFiberFlagsModule.StaticMask
local ConcurrentRoot = ReactRootTagsModule.ConcurrentRoot
local BlockingRoot = ReactRootTagsModule.BlockingRoot
local IndeterminateComponent = ReactWorkTagsModule.IndeterminateComponent
local ClassComponent = ReactWorkTagsModule.ClassComponent
local HostRoot = ReactWorkTagsModule.HostRoot
local HostComponent = ReactWorkTagsModule.HostComponent
local HostText = ReactWorkTagsModule.HostText
local HostPortal = ReactWorkTagsModule.HostPortal
local ForwardRef = ReactWorkTagsModule.ForwardRef
local Fragment = ReactWorkTagsModule.Fragment
local Mode = ReactWorkTagsModule.Mode
local ContextProvider = ReactWorkTagsModule.ContextProvider
local ContextConsumer = ReactWorkTagsModule.ContextConsumer
local Profiler = ReactWorkTagsModule.Profiler
local SuspenseComponent = ReactWorkTagsModule.SuspenseComponent
local SuspenseListComponent = ReactWorkTagsModule.SuspenseListComponent
local DehydratedFragment = ReactWorkTagsModule.DehydratedFragment
local FunctionComponent = ReactWorkTagsModule.FunctionComponent
local MemoComponent = ReactWorkTagsModule.MemoComponent
local SimpleMemoComponent = ReactWorkTagsModule.SimpleMemoComponent
local LazyComponent = ReactWorkTagsModule.LazyComponent
local FundamentalComponent = ReactWorkTagsModule.FundamentalComponent
local ScopeComponent = ReactWorkTagsModule.ScopeComponent
local OffscreenComponent = ReactWorkTagsModule.OffscreenComponent
local LegacyHiddenComponent = ReactWorkTagsModule.LegacyHiddenComponent
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local IsDevToolsPresentFunction = require(script.Parent["ReactFiberDevToolsHook.new"]).isDevToolsPresent
local ReactFiberHotReloadingNewModule = require(script.Parent["ReactFiberHotReloading.new"])
local ResolveClassForHotReloadingFunction = ReactFiberHotReloadingNewModule.resolveClassForHotReloading
local ResolveFunctionForHotReloadingFunction = ReactFiberHotReloadingNewModule.resolveFunctionForHotReloading
local ResolveForwardRefForHotReloadingFunction = ReactFiberHotReloadingNewModule.resolveForwardRefForHotReloading
local NoLanes = require(script.Parent.ReactFiberLane).NoLanes
local NoMode = ReactTypeOfModeModule.NoMode
local ConcurrentMode = ReactTypeOfModeModule.ConcurrentMode
local DebugTracingMode = ReactTypeOfModeModule.DebugTracingMode
local ProfileMode = ReactTypeOfModeModule.ProfileMode
local StrictMode = ReactTypeOfModeModule.StrictMode
local BlockingMode = ReactTypeOfModeModule.BlockingMode
local ReactSymbols = require(Parent.Shared).ReactSymbols
local REACTFORWARDREFTYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACTFRAGMENTTYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACTELEMENTTYPE = ReactSymbols.REACT_ELEMENT_TYPE
local REACTDEBUGTRACINGMODETYPE = ReactSymbols.REACT_DEBUG_TRACING_MODE_TYPE
local REACTSTRICTMODETYPE = ReactSymbols.REACT_STRICT_MODE_TYPE
local REACTPROFILERTYPE = ReactSymbols.REACT_PROFILER_TYPE
local REACTPROVIDERTYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACTCONTEXTTYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACTSUSPENSETYPE = ReactSymbols.REACT_SUSPENSE_TYPE
local REACTSUSPENSELISTTYPE = ReactSymbols.REACT_SUSPENSE_LIST_TYPE
local REACTMEMOTYPE = ReactSymbols.REACT_MEMO_TYPE
local REACTLAZYTYPE = ReactSymbols.REACT_LAZY_TYPE
local REACTOFFSCREENTYPE = ReactSymbols.REACT_OFFSCREEN_TYPE
local REACTLEGACYHIDDENTYPE = ReactSymbols.REACT_LEGACY_HIDDEN_TYPE
local Callback = nil
local Callback2 = nil
local Callback1 = nil
local Callback3 = nil
local Callback4 = nil
local _debugID = 1

local function createFiber(Tag, PendingProps, Key, Mode, ElementType, ElementType1, StateNode, p1)
	-- upvalues: NoFlags (copy), NoLanes (copy), EnableProfilerTimer (copy), DEV (copy), _debugID (ref)
	local config = {
		index = 1,
		tag = Tag,
		key = Key,
		elementType = ElementType,
		type = ElementType1,
		stateNode = StateNode,
		pendingProps = PendingProps,
		mode = Mode,
		flags = NoFlags,
		subtreeFlags = NoFlags,
		lanes = if p1 then p1 else NoLanes,
		childLanes = NoLanes
	}
	
	if EnableProfilerTimer then
		config.actualDuration = 0
		config.actualStartTime = -1
		config.selfBaseDuration = 0
		config.treeBaseDuration = 0
	end
	if DEV then
		config._debugID = _debugID
		_debugID += 1
		config._debugSource = nil
		config._debugOwner = nil
		config._debugNeedsRemount = false
		config._debugHookTypes = nil
	end
	return config
end

function _shouldConstruct(Callback): boolean
	return type(Callback) ~= "function" and not not Callback.isReactComponent
end

local function createFiberFromTypeAndProps(ElementType, Key, PendingProps, _debugOwner, Value: number, p1)
	-- upvalues: IndeterminateComponent (copy), DEV (copy), ResolveFunctionForHotReloadingFunction (copy), ClassComponent (copy), ResolveClassForHotReloadingFunction (copy), HostComponent (copy), REACTFRAGMENTTYPE (copy), Callback2 (ref), REACTDEBUGTRACINGMODETYPE (copy), Mode (copy), DebugTracingMode (copy), REACTSTRICTMODETYPE (copy), StrictMode (copy), REACTPROFILERTYPE (copy), Callback (ref), REACTSUSPENSETYPE (copy), Callback1 (ref), REACTOFFSCREENTYPE (copy), Callback3 (ref), REACTLEGACYHIDDENTYPE (copy), Callback4 (ref), REACTPROVIDERTYPE (copy), ContextProvider (copy), REACTCONTEXTTYPE (copy), ContextConsumer (copy), REACTFORWARDREFTYPE (copy), ForwardRef (copy), ResolveForwardRefForHotReloadingFunction (copy), REACTMEMOTYPE (copy), MemoComponent (copy), REACTLAZYTYPE (copy), LazyComponent (copy), Object (copy), InspectFunction (copy), GetComponentNameFunction (copy), Array (copy), REACTELEMENTTYPE (copy), InvariantFunction (copy), createFiber (copy)
	local Tag = IndeterminateComponent
	local ElementType1 = ElementType
	local ValueType = type(ElementType)
	
	if ValueType == "function" then
		if DEV then
			ElementType1 = ResolveFunctionForHotReloadingFunction(ElementType1)
		end
	elseif ValueType == "table" and ElementType.isReactComponent then
		Tag = ClassComponent
		
		if DEV then
			ElementType1 = ResolveClassForHotReloadingFunction(ElementType1)
		end
	elseif ValueType == "string" then
		Tag = HostComponent
	else
		if ElementType == REACTFRAGMENTTYPE then
			return Callback2(PendingProps.children, Value, p1, Key)
		end
		if ElementType == REACTDEBUGTRACINGMODETYPE then
			Tag = Mode
			Value = bit32.bor(Value, DebugTracingMode)
		elseif ElementType == REACTSTRICTMODETYPE then
			Tag = Mode
			Value = bit32.bor(Value, StrictMode)
		else
			if ElementType == REACTPROFILERTYPE then
				return Callback(PendingProps, Value, p1, Key)
			end
			if ElementType == REACTSUSPENSETYPE then
				return Callback1(PendingProps, Value, p1, Key)
			end
			if ElementType == REACTOFFSCREENTYPE then
				return Callback3(PendingProps, Value, p1, Key)
			end
			if ElementType == REACTLEGACYHIDDENTYPE then
				return Callback4(PendingProps, Value, p1, Key)
			end
			local Flag = false
			local Typeof1 = nil
			
			if ValueType == "table" then
				Typeof1 = ElementType["$$typeof"]
				
				if Typeof1 == REACTPROVIDERTYPE then
					Tag = ContextProvider
					Flag = true
				elseif Typeof1 == REACTCONTEXTTYPE then
					Tag = ContextConsumer
					Flag = true
				elseif Typeof1 == REACTFORWARDREFTYPE then
					Tag = ForwardRef
					
					if DEV then
						ElementType1 = ResolveForwardRefForHotReloadingFunction(ElementType1)
					end
					Flag = true
				elseif Typeof1 == REACTMEMOTYPE then
					Tag = MemoComponent
					Flag = true
				elseif Typeof1 == REACTLAZYTYPE then
					Tag = LazyComponent
					ElementType1 = nil
					Flag = true
				end
			end
			if not Flag then
				local Text = ""
				
				if DEV then
					if ElementType == nil or ValueType == "table" and #Object.keys(ElementType) == 0 then
						Text ..= " You likely forgot to export your component from the file " .. "it's defined in, or you might have mixed up default and " .. "named imports."
					elseif ElementType ~= nil and ValueType == "table" then
						Text ..= "\n" .. InspectFunction(ElementType)
					end
					local ComponentName = if _debugOwner then GetComponentNameFunction(_debugOwner.type) else nil
					
					if ComponentName == nil or ComponentName == "" then
						if _debugOwner then
							Text ..= "\n" .. InspectFunction(_debugOwner)
						end
					else
						Text ..= "\n\nCheck the render method of `" .. ComponentName .. "`."
					end
				end
				local Formatted = nil
				if ElementType == nil then
					Formatted = "nil"
				elseif Array.isArray(ElementType) then
					Formatted = "array"
				elseif ValueType == "table" and Typeof1 == REACTELEMENTTYPE then
					Formatted = string.format("<%s />", GetComponentNameFunction(ElementType.type) or "Unknown")
					Text = " Did you accidentally export a JSX literal or Element instead of a component?"
				else
					Formatted = ValueType
				end
				InvariantFunction(false, "Element type is invalid: expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", Formatted, Text)
			end
		end
	end
	local Fiber = createFiber(Tag, PendingProps, Key, Value, ElementType, ElementType1, nil, p1)
	
	if DEV then
		Fiber._debugOwner = _debugOwner
	end
	return Fiber
end

Callback2 = function(Children, Mode, p1, Key)
	-- upvalues: createFiber (copy), Fragment (copy)
	return (createFiber(Fragment, Children, Key, Mode, nil, nil, nil, p1))
end

local function _(ElementType, PendingProps, Mode, p1, Key)
	-- upvalues: createFiber (copy), ScopeComponent (copy)
	return (createFiber(ScopeComponent, PendingProps, Key, Mode, ElementType, ElementType, nil, p1))
end

Callback = function(PendingProps, Value: number, p1, Key)
	-- upvalues: DEV (copy), Console (copy), createFiber (copy), Profiler (copy), ProfileMode (copy), REACTPROFILERTYPE (copy), EnableProfilerTimer (copy)
	if DEV and typeof(PendingProps.id) ~= "string" then
		Console.error("Profiler must specify an \"id\" as a prop")
	end
	return (createFiber(Profiler, PendingProps, Key, bit32.bor(Value, ProfileMode), REACTPROFILERTYPE, REACTPROFILERTYPE, if EnableProfilerTimer then { effectDuration = 0, passiveEffectDuration = 0 } else nil, p1))
end

Callback1 = function(PendingProps, Mode, p1, Key)
	-- upvalues: createFiber (copy), SuspenseComponent (copy), REACTSUSPENSETYPE (copy)
	return (createFiber(SuspenseComponent, PendingProps, Key, Mode, REACTSUSPENSETYPE, REACTSUSPENSETYPE, nil, p1))
end

Callback3 = function(PendingProps, Mode, p1, Key)
	-- upvalues: createFiber (copy), OffscreenComponent (copy), REACTOFFSCREENTYPE (copy), DEV (copy)
	return (createFiber(OffscreenComponent, PendingProps, Key, Mode, REACTOFFSCREENTYPE, if DEV then REACTOFFSCREENTYPE else nil, nil, p1))
end

Callback4 = function(PendingProps, Mode, p1, Key)
	-- upvalues: createFiber (copy), LegacyHiddenComponent (copy), REACTLEGACYHIDDENTYPE (copy), DEV (copy)
	return (createFiber(LegacyHiddenComponent, PendingProps, Key, Mode, REACTLEGACYHIDDENTYPE, if DEV then REACTLEGACYHIDDENTYPE else nil, nil, p1))
end

return {
	isSimpleFunctionComponent = function(Callback): boolean
		return type(Callback) == "function"
	end,
	resolveLazyComponentTag = function(p1)
		-- upvalues: FunctionComponent (copy), ClassComponent (copy), REACTFORWARDREFTYPE (copy), ForwardRef (copy), REACTMEMOTYPE (copy), MemoComponent (copy), IndeterminateComponent (copy)
		local ValueType = typeof(p1)
		
		if ValueType == "function" then
			return FunctionComponent
		end
		if ValueType == "table" then
			if p1.isReactComponent then
				return ClassComponent
			end
			local Typeof1 = p1["$$typeof"]
			
			if Typeof1 == REACTFORWARDREFTYPE then
				return ForwardRef
			elseif Typeof1 == REACTMEMOTYPE then
				return MemoComponent
			end
		end
		return IndeterminateComponent
	end,
	createWorkInProgress = function(Alternate, PendingProps)
		-- upvalues: createFiber (copy), DEV (copy), NoFlags (copy), EnableProfilerTimer (copy), StaticMask (copy), IndeterminateComponent (copy), FunctionComponent (copy), SimpleMemoComponent (copy), ResolveFunctionForHotReloadingFunction (copy), ClassComponent (copy), ResolveClassForHotReloadingFunction (copy), ForwardRef (copy), ResolveForwardRefForHotReloadingFunction (copy)
		local Alternate1 = Alternate.alternate
		
		if Alternate1 == nil then
			Alternate1 = createFiber(Alternate.tag, PendingProps, Alternate.key, Alternate.mode, Alternate.elementType, Alternate.type, Alternate.stateNode)
			
			if DEV then
				Alternate1._debugID = Alternate._debugID
				Alternate1._debugSource = Alternate._debugSource
				Alternate1._debugOwner = Alternate._debugOwner
				Alternate1._debugHookTypes = Alternate._debugHookTypes
			end
			Alternate1.alternate = Alternate
			Alternate.alternate = Alternate1
		else
			Alternate1.pendingProps = PendingProps
			Alternate1.type = Alternate.type
			Alternate1.flags = NoFlags
			Alternate1.subtreeFlags = NoFlags
			Alternate1.deletions = nil
			
			if EnableProfilerTimer then
				Alternate1.actualDuration = 0
				Alternate1.actualStartTime = -1
			end
		end
		Alternate1.flags = bit32.band(Alternate.flags, StaticMask)
		Alternate1.childLanes = Alternate.childLanes
		Alternate1.lanes = Alternate.lanes
		Alternate1.child = Alternate.child
		Alternate1.memoizedProps = Alternate.memoizedProps
		Alternate1.memoizedState = Alternate.memoizedState
		Alternate1.updateQueue = Alternate.updateQueue
		local Dependencies = Alternate.dependencies
		
		if Dependencies == nil then
			Alternate1.dependencies = nil
		else
			Alternate1.dependencies = {
				lanes = Dependencies.lanes,
				firstContext = Dependencies.firstContext
			}
		end
		Alternate1.sibling = Alternate.sibling
		Alternate1.index = Alternate.index
		Alternate1.ref = Alternate.ref
		
		if EnableProfilerTimer then
			Alternate1.selfBaseDuration = Alternate.selfBaseDuration
			Alternate1.treeBaseDuration = Alternate.treeBaseDuration
		end
		if DEV then
			Alternate1._debugNeedsRemount = Alternate._debugNeedsRemount
			
			if Alternate1.tag == IndeterminateComponent or Alternate1.tag == FunctionComponent or Alternate1.tag == SimpleMemoComponent then
				Alternate1.type = ResolveFunctionForHotReloadingFunction(Alternate.type)
				
				return Alternate1
			end
			if Alternate1.tag == ClassComponent then
				Alternate1.type = ResolveClassForHotReloadingFunction(Alternate.type)
				
				return Alternate1
			end
			if Alternate1.tag == ForwardRef then
				Alternate1.type = ResolveForwardRefForHotReloadingFunction(Alternate.type)
			end
		end
		return Alternate1
	end,
	resetWorkInProgress = function(p1, Lanes)
		-- upvalues: StaticMask (copy), Placement (copy), NoLanes (copy), NoFlags (copy), EnableProfilerTimer (copy)
		p1.flags = bit32.band(p1.flags, (bit32.bor(StaticMask, Placement)))
		local Alternate = p1.alternate
		
		if Alternate == nil then
			p1.childLanes = NoLanes
			p1.lanes = Lanes
			p1.child = nil
			p1.subtreeFlags = NoFlags
			p1.memoizedProps = nil
			p1.memoizedState = nil
			p1.updateQueue = nil
			p1.dependencies = nil
			p1.stateNode = nil
			
			if EnableProfilerTimer then
				p1.selfBaseDuration = 0
				p1.treeBaseDuration = 0
				
				return p1
			end
		else
			p1.childLanes = Alternate.childLanes
			p1.lanes = Alternate.lanes
			p1.child = Alternate.child
			p1.subtreeFlags = Alternate.subtreeFlags
			p1.deletions = nil
			p1.memoizedProps = Alternate.memoizedProps
			p1.memoizedState = Alternate.memoizedState
			p1.updateQueue = Alternate.updateQueue
			p1.type = Alternate.type
			local Dependencies = Alternate.dependencies
			
			if Dependencies == nil then
				p1.dependencies = nil
			else
				p1.dependencies = {
					lanes = Dependencies.lanes,
					firstContext = Dependencies.firstContext
				}
			end
			if EnableProfilerTimer then
				p1.selfBaseDuration = Alternate.selfBaseDuration
				p1.treeBaseDuration = Alternate.treeBaseDuration
			end
		end
		return p1
	end,
	createHostRootFiber = function(BlockingRoot1)
		-- upvalues: ConcurrentRoot (copy), ConcurrentMode (copy), BlockingMode (copy), StrictMode (copy), BlockingRoot (copy), NoMode (copy), EnableProfilerTimer (copy), IsDevToolsPresentFunction (copy), ProfileMode (copy), createFiber (copy), HostRoot (copy)
		local Bits = if BlockingRoot1 == ConcurrentRoot then bit32.bor(ConcurrentMode, BlockingMode, StrictMode) elseif BlockingRoot1 == BlockingRoot then bit32.bor(BlockingMode, StrictMode) else NoMode
		
		if EnableProfilerTimer and IsDevToolsPresentFunction() then
			Bits = bit32.bor(Bits, ProfileMode)
		end
		return (createFiber(HostRoot, nil, nil, Bits))
	end,
	createFiberFromTypeAndProps = createFiberFromTypeAndProps,
	createFiberFromElement = function(p1, p2, p3)
		-- upvalues: DEV (copy), createFiberFromTypeAndProps (copy)
		local FiberFromTypeAndProps = createFiberFromTypeAndProps(p1.type, p1.key, p1.props, if DEV then p1._owner else nil, p2, p3)
		
		if DEV then
			FiberFromTypeAndProps._debugSource = p1._source
			FiberFromTypeAndProps._debugOwner = p1._owner
		end
		return FiberFromTypeAndProps
	end,
	createFiberFromFragment = Callback2,
	createFiberFromFundamental = function(ElementType, PendingProps, Mode, p1, Key)
		-- upvalues: createFiber (copy), FundamentalComponent (copy)
		return (createFiber(FundamentalComponent, PendingProps, Key, Mode, ElementType, ElementType, nil, p1))
	end,
	createFiberFromSuspense = Callback1,
	createFiberFromSuspenseList = function(PendingProps, Mode, p1, Key)
		-- upvalues: createFiber (copy), SuspenseListComponent (copy), REACTSUSPENSELISTTYPE (copy), DEV (copy)
		return (createFiber(SuspenseListComponent, PendingProps, Key, Mode, REACTSUSPENSELISTTYPE, if DEV then REACTSUSPENSELISTTYPE else nil, nil, p1))
	end,
	createFiberFromOffscreen = Callback3,
	createFiberFromLegacyHidden = Callback4,
	createFiberFromText = function(PendingProps, Mode, p1)
		-- upvalues: createFiber (copy), HostText (copy)
		return (createFiber(HostText, PendingProps, nil, Mode, nil, nil, nil, p1))
	end,
	createFiberFromHostInstanceForDeletion = function()
		-- upvalues: createFiber (copy), HostComponent (copy), NoMode (copy)
		return (createFiber(HostComponent, nil, nil, NoMode, "DELETED", "DELETED"))
	end,
	createFiberFromDehydratedFragment = function(StateNode)
		-- upvalues: createFiber (copy), DehydratedFragment (copy), NoMode (copy)
		return (createFiber(DehydratedFragment, nil, nil, NoMode, nil, nil, StateNode))
	end,
	createFiberFromPortal = function(p1, Mode, p2)
		-- upvalues: createFiber (copy), HostPortal (copy)
		return (createFiber(HostPortal, if p1.children == nil then {} else p1.children, p1.key, Mode, nil, nil, {
			pendingChildren = nil,
			containerInfo = p1.containerInfo,
			implementation = p1.implementation
		}, p2))
	end,
	assignFiberPropertiesInDEV = function(p1, p2)
		-- upvalues: createFiber (copy), IndeterminateComponent (copy), NoMode (copy), EnableProfilerTimer (copy)
		if p1 == nil then
			p1 = createFiber(IndeterminateComponent, nil, nil, NoMode)
		end
		p1.tag = p2.tag
		p1.key = p2.key
		p1.elementType = p2.elementType
		p1.type = p2.type
		p1.stateNode = p2.stateNode
		p1.return_ = p2.return_
		p1.child = p2.child
		p1.sibling = p2.sibling
		p1.index = p2.index
		p1.ref = p2.ref
		p1.pendingProps = p2.pendingProps
		p1.memoizedProps = p2.memoizedProps
		p1.updateQueue = p2.updateQueue
		p1.memoizedState = p2.memoizedState
		p1.dependencies = p2.dependencies
		p1.mode = p2.mode
		p1.flags = p2.flags
		p1.subtreeFlags = p2.subtreeFlags
		p1.deletions = p2.deletions
		p1.lanes = p2.lanes
		p1.childLanes = p2.childLanes
		p1.alternate = p2.alternate
		
		if EnableProfilerTimer then
			p1.actualDuration = p2.actualDuration
			p1.actualStartTime = p2.actualStartTime
			p1.selfBaseDuration = p2.selfBaseDuration
			p1.treeBaseDuration = p2.treeBaseDuration
		end
		p1._debugID = p2._debugID
		p1._debugSource = p2._debugSource
		p1._debugOwner = p2._debugOwner
		p1._debugNeedsRemount = p2._debugNeedsRemount
		p1._debugHookTypes = p2._debugHookTypes
		
		return p1
	end
}