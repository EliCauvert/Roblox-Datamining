local parent = script.Parent.Parent
local object = require(parent.LuauPolyfill).Object
local dEV = require(parent.ReactGlobals).__DEV__
local console = require(parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local reactFiberLaneModule = require(script.Parent.ReactFiberLane)
local unknownModule = require(script.Parent["ReactUpdateQueue.new"])
local _ = require(parent.Shared)
local reactModule = require(parent.React)
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local update = reactFiberFlagsModule.Update
local snapshot = reactFiberFlagsModule.Snapshot
local mountLayoutDev = reactFiberFlagsModule.MountLayoutDev
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local debugRenderPhaseSideEffectsForStrictMode = reactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode
local disableLegacyContext = reactFeatureFlags.disableLegacyContext
local enableDebugTracing = reactFeatureFlags.enableDebugTracing
local enableSchedulingProfiler = reactFeatureFlags.enableSchedulingProfiler
local warnAboutDeprecatedLifecycles = reactFeatureFlags.warnAboutDeprecatedLifecycles
local enableDoubleInvokingEffects = reactFeatureFlags.enableDoubleInvokingEffects
local unknownModule_1 = require(script.Parent["ReactStrictModeWarnings.new"])
local isMounted = require(script.Parent.ReactFiberTreeReflection).isMounted
local reactInstanceMap = require(parent.Shared).ReactInstanceMap
local get = reactInstanceMap.get
local set = reactInstanceMap.set
local shallowEqual = require(parent.Shared).shallowEqual
local getComponentName = require(parent.Shared).getComponentName
local uninitializedState = require(parent.Shared).UninitializedState
local describeError = require(parent.Shared).describeError
local reactSymbols = require(parent.Shared).ReactSymbols
local REACT_CONTEXT_TYPE = reactSymbols.REACT_CONTEXT_TYPE
local REACT_PROVIDER_TYPE = reactSymbols.REACT_PROVIDER_TYPE
local resolveDefaultProps = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps
local reactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local debugTracingMode = reactTypeOfModeModule.DebugTracingMode
local strictMode = reactTypeOfModeModule.StrictMode
local enqueueUpdate = unknownModule.enqueueUpdate
local processUpdateQueue = unknownModule.processUpdateQueue
local checkHasForceUpdateAfterProcessing = unknownModule.checkHasForceUpdateAfterProcessing
local resetHasForceUpdateBeforeProcessing = unknownModule.resetHasForceUpdateBeforeProcessing
local createUpdate = unknownModule.createUpdate
local replaceState = unknownModule.ReplaceState
local forceUpdate = unknownModule.ForceUpdate
local initializeUpdateQueue = unknownModule.initializeUpdateQueue
local cloneUpdateQueue = unknownModule.cloneUpdateQueue
local noLanes = reactFiberLaneModule.NoLanes
local unknownModule_2 = require(script.Parent["ReactFiberContext.new"])
local cacheContext = unknownModule_2.cacheContext
local getMaskedContext = unknownModule_2.getMaskedContext
local getUnmaskedContext = unknownModule_2.getUnmaskedContext
local hasContextChanged = unknownModule_2.hasContextChanged
local emptyContextObject = unknownModule_2.emptyContextObject
local readContext = require(script.Parent["ReactFiberNewContext.new"]).readContext
local debugTracingModule = require(script.Parent.DebugTracing)
local logForceUpdateScheduled = debugTracingModule.logForceUpdateScheduled
local logStateUpdateScheduled = debugTracingModule.logStateUpdateScheduled
local consolePatchingDev = require(parent.Shared).ConsolePatchingDev
local disableLogs = consolePatchingDev.disableLogs
local reenableLogs = consolePatchingDev.reenableLogs
local schedulingProfilerModule = require(script.Parent.SchedulingProfiler)
local markForceUpdateScheduled = schedulingProfilerModule.markForceUpdateScheduled
local markStateUpdateScheduled = schedulingProfilerModule.markStateUpdateScheduled
local t = {}
local refs = reactModule.Component:extend("").__refs
local t_1 = nil
local t_2 = nil
local t_3 = nil
local t_4 = nil
local t_5 = nil
local warnOnUndefinedDerivedState = nil
local warnOnInvalidCallback = nil
local t_6 = nil
local t_7 = nil
local t_8 = nil

if dEV then
	t_1 = {}
	t_2 = {}
	t_3 = {}
	t_4 = {}
	t_6 = {}
	t_5 = {}
	t_7 = {}
	t_8 = {}
	local t_9 = {}
	
	warnOnInvalidCallback = function(p1, p2)
		-- upvalues: t_9 (ref), console (ref)
		if p1 == nil or type(p1) == "function" then return end
		local text = p2 .. "_" .. tostring(p1)
		
		if not t_9[text] then
			t_9[text] = true
			console.error("%s(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", p2, tostring(p1))
		end
	end
	
	warnOnUndefinedDerivedState = function(_, _) end
end
local function applyDerivedStateFromProps(p1, p2, p3, p4)
	-- upvalues: dEV (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), warnOnUndefinedDerivedState (write), object (ref), noLanes (ref)
	local memoizedState = p1.memoizedState
	
	if dEV and debugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, strictMode) ~= 0 then
		disableLogs()
		local ok, status = xpcall(p3, describeError, p4, memoizedState)
		reenableLogs()
		
		if not ok then
			error(status)
		end
	end
	local var1 = p3(p4, memoizedState)
	
	if dEV then
		warnOnUndefinedDerivedState(p2, var1)
	end
	local var2 = if var1 == nil then memoizedState else object.assign({}, memoizedState, var1)
	p1.memoizedState = var2
	
	if p1.lanes == noLanes then
		p1.updateQueue.baseState = var2
	end
