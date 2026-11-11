local Parent = script.Parent.Parent
local Object = require(Parent.LuauPolyfill).Object
local DEV = require(Parent.ReactGlobals).__DEV__
local Console = require(Parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local ReactUpdateQueueNewModule = require(script.Parent["ReactUpdateQueue.new"])
local _ = require(Parent.Shared)
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local Update = ReactFiberFlagsModule.Update
local Snapshot = ReactFiberFlagsModule.Snapshot
local MountLayoutDev = ReactFiberFlagsModule.MountLayoutDev
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local DebugRenderPhaseSideEffectsForStrictMode = ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode
local DisableLegacyContext = ReactFeatureFlags.disableLegacyContext
local EnableDebugTracing = ReactFeatureFlags.enableDebugTracing
local EnableSchedulingProfiler = ReactFeatureFlags.enableSchedulingProfiler
local WarnAboutDeprecatedLifecycles = ReactFeatureFlags.warnAboutDeprecatedLifecycles
local EnableDoubleInvokingEffects = ReactFeatureFlags.enableDoubleInvokingEffects
local ReactStrictModeWarningsNewModule = require(script.Parent["ReactStrictModeWarnings.new"])
local IsMounted = require(script.Parent.ReactFiberTreeReflection).isMounted
local ReactInstanceMap = require(Parent.Shared).ReactInstanceMap
local GetFunction = ReactInstanceMap.get
local SetFunction = ReactInstanceMap.set
local ShallowEqualFunction = require(Parent.Shared).shallowEqual
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local UninitializedState = require(Parent.Shared).UninitializedState
local DescribeError = require(Parent.Shared).describeError
local ReactSymbols = require(Parent.Shared).ReactSymbols
local REACTCONTEXTTYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACTPROVIDERTYPE = ReactSymbols.REACT_PROVIDER_TYPE
local ResolveDefaultPropsFunction = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps
local ReactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local DebugTracingMode = ReactTypeOfModeModule.DebugTracingMode
local StrictMode = ReactTypeOfModeModule.StrictMode
local EnqueueUpdateFunction = ReactUpdateQueueNewModule.enqueueUpdate
local ProcessUpdateQueueFunction = ReactUpdateQueueNewModule.processUpdateQueue
local CheckHasForceUpdateAfterProcessingFunction = ReactUpdateQueueNewModule.checkHasForceUpdateAfterProcessing
local ResetHasForceUpdateBeforeProcessingFunction = ReactUpdateQueueNewModule.resetHasForceUpdateBeforeProcessing
local CreateUpdateFunction = ReactUpdateQueueNewModule.createUpdate
local ReplaceState = ReactUpdateQueueNewModule.ReplaceState
local ForceUpdate = ReactUpdateQueueNewModule.ForceUpdate
local InitializeUpdateQueueFunction = ReactUpdateQueueNewModule.initializeUpdateQueue
local CloneUpdateQueueFunction = ReactUpdateQueueNewModule.cloneUpdateQueue
local NoLanes = require(script.Parent.ReactFiberLane).NoLanes
local ReactFiberContextNewModule = require(script.Parent["ReactFiberContext.new"])
local CacheContextFunction = ReactFiberContextNewModule.cacheContext
local GetMaskedContextFunction = ReactFiberContextNewModule.getMaskedContext
local GetUnmaskedContextFunction = ReactFiberContextNewModule.getUnmaskedContext
local HasContextChangedFunction = ReactFiberContextNewModule.hasContextChanged
local EmptyContextObject = ReactFiberContextNewModule.emptyContextObject
local ReadContextFunction = require(script.Parent["ReactFiberNewContext.new"]).readContext
local DebugTracingModule = require(script.Parent.DebugTracing)
local LogForceUpdateScheduledFunction = DebugTracingModule.logForceUpdateScheduled
local LogStateUpdateScheduledFunction = DebugTracingModule.logStateUpdateScheduled
local ConsolePatchingDev = require(Parent.Shared).ConsolePatchingDev
local DisableLogsFunction = ConsolePatchingDev.disableLogs
local ReenableLogsFunction = ConsolePatchingDev.reenableLogs
local SchedulingProfilerModule = require(script.Parent.SchedulingProfiler)
local MarkForceUpdateScheduledFunction = SchedulingProfilerModule.markForceUpdateScheduled
local MarkStateUpdateScheduledFunction = SchedulingProfilerModule.markStateUpdateScheduled
local _reactInternalInstance = {}
local Refs = require(Parent.React).Component:extend("").__refs
local v1 = nil
local v2 = nil
local v3 = nil
local v4 = nil
local Callback: ((any, any) -> ())? = nil
local Callback1: ((any, any) -> ())? = nil
local v5 = nil
local v6 = nil
local v7 = nil

if DEV then
	v1 = {}
	v2 = {}
	v3 = {}
	v4 = {}
	v5 = {}
	v6 = {}
	v7 = {}
	local t = {}
	
	Callback1 = function(Callback, Text)
		-- upvalues: t (copy), Console (copy)
		if Callback == nil or type(Callback) == "function" then return end
		local Text1 = Text .. "_" .. tostring(Callback)
		
		if not t[Text1] then
			t[Text1] = true
			Console.error("%s(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", Text, (tostring(Callback)))
		end
	end
	
	Callback = function(_, _) end
end
local function applyDerivedStateFromProps(p1, Key, Callback1, MemoizedProps)
	-- upvalues: DEV (copy), DebugRenderPhaseSideEffectsForStrictMode (copy), StrictMode (copy), DisableLogsFunction (copy), DescribeError (copy), ReenableLogsFunction (copy), Callback (ref), Object (copy), NoLanes (copy)
	local MemoizedState = p1.memoizedState
	
	if DEV and DebugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, StrictMode) ~= 0 then
		DisableLogsFunction()
		local Success, Result = xpcall(Callback1, DescribeError, MemoizedProps, MemoizedState)
		ReenableLogsFunction()
		
		if not Success then
			error(Result)
		end
	end
	local CallbackResult = Callback1(MemoizedProps, MemoizedState)
	
	if DEV then
		Callback(Key, CallbackResult)
	end
	local MemoizedState1 = if CallbackResult == nil then MemoizedState else Object.assign({}, MemoizedState, CallbackResult)
	p1.memoizedState = MemoizedState1
	
	if p1.lanes == NoLanes then
		p1.updateQueue.baseState = MemoizedState1
	end
