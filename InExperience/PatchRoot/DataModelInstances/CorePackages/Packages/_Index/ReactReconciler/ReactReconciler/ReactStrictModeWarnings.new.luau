local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local reactCurrentFiberModule = require(script.Parent.ReactCurrentFiber)
local resetCurrentFiber = reactCurrentFiberModule.resetCurrentFiber
local setCurrentFiber = reactCurrentFiberModule.setCurrentFiber
local getComponentName = require(parent.Shared).getComponentName
local strictMode = require(script.Parent.ReactTypeOfMode).StrictMode
local t = {
	recordUnsafeLifecycleWarnings = function(_, _) --[[ line: 32 ]] end,
	flushPendingUnsafeLifecycleWarnings = function() --[[ line: 33 ]] end,
	recordLegacyContextWarning = function(_, _) --[[ line: 34 ]] end,
	flushLegacyContextWarning = function() --[[ line: 35 ]] end,
	discardPendingWarnings = function() --[[ line: 36 ]] end
}

if reactGlobalsModule.__DEV__ then
	local _ = function(p0) --[[ line: 40 ]]
		-- upvalues: strictMode (ref)
		local var13 = nil
		local var14 = p0
		while var14 ~= nil do
			if bit32.band(var14.mode, strictMode) ~= 0 then
				var13 = var14
			end
			var14 = var14.return_
		end
		return var13
	end
	
	local var3 = function(p1) --[[ line: 55 ]]
		local t = {}
		
		for i, v in p1 do
			table.insert(t, i)
		end
		table.sort(t)
		
		return table.concat(t, ", ")
	end
	
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local t_7 = {}
	
	function t.recordUnsafeLifecycleWarnings(p2, p3) --[[ line: 74 ]]
		-- upvalues: t_7 (ref), t_1 (ref), strictMode (ref), t_2 (ref), t_3 (ref), t_4 (ref), t_5 (ref), t_6 (ref)
		if t_7[p2.type] then return end
		if typeof(p3.componentWillMount) == "function" then
			table.insert(t_1, p2)
		end
		if bit32.band(p2.mode, strictMode) ~= 0 and typeof(p3.UNSAFE_componentWillMount) == "function" then
			table.insert(t_2, p2)
		end
		if typeof(p3.componentWillReceiveProps) == "function" then
			table.insert(t_3, p2)
		end
		if bit32.band(p2.mode, strictMode) ~= 0 and typeof(p3.UNSAFE_componentWillReceiveProps) == "function" then
			table.insert(t_4, p2)
		end
		if typeof(p3.componentWillUpdate) == "function" then
			table.insert(t_5, p2)
		end
		if bit32.band(p2.mode, strictMode) ~= 0 and typeof(p3.UNSAFE_componentWillUpdate) == "function" then
			table.insert(t_6, p2)
		end
	end
	
	function t.flushPendingUnsafeLifecycleWarnings() --[[ line: 130 ]]
		-- upvalues: t_1 (ref), getComponentName (ref), t_7 (ref), t_2 (ref), t_3 (ref), t_4 (ref), t_5 (ref), t_6 (ref), var3 (ref), console (ref)
		local t = {}
		
		if #t_1 > 0 then
			for i, v in t_1 do
				t[getComponentName(v.type) or "Component"] = true
				t_7[v.type] = true
			end
			table.clear(t_1)
		end
		local t_8 = {}
		
		if #t_2 > 0 then
			for i, v in t_2 do
				t_8[getComponentName(v.type) or "Component"] = true
				t_7[v.type] = true
			end
			table.clear(t_2)
		end
		local t_9 = {}
		
		if #t_3 > 0 then
			for i, v in t_3 do
				t_9[getComponentName(v.type) or "Component"] = true
				t_7[v.type] = true
			end
			table.clear(t_3)
		end
		local t_10 = {}
		
		if #t_4 > 0 then
			for i, v in t_4 do
				t_10[getComponentName(v.type) or "Component"] = true
				t_7[v.type] = true
			end
			table.clear(t_4)
		end
		local t_11 = {}
		
		if #t_5 > 0 then
			for i, v in t_5 do
				t_11[getComponentName(v.type) or "Component"] = true
				t_7[v.type] = true
			end
			table.clear(t_5)
		end
		local t_12 = {}
		
		if #t_6 > 0 then
			for i, v in t_6 do
				t_12[getComponentName(v.type) or "Component"] = true
				t_7[v.type] = true
			end
			table.clear(t_6)
		end
		if next(t_8) ~= nil then
			console.error("Using UNSAFE_componentWillMount in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n\nPlease update the following components: %s", var3(t_8))
		end
		if next(t_10) ~= nil then
			console.error("Using UNSAFE_componentWillReceiveProps in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n\nPlease update the following components: %s", var3(t_10))
		end
		if next(t_12) ~= nil then
			console.error("Using UNSAFE_componentWillUpdate in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n\nPlease update the following components: %s", var3(t_12))
		end
		if next(t) ~= nil then
			console.warn("componentWillMount has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n* Rename componentWillMount to UNSAFE_componentWillMount to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", var3(t))
		end
		if next(t_9) ~= nil then
			console.warn("componentWillReceiveProps has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n* Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", var3(t_9))
		end
		if next(t_11) ~= nil then
			console.warn("componentWillUpdate has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* Rename componentWillUpdate to UNSAFE_componentWillUpdate to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", var3(t_11))
		end
	end
	
	local t_8 = {}
	local t_9 = {}
	
	function t.recordLegacyContextWarning(p4, p5) --[[ line: 303 ]]
		-- upvalues: strictMode (ref), console (ref), t_9 (ref), t_8 (ref)
		local t = nil
		local var23 = p4
		while var23 ~= nil do
			if bit32.band(var23.mode, strictMode) ~= 0 then
				t = var23
			end
			var23 = var23.return_
		end
		if t == nil then
			console.error("Expected to find a StrictMode component in a strict mode tree. This error is likely caused by a bug in React. Please file an issue.")
			
			return
		elseif t_9[p4.type] then return end
		t = t_8[t]
		
		if typeof(p4.type) ~= "function" and (p4.type.contextTypes ~= nil or p4.type.childContextTypes ~= nil or p5 ~= nil and typeof(p5.getChildContext) == "function") then
			if t == nil then
				t = {}
				t_8[t] = t
			end
			table.insert(t, p4)
		end
	end
	
	function t.flushLegacyContextWarning() --[[ line: 342 ]]
		-- upvalues: t_8 (ref), getComponentName (ref), t_9 (ref), var3 (ref), setCurrentFiber (ref), console (ref), resetCurrentFiber (ref)
		for i, v in t_8 do
			if #v ~= 0 then
				local var24 = v[1]
				local t = {}
				
				for i_1, v_1 in v do
					t[getComponentName(v_1.type) or "Component"] = true
					t_9[v_1.type] = true
				end
				local var26 = var3(t)
				local ok, status = pcall(function() --[[ line: 357 ]]
					-- upvalues: setCurrentFiber (copy), var24 (ref), console (copy), var26 (ref)
					setCurrentFiber(var24)
					console.error("Legacy context API has been detected within a strict-mode tree.\n\nThe old API will be supported in all 16.x releases, but applications using it should migrate to the new version.\n\nPlease update the following components: %s\n\nLearn more about this warning here: https://reactjs.org/link/legacy-context", var26)
				end)
				resetCurrentFiber()
				
				if not ok then
					error(status)
				end
			end
			return
		end
	end
	
	function t.discardPendingWarnings() --[[ line: 378 ]]
		-- upvalues: t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref), t_5 (ref), t_6 (ref), t_8 (ref)
		table.clear(t_1)
		table.clear(t_2)
		table.clear(t_3)
		table.clear(t_4)
		table.clear(t_5)
		table.clear(t_6)
		table.clear(t_8)
	end
end
return t