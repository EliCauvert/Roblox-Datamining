local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local object = require(parent.LuauPolyfill).Object
local console = require(parent.Shared).console
local _ = require(parent.Shared)
local reactNoopUpdateQueueModule = require(script.Parent.ReactNoopUpdateQueue)
local t = {}
local dEV = reactGlobalsModule.__DEV__
local cOMPATWARNINGS = reactGlobalsModule.__COMPAT_WARNINGS__

if dEV then
	object.freeze(t)
end
local uninitializedState = require(parent.Shared).UninitializedState
local t_1 = { isReactComponent = true }

local function _(p1)
	local match = string.match(p1, "%.%u[%.%w]-$")
	
	return if match then string.gsub(match, "^%.", "") else p1
end

local _ = function(p1, p2, p3)
	-- upvalues: console (ref)
	console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", p1, p3, p2, p1)
end

local _ = function(p1, p2, p3)
	-- upvalues: dEV (ref), cOMPATWARNINGS (ref), console (ref)
	if dEV and cOMPATWARNINGS then
		local debugInfo, debugInfo_1 = debug.info(3, "sln")
		local match = string.match(debugInfo, "%.%u[%.%w]-$")
		console.warn("%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s", p1, p2, p3, if match then string.gsub(match, "^%.", "") else debugInfo, tostring(debugInfo_1))
	end
end

local t_2 = {
	didMount = "componentDidMount",
	shouldUpdate = "shouldComponentUpdate",
	willUpdate = "UNSAFE_componentWillUpdate",
	didUpdate = "componentDidUpdate",
	willUnmount = "componentWillUnmount"
}

local function handleNewLifecycle(p1, p2, p3)
	-- upvalues: t_2 (ref), console (ref), dEV (ref), cOMPATWARNINGS (ref)
	if t_2[p2] ~= nil then
		if p1[t_2[p2]] ~= nil then
			local componentName = p1.__componentName
			console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", componentName, t_2[p2], p2, componentName)
		elseif p2 == "willUpdate" and p1.componentWillUpdate then
			local componentName = p1.__componentName
			console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", componentName, "UNSAFE_componentWillUpdate", p2, componentName)
		else
			local componentName = p1.__componentName
			local var1 = p2
			local var2 = t_2[p2]
			
			if dEV and cOMPATWARNINGS then
				local debugInfo, debugInfo_1 = debug.info(3, "sln")
				local match = string.match(debugInfo, "%.%u[%.%w]-$")
				console.warn("%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s", componentName, var1, var2, if match then string.gsub(match, "^%.", "") else debugInfo, tostring(debugInfo_1))
			end
		end
		p2 = t_2[p2]
	end
	rawset(p1, p2, p3)
end

local tbl = setmetatable({ __componentName = "Component" }, {
	__newindex = handleNewLifecycle,
	__index = t_1,
	__tostring = function(p1)
		return p1.__componentName
	end
})
local var1 = if not reactGlobalsModule.__TESTEZ_RUNNING_TEST__ then 900 else 0
local var2 = 1
local list = table.create(var1)

for i = 1, var1 do
	table.insert(list, {
		props = nil,
		context = nil,
		state = uninitializedState,
		__refs = t,
		__updater = reactNoopUpdateQueueModule
	})
end
local function setStateInInit(value, p1, p2)
	-- upvalues: dEV (ref), console (ref), object (ref)
	if dEV and p2 ~= nil then
		console.warn("Received a `callback` argument to `setState` during initialization of \"%s\". The callback behavior is not supported when using `setState` in `init`.\n\nConsider defining similar behavior in a `compontentDidMount` method instead.", value.__componentName)
	end
	local var3 = p1 and type(p1)
	
	if p1 == nil or var3 ~= "table" and var3 ~= "function" then
		error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
	end
	local state = value.state
	value.state = object.assign({}, state, if var3 == "function" then p1(state, value.props) else p1)
end

function tbl.extend(p1, p2)
	-- upvalues: cOMPATWARNINGS (ref), console (ref), var2 (write), var1 (ref), list (ref), uninitializedState (ref), t (ref), reactNoopUpdateQueueModule (ref), setStateInInit (ref)
	if p2 == nil then
		if cOMPATWARNINGS then
			console.warn("Component:extend() accepting no arguments is deprecated, and will not be supported in a future version of Roact. Please provide an explicit name.")
		end
		p2 = ""
	elseif type(p2) ~= "string" then
		error("Component class name must be a string")
	end
	local t_1 = {
		init = nil,
		__componentName = p2,
		setState = p1.setState,
		forceUpdate = p1.forceUpdate
	}
	t_1.__index = t_1
	
	function t_1.__ctor(p3, p4, p5)
		-- upvalues: var2 (copy), var1 (copy), list (copy), uninitializedState (copy), t (copy), reactNoopUpdateQueueModule (copy), t_1 (ref), setStateInInit (copy)
		local var3
		local _ = nil
		
		if var2 <= var1 then
			var3 = list[var2]
			var3.props = p3
			var3.context = p4
			list[var2] = nil
			var2 += 1
		else
			var3 = {
				props = p3,
				context = p4,
				state = uninitializedState,
				__refs = t,
				__updater = p5 or reactNoopUpdateQueueModule
			}
		end
		local tbl = setmetatable(var3, t_1)
		
		if t_1.init and type(t_1.init) == "function" then
			tbl.setState = setStateInInit
			t_1.init(tbl, p3, p4)
			tbl.setState = nil
		end
		return tbl
	end
	
	setmetatable(t_1, getmetatable(p1))
	
	return t_1
end

function tbl.setState(value, p1, p2)
	if p1 ~= nil and type(p1) ~= "table" and type(p1) ~= "function" then
		error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
	end
	value.__updater.enqueueSetState(value, p1, p2, "setState")
end

function tbl.forceUpdate(p1, p2)
	p1.__updater.enqueueForceUpdate(p1, p2, "forceUpdate")
end

if dEV then
	local t_3 = {
		isMounted = {
			"isMounted",
			"Instead, make sure to clean up subscriptions and pending requests in componentWillUnmount to prevent memory leaks."
		},
		replaceState = {
			"replaceState",
			"Refactor your code to use setState instead (see https://github.com/facebook/react/issues/3236)."
		}
	}
	
	i = function(p1, p2)
		-- upvalues: tbl (ref), console (ref)
		tbl[p1] = function()
			-- upvalues: console (copy), p2 (ref)
			console.warn("%s(...) is deprecated in plain JavaScript React classes. %s", p2[1], p2[2])
			
			return nil
		end
	end
	
	for i_1, v in t_3 do
		if t_3[i_1] ~= nil then
			local var3 = t_3[i_1]
			
			tbl[i_1] = function()
				-- upvalues: console (ref), var3 (ref)
				console.warn("%s(...) is deprecated in plain JavaScript React classes. %s", var3[1], var3[2])
				
				return nil
			end
		end
	end
end
local pureComponent = tbl:extend("PureComponent")
pureComponent.extend = tbl.extend
setmetatable(pureComponent, {
	__newindex = handleNewLifecycle,
	__index = { isReactComponent = true, isPureReactComponent = true },
	__tostring = function(p1)
		return p1.__componentName
	end
})

return { Component = tbl, PureComponent = pureComponent }