end

local Config = nil

local function initializeClassComponentUpdater()
	-- upvalues: Config (ref), IsMounted (copy), GetFunction (copy), CreateUpdateFunction (copy), DEV (copy), Callback1 (ref), EnqueueUpdateFunction (copy), EnableDebugTracing (copy), DebugTracingMode (copy), GetComponentNameFunction (copy), LogStateUpdateScheduledFunction (copy), EnableSchedulingProfiler (copy), MarkStateUpdateScheduledFunction (copy), ReplaceState (copy), ForceUpdate (copy), LogForceUpdateScheduledFunction (copy), MarkForceUpdateScheduledFunction (copy)
	local ReactFiberWorkLoopNewModule = require(script.Parent["ReactFiberWorkLoop.new"])
	local RequestEventTimeFunction = ReactFiberWorkLoopNewModule.requestEventTime
	local RequestUpdateLaneFunction = ReactFiberWorkLoopNewModule.requestUpdateLane
	local ScheduleUpdateOnFiberFunction = ReactFiberWorkLoopNewModule.scheduleUpdateOnFiber
	Config = {
		isMounted = IsMounted,
		enqueueSetState = function(p1, p2, p3)
			-- upvalues: GetFunction (upval), RequestEventTimeFunction (copy), RequestUpdateLaneFunction (copy), CreateUpdateFunction (upval), DEV (upval), Callback1 (upval), EnqueueUpdateFunction (upval), ScheduleUpdateOnFiberFunction (copy), EnableDebugTracing (upval), DebugTracingMode (upval), GetComponentNameFunction (upval), LogStateUpdateScheduledFunction (upval), EnableSchedulingProfiler (upval), MarkStateUpdateScheduledFunction (upval)
			local GetResult = GetFunction(p1)
			local RequestEventTimeResult = RequestEventTimeFunction()
			local RequestUpdateLaneResult = RequestUpdateLaneFunction(GetResult)
			local Update = CreateUpdateFunction(RequestEventTimeResult, RequestUpdateLaneResult, p2, p3)
			
			if p3 ~= nil and DEV then
				Callback1(p3, "setState")
			end
			EnqueueUpdateFunction(GetResult, Update)
			ScheduleUpdateOnFiberFunction(GetResult, RequestUpdateLaneResult, RequestEventTimeResult)
			
			if DEV and EnableDebugTracing and bit32.band(GetResult.mode, DebugTracingMode) ~= 0 then
				LogStateUpdateScheduledFunction(GetComponentNameFunction(GetResult.type) or "Unknown", RequestUpdateLaneResult, p2)
			end
			if EnableSchedulingProfiler then
				MarkStateUpdateScheduledFunction(GetResult, RequestUpdateLaneResult)
			end
		end,
		enqueueReplaceState = function(p1, State, p2)
			-- upvalues: GetFunction (upval), RequestEventTimeFunction (copy), RequestUpdateLaneFunction (copy), CreateUpdateFunction (upval), ReplaceState (upval), DEV (upval), Callback1 (upval), EnqueueUpdateFunction (upval), ScheduleUpdateOnFiberFunction (copy), EnableDebugTracing (upval), DebugTracingMode (upval), GetComponentNameFunction (upval), LogStateUpdateScheduledFunction (upval), EnableSchedulingProfiler (upval), MarkStateUpdateScheduledFunction (upval)
			local GetResult = GetFunction(p1)
			local RequestEventTimeResult = RequestEventTimeFunction()
			local RequestUpdateLaneResult = RequestUpdateLaneFunction(GetResult)
			local Update = CreateUpdateFunction(RequestEventTimeResult, RequestUpdateLaneResult, State, p2)
			Update.tag = ReplaceState
			
			if p2 ~= nil and DEV then
				Callback1(p2, "replaceState")
			end
			EnqueueUpdateFunction(GetResult, Update)
			ScheduleUpdateOnFiberFunction(GetResult, RequestUpdateLaneResult, RequestEventTimeResult)
			
			if DEV and EnableDebugTracing and bit32.band(GetResult.mode, DebugTracingMode) ~= 0 then
				LogStateUpdateScheduledFunction(GetComponentNameFunction(GetResult.type) or "Unknown", RequestUpdateLaneResult, State)
			end
			if EnableSchedulingProfiler then
				MarkStateUpdateScheduledFunction(GetResult, RequestUpdateLaneResult)
			end
		end,
		enqueueForceUpdate = function(p1, p2)
			-- upvalues: GetFunction (upval), RequestEventTimeFunction (copy), RequestUpdateLaneFunction (copy), CreateUpdateFunction (upval), ForceUpdate (upval), DEV (upval), Callback1 (upval), EnqueueUpdateFunction (upval), ScheduleUpdateOnFiberFunction (copy), EnableDebugTracing (upval), DebugTracingMode (upval), GetComponentNameFunction (upval), LogForceUpdateScheduledFunction (upval), EnableSchedulingProfiler (upval), MarkForceUpdateScheduledFunction (upval)
			local GetResult = GetFunction(p1)
			local RequestEventTimeResult = RequestEventTimeFunction()
			local RequestUpdateLaneResult = RequestUpdateLaneFunction(GetResult)
			local Update = CreateUpdateFunction(RequestEventTimeResult, RequestUpdateLaneResult, nil, p2)
			Update.tag = ForceUpdate
			
			if p2 ~= nil and DEV then
				Callback1(p2, "forceUpdate")
			end
			EnqueueUpdateFunction(GetResult, Update)
			ScheduleUpdateOnFiberFunction(GetResult, RequestUpdateLaneResult, RequestEventTimeResult)
			
			if DEV and EnableDebugTracing and bit32.band(GetResult.mode, DebugTracingMode) ~= 0 then
				LogForceUpdateScheduledFunction(GetComponentNameFunction(GetResult.type) or "Unknown", RequestUpdateLaneResult)
			end
			if EnableSchedulingProfiler then
				MarkForceUpdateScheduledFunction(GetResult, RequestUpdateLaneResult)
			end
		end
	}
