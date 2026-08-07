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
	
	warnOnInvalidCallback = function(p0, p1) --[[ line: 140 | named "warnOnInvalidCallback" ]]
		-- upvalues: t_9 (ref), console (ref)
		if p0 == nil or type(p0) == "function" then return end
		local text = p1 .. "_" .. tostring(p0)
		
		if not t_9[text] then
			t_9[text] = true
			console.error("%s(...): Expected the last optional `callback` argument to be a function. Instead received: %s.", p1, tostring(p0))
		end
	end
	
	warnOnUndefinedDerivedState = function(_, _) --[[ line: 156 | named "warnOnUndefinedDerivedState" ]] end
end
local function applyDerivedStateFromProps(p2, p3, p4, p5) --[[ line: 199 ]]
	-- upvalues: dEV (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), warnOnUndefinedDerivedState (write), object (ref), noLanes (ref)
	local memoizedState = p2.memoizedState
	
	if dEV and debugRenderPhaseSideEffectsForStrictMode and bit32.band(p2.mode, strictMode) ~= 0 then
		disableLogs()
		local ok, status = xpcall(p4, describeError, p5, memoizedState)
		reenableLogs()
		
		if not ok then
			error(status)
		end
	end
	local var30 = p4(p5, memoizedState)
	
	if dEV then
		warnOnUndefinedDerivedState(p3, var30)
	end
	local var31 = if var30 == nil then memoizedState else object.assign({}, memoizedState, var30)
	p2.memoizedState = var31
	
	if p2.lanes == noLanes then
		p2.updateQueue.baseState = var31
	end
end

local var22 = nil

local function initializeClassComponentUpdater() --[[ line: 247 ]]
	-- upvalues: var22 (write), isMounted (ref), get (ref), createUpdate (ref), dEV (ref), warnOnInvalidCallback (write), enqueueUpdate (ref), enableDebugTracing (ref), debugTracingMode (ref), getComponentName (ref), logStateUpdateScheduled (ref), enableSchedulingProfiler (ref), markStateUpdateScheduled (ref), replaceState (ref), forceUpdate (ref), logForceUpdateScheduled (ref), markForceUpdateScheduled (ref)
	local unknownModule = require(script.Parent["ReactFiberWorkLoop.new"])
	local requestEventTime = unknownModule.requestEventTime
	local requestUpdateLane = unknownModule.requestUpdateLane
	local scheduleUpdateOnFiber = unknownModule.scheduleUpdateOnFiber
	var22 = {
		isMounted = isMounted,
		enqueueSetState = function(value, p6, p7) --[[ line: 255 ]]
			-- upvalues: get (copy), requestEventTime (ref), requestUpdateLane (ref), createUpdate (copy), dEV (copy), warnOnInvalidCallback (copy), enqueueUpdate (copy), scheduleUpdateOnFiber (ref), enableDebugTracing (copy), debugTracingMode (copy), getComponentName (copy), logStateUpdateScheduled (copy), enableSchedulingProfiler (copy), markStateUpdateScheduled (copy)
			local var33 = get(value)
			local var34 = requestEventTime()
			local var35 = requestUpdateLane(var33)
			local var36 = createUpdate(var34, var35, p6, p7)
			
			if p7 ~= nil and dEV then
				warnOnInvalidCallback(p7, "setState")
			end
			enqueueUpdate(var33, var36)
			scheduleUpdateOnFiber(var33, var35, var34)
			
			if dEV and enableDebugTracing and bit32.band(var33.mode, debugTracingMode) ~= 0 then
				logStateUpdateScheduled(getComponentName(var33.type) or "Unknown", var35, p6)
			end
			if enableSchedulingProfiler then
				markStateUpdateScheduled(var33, var35)
			end
		end,
		enqueueReplaceState = function(p8, p9, p10) --[[ line: 285 ]]
			-- upvalues: get (copy), requestEventTime (ref), requestUpdateLane (ref), createUpdate (copy), replaceState (copy), dEV (copy), warnOnInvalidCallback (copy), enqueueUpdate (copy), scheduleUpdateOnFiber (ref), enableDebugTracing (copy), debugTracingMode (copy), getComponentName (copy), logStateUpdateScheduled (copy), enableSchedulingProfiler (copy), markStateUpdateScheduled (copy)
			local var37 = get(p8)
			local var38 = requestEventTime()
			local var39 = requestUpdateLane(var37)
			local var40 = createUpdate(var38, var39, p9, p10)
			var40.tag = replaceState
			
			if p10 ~= nil and dEV then
				warnOnInvalidCallback(p10, "replaceState")
			end
			enqueueUpdate(var37, var40)
			scheduleUpdateOnFiber(var37, var39, var38)
			
			if dEV and enableDebugTracing and bit32.band(var37.mode, debugTracingMode) ~= 0 then
				logStateUpdateScheduled(getComponentName(var37.type) or "Unknown", var39, p9)
			end
			if enableSchedulingProfiler then
				markStateUpdateScheduled(var37, var39)
			end
		end,
		enqueueForceUpdate = function(p11, p12) --[[ line: 317 ]]
			-- upvalues: get (copy), requestEventTime (ref), requestUpdateLane (ref), createUpdate (copy), forceUpdate (copy), dEV (copy), warnOnInvalidCallback (copy), enqueueUpdate (copy), scheduleUpdateOnFiber (ref), enableDebugTracing (copy), debugTracingMode (copy), getComponentName (copy), logForceUpdateScheduled (copy), enableSchedulingProfiler (copy), markForceUpdateScheduled (copy)
			local var41 = get(p11)
			local var42 = requestEventTime()
			local var43 = requestUpdateLane(var41)
			local var44 = createUpdate(var42, var43, nil, p12)
			var44.tag = forceUpdate
			
			if p12 ~= nil and dEV then
				warnOnInvalidCallback(p12, "forceUpdate")
			end
			enqueueUpdate(var41, var44)
			scheduleUpdateOnFiber(var41, var43, var42)
			
			if dEV and enableDebugTracing and bit32.band(var41.mode, debugTracingMode) ~= 0 then
				logForceUpdateScheduled(getComponentName(var41.type) or "Unknown", var43)
			end
			if enableSchedulingProfiler then
				markForceUpdateScheduled(var41, var43)
			end
		end
	}