end

local var1 = nil

local function initializeClassComponentUpdater()
	-- upvalues: var1 (write), isMounted (ref), get (ref), createUpdate (ref), dEV (ref), warnOnInvalidCallback (write), enqueueUpdate (ref), enableDebugTracing (ref), debugTracingMode (ref), getComponentName (ref), logStateUpdateScheduled (ref), enableSchedulingProfiler (ref), markStateUpdateScheduled (ref), replaceState (ref), forceUpdate (ref), logForceUpdateScheduled (ref), markForceUpdateScheduled (ref)
	local unknownModule = require(script.Parent["ReactFiberWorkLoop.new"])
	local requestEventTime = unknownModule.requestEventTime
	local requestUpdateLane = unknownModule.requestUpdateLane
	local scheduleUpdateOnFiber = unknownModule.scheduleUpdateOnFiber
	var1 = {
		isMounted = isMounted,
		enqueueSetState = function(value, p1, p2)
			-- upvalues: get (copy), requestEventTime (ref), requestUpdateLane (ref), createUpdate (copy), dEV (copy), warnOnInvalidCallback (copy), enqueueUpdate (copy), scheduleUpdateOnFiber (ref), enableDebugTracing (copy), debugTracingMode (copy), getComponentName (copy), logStateUpdateScheduled (copy), enableSchedulingProfiler (copy), markStateUpdateScheduled (copy)
			local var2 = get(value)
			local var3 = requestEventTime()
			local var4 = requestUpdateLane(var2)
			local var5 = createUpdate(var3, var4, p1, p2)
			
			if p2 ~= nil and dEV then
				warnOnInvalidCallback(p2, "setState")
			end
			enqueueUpdate(var2, var5)
			scheduleUpdateOnFiber(var2, var4, var3)
			
			if dEV and enableDebugTracing and bit32.band(var2.mode, debugTracingMode) ~= 0 then
				logStateUpdateScheduled(getComponentName(var2.type) or "Unknown", var4, p1)
			end
			if enableSchedulingProfiler then
				markStateUpdateScheduled(var2, var4)
			end
		end,
		enqueueReplaceState = function(p1, p2, p3)
			-- upvalues: get (copy), requestEventTime (ref), requestUpdateLane (ref), createUpdate (copy), replaceState (copy), dEV (copy), warnOnInvalidCallback (copy), enqueueUpdate (copy), scheduleUpdateOnFiber (ref), enableDebugTracing (copy), debugTracingMode (copy), getComponentName (copy), logStateUpdateScheduled (copy), enableSchedulingProfiler (copy), markStateUpdateScheduled (copy)
			local var2 = get(p1)
			local var3 = requestEventTime()
			local var4 = requestUpdateLane(var2)
			local var5 = createUpdate(var3, var4, p2, p3)
			var5.tag = replaceState
			
			if p3 ~= nil and dEV then
				warnOnInvalidCallback(p3, "replaceState")
			end
			enqueueUpdate(var2, var5)
			scheduleUpdateOnFiber(var2, var4, var3)
			
			if dEV and enableDebugTracing and bit32.band(var2.mode, debugTracingMode) ~= 0 then
				logStateUpdateScheduled(getComponentName(var2.type) or "Unknown", var4, p2)
			end
			if enableSchedulingProfiler then
				markStateUpdateScheduled(var2, var4)
			end
		end,
		enqueueForceUpdate = function(p1, p2)
			-- upvalues: get (copy), requestEventTime (ref), requestUpdateLane (ref), createUpdate (copy), forceUpdate (copy), dEV (copy), warnOnInvalidCallback (copy), enqueueUpdate (copy), scheduleUpdateOnFiber (ref), enableDebugTracing (copy), debugTracingMode (copy), getComponentName (copy), logForceUpdateScheduled (copy), enableSchedulingProfiler (copy), markForceUpdateScheduled (copy)
			local var2 = get(p1)
			local var3 = requestEventTime()
			local var4 = requestUpdateLane(var2)
			local var5 = createUpdate(var3, var4, nil, p2)
			var5.tag = forceUpdate
			
			if p2 ~= nil and dEV then
				warnOnInvalidCallback(p2, "forceUpdate")
			end
			enqueueUpdate(var2, var5)
			scheduleUpdateOnFiber(var2, var4, var3)
			
			if dEV and enableDebugTracing and bit32.band(var2.mode, debugTracingMode) ~= 0 then
				logForceUpdateScheduled(getComponentName(var2.type) or "Unknown", var4)
			end
			if enableSchedulingProfiler then
				markForceUpdateScheduled(var2, var4)
			end
		end
	}