end

local function _()
	-- upvalues: Config (ref), initializeClassComponentUpdater (copy)
	if Config == nil then
		initializeClassComponentUpdater()
	end
	return Config
end

function checkShouldComponentUpdate(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: DEV (copy), DebugRenderPhaseSideEffectsForStrictMode (copy), StrictMode (copy), DisableLogsFunction (copy), DescribeError (copy), ReenableLogsFunction (copy), Console (copy), GetComponentNameFunction (copy), ShallowEqualFunction (copy)
	local StateNode = p1.stateNode
	
	if StateNode.shouldComponentUpdate == nil or type(StateNode.shouldComponentUpdate) ~= "function" then
		return type(p2) ~= "table" or not p2.isPureReactComponent or (not ShallowEqualFunction(p3, p4) or not ShallowEqualFunction(p5, p6))
	end
	if DEV and DebugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, StrictMode) ~= 0 then
		DisableLogsFunction()
		local Success, Result = xpcall(StateNode.shouldComponentUpdate, DescribeError, StateNode, p4, p6, p7)
		ReenableLogsFunction()
		
		if not Success then
			error(Result)
		end
	end
	local ShouldComponentUpdate = StateNode:shouldComponentUpdate(p4, p6, p7)
	
	if DEV and ShouldComponentUpdate == nil then
		Console.error("%s.shouldComponentUpdate(): Returned nil instead of a boolean value. Make sure to return true or false.", GetComponentNameFunction(p2) or "Component")
	end
	return ShouldComponentUpdate
end