end

local function _() --[[ line: 351 | named "getClassComponentUpdater" ]]
	-- upvalues: var22 (write), initializeClassComponentUpdater (ref)
	if var22 == nil then
		initializeClassComponentUpdater()
	end
	return var22
end

function checkShouldComponentUpdate(p13, p14, p15, p16, p17, p18, p19) --[[ line: 358 ]]
	-- upvalues: dEV (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), console (ref), getComponentName (ref), shallowEqual (ref)
	local stateNode = p13.stateNode
	
	if stateNode.shouldComponentUpdate == nil or type(stateNode.shouldComponentUpdate) ~= "function" then
		return if type(p14) == "table" and p14.isPureReactComponent then not shallowEqual(p15, p16) or not shallowEqual(p17, p18) else true
	elseif dEV and debugRenderPhaseSideEffectsForStrictMode and bit32.band(p13.mode, strictMode) ~= 0 then
		disableLogs()
		local ok, status = xpcall(stateNode.shouldComponentUpdate, describeError, stateNode, p16, p18, p19)
		reenableLogs()
		
		if not ok then
			error(status)
		end
	end
	local var45 = stateNode:shouldComponentUpdate(p16, p18, p19)
	
	if dEV and var45 == nil then
		console.error("%s.shouldComponentUpdate(): Returned nil instead of a boolean value. Make sure to return true or false.", getComponentName(p14) or "Component")
	end
	return var45
end