end

local function _()
	-- upvalues: var1 (write), initializeClassComponentUpdater (ref)
	if var1 == nil then
		initializeClassComponentUpdater()
	end
	return var1
end

function checkShouldComponentUpdate(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: dEV (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), console (ref), getComponentName (ref), shallowEqual (ref)
	local stateNode = p1.stateNode
	
	if stateNode.shouldComponentUpdate == nil or type(stateNode.shouldComponentUpdate) ~= "function" then
		return if type(p2) == "table" and p2.isPureReactComponent then not shallowEqual(p3, p4) or not shallowEqual(p5, p6) else true
	elseif dEV and debugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, strictMode) ~= 0 then
		disableLogs()
		local ok, status = xpcall(stateNode.shouldComponentUpdate, describeError, stateNode, p4, p6, p7)
		reenableLogs()
		
		if not ok then
			error(status)
		end
	end
	local var2 = stateNode:shouldComponentUpdate(p4, p6, p7)
	
	if dEV and var2 == nil then
		console.error("%s.shouldComponentUpdate(): Returned nil instead of a boolean value. Make sure to return true or false.", getComponentName(p2) or "Component")
	end
	return var2
end

local function checkClassInstance(p1, p2, p3)
	-- upvalues: dEV (ref), getComponentName (ref), console (ref), disableLegacyContext (ref), t_7 (write), t_3 (write)
	local stateNode = p1.stateNode
	
	if dEV then
		local var2 = getComponentName(p2) or "Component"
		
		if not stateNode.render then
			if type(p2.render) == "function" then
				console.error("%s(...): No `render` method found on the returned component instance: did you accidentally return an object from the constructor?", var2)
			else
				console.error("%s(...): No `render` method found on the returned component instance: you may have forgotten to define `render`.", var2)
			end
		end
		if stateNode.getInitialState and not stateNode.getInitialState.isReactClassApproved and not stateNode.state then
			console.error("getInitialState was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Did you mean to define a state property instead?", var2)
		end
		if stateNode.getDefaultProps and not stateNode.getDefaultProps.isReactClassApproved then
			console.error("getDefaultProps was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Use a static property to define defaultProps instead.", var2)
		end
		if stateNode.propTypes and not p2.propTypes then
			console.error("propTypes was defined as an instance property on %s. Use a static property to define propTypes instead.", var2)
		end
		if stateNode.contextType and not p2.contextType then
			console.error("contextType was defined as an instance property on %s. Use a static property to define contextType instead.", var2)
		end
		if disableLegacyContext then
			if p2.childContextTypes then
				console.error("%s uses the legacy childContextTypes API which is no longer supported. Use React.createContext() instead.", var2)
			end
			if p2.contextTypes then
				console.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with static contextType instead.", var2)
			end
		elseif stateNode.contextTypes and not p2.contextTypes then
			console.error("contextTypes was defined as an instance property on %s. Use a static property to define contextTypes instead.", var2)
		end
		if type(p2) == "table" and p2.contextType and (p2.contextTypes and not t_7[p2]) then
			t_7[p2] = true
			console.error("%s declares both contextTypes and contextType static properties. The legacy contextTypes property will be ignored.", var2)
		end
		if type(stateNode.componentShouldUpdate) == "function" then
			console.error("%s has a method called componentShouldUpdate(). Did you mean shouldComponentUpdate()? The name is phrased as a question because the function is expected to return a value.", var2)
		end
		if type(p2) == "table" and p2.isPureReactComponent and stateNode.shouldComponentUpdate ~= nil then
			console.error("%s has a method called shouldComponentUpdate(). shouldComponentUpdate should not be used when extending React.PureComponent. Please extend React.Component if shouldComponentUpdate is used.", getComponentName(p2) or "A pure component")
		end
		if type(stateNode.componentDidUnmount) == "function" then
			console.error("%s has a method called componentDidUnmount(). But there is no such lifecycle method. Did you mean componentWillUnmount()?", var2)
		end
		if type(stateNode.componentDidReceiveProps) == "function" then
			console.error("%s has a method called componentDidReceiveProps(). But there is no such lifecycle method. If you meant to update the state in response to changing props, use componentWillReceiveProps(). If you meant to fetch data or run side-effects or mutations after React has updated the UI, use componentDidUpdate().", var2)
		end
		if type(stateNode.componentWillRecieveProps) == "function" then
			console.error("%s has a method called componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", var2)
		end
		if type(stateNode.UNSAFE_componentWillRecieveProps) == "function" then
			console.error("%s has a method called UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", var2)
		end
		if stateNode.props ~= nil and stateNode.props ~= p3 then
			console.error("%s(...): When calling super() in `%s`, make sure to pass up the same props that your component's constructor was passed.", var2, var2)
		end
		if rawget(stateNode, "defaultProps") then
			console.error("Setting defaultProps as an instance property on %s is not supported and will be ignored. Instead, define defaultProps as a static property on %s.", var2, var2)
		end
		if type(stateNode.getSnapshotBeforeUpdate) == "function" and type(stateNode.componentDidUpdate) ~= "function" and not t_3[p2] then
			t_3[p2] = true
			console.error("%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). This component defines getSnapshotBeforeUpdate() only.", getComponentName(p2))
		end
		local state = stateNode.state
		
		if state ~= nil and type(state) ~= "table" then
			console.error("%s.state: must be set to an object or nil", var2)
		end
		if type(p2) == "table" and type(stateNode.getChildContext) == "function" and type(p2.childContextTypes) ~= "table" then
			console.error("%s.getChildContext(): childContextTypes must be defined in order to use getChildContext().", var2)
		end
	end