local function checkClassInstance(p1, Key, Props)
	-- upvalues: DEV (copy), GetComponentNameFunction (copy), Console (copy), DisableLegacyContext (copy), v6 (ref), v3 (ref)
	local StateNode = p1.stateNode
	
	if DEV then
		local ComponentName = GetComponentNameFunction(Key) or "Component"
		
		if not StateNode.render then
			if type(Key.render) == "function" then
				Console.error("%s(...): No `render` method found on the returned component instance: did you accidentally return an object from the constructor?", ComponentName)
			else
				Console.error("%s(...): No `render` method found on the returned component instance: you may have forgotten to define `render`.", ComponentName)
			end
		end
		if StateNode.getInitialState and not StateNode.getInitialState.isReactClassApproved and not StateNode.state then
			Console.error("getInitialState was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Did you mean to define a state property instead?", ComponentName)
		end
		if StateNode.getDefaultProps and not StateNode.getDefaultProps.isReactClassApproved then
			Console.error("getDefaultProps was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Use a static property to define defaultProps instead.", ComponentName)
		end
		if StateNode.propTypes and not Key.propTypes then
			Console.error("propTypes was defined as an instance property on %s. Use a static property to define propTypes instead.", ComponentName)
		end
		if StateNode.contextType and not Key.contextType then
			Console.error("contextType was defined as an instance property on %s. Use a static property to define contextType instead.", ComponentName)
		end
		if DisableLegacyContext then
			if Key.childContextTypes then
				Console.error("%s uses the legacy childContextTypes API which is no longer supported. Use React.createContext() instead.", ComponentName)
			end
			if Key.contextTypes then
				Console.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with static contextType instead.", ComponentName)
			end
		else
			if StateNode.contextTypes and not Key.contextTypes then
				Console.error("contextTypes was defined as an instance property on %s. Use a static property to define contextTypes instead.", ComponentName)
			end
			if type(Key) == "table" and Key.contextType and Key.contextTypes and not v6[Key] then
				v6[Key] = true
				Console.error("%s declares both contextTypes and contextType static properties. The legacy contextTypes property will be ignored.", ComponentName)
			end
		end
		if type(StateNode.componentShouldUpdate) == "function" then
			Console.error("%s has a method called componentShouldUpdate(). Did you mean shouldComponentUpdate()? The name is phrased as a question because the function is expected to return a value.", ComponentName)
		end
		if type(Key) == "table" and Key.isPureReactComponent and StateNode.shouldComponentUpdate ~= nil then
			Console.error("%s has a method called shouldComponentUpdate(). shouldComponentUpdate should not be used when extending React.PureComponent. Please extend React.Component if shouldComponentUpdate is used.", GetComponentNameFunction(Key) or "A pure component")
		end
		if type(StateNode.componentDidUnmount) == "function" then
			Console.error("%s has a method called componentDidUnmount(). But there is no such lifecycle method. Did you mean componentWillUnmount()?", ComponentName)
		end
		if type(StateNode.componentDidReceiveProps) == "function" then
			Console.error("%s has a method called componentDidReceiveProps(). But there is no such lifecycle method. If you meant to update the state in response to changing props, use componentWillReceiveProps(). If you meant to fetch data or run side-effects or mutations after React has updated the UI, use componentDidUpdate().", ComponentName)
		end
		if type(StateNode.componentWillRecieveProps) == "function" then
			Console.error("%s has a method called componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", ComponentName)
		end
		if type(StateNode.UNSAFE_componentWillRecieveProps) == "function" then
			Console.error("%s has a method called UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", ComponentName)
		end
		local IsNotPropsMatch = StateNode.props ~= Props
		
		if StateNode.props ~= nil and IsNotPropsMatch then
			Console.error("%s(...): When calling super() in `%s`, make sure to pass up the same props that your component's constructor was passed.", ComponentName, ComponentName)
		end
		if rawget(StateNode, "defaultProps") then
			Console.error("Setting defaultProps as an instance property on %s is not supported and will be ignored. Instead, define defaultProps as a static property on %s.", ComponentName, ComponentName)
		end
		if type(StateNode.getSnapshotBeforeUpdate) == "function" and type(StateNode.componentDidUpdate) ~= "function" and not v3[Key] then
			v3[Key] = true
			Console.error("%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). This component defines getSnapshotBeforeUpdate() only.", GetComponentNameFunction(Key))
		end
		local State = StateNode.state
		
		if State ~= nil and type(State) ~= "table" then
			Console.error("%s.state: must be set to an object or nil", ComponentName)
		end
		if type(Key) == "table" and type(StateNode.getChildContext) == "function" and type(Key.childContextTypes) ~= "table" then
			Console.error("%s.getChildContext(): childContextTypes must be defined in order to use getChildContext().", ComponentName)
		end
	end
end

local function adoptClassInstance(p1, StateNode)
	-- upvalues: Config (ref), initializeClassComponentUpdater (copy), SetFunction (copy), DEV (copy), _reactInternalInstance (copy)
	if Config == nil then
		initializeClassComponentUpdater()
	end
	StateNode.__updater = Config
	p1.stateNode = StateNode
	SetFunction(StateNode, p1)
	
	if DEV then
		StateNode._reactInternalInstance = _reactInternalInstance
	end
end

