local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Object = require(Parent.LuauPolyfill).Object
local Console = require(Parent.Shared).console
local EnableAllocationTrims = require(Parent.Shared).ReactFeatureFlags.enableAllocationTrims
local ReactNoopUpdateQueueModule = require(script.Parent.ReactNoopUpdateQueue)
local t = {}
local DEV = ReactGlobalsModule.__DEV__
local COMPATWARNINGS = ReactGlobalsModule.__COMPAT_WARNINGS__

if DEV then
	Object.freeze(t)
end
local UninitializedState = require(Parent.Shared).UninitializedState

local function _(Text: string): string --[[ Line: 52 | Named "trimPath" ]]
	local Match: string? = string.match(Text, "%.%u[%.%w]-$")
	
	return if Match then string.gsub(Match, "^%.", "") else Text
end

local _ = function(p1, p2, p3) --[[ Line: 66 | Named "warnAboutExistingLifecycle" ]]
	-- upvalues: Console (copy)
	Console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", p1, p3, p2, p1)
end

local _ = function(p1, p2, p3) --[[ Line: 76 | Named "warnAboutDeprecatedLifecycleName" ]]
	-- upvalues: DEV (copy), COMPATWARNINGS (copy), Console (copy)
	if DEV and COMPATWARNINGS then
		local DebugInfo, DebugInfo2 = debug.info(3, "sln")
		local Match: string? = string.match(DebugInfo, "%.%u[%.%w]-$")
		Console.warn("%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s", p1, p2, p3, if Match then string.gsub(Match, "^%.", "") else DebugInfo, (tostring(DebugInfo2)))
	end
end

local config = {
	didMount = "componentDidMount",
	shouldUpdate = "shouldComponentUpdate",
	willUpdate = "UNSAFE_componentWillUpdate",
	didUpdate = "componentDidUpdate",
	willUnmount = "componentWillUnmount"
}

local function handleNewLifecycle(p1, p2, p3) --[[ Line: 98 ]]
	-- upvalues: config (copy), Console (copy), DEV (copy), COMPATWARNINGS (copy)
	if config[p2] ~= nil then
		if p1[config[p2]] == nil then
			if p2 == "willUpdate" and p1.componentWillUpdate then
				local ComponentName1 = p1.__componentName
				Console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", ComponentName1, "UNSAFE_componentWillUpdate", p2, ComponentName1)
			else
				local ComponentName = p1.__componentName
				local v1 = p2
				local Entry = config[p2]
				
				if DEV and COMPATWARNINGS then
					local DebugInfo, DebugInfo2 = debug.info(3, "sln")
					local Match: string? = string.match(DebugInfo, "%.%u[%.%w]-$")
					Console.warn("%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s", ComponentName, v1, Entry, if Match then string.gsub(Match, "^%.", "") else DebugInfo, (tostring(DebugInfo2)))
				end
			end
		else
			local ComponentName = p1.__componentName
			Console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", ComponentName, config[p2], p2, ComponentName)
		end
		p2 = config[p2]
	end
	rawset(p1, p2, p3)
end

local self = setmetatable({ __componentName = "Component" }, {
	__newindex = handleNewLifecycle,
	__index = { isReactComponent = true },
	__tostring = function(p1) --[[ Line: 128 ]]
		return p1.__componentName
	end
})
local v1: number = if ReactGlobalsModule.__TESTEZ_RUNNING_TEST__ then 0 else 900
local Count = 1
local Buffer = table.create(v1)

for _ = 1, v1 do
	table.insert(Buffer, {
		props = nil,
		context = nil,
		state = UninitializedState,
		__refs = t,
		__updater = ReactNoopUpdateQueueModule
	})
end
local function setStateInInit(p1, Callback, p2) --[[ Line: 164 ]]
	-- upvalues: DEV (copy), Console (copy), EnableAllocationTrims (copy), Object (copy)
	if DEV and p2 ~= nil then
		Console.warn("Received a `callback` argument to `setState` during initialization of \"%s\". The callback behavior is not supported when using `setState` in `init`.\n\nConsider defining similar behavior in a `compontentDidMount` method instead.", p1.__componentName)
	end
	local ValueType = Callback and type(Callback)
	
	if Callback == nil or ValueType ~= "table" and ValueType ~= "function" then
		error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
	end
	local State = p1.state
	local CallbackResult = if ValueType == "function" then Callback(State, p1.props) else Callback
	
	if EnableAllocationTrims then
		p1.state = if type(State) == "table" and getmetatable(State) == nil then Object.assign(table.clone(State), CallbackResult) else Object.assign({}, State, CallbackResult)
		
		return
	else
		p1.state = Object.assign({}, State, CallbackResult)
	end
