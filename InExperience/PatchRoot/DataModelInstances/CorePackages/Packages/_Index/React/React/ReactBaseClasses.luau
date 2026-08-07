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

local function _(p0) --[[ line: 51 | named "trimPath" ]]
	local match = string.match(p0, "%.%u[%.%w]-$")
	
	return if match then string.gsub(match, "^%.", "") else p0
end

local _ = function(p1, p2, p3) --[[ line: 65 | named "warnAboutExistingLifecycle" ]]
	-- upvalues: console (ref)
	console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", p1, p3, p2, p1)
end

local _ = function(p4, p5, p6) --[[ line: 75 | named "warnAboutDeprecatedLifecycleName" ]]
	-- upvalues: dEV (ref), cOMPATWARNINGS (ref), console (ref)
	if dEV and cOMPATWARNINGS then
		local debugInfo, debugInfo_1 = debug.info(3, "sln")
		local match = string.match(debugInfo, "%.%u[%.%w]-$")
		console.warn("%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s", p4, p5, p6, if match then string.gsub(match, "^%.", "") else debugInfo, tostring(debugInfo_1))
	end
end

local t_2 = {
	didMount = "componentDidMount",
	shouldUpdate = "shouldComponentUpdate",
	willUpdate = "UNSAFE_componentWillUpdate",
	didUpdate = "componentDidUpdate",
	willUnmount = "componentWillUnmount"
}

local function handleNewLifecycle(p7, p8, p9) --[[ line: 97 ]]
	-- upvalues: t_2 (ref), console (ref), dEV (ref), cOMPATWARNINGS (ref)
	if t_2[p8] ~= nil then
		if p7[t_2[p8]] ~= nil then
			local componentName = p7.__componentName
			console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", componentName, t_2[p8], p8, componentName)
		elseif p8 == "willUpdate" and p7.componentWillUpdate then
			local componentName = p7.__componentName
			console.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", componentName, "UNSAFE_componentWillUpdate", p8, componentName)
		else
			local componentName = p7.__componentName
			local var18 = p8
			local var19 = t_2[p8]
			
			if dEV and cOMPATWARNINGS then
				local debugInfo, debugInfo_1 = debug.info(3, "sln")
				local match = string.match(debugInfo, "%.%u[%.%w]-$")
				console.warn("%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s", componentName, var18, var19, if match then string.gsub(match, "^%.", "") else debugInfo, tostring(debugInfo_1))
			end
		end
		p8 = t_2[p8]
	end
	rawset(p7, p8, p9)
end

local tbl = setmetatable({ __componentName = "Component" }, {
	__newindex = handleNewLifecycle,
	__index = t_1,
	__tostring = function(p10) --[[ line: 127 ]]
		return p10.__componentName
	end
})
local var7 = if not reactGlobalsModule.__TESTEZ_RUNNING_TEST__ then 900 else 0
local var8 = 1
local list = table.create(var7)

for i = 1, var7 do
	table.insert(list, {
		props = nil,
		context = nil,
		state = uninitializedState,
		__refs = t,
		__updater = reactNoopUpdateQueueModule
	})
end
local function setStateInInit(value, p11, p12) --[[ line: 163 ]]
	-- upvalues: dEV (ref), console (ref), object (ref)
	if dEV and p12 ~= nil then
		console.warn("Received a `callback` argument to `setState` during initialization of \"%s\". The callback behavior is not supported when using `setState` in `init`.\n\nConsider defining similar behavior in a `compontentDidMount` method instead.", value.__componentName)
	end
	local var23 = p11 and type(p11)
	
	if p11 == nil or var23 ~= "table" and var23 ~= "function" then
		error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
	end
	local state = value.state
	value.state = object.assign({}, state, if var23 == "function" then p11(state, value.props) else p11)
end

function tbl.extend(p13, p14) --[[ line: 203 ]]
	-- upvalues: cOMPATWARNINGS (ref), console (ref), var8 (write), var7 (ref), list (ref), uninitializedState (ref), t (ref), reactNoopUpdateQueueModule (ref), setStateInInit (ref)
	if p14 == nil then
		if cOMPATWARNINGS then
			console.warn("Component:extend() accepting no arguments is deprecated, and will not be supported in a future version of Roact. Please provide an explicit name.")
		end
		p14 = ""
	elseif type(p14) ~= "string" then
		error("Component class name must be a string")
	end
	local t_1 = {
		init = nil,
		__componentName = p14,
		setState = p13.setState,
		forceUpdate = p13.forceUpdate
	}
	t_1.__index = t_1
	
	function t_1.__ctor(p15, p16, p17) --[[ line: 237 ]]
		-- upvalues: var8 (copy), var7 (copy), list (copy), uninitializedState (copy), t (copy), reactNoopUpdateQueueModule (copy), t_1 (ref), setStateInInit (copy)
		local var25
		local _ = nil
		
		if var8 <= var7 then
			var25 = list[var8]
			var25.props = p15
			var25.context = p16
			list[var8] = nil
			var8 += 1
		else
			var25 = {
				props = p15,
				context = p16,
				state = uninitializedState,
				__refs = t,
				__updater = p17 or reactNoopUpdateQueueModule
			}
		end
		local tbl = setmetatable(var25, t_1)
		
		if t_1.init and type(t_1.init) == "function" then
			tbl.setState = setStateInInit
			t_1.init(tbl, p15, p16)
			tbl.setState = nil
		end
		return tbl
	end
	
	setmetatable(t_1, getmetatable(p13))
	
	return t_1
end

function tbl.setState(value, p18, p19) --[[ line: 329 ]]
	if p18 ~= nil and type(p18) ~= "table" and type(p18) ~= "function" then
		error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
	end
	value.__updater.enqueueSetState(value, p18, p19, "setState")
end

function tbl.forceUpdate(p20, p21) --[[ line: 358 ]]
	p20.__updater.enqueueForceUpdate(p20, p21, "forceUpdate")
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
	
	i = function(p22, p23) --[[ line: 382 ]]
		-- upvalues: tbl (ref), console (ref)
		tbl[p22] = function() --[[ line: 383 ]]
			-- upvalues: console (copy), p23 (ref)
			console.warn("%s(...) is deprecated in plain JavaScript React classes. %s", p23[1], p23[2])
			
			return nil
		end
	end
	
	for i_1, v in t_3 do
		if t_3[i_1] ~= nil then
			local var12 = t_3[i_1]
			
			tbl[i_1] = function() --[[ line: 383 ]]
				-- upvalues: console (ref), var12 (ref)
				console.warn("%s(...) is deprecated in plain JavaScript React classes. %s", var12[1], var12[2])
				
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
	__tostring = function(p24) --[[ line: 430 ]]
		return p24.__componentName
	end
})

return { Component = tbl, PureComponent = pureComponent }