end

local function adoptClassInstance(p1, p2)
	-- upvalues: var1 (write), initializeClassComponentUpdater (ref), set (ref), dEV (ref), t (ref)
	if var1 == nil then
		initializeClassComponentUpdater()
	end
	p2.__updater = var1
	p1.stateNode = p2
	set(p2, p1)
	
	if dEV then
		p2._reactInternalInstance = t
	end
end

local function constructClassInstance(p1, p2, p3)
	-- upvalues: emptyContextObject (ref), dEV (ref), REACT_CONTEXT_TYPE (ref), t_8 (write), REACT_PROVIDER_TYPE (ref), console (ref), getComponentName (ref), readContext (ref), disableLegacyContext (ref), getUnmaskedContext (ref), getMaskedContext (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), var1 (write), initializeClassComponentUpdater (ref), set (ref), t (ref), uninitializedState (ref), t_2 (write), t_4 (write), cacheContext (ref)
	local var2 = false
	local var3 = emptyContextObject
	local var4 = emptyContextObject
	local contextType = p2.contextType
	
	if dEV and p2.contextType ~= nil then
		if not (if contextType ~= nil then contextType["$$typeof"] == REACT_CONTEXT_TYPE and contextType._context == nil else true) and not t_8[p2] then
			t_8[p2] = true
			local var5 = ""
			
			if contextType == nil then
				var5 = " However, it is set to nil. This can be caused by a typo or by mixing up named and default imports. This can also happen due to a circular dependency, so try moving the createContext() call to a separate file."
			elseif type(contextType) ~= "table" then
				var5 = " However, it is set to a " .. type(contextType) .. "."
			elseif contextType["$$typeof"] == REACT_PROVIDER_TYPE then
				var5 = " Did you accidentally pass the Context.Provider instead?"
			elseif contextType._context == nil then
				var5 ..= " However, it is set to an object with keys {"
				
				for i, v in contextType do
					var5 ..= i .. ", "
				end
				var5 ..= "}."
			else
				var5 = " Did you accidentally pass the Context.Consumer instead?"
			end
			console.error("%s defines an invalid contextType. contextType should point to the Context object returned by React.createContext().%s", getComponentName(p2) or "Component", var5)
		end
	end
	if contextType ~= nil and type(contextType) == "table" then
		var4 = readContext(contextType)
	elseif not disableLegacyContext then
		var3 = getUnmaskedContext(p1, p2, true)
		var2 = p2.contextTypes ~= nil
		var4 = var2 and getMaskedContext(p1, var3) or emptyContextObject
	end
	if dEV and debugRenderPhaseSideEffectsForStrictMode and bit32.band(p1.mode, strictMode) ~= 0 then
		disableLogs()
		local ok, status = xpcall(p2.__ctor, describeError, p3, var4)
		reenableLogs()
		
		if not ok then
			error(status)
		end
	end
	local var6 = p2.__ctor(p3, var4)
	p1.memoizedState = var6.state
	local memoizedState = p1.memoizedState
	
	if var1 == nil then
		initializeClassComponentUpdater()
	end
	var6.__updater = var1
	p1.stateNode = var6
	set(var6, p1)
	
	if dEV then
		var6._reactInternalInstance = t
	end
	if dEV then
		if type(p2.getDerivedStateFromProps) == "function" and memoizedState == uninitializedState then
			local var7 = getComponentName(p2) or "Component"
			
			if not t_2[var7] then
				t_2[var7] = true
				console.error("`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. This is not recommended. Instead, define the initial state by passing an object to `self:setState` in the `init` method of `%s`. This ensures that `getDerivedStateFromProps` arguments have a consistent shape.", var7, var7)
			end
		end
		if type(p2.getDerivedStateFromProps) == "function" or type(var6.getSnapshotBeforeUpdate) == "function" then
			local var8 = nil
			local var9 = nil
			local var10 = nil
			
			if type(var6.componentWillMount) == "function" then
				var8 = "componentWillMount"
			elseif type(var6.UNSAFE_componentWillMount) == "function" then
				var8 = "UNSAFE_componentWillMount"
			end
			if type(var6.componentWillReceiveProps) == "function" then
				var9 = "componentWillReceiveProps"
			elseif type(var6.UNSAFE_componentWillReceiveProps) == "function" then
				var9 = "UNSAFE_componentWillReceiveProps"
			end
			if type(var6.componentWillUpdate) == "function" then
				var10 = "componentWillUpdate"
			elseif type(var6.UNSAFE_componentWillUpdate) == "function" then
				var10 = "UNSAFE_componentWillUpdate"
			end
			if var8 ~= nil or var9 ~= nil or var10 ~= nil then
				local var11 = getComponentName(p2) or "Component"
				local _ = nil
				local var12 = if type(p2.getDerivedStateFromProps) == "function" then "getDerivedStateFromProps()" else "getSnapshotBeforeUpdate()"
				local var13 = if var8 ~= nil then "" else "\n  " .. tostring(var8)
				local var14 = if var9 ~= nil then "" else "\n  " .. tostring(var9)
				local var15 = if var10 ~= nil then "" else "\n  " .. tostring(var10)
				
				if not t_4[var11] then
					t_4[var11] = true
					console.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\nThe above lifecycles should be removed. Learn more about this warning here:\nhttps://reactjs.org/link/unsafe-component-lifecycles", var11, var12, var13, var14, var15)
				end
			end
		end
	end
	if var2 then
		cacheContext(p1, var3, var4)
	end
	return var6