local function constructClassInstance(p1, Key, p2)
	-- upvalues: EmptyContextObject (copy), DEV (copy), REACTCONTEXTTYPE (copy), v7 (ref), REACTPROVIDERTYPE (copy), Console (copy), GetComponentNameFunction (copy), ReadContextFunction (copy), DisableLegacyContext (copy), GetUnmaskedContextFunction (copy), GetMaskedContextFunction (copy), DebugRenderPhaseSideEffectsForStrictMode (copy), StrictMode (copy), DisableLogsFunction (copy), DescribeError (copy), ReenableLogsFunction (copy), Config (ref), initializeClassComponentUpdater (copy), SetFunction (copy), _reactInternalInstance (copy), UninitializedState (copy), v2 (ref), v4 (ref), CacheContextFunction (copy)
	local HasContextTypes = false
	local EmptyContextObject1 = EmptyContextObject
	local EmptyContextObject2 = EmptyContextObject
	local ContextType = Key.contextType
	
	if DEV and Key.contextType ~= nil and (ContextType ~= nil and (ContextType["$$typeof"] ~= REACTCONTEXTTYPE or ContextType._context ~= nil) and not v7[Key]) then
		v7[Key] = true
		local v8 = ""
		local Text = nil
		
		if ContextType == nil then
			Text = " However, it is set to nil. This can be caused by a typo or by mixing up named and default imports. This can also happen due to a circular dependency, so try moving the createContext() call to a separate file."
		elseif type(ContextType) == "table" then
			if ContextType["$$typeof"] == REACTPROVIDERTYPE then
				Text = " Did you accidentally pass the Context.Provider instead?"
			elseif ContextType._context == nil then
				local Text1 = v8 .. " However, it is set to an object with keys {"
				
				for i, _ in ContextType do
					Text1 ..= i .. ", "
				end
				Text = Text1 .. "}."
			else
				Text = " Did you accidentally pass the Context.Consumer instead?"
			end
		else
			Text = " However, it is set to a " .. type(ContextType) .. "."
		end
		Console.error("%s defines an invalid contextType. contextType should point to the Context object returned by React.createContext().%s", GetComponentNameFunction(Key) or "Component", Text)
	end
	if ContextType == nil or type(ContextType) ~= "table" then
		if not DisableLegacyContext then
			EmptyContextObject1 = GetUnmaskedContextFunction(p1, Key, true)
			HasContextTypes = Key.contextTypes ~= nil
			EmptyContextObject2 = HasContextTypes and GetMaskedContextFunction(p1, EmptyContextObject1) or EmptyContextObject
		end
	else
		EmptyContextObject2 = ReadContextFunction(ContextType)
	end
	if DEV and DebugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, StrictMode) ~= 0 then
		DisableLogsFunction()
		local Success, Result = xpcall(Key.__ctor, DescribeError, p2, EmptyContextObject2)
		ReenableLogsFunction()
		
		if not Success then
			error(Result)
		end
	end
	local CtorResult = Key.__ctor(p2, EmptyContextObject2)
	p1.memoizedState = CtorResult.state
	local MemoizedState = p1.memoizedState
	
	if Config == nil then
		initializeClassComponentUpdater()
	end
	CtorResult.__updater = Config
	p1.stateNode = CtorResult
	SetFunction(CtorResult, p1)
	
	if DEV then
		CtorResult._reactInternalInstance = _reactInternalInstance
	end
	if DEV then
		if type(Key.getDerivedStateFromProps) == "function" and MemoizedState == UninitializedState then
			local ComponentName = GetComponentNameFunction(Key) or "Component"
			
			if not v2[ComponentName] then
				v2[ComponentName] = true
				Console.error("`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. This is not recommended. Instead, define the initial state by passing an object to `self:setState` in the `init` method of `%s`. This ensures that `getDerivedStateFromProps` arguments have a consistent shape.", ComponentName, ComponentName)
			end
		end
		if type(Key.getDerivedStateFromProps) == "function" or type(CtorResult.getSnapshotBeforeUpdate) == "function" then
			local v9: string? = nil
			local v10: string? = nil
			local v11: string? = nil
			
			if type(CtorResult.componentWillMount) == "function" then
				v9 = "componentWillMount"
			elseif type(CtorResult.UNSAFE_componentWillMount) == "function" then
				v9 = "UNSAFE_componentWillMount"
			end
			if type(CtorResult.componentWillReceiveProps) == "function" then
				v10 = "componentWillReceiveProps"
			elseif type(CtorResult.UNSAFE_componentWillReceiveProps) == "function" then
				v10 = "UNSAFE_componentWillReceiveProps"
			end
			if type(CtorResult.componentWillUpdate) == "function" then
				v11 = "componentWillUpdate"
			elseif type(CtorResult.UNSAFE_componentWillUpdate) == "function" then
				v11 = "UNSAFE_componentWillUpdate"
			end
			if v9 ~= nil or v10 ~= nil or v11 ~= nil then
				local ComponentName = GetComponentNameFunction(Key) or "Component"
				local GetDerivedStateFromProps: string = if type(Key.getDerivedStateFromProps) == "function" then "getDerivedStateFromProps()" else "getSnapshotBeforeUpdate()"
				local Text: string = if v9 == nil then "" else "\n  " .. tostring(v9)
				local Text1: string = if v10 == nil then "" else "\n  " .. tostring(v10)
				local Text2: string = if v11 == nil then "" else "\n  " .. tostring(v11)
				
				if not v4[ComponentName] then
					v4[ComponentName] = true
					Console.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\nThe above lifecycles should be removed. Learn more about this warning here:\nhttps://reactjs.org/link/unsafe-component-lifecycles", ComponentName, GetDerivedStateFromProps, Text, Text1, Text2)
				end
			end
		end
	end
	if HasContextTypes then
		CacheContextFunction(p1, EmptyContextObject1, EmptyContextObject2)
	end
	return CtorResult
end

local function callComponentWillMount(p3, StateNode)
	-- upvalues: DEV (copy), Console (copy), GetComponentNameFunction (copy), Config (ref), initializeClassComponentUpdater (copy)
	local State = StateNode.state
	
	if StateNode.componentWillMount ~= nil and type(StateNode.componentWillMount) == "function" then
		StateNode:componentWillMount()
	end
	if StateNode.UNSAFE_componentWillMount ~= nil and type(StateNode.UNSAFE_componentWillMount) == "function" then
		StateNode:UNSAFE_componentWillMount()
	end
	if State ~= StateNode.state then
		if DEV then
			Console.error("%s.componentWillMount(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.", GetComponentNameFunction(p3.type) or "Component")
		end
		if Config == nil then
			initializeClassComponentUpdater()
		end
		Config.enqueueReplaceState(StateNode, StateNode.state)
	end