local function checkClassInstance(p20, p21, p22) --[[ line: 423 ]]
	-- upvalues: dEV (ref), getComponentName (ref), console (ref), disableLegacyContext (ref), t_7 (write), t_3 (write)
	local stateNode = p20.stateNode
	
	if dEV then
		local var46 = getComponentName(p21) or "Component"
		
		if not stateNode.render then
			if type(p21.render) == "function" then
				console.error("%s(...): No `render` method found on the returned component instance: did you accidentally return an object from the constructor?", var46)
			else
				console.error("%s(...): No `render` method found on the returned component instance: you may have forgotten to define `render`.", var46)
			end
		end
		if stateNode.getInitialState and not stateNode.getInitialState.isReactClassApproved and not stateNode.state then
			console.error("getInitialState was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Did you mean to define a state property instead?", var46)
		end
		if stateNode.getDefaultProps and not stateNode.getDefaultProps.isReactClassApproved then
			console.error("getDefaultProps was defined on %s, a plain JavaScript class. This is only supported for classes created using React.createClass. Use a static property to define defaultProps instead.", var46)
		end
		if stateNode.propTypes and not p21.propTypes then
			console.error("propTypes was defined as an instance property on %s. Use a static property to define propTypes instead.", var46)
		end
		if stateNode.contextType and not p21.contextType then
			console.error("contextType was defined as an instance property on %s. Use a static property to define contextType instead.", var46)
		end
		if disableLegacyContext then
			if p21.childContextTypes then
				console.error("%s uses the legacy childContextTypes API which is no longer supported. Use React.createContext() instead.", var46)
			end
			if p21.contextTypes then
				console.error("%s uses the legacy contextTypes API which is no longer supported. Use React.createContext() with static contextType instead.", var46)
			end
		elseif stateNode.contextTypes and not p21.contextTypes then
			console.error("contextTypes was defined as an instance property on %s. Use a static property to define contextTypes instead.", var46)
		end
		if type(p21) == "table" and p21.contextType and (p21.contextTypes and not t_7[p21]) then
			t_7[p21] = true
			console.error("%s declares both contextTypes and contextType static properties. The legacy contextTypes property will be ignored.", var46)
		end
		if type(stateNode.componentShouldUpdate) == "function" then
			console.error("%s has a method called componentShouldUpdate(). Did you mean shouldComponentUpdate()? The name is phrased as a question because the function is expected to return a value.", var46)
		end
		if type(p21) == "table" and p21.isPureReactComponent and stateNode.shouldComponentUpdate ~= nil then
			console.error("%s has a method called shouldComponentUpdate(). shouldComponentUpdate should not be used when extending React.PureComponent. Please extend React.Component if shouldComponentUpdate is used.", getComponentName(p21) or "A pure component")
		end
		if type(stateNode.componentDidUnmount) == "function" then
			console.error("%s has a method called componentDidUnmount(). But there is no such lifecycle method. Did you mean componentWillUnmount()?", var46)
		end
		if type(stateNode.componentDidReceiveProps) == "function" then
			console.error("%s has a method called componentDidReceiveProps(). But there is no such lifecycle method. If you meant to update the state in response to changing props, use componentWillReceiveProps(). If you meant to fetch data or run side-effects or mutations after React has updated the UI, use componentDidUpdate().", var46)
		end
		if type(stateNode.componentWillRecieveProps) == "function" then
			console.error("%s has a method called componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", var46)
		end
		if type(stateNode.UNSAFE_componentWillRecieveProps) == "function" then
			console.error("%s has a method called UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", var46)
		end
		if stateNode.props ~= nil and stateNode.props ~= p22 then
			console.error("%s(...): When calling super() in `%s`, make sure to pass up the same props that your component's constructor was passed.", var46, var46)
		end
		if rawget(stateNode, "defaultProps") then
			console.error("Setting defaultProps as an instance property on %s is not supported and will be ignored. Instead, define defaultProps as a static property on %s.", var46, var46)
		end
		if type(stateNode.getSnapshotBeforeUpdate) == "function" and type(stateNode.componentDidUpdate) ~= "function" and not t_3[p21] then
			t_3[p21] = true
			console.error("%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). This component defines getSnapshotBeforeUpdate() only.", getComponentName(p21))
		end
		local state = stateNode.state
		
		if state ~= nil and type(state) ~= "table" then
			console.error("%s.state: must be set to an object or nil", var46)
		end
		if type(p21) == "table" and type(stateNode.getChildContext) == "function" and type(p21.childContextTypes) ~= "table" then
			console.error("%s.getChildContext(): childContextTypes must be defined in order to use getChildContext().", var46)
		end
	end