end

local function callComponentWillMount(p4, p5)
	-- upvalues: dEV (ref), console (ref), getComponentName (ref), var1 (write), initializeClassComponentUpdater (ref)
	local state = p5.state
	
	if p5.componentWillMount ~= nil and type(p5.componentWillMount) == "function" then
		p5:componentWillMount()
	end
	if p5.UNSAFE_componentWillMount ~= nil and type(p5.UNSAFE_componentWillMount) == "function" then
		p5:UNSAFE_componentWillMount()
	end
	if state ~= p5.state then
		if dEV then
			console.error("%s.componentWillMount(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.", getComponentName(p4.type) or "Component")
		end
		if var1 == nil then
			initializeClassComponentUpdater()
		end
		var1.enqueueReplaceState(p5, p5.state)
	end
end

function callComponentWillReceiveProps(p4, p5, p6, p7)
	-- upvalues: dEV (ref), getComponentName (ref), t_1 (write), console (ref), var1 (write), initializeClassComponentUpdater (ref)
	local state = p5.state
	
	if p5.componentWillReceiveProps ~= nil and type(p5.componentWillReceiveProps) == "function" then
		p5:componentWillReceiveProps(p6, p7)
	end
	if p5.UNSAFE_componentWillReceiveProps ~= nil and type(p5.UNSAFE_componentWillReceiveProps) == "function" then
		p5:UNSAFE_componentWillReceiveProps(p6, p7)
	end
	if p5.state ~= state then
		if dEV then
			local type = getComponentName(p4.type) or "Component"
			
			if not t_1[type] then
				t_1[type] = true
				console.error("%s.componentWillReceiveProps(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.", type)
			end
		end
		if var1 == nil then
			initializeClassComponentUpdater()
		end
		var1.enqueueReplaceState(p5, p5.state)
	end