end

function callComponentWillReceiveProps(p3, p4, p5, p6)
	-- upvalues: DEV (copy), GetComponentNameFunction (copy), v1 (ref), Console (copy), Config (ref), initializeClassComponentUpdater (copy)
	local State = p4.state
	
	if p4.componentWillReceiveProps ~= nil and type(p4.componentWillReceiveProps) == "function" then
		p4:componentWillReceiveProps(p5, p6)
	end
	if p4.UNSAFE_componentWillReceiveProps ~= nil and type(p4.UNSAFE_componentWillReceiveProps) == "function" then
		p4:UNSAFE_componentWillReceiveProps(p5, p6)
	end
	if p4.state ~= State then
		if DEV then
			local ComponentName = GetComponentNameFunction(p3.type) or "Component"
			
			if not v1[ComponentName] then
				v1[ComponentName] = true
				Console.error("%s.componentWillReceiveProps(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.", ComponentName)
			end
		end
		if Config == nil then
			initializeClassComponentUpdater()
		end
		Config.enqueueReplaceState(p4, p4.state)
	end
end

local function mountClassInstance(p3, Key, Props, p4)
	-- upvalues: DEV (copy), checkClassInstance (copy), Refs (copy), InitializeUpdateQueueFunction (copy), ReadContextFunction (copy), DisableLegacyContext (copy), EmptyContextObject (copy), GetUnmaskedContextFunction (copy), GetMaskedContextFunction (copy), GetComponentNameFunction (copy), v5 (ref), Console (copy), StrictMode (copy), ReactStrictModeWarningsNewModule (copy), WarnAboutDeprecatedLifecycles (copy), ProcessUpdateQueueFunction (copy), applyDerivedStateFromProps (copy), callComponentWillMount (copy), EnableDoubleInvokingEffects (copy), MountLayoutDev (copy), Update (copy)
	if DEV then
		checkClassInstance(p3, Key, Props)
	end
	local StateNode = p3.stateNode
	StateNode.props = Props
	StateNode.state = p3.memoizedState
	StateNode.__refs = Refs
	InitializeUpdateQueueFunction(p3)
	local ContextType = if type(Key) == "table" then Key.contextType else nil
	
	if ContextType == nil or type(ContextType) ~= "table" then
		if DisableLegacyContext then
			StateNode.context = EmptyContextObject
		else
			StateNode.context = GetMaskedContextFunction(p3, (GetUnmaskedContextFunction(p3, Key, true)))
		end
	else
		StateNode.context = ReadContextFunction(ContextType)
	end
	if DEV then
		if StateNode.state == Props then
			local ComponentName = GetComponentNameFunction(Key) or "Component"
			
			if not v5[ComponentName] then
				v5[ComponentName] = true
				Console.error("%s: It is not recommended to assign props directly to state because updates to props won't be reflected in state. In most cases, it is better to use props directly.", ComponentName)
			end
		end
		if bit32.band(p3.mode, StrictMode) ~= 0 then
			ReactStrictModeWarningsNewModule.recordLegacyContextWarning(p3, StateNode)
		end
		if WarnAboutDeprecatedLifecycles then
			ReactStrictModeWarningsNewModule.recordUnsafeLifecycleWarnings(p3, StateNode)
		end
	end
	ProcessUpdateQueueFunction(p3, Props, StateNode, p4)
	StateNode.state = p3.memoizedState
	local ValueType = type(Key)
	local GetDerivedStateFromProps = if type(Key) == "table" then Key.getDerivedStateFromProps else nil
	
	if GetDerivedStateFromProps ~= nil and type(GetDerivedStateFromProps) == "function" then
		applyDerivedStateFromProps(p3, Key, GetDerivedStateFromProps, Props)
		StateNode.state = p3.memoizedState
	end
	if ValueType == "table" and type(Key.getDerivedStateFromProps) ~= "function" and type(StateNode.getSnapshotBeforeUpdate) ~= "function" and (type(StateNode.UNSAFE_componentWillMount) == "function" or type(StateNode.componentWillMount) == "function") then
		callComponentWillMount(p3, StateNode)
		ProcessUpdateQueueFunction(p3, Props, StateNode, p4)
		StateNode.state = p3.memoizedState
	end
	if type(StateNode.componentDidMount) == "function" then
		if DEV and EnableDoubleInvokingEffects then
			p3.flags = bit32.bor(p3.flags, (bit32.bor(MountLayoutDev, Update)))
			
			return
		end
		p3.flags = bit32.bor(p3.flags, Update)
	end
end