end

local function adoptClassInstance(p23, p24) --[[ line: 657 ]]
	-- upvalues: var22 (write), initializeClassComponentUpdater (ref), set (ref), dEV (ref), t (ref)
	if var22 == nil then
		initializeClassComponentUpdater()
	end
	p24.__updater = var22
	p23.stateNode = p24
	set(p24, p23)
	
	if dEV then
		p24._reactInternalInstance = t
	end
end

local function constructClassInstance(p25, p26, p27) --[[ line: 668 ]]
	-- upvalues: emptyContextObject (ref), dEV (ref), REACT_CONTEXT_TYPE (ref), t_8 (write), REACT_PROVIDER_TYPE (ref), console (ref), getComponentName (ref), readContext (ref), disableLegacyContext (ref), getUnmaskedContext (ref), getMaskedContext (ref), debugRenderPhaseSideEffectsForStrictMode (ref), strictMode (ref), disableLogs (ref), describeError (ref), reenableLogs (ref), var22 (write), initializeClassComponentUpdater (ref), set (ref), t (ref), uninitializedState (ref), t_2 (write), t_4 (write), cacheContext (ref)
	local var47 = false
	local var48 = emptyContextObject
	local var49 = emptyContextObject
	local contextType = p26.contextType
	
	if dEV and p26.contextType ~= nil then
		if not (if contextType ~= nil then contextType["$$typeof"] == REACT_CONTEXT_TYPE and contextType._context == nil else true) and not t_8[p26] then
			t_8[p26] = true
			local var50 = ""
			
			if contextType == nil then
				var50 = " However, it is set to nil. This can be caused by a typo or by mixing up named and default imports. This can also happen due to a circular dependency, so try moving the createContext() call to a separate file."
			elseif type(contextType) ~= "table" then
				var50 = " However, it is set to a " .. type(contextType) .. "."
			elseif contextType["$$typeof"] == REACT_PROVIDER_TYPE then
				var50 = " Did you accidentally pass the Context.Provider instead?"
			elseif contextType._context == nil then
				var50 ..= " However, it is set to an object with keys {"
				
				for i, v in contextType do
					var50 ..= i .. ", "
				end
				var50 ..= "}."
			else
				var50 = " Did you accidentally pass the Context.Consumer instead?"
			end
			console.error("%s defines an invalid contextType. contextType should point to the Context object returned by React.createContext().%s", getComponentName(p26) or "Component", var50)
		end
	end
	if contextType ~= nil and type(contextType) == "table" then
		var49 = readContext(contextType)
	elseif not disableLegacyContext then
		var48 = getUnmaskedContext(p25, p26, true)
		var47 = p26.contextTypes ~= nil
		var49 = var47 and getMaskedContext(p25, var48) or emptyContextObject
	end
	if dEV and debugRenderPhaseSideEffectsForStrictMode and bit32.band(p25.mode, strictMode) ~= 0 then
		disableLogs()
		local ok, status = xpcall(p26.__ctor, describeError, p27, var49)
		reenableLogs()
		
		if not ok then
			error(status)
		end
	end
	local var51 = p26.__ctor(p27, var49)
	p25.memoizedState = var51.state
	local memoizedState = p25.memoizedState
	
	if var22 == nil then
		initializeClassComponentUpdater()
	end
	var51.__updater = var22
	p25.stateNode = var51
	set(var51, p25)
	
	if dEV then
		var51._reactInternalInstance = t
	end
	if dEV then
		if type(p26.getDerivedStateFromProps) == "function" and memoizedState == uninitializedState then
			local var52 = getComponentName(p26) or "Component"
			
			if not t_2[var52] then
				t_2[var52] = true
				console.error("`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. This is not recommended. Instead, define the initial state by passing an object to `self:setState` in the `init` method of `%s`. This ensures that `getDerivedStateFromProps` arguments have a consistent shape.", var52, var52)
			end
		end
		if type(p26.getDerivedStateFromProps) == "function" or type(var51.getSnapshotBeforeUpdate) == "function" then
			local var53 = nil
			local var54 = nil
			local var55 = nil
			
			if type(var51.componentWillMount) == "function" then
				var53 = "componentWillMount"
			elseif type(var51.UNSAFE_componentWillMount) == "function" then
				var53 = "UNSAFE_componentWillMount"
			end
			if type(var51.componentWillReceiveProps) == "function" then
				var54 = "componentWillReceiveProps"
			elseif type(var51.UNSAFE_componentWillReceiveProps) == "function" then
				var54 = "UNSAFE_componentWillReceiveProps"
			end
			if type(var51.componentWillUpdate) == "function" then
				var55 = "componentWillUpdate"
			elseif type(var51.UNSAFE_componentWillUpdate) == "function" then
				var55 = "UNSAFE_componentWillUpdate"
			end
			if var53 ~= nil or var54 ~= nil or var55 ~= nil then
				local var56 = getComponentName(p26) or "Component"
				local _ = nil
				local var57 = if type(p26.getDerivedStateFromProps) == "function" then "getDerivedStateFromProps()" else "getSnapshotBeforeUpdate()"
				local var58 = if var53 ~= nil then "" else "\n  " .. tostring(var53)
				local var59 = if var54 ~= nil then "" else "\n  " .. tostring(var54)
				local var60 = if var55 ~= nil then "" else "\n  " .. tostring(var55)
				
				if not t_4[var56] then
					t_4[var56] = true
					console.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\nThe above lifecycles should be removed. Learn more about this warning here:\nhttps://reactjs.org/link/unsafe-component-lifecycles", var56, var57, var58, var59, var60)
				end
			end
		end
	end
	if var47 then
		cacheContext(p25, var48, var49)
	end
	return var51