end

local function mountClassInstance(p4, p5, p6, p7)
	-- upvalues: dEV (ref), checkClassInstance (ref), refs (ref), initializeUpdateQueue (ref), readContext (ref), disableLegacyContext (ref), emptyContextObject (ref), getUnmaskedContext (ref), getMaskedContext (ref), getComponentName (ref), t_6 (write), console (ref), strictMode (ref), unknownModule_1 (ref), warnAboutDeprecatedLifecycles (ref), processUpdateQueue (ref), applyDerivedStateFromProps (ref), callComponentWillMount (ref), enableDoubleInvokingEffects (ref), mountLayoutDev (ref), update (ref)
	if dEV then
		checkClassInstance(p4, p5, p6)
	end
	local stateNode = p4.stateNode
	stateNode.props = p6
	stateNode.state = p4.memoizedState
	stateNode.__refs = refs
	initializeUpdateQueue(p4)
	local var16 = if type(p5) == "table" then p5.contextType else nil
	
	if var16 ~= nil and type(var16) == "table" then
		stateNode.context = readContext(var16)
	elseif disableLegacyContext then
		stateNode.context = emptyContextObject
	else
		stateNode.context = getMaskedContext(p4, getUnmaskedContext(p4, p5, true))
	end
	if dEV then
		if stateNode.state == p6 then
			local var17 = getComponentName(p5) or "Component"
			
			if not t_6[var17] then
				t_6[var17] = true
				console.error("%s: It is not recommended to assign props directly to state because updates to props won't be reflected in state. In most cases, it is better to use props directly.", var17)
			end
		end
		if bit32.band(p4.mode, strictMode) ~= 0 then
			unknownModule_1.recordLegacyContextWarning(p4, stateNode)
		end
		if warnAboutDeprecatedLifecycles then
			unknownModule_1.recordUnsafeLifecycleWarnings(p4, stateNode)
		end
	end
	processUpdateQueue(p4, p6, stateNode, p7)
	stateNode.state = p4.memoizedState
	local var18 = type(p5)
	local var19 = if type(p5) == "table" then p5.getDerivedStateFromProps else nil
	
	if var19 ~= nil and type(var19) == "function" then
		applyDerivedStateFromProps(p4, p5, var19, p6)
		stateNode.state = p4.memoizedState
	end
	if var18 == "table" and type(p5.getDerivedStateFromProps) ~= "function" and type(stateNode.getSnapshotBeforeUpdate) ~= "function" and (type(stateNode.UNSAFE_componentWillMount) == "function" or type(stateNode.componentWillMount) == "function") then
		callComponentWillMount(p4, stateNode)
		processUpdateQueue(p4, p6, stateNode, p7)
		stateNode.state = p4.memoizedState
	end
	if type(stateNode.componentDidMount) == "function" then
		if dEV and enableDoubleInvokingEffects then
			p4.flags = bit32.bor(p4.flags, bit32.bor(mountLayoutDev, update))
			
			return
		end
		p4.flags = bit32.bor(p4.flags, update)
	end