function resumeMountClassInstance(p3, p4, MemoizedProps, p5)
	-- upvalues: EmptyContextObject (copy), ReadContextFunction (copy), DisableLegacyContext (copy), GetUnmaskedContextFunction (copy), GetMaskedContextFunction (copy), ResetHasForceUpdateBeforeProcessingFunction (copy), ProcessUpdateQueueFunction (copy), HasContextChangedFunction (copy), CheckHasForceUpdateAfterProcessingFunction (copy), DEV (copy), EnableDoubleInvokingEffects (copy), MountLayoutDev (copy), Update (copy), applyDerivedStateFromProps (copy)
	local StateNode = p3.stateNode
	local MemoizedProps1 = p3.memoizedProps
	StateNode.props = MemoizedProps1
	local Context = StateNode.context
	local ContextType = p4.contextType
	local EmptyContextObject1 = if ContextType == nil or type(ContextType) ~= "table" then if DisableLegacyContext then EmptyContextObject else GetMaskedContextFunction(p3, (GetUnmaskedContextFunction(p3, p4, true))) else ReadContextFunction(ContextType)
	local GetDerivedStateFromPropsFunction = p4.getDerivedStateFromProps
	local IsFunction: boolean = type(GetDerivedStateFromPropsFunction) == "function" or type(StateNode.getSnapshotBeforeUpdate) == "function"
	
	if not IsFunction and (type(StateNode.UNSAFE_componentWillReceiveProps) == "function" or type(StateNode.componentWillReceiveProps) == "function") and (MemoizedProps1 ~= MemoizedProps or Context ~= EmptyContextObject1) then
		callComponentWillReceiveProps(p3, StateNode, MemoizedProps, EmptyContextObject1)
	end
	ResetHasForceUpdateBeforeProcessingFunction()
	local MemoizedState = p3.memoizedState
	StateNode.state = MemoizedState
	ProcessUpdateQueueFunction(p3, MemoizedProps, StateNode, p5)
	local MemoizedState1 = p3.memoizedState
	
	if MemoizedProps1 == MemoizedProps and MemoizedState == MemoizedState1 and not HasContextChangedFunction() and not CheckHasForceUpdateAfterProcessingFunction() then
		if type(StateNode.componentDidMount) == "function" then
			if DEV and EnableDoubleInvokingEffects then
				p3.flags = bit32.bor(p3.flags, MountLayoutDev, Update)
			else
				p3.flags = bit32.bor(p3.flags, Update)
			end
		end
		return false
	else
		if GetDerivedStateFromPropsFunction ~= nil and type(GetDerivedStateFromPropsFunction) == "function" then
			applyDerivedStateFromProps(p3, p4, GetDerivedStateFromPropsFunction, MemoizedProps)
			MemoizedState1 = p3.memoizedState
		end
		local CheckHasForceUpdateAfterProcessingResult = CheckHasForceUpdateAfterProcessingFunction() or checkShouldComponentUpdate(p3, p4, MemoizedProps1, MemoizedProps, MemoizedState, MemoizedState1, EmptyContextObject1)
		
		if CheckHasForceUpdateAfterProcessingResult then
			if not IsFunction and (type(StateNode.UNSAFE_componentWillMount) == "function" or type(StateNode.componentWillMount) == "function") then
				if type(StateNode.componentWillMount) == "function" then
					StateNode:componentWillMount()
				end
				if type(StateNode.UNSAFE_componentWillMount) == "function" then
					StateNode:UNSAFE_componentWillMount()
				end
			end
			if type(StateNode.componentDidMount) == "function" then
				if DEV and EnableDoubleInvokingEffects then
					p3.flags = bit32.bor(p3.flags, MountLayoutDev, Update)
				else
					p3.flags = bit32.bor(p3.flags, Update)
				end
			end
		else
			if type(StateNode.componentDidMount) == "function" then
				if DEV and EnableDoubleInvokingEffects then
					p3.flags = bit32.bor(p3.flags, MountLayoutDev, Update)
				else
					p3.flags = bit32.bor(p3.flags, Update)
				end
			end
			p3.memoizedProps = MemoizedProps
			p3.memoizedState = MemoizedState1
		end
		StateNode.props = MemoizedProps
		StateNode.state = MemoizedState1
		StateNode.context = EmptyContextObject1
		
		return CheckHasForceUpdateAfterProcessingResult
	end
end