end

local function callComponentWillMount(p28, p29) --[[ line: 881 ]]
	-- upvalues: dEV (ref), console (ref), getComponentName (ref), var22 (write), initializeClassComponentUpdater (ref)
	local state = p29.state
	
	if p29.componentWillMount ~= nil and type(p29.componentWillMount) == "function" then
		p29:componentWillMount()
	end
	if p29.UNSAFE_componentWillMount ~= nil and type(p29.UNSAFE_componentWillMount) == "function" then
		p29:UNSAFE_componentWillMount()
	end
	if state ~= p29.state then
		if dEV then
			console.error("%s.componentWillMount(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.", getComponentName(p28.type) or "Component")
		end
		if var22 == nil then
			initializeClassComponentUpdater()
		end
		var22.enqueueReplaceState(p29, p29.state)
	end
end

function callComponentWillReceiveProps(p30, p31, p32, p33) --[[ line: 913 ]]
	-- upvalues: dEV (ref), getComponentName (ref), t_1 (write), console (ref), var22 (write), initializeClassComponentUpdater (ref)
	local state = p31.state
	
	if p31.componentWillReceiveProps ~= nil and type(p31.componentWillReceiveProps) == "function" then
		p31:componentWillReceiveProps(p32, p33)
	end
	if p31.UNSAFE_componentWillReceiveProps ~= nil and type(p31.UNSAFE_componentWillReceiveProps) == "function" then
		p31:UNSAFE_componentWillReceiveProps(p32, p33)
	end
	if p31.state ~= state then
		if dEV then
			local type = getComponentName(p30.type) or "Component"
			
			if not t_1[type] then
				t_1[type] = true
				console.error("%s.componentWillReceiveProps(): Assigning directly to this.state is deprecated (except inside a component's constructor). Use setState instead.", type)
			end
		end
		if var22 == nil then
			initializeClassComponentUpdater()
		end
		var22.enqueueReplaceState(p31, p31.state)
	end