end

function resumeMountClassInstance(p4, p5, p6, p7)
	-- upvalues: emptyContextObject (ref), readContext (ref), disableLegacyContext (ref), getUnmaskedContext (ref), getMaskedContext (ref), resetHasForceUpdateBeforeProcessing (ref), processUpdateQueue (ref), hasContextChanged (ref), checkHasForceUpdateAfterProcessing (ref), dEV (ref), enableDoubleInvokingEffects (ref), mountLayoutDev (ref), update (ref), applyDerivedStateFromProps (ref)
	local stateNode = p4.stateNode
	local memoizedProps = p4.memoizedProps
	stateNode.props = memoizedProps
	local context = stateNode.context
	local contextType = p5.contextType
	local var16 = emptyContextObject
	
	if contextType ~= nil and type(contextType) == "table" then
		var16 = readContext(contextType)
	elseif not disableLegacyContext then
		var16 = getMaskedContext(p4, getUnmaskedContext(p4, p5, true))
	end
	local getDerivedStateFromProps = p5.getDerivedStateFromProps
	local var17 = if type(getDerivedStateFromProps) ~= "function" then type(stateNode.getSnapshotBeforeUpdate) == "function" else true
	
	if not var17 and (type(stateNode.UNSAFE_componentWillReceiveProps) == "function" or type(stateNode.componentWillReceiveProps) == "function") and (memoizedProps ~= p6 or context ~= var16) then
		callComponentWillReceiveProps(p4, stateNode, p6, var16)
	end
	resetHasForceUpdateBeforeProcessing()
	local memoizedState = p4.memoizedState
	stateNode.state = memoizedState
	processUpdateQueue(p4, p6, stateNode, p7)
	local memoizedState_1 = p4.memoizedState
	
	if memoizedProps == p6 and memoizedState == memoizedState_1 and (not hasContextChanged() and not checkHasForceUpdateAfterProcessing()) then
		if type(stateNode.componentDidMount) == "function" then
			if dEV and enableDoubleInvokingEffects then
				p4.flags = bit32.bor(p4.flags, mountLayoutDev, update)
			else
				p4.flags = bit32.bor(p4.flags, update)
			end
		end
		return false
	elseif getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
		applyDerivedStateFromProps(p4, p5, getDerivedStateFromProps, p6)
		memoizedState_1 = p4.memoizedState
	end
	local var18 = checkHasForceUpdateAfterProcessing() or checkShouldComponentUpdate(p4, p5, memoizedProps, p6, memoizedState, memoizedState_1, var16)
	
	if var18 then
		if not var17 and (type(stateNode.UNSAFE_componentWillMount) == "function" or type(stateNode.componentWillMount) == "function") then
			if type(stateNode.componentWillMount) == "function" then
				stateNode:componentWillMount()
			end
			if type(stateNode.UNSAFE_componentWillMount) == "function" then
				stateNode:UNSAFE_componentWillMount()
			end
		end
		if type(stateNode.componentDidMount) == "function" then
			if dEV and enableDoubleInvokingEffects then
				p4.flags = bit32.bor(p4.flags, mountLayoutDev, update)
			else
				p4.flags = bit32.bor(p4.flags, update)
			end
		end
	elseif type(stateNode.componentDidMount) == "function" then
		if dEV and enableDoubleInvokingEffects then
			p4.flags = bit32.bor(p4.flags, mountLayoutDev, update)
		else
			p4.flags = bit32.bor(p4.flags, update)
		end
	end
	p4.memoizedProps = p6
	p4.memoizedState = memoizedState_1
	stateNode.props = p6
	stateNode.state = memoizedState_1
	stateNode.context = var16
	
	return var18
end

return {
	adoptClassInstance = adoptClassInstance,
	constructClassInstance = constructClassInstance,
	mountClassInstance = mountClassInstance,
	resumeMountClassInstance = resumeMountClassInstance,
	updateClassInstance = function(p4, p5, p6, p7, p8)
		-- upvalues: cloneUpdateQueue (ref), resolveDefaultProps (ref), emptyContextObject (ref), readContext (ref), disableLegacyContext (ref), getUnmaskedContext (ref), getMaskedContext (ref), resetHasForceUpdateBeforeProcessing (ref), processUpdateQueue (ref), hasContextChanged (ref), checkHasForceUpdateAfterProcessing (ref), update (ref), snapshot (ref), applyDerivedStateFromProps (ref)
		local stateNode = p5.stateNode
		cloneUpdateQueue(p4, p5)
		local memoizedProps = p5.memoizedProps
		local var16 = if p5.type == p5.elementType then memoizedProps else resolveDefaultProps(p5.type, memoizedProps)
		stateNode.props = var16
		local pendingProps = p5.pendingProps
		local context = stateNode.context
		local contextType = nil
		local getDerivedStateFromProps = nil
		
		if type(p6) == "table" then
			contextType = p6.contextType
			getDerivedStateFromProps = p6.getDerivedStateFromProps
		end
		local var17
		local var18 = emptyContextObject
		
		if type(contextType) == "table" then
			var18 = readContext(contextType)
		elseif not disableLegacyContext then
			var18 = getMaskedContext(p5, getUnmaskedContext(p5, p6, true))
		end
		if getDerivedStateFromProps ~= nil then
			var17 = true
			
			if type(getDerivedStateFromProps) ~= "function" then
				var17 = stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function"
			end
			if not var17 and (stateNode.UNSAFE_componentWillReceiveProps ~= nil and type(stateNode.UNSAFE_componentWillReceiveProps) == "function" or stateNode.componentWillReceiveProps ~= nil and type(stateNode.componentWillReceiveProps) == "function") and (memoizedProps ~= pendingProps or context ~= var18) then
				callComponentWillReceiveProps(p5, stateNode, p7, var18)
			end
			resetHasForceUpdateBeforeProcessing()
			local memoizedState = p5.memoizedState
			stateNode.state = memoizedState
			local _ = stateNode.state
			processUpdateQueue(p5, p7, stateNode, p8)
			local memoizedState_1 = p5.memoizedState
			
			if memoizedProps == pendingProps and memoizedState == memoizedState_1 and (not hasContextChanged() and not checkHasForceUpdateAfterProcessing()) then
				if stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" and (memoizedProps ~= p4.memoizedProps or memoizedState ~= p4.memoizedState) then
					p5.flags = bit32.bor(p5.flags, update)
				end
				if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" and (memoizedProps ~= p4.memoizedProps or memoizedState ~= p4.memoizedState) then
					p5.flags = bit32.bor(p5.flags, snapshot)
				end
				return false
			elseif getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
				applyDerivedStateFromProps(p5, p6, getDerivedStateFromProps, p7)
				memoizedState_1 = p5.memoizedState
			end
			local var19 = checkHasForceUpdateAfterProcessing() or checkShouldComponentUpdate(p5, p6, var16, p7, memoizedState, memoizedState_1, var18)
			
			if var19 then
				if not var17 and (stateNode.UNSAFE_componentWillUpdate ~= nil and type(stateNode.UNSAFE_componentWillUpdate) == "function" or stateNode.componentWillUpdate ~= nil and type(stateNode.componentWillUpdate) == "function") then
					if stateNode.componentWillUpdate ~= nil and type(stateNode.componentWillUpdate) == "function" then
						stateNode:componentWillUpdate(p7, memoizedState_1, var18)
					end
					if stateNode.UNSAFE_componentWillUpdate ~= nil and type(stateNode.UNSAFE_componentWillUpdate) == "function" then
						stateNode:UNSAFE_componentWillUpdate(p7, memoizedState_1, var18)
					end
				end
				if stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" then
					p5.flags = bit32.bor(p5.flags, update)
				end
				if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" then
					p5.flags = bit32.bor(p5.flags, snapshot)
				end
			elseif stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" and (memoizedProps ~= p4.memoizedProps or memoizedState ~= p4.memoizedState) then
				p5.flags = bit32.bor(p5.flags, update)
			end
			if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" and (memoizedProps ~= p4.memoizedProps or memoizedState ~= p4.memoizedState) then
				p5.flags = bit32.bor(p5.flags, snapshot)
			end
			p5.memoizedProps = p7
			p5.memoizedState = memoizedState_1
			stateNode.props = p7
			stateNode.state = memoizedState_1
			stateNode.context = var18
			
			return var19
		end
	end,
	applyDerivedStateFromProps = applyDerivedStateFromProps,
	emptyRefsObject = refs
}