return {
	adoptClassInstance = adoptClassInstance,
	constructClassInstance = constructClassInstance,
	mountClassInstance = mountClassInstance,
	resumeMountClassInstance = resumeMountClassInstance,
	updateClassInstance = function(p3, p4, p5, MemoizedProps, p6)
		-- upvalues: CloneUpdateQueueFunction (copy), ResolveDefaultPropsFunction (copy), EmptyContextObject (copy), ReadContextFunction (copy), DisableLegacyContext (copy), GetUnmaskedContextFunction (copy), GetMaskedContextFunction (copy), ResetHasForceUpdateBeforeProcessingFunction (copy), ProcessUpdateQueueFunction (copy), HasContextChangedFunction (copy), CheckHasForceUpdateAfterProcessingFunction (copy), Update (copy), Snapshot (copy), applyDerivedStateFromProps (copy)
		local StateNode = p4.stateNode
		CloneUpdateQueueFunction(p3, p4)
		local MemoizedProps1 = p4.memoizedProps
		local MemoizedProps2 = if p4.type == p4.elementType then MemoizedProps1 else ResolveDefaultPropsFunction(p4.type, MemoizedProps1)
		StateNode.props = MemoizedProps2
		local PendingProps = p4.pendingProps
		local Context = StateNode.context
		local ContextType = nil
		local GetDerivedStateFromPropsFunction = nil
		
		if type(p5) == "table" then
			ContextType = p5.contextType
			GetDerivedStateFromPropsFunction = p5.getDerivedStateFromProps
		end
		local Context1 = if type(ContextType) == "table" then ReadContextFunction(ContextType) elseif DisableLegacyContext then EmptyContextObject else GetMaskedContextFunction(p4, (GetUnmaskedContextFunction(p4, p5, true)))
		local IsFunction: boolean = if GetDerivedStateFromPropsFunction == nil then StateNode.getSnapshotBeforeUpdate ~= nil and type(StateNode.getSnapshotBeforeUpdate) == "function" else type(GetDerivedStateFromPropsFunction) == "function" or StateNode.getSnapshotBeforeUpdate ~= nil and type(StateNode.getSnapshotBeforeUpdate) == "function"
		
		if not IsFunction and (StateNode.UNSAFE_componentWillReceiveProps ~= nil and type(StateNode.UNSAFE_componentWillReceiveProps) == "function" or StateNode.componentWillReceiveProps ~= nil and type(StateNode.componentWillReceiveProps) == "function") and (MemoizedProps1 ~= PendingProps or Context ~= Context1) then
			callComponentWillReceiveProps(p4, StateNode, MemoizedProps, Context1)
		end
		ResetHasForceUpdateBeforeProcessingFunction()
		local MemoizedState = p4.memoizedState
		StateNode.state = MemoizedState
		local _ = StateNode.state
		ProcessUpdateQueueFunction(p4, MemoizedProps, StateNode, p6)
		local MemoizedState1 = p4.memoizedState
		
		if MemoizedProps1 == PendingProps and MemoizedState == MemoizedState1 and not HasContextChangedFunction() and not CheckHasForceUpdateAfterProcessingFunction() then
			if StateNode.componentDidUpdate ~= nil and type(StateNode.componentDidUpdate) == "function" and (MemoizedProps1 ~= p3.memoizedProps or MemoizedState ~= p3.memoizedState) then
				p4.flags = bit32.bor(p4.flags, Update)
			end
			if StateNode.getSnapshotBeforeUpdate ~= nil and type(StateNode.getSnapshotBeforeUpdate) == "function" and (MemoizedProps1 ~= p3.memoizedProps or MemoizedState ~= p3.memoizedState) then
				p4.flags = bit32.bor(p4.flags, Snapshot)
			end
			return false
		else
			if GetDerivedStateFromPropsFunction ~= nil and type(GetDerivedStateFromPropsFunction) == "function" then
				applyDerivedStateFromProps(p4, p5, GetDerivedStateFromPropsFunction, MemoizedProps)
				MemoizedState1 = p4.memoizedState
			end
			local CheckHasForceUpdateAfterProcessingResult = CheckHasForceUpdateAfterProcessingFunction() or checkShouldComponentUpdate(p4, p5, MemoizedProps2, MemoizedProps, MemoizedState, MemoizedState1, Context1)
			
			if CheckHasForceUpdateAfterProcessingResult then
				if not IsFunction and (StateNode.UNSAFE_componentWillUpdate ~= nil and type(StateNode.UNSAFE_componentWillUpdate) == "function" or StateNode.componentWillUpdate ~= nil and type(StateNode.componentWillUpdate) == "function") then
					if StateNode.componentWillUpdate ~= nil and type(StateNode.componentWillUpdate) == "function" then
						StateNode:componentWillUpdate(MemoizedProps, MemoizedState1, Context1)
					end
					if StateNode.UNSAFE_componentWillUpdate ~= nil and type(StateNode.UNSAFE_componentWillUpdate) == "function" then
						StateNode:UNSAFE_componentWillUpdate(MemoizedProps, MemoizedState1, Context1)
					end
				end
				if StateNode.componentDidUpdate ~= nil and type(StateNode.componentDidUpdate) == "function" then
					p4.flags = bit32.bor(p4.flags, Update)
				end
				if StateNode.getSnapshotBeforeUpdate ~= nil and type(StateNode.getSnapshotBeforeUpdate) == "function" then
					p4.flags = bit32.bor(p4.flags, Snapshot)
				end
			else
				if StateNode.componentDidUpdate ~= nil and type(StateNode.componentDidUpdate) == "function" and (MemoizedProps1 ~= p3.memoizedProps or MemoizedState ~= p3.memoizedState) then
					p4.flags = bit32.bor(p4.flags, Update)
				end
				if StateNode.getSnapshotBeforeUpdate ~= nil and type(StateNode.getSnapshotBeforeUpdate) == "function" and (MemoizedProps1 ~= p3.memoizedProps or MemoizedState ~= p3.memoizedState) then
					p4.flags = bit32.bor(p4.flags, Snapshot)
				end
				p4.memoizedProps = MemoizedProps
				p4.memoizedState = MemoizedState1
			end
			StateNode.props = MemoizedProps
			StateNode.state = MemoizedState1
			StateNode.context = Context1
			
			return CheckHasForceUpdateAfterProcessingResult
		end
	end,
	applyDerivedStateFromProps = applyDerivedStateFromProps,
	emptyRefsObject = Refs
}