end

function self.extend(p1, p2: string) --[[ Line: 213 ]]
	-- upvalues: COMPATWARNINGS (copy), Console (copy), Count (ref), v1 (copy), Buffer (copy), UninitializedState (copy), t (copy), ReactNoopUpdateQueueModule (copy), setStateInInit (copy)
	if p2 == nil then
		if COMPATWARNINGS then
			Console.warn("Component:extend() accepting no arguments is deprecated, and will not be supported in a future version of Roact. Please provide an explicit name.")
		end
		p2 = ""
	elseif type(p2) ~= "string" then
		error("Component class name must be a string")
	end
	local Module = {
		init = nil,
		__componentName = p2,
		setState = p1.setState,
		forceUpdate = p1.forceUpdate
	}
	Module.__index = Module
	
	function Module.__ctor(Props, Context, p3) --[[ Line: 247 ]]
		-- upvalues: Count (upval), v1 (upval), Buffer (upval), UninitializedState (upval), t (upval), ReactNoopUpdateQueueModule (upval), Module (copy), setStateInInit (upval)
		local BufferEntry = nil
		if Count <= v1 then
			BufferEntry = Buffer[Count]
			BufferEntry.props = Props
			BufferEntry.context = Context
			Buffer[Count] = nil
			Count += 1
		else
			BufferEntry = {
				props = Props,
				context = Context,
				state = UninitializedState,
				__refs = t,
				__updater = p3 or ReactNoopUpdateQueueModule
			}
		end
		local self = setmetatable(BufferEntry, Module)
		
		if Module.init and type(Module.init) == "function" then
			self.setState = setStateInInit
			Module.init(self, Props, Context)
			self.setState = nil
		end
		return self
	end
	
	setmetatable(Module, (getmetatable(p1)))
	
	return Module
end

function self.setState(p1, Callback, p2) --[[ Line: 339 ]]
	if Callback ~= nil and type(Callback) ~= "table" and type(Callback) ~= "function" then
		error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
	end
	p1.__updater.enqueueSetState(p1, Callback, p2, "setState")
end

function self.forceUpdate(p1, p2) --[[ Line: 368 ]]
	p1.__updater.enqueueForceUpdate(p1, p2, "forceUpdate")
end

if DEV then
	local config1 = {
		isMounted = {
			"isMounted",
			"Instead, make sure to clean up subscriptions and pending requests in componentWillUnmount to prevent memory leaks."
		},
		replaceState = {
			"replaceState",
			"Refactor your code to use setState instead (see https://github.com/facebook/react/issues/3236)."
		}
	}
	
	local _ = function(Key, Entry) --[[ Line: 392 ]]
		-- upvalues: self (copy), Console (copy)
		self[Key] = function() --[[ Line: 393 ]]
			-- upvalues: Console (upval), Entry (copy)
			Console.warn("%s(...) is deprecated in plain JavaScript React classes. %s", Entry[1], Entry[2])
			
			return nil
		end
	end
	
	for i, _ in config1 do
		if config1[i] ~= nil then
			local Entry = config1[i]
			
			self[i] = function() --[[ Line: 393 ]]
				-- upvalues: Console (copy), Entry (copy)
				Console.warn("%s(...) is deprecated in plain JavaScript React classes. %s", Entry[1], Entry[2])
				
				return nil
			end
		end
	end
end
local PureComponent = self:extend("PureComponent")
PureComponent.extend = self.extend
setmetatable(PureComponent, {
	__newindex = handleNewLifecycle,
	__index = { isReactComponent = true, isPureReactComponent = true },
	__tostring = function(p1) --[[ Line: 440 ]]
		return p1.__componentName
	end
})

return { Component = self, PureComponent = PureComponent }