end

local function mountClassInstance(p34, p35, p36, p37) --[[ line: 948 ]]
	-- upvalues: dEV (ref), checkClassInstance (ref), refs (ref), initializeUpdateQueue (ref), readContext (ref), disableLegacyContext (ref), emptyContextObject (ref), getUnmaskedContext (ref), getMaskedContext (ref), getComponentName (ref), t_6 (write), console (ref), strictMode (ref), unknownModule_1 (ref), warnAboutDeprecatedLifecycles (ref), processUpdateQueue (ref), applyDerivedStateFromProps (ref), callComponentWillMount (ref), enableDoubleInvokingEffects (ref), mountLayoutDev (ref), update (ref)
	if dEV then
		checkClassInstance(p34, p35, p36)
	end
	local stateNode = p34.stateNode
	stateNode.props = p36
	stateNode.state = p34.memoizedState
	stateNode.__refs = refs
	initializeUpdateQueue(p34)
	local var62 = if type(p35) == "table" then p35.contextType else nil
	
	if var62 ~= nil and type(var62) == "table" then
		stateNode.context = readContext(var62)
	elseif disableLegacyContext then
		stateNode.context = emptyContextObject
	else
		stateNode.context = getMaskedContext(p34, getUnmaskedContext(p34, p35, true))
	end
	if dEV then
		if stateNode.state == p36 then
			local var63 = getComponentName(p35) or "Component"
			
			if not t_6[var63] then
				t_6[var63] = true
				console.error("%s: It is not recommended to assign props directly to state because updates to props won't be reflected in state. In most cases, it is better to use props directly.", var63)
			end
		end
		if bit32.band(p34.mode, strictMode) ~= 0 then
			unknownModule_1.recordLegacyContextWarning(p34, stateNode)
		end
		if warnAboutDeprecatedLifecycles then
			unknownModule_1.recordUnsafeLifecycleWarnings(p34, stateNode)
		end
	end
	processUpdateQueue(p34, p36, stateNode, p37)
	stateNode.state = p34.memoizedState
	local var64 = type(p35)
	local var65 = if type(p35) == "table" then p35.getDerivedStateFromProps else nil
	
	if var65 ~= nil and type(var65) == "function" then
		applyDerivedStateFromProps(p34, p35, var65, p36)
		stateNode.state = p34.memoizedState
	end
	if var64 == "table" and type(p35.getDerivedStateFromProps) ~= "function" and type(stateNode.getSnapshotBeforeUpdate) ~= "function" and (type(stateNode.UNSAFE_componentWillMount) == "function" or type(stateNode.componentWillMount) == "function") then
		callComponentWillMount(p34, stateNode)
		processUpdateQueue(p34, p36, stateNode, p37)
		stateNode.state = p34.memoizedState
	end
	if type(stateNode.componentDidMount) == "function" then
		if dEV and enableDoubleInvokingEffects then
			p34.flags = bit32.bor(p34.flags, bit32.bor(mountLayoutDev, update))
			
			return
		end
		p34.flags = bit32.bor(p34.flags, update)
	end
end

function resumeMountClassInstance(p38, p39, p40, p41) --[[ line: 1059 ]]
	-- upvalues: emptyContextObject (ref), readContext (ref), disableLegacyContext (ref), getUnmaskedContext (ref), getMaskedContext (ref), resetHasForceUpdateBeforeProcessing (ref), processUpdateQueue (ref), hasContextChanged (ref), checkHasForceUpdateAfterProcessing (ref), dEV (ref), enableDoubleInvokingEffects (ref), mountLayoutDev (ref), update (ref), applyDerivedStateFromProps (ref)
	local stateNode = p38.stateNode
	local memoizedProps = p38.memoizedProps
	stateNode.props = memoizedProps
	local context = stateNode.context
	local contextType = p39.contextType
	local var66 = emptyContextObject
	
	if contextType ~= nil and type(contextType) == "table" then
		var66 = readContext(contextType)
	elseif not disableLegacyContext then
		var66 = getMaskedContext(p38, getUnmaskedContext(p38, p39, true))
	end
	local getDerivedStateFromProps = p39.getDerivedStateFromProps
	local var67 = if type(getDerivedStateFromProps) ~= "function" then type(stateNode.getSnapshotBeforeUpdate) == "function" else true
	
	if not var67 and (type(stateNode.UNSAFE_componentWillReceiveProps) == "function" or type(stateNode.componentWillReceiveProps) == "function") and (memoizedProps ~= p40 or context ~= var66) then
		callComponentWillReceiveProps(p38, stateNode, p40, var66)
	end
	resetHasForceUpdateBeforeProcessing()
	local memoizedState = p38.memoizedState
	stateNode.state = memoizedState
	processUpdateQueue(p38, p40, stateNode, p41)
	local memoizedState_1 = p38.memoizedState
	
	if memoizedProps == p40 and memoizedState == memoizedState_1 and (not hasContextChanged() and not checkHasForceUpdateAfterProcessing()) then
		if type(stateNode.componentDidMount) == "function" then
			if dEV and enableDoubleInvokingEffects then
				p38.flags = bit32.bor(p38.flags, mountLayoutDev, update)
			else
				p38.flags = bit32.bor(p38.flags, update)
			end
		end
		return false
	elseif getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
		applyDerivedStateFromProps(p38, p39, getDerivedStateFromProps, p40)
		memoizedState_1 = p38.memoizedState
	end
	local var68 = checkHasForceUpdateAfterProcessing() or checkShouldComponentUpdate(p38, p39, memoizedProps, p40, memoizedState, memoizedState_1, var66)
	
	if var68 then
		if not var67 and (type(stateNode.UNSAFE_componentWillMount) == "function" or type(stateNode.componentWillMount) == "function") then
			if type(stateNode.componentWillMount) == "function" then
				stateNode:componentWillMount()
			end
			if type(stateNode.UNSAFE_componentWillMount) == "function" then
				stateNode:UNSAFE_componentWillMount()
			end
		end
		if type(stateNode.componentDidMount) == "function" then
			if dEV and enableDoubleInvokingEffects then
				p38.flags = bit32.bor(p38.flags, mountLayoutDev, update)
			else
				p38.flags = bit32.bor(p38.flags, update)
			end
		end
	elseif type(stateNode.componentDidMount) == "function" then
		if dEV and enableDoubleInvokingEffects then
			p38.flags = bit32.bor(p38.flags, mountLayoutDev, update)
		else
			p38.flags = bit32.bor(p38.flags, update)
		end
	end
	p38.memoizedProps = p40
	p38.memoizedState = memoizedState_1
	stateNode.props = p40
	stateNode.state = memoizedState_1
	stateNode.context = var66
	
	return var68
end

return {
	adoptClassInstance = adoptClassInstance,
	constructClassInstance = constructClassInstance,
	mountClassInstance = mountClassInstance,
	resumeMountClassInstance = resumeMountClassInstance,
	updateClassInstance = function(p42, p43, p44, p45, p46) --[[ line: 1207 ]]
		-- upvalues: cloneUpdateQueue (ref), resolveDefaultProps (ref), emptyContextObject (ref), readContext (ref), disableLegacyContext (ref), getUnmaskedContext (ref), getMaskedContext (ref), resetHasForceUpdateBeforeProcessing (ref), processUpdateQueue (ref), hasContextChanged (ref), checkHasForceUpdateAfterProcessing (ref), update (ref), snapshot (ref), applyDerivedStateFromProps (ref)
		local stateNode = p43.stateNode
		cloneUpdateQueue(p42, p43)
		local memoizedProps = p43.memoizedProps
		local var69 = if p43.type == p43.elementType then memoizedProps else resolveDefaultProps(p43.type, memoizedProps)
		stateNode.props = var69
		local pendingProps = p43.pendingProps
		local context = stateNode.context
		local contextType = nil
		local getDerivedStateFromProps = nil
		
		if type(p44) == "table" then
			contextType = p44.contextType
			getDerivedStateFromProps = p44.getDerivedStateFromProps
		end
		local var71
		local var70 = emptyContextObject
		
		if type(contextType) == "table" then
			var70 = readContext(contextType)
		elseif not disableLegacyContext then
			var70 = getMaskedContext(p43, getUnmaskedContext(p43, p44, true))
		end
		if getDerivedStateFromProps ~= nil then
			var71 = true
			
			if type(getDerivedStateFromProps) ~= "function" then
				var71 = stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function"
			end
			if not var71 and (stateNode.UNSAFE_componentWillReceiveProps ~= nil and type(stateNode.UNSAFE_componentWillReceiveProps) == "function" or stateNode.componentWillReceiveProps ~= nil and type(stateNode.componentWillReceiveProps) == "function") and (memoizedProps ~= pendingProps or context ~= var70) then
				callComponentWillReceiveProps(p43, stateNode, p45, var70)
			end
			resetHasForceUpdateBeforeProcessing()
			local memoizedState = p43.memoizedState
			stateNode.state = memoizedState
			local _ = stateNode.state
			processUpdateQueue(p43, p45, stateNode, p46)
			local memoizedState_1 = p43.memoizedState
			
			if memoizedProps == pendingProps and memoizedState == memoizedState_1 and (not hasContextChanged() and not checkHasForceUpdateAfterProcessing()) then
				if stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" and (memoizedProps ~= p42.memoizedProps or memoizedState ~= p42.memoizedState) then
					p43.flags = bit32.bor(p43.flags, update)
				end
				if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" and (memoizedProps ~= p42.memoizedProps or memoizedState ~= p42.memoizedState) then
					p43.flags = bit32.bor(p43.flags, snapshot)
				end
				return false
			elseif getDerivedStateFromProps ~= nil and type(getDerivedStateFromProps) == "function" then
				applyDerivedStateFromProps(p43, p44, getDerivedStateFromProps, p45)
				memoizedState_1 = p43.memoizedState
			end
			local var72 = checkHasForceUpdateAfterProcessing() or checkShouldComponentUpdate(p43, p44, var69, p45, memoizedState, memoizedState_1, var70)
			
			if var72 then
				if not var71 and (stateNode.UNSAFE_componentWillUpdate ~= nil and type(stateNode.UNSAFE_componentWillUpdate) == "function" or stateNode.componentWillUpdate ~= nil and type(stateNode.componentWillUpdate) == "function") then
					if stateNode.componentWillUpdate ~= nil and type(stateNode.componentWillUpdate) == "function" then
						stateNode:componentWillUpdate(p45, memoizedState_1, var70)
					end
					if stateNode.UNSAFE_componentWillUpdate ~= nil and type(stateNode.UNSAFE_componentWillUpdate) == "function" then
						stateNode:UNSAFE_componentWillUpdate(p45, memoizedState_1, var70)
					end
				end
				if stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" then
					p43.flags = bit32.bor(p43.flags, update)
				end
				if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" then
					p43.flags = bit32.bor(p43.flags, snapshot)
				end
			elseif stateNode.componentDidUpdate ~= nil and type(stateNode.componentDidUpdate) == "function" and (memoizedProps ~= p42.memoizedProps or memoizedState ~= p42.memoizedState) then
				p43.flags = bit32.bor(p43.flags, update)
			end
			if stateNode.getSnapshotBeforeUpdate ~= nil and type(stateNode.getSnapshotBeforeUpdate) == "function" and (memoizedProps ~= p42.memoizedProps or memoizedState ~= p42.memoizedState) then
				p43.flags = bit32.bor(p43.flags, snapshot)
			end
			p43.memoizedProps = p45
			p43.memoizedState = memoizedState_1
			stateNode.props = p45
			stateNode.state = memoizedState_1
			stateNode.context = var70
			
			return var72
		end
	end,
	applyDerivedStateFromProps = applyDerivedStateFromProps,
	emptyRefsObject = refs
}