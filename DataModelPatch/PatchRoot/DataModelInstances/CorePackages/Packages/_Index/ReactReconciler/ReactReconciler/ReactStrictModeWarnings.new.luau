local Parent = script.Parent.Parent
local Console = require(Parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local ReactCurrentFiberModule = require(script.Parent.ReactCurrentFiber)
local ResetCurrentFiberFunction = ReactCurrentFiberModule.resetCurrentFiber
local SetCurrentFiberFunction = ReactCurrentFiberModule.setCurrentFiber
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local StrictMode = require(script.Parent.ReactTypeOfMode).StrictMode
local ReactStrictModeWarningsModule = {
	recordUnsafeLifecycleWarnings = function(_, _) end,
	flushPendingUnsafeLifecycleWarnings = function() end,
	recordLegacyContextWarning = function(_, _) end,
	flushLegacyContextWarning = function() end,
	discardPendingWarnings = function() end
}

if require(Parent.ReactGlobals).__DEV__ then
	local function _(Return)
		-- upvalues: StrictMode (copy)
		local v1 = nil
		local Return1 = Return
		while Return1 ~= nil do
			if bit32.band(Return1.mode, StrictMode) ~= 0 then
				v1 = Return1
			end
			Return1 = Return1.return_
		end
		return v1
	end
	
	local function v6(List): string
		local List1 = {}
		
		for i, _ in List do
			table.insert(List1, i)
		end
		table.sort(List1)
		
		return table.concat(List1, ", ")
	end
	
	local Tbl = {}
	local Tbl1 = {}
	local Tbl2 = {}
	local Tbl3 = {}
	local Tbl4 = {}
	local Tbl5 = {}
	local t = {}
	
	function ReactStrictModeWarningsModule.recordUnsafeLifecycleWarnings(p1, p2)
		-- upvalues: t (copy), Tbl (copy), StrictMode (copy), Tbl1 (copy), Tbl2 (copy), Tbl3 (copy), Tbl4 (copy), Tbl5 (copy)
		if t[p1.type] then return end
		if typeof(p2.componentWillMount) == "function" then
			table.insert(Tbl, p1)
		end
		if bit32.band(p1.mode, StrictMode) ~= 0 and typeof(p2.UNSAFE_componentWillMount) == "function" then
			table.insert(Tbl1, p1)
		end
		if typeof(p2.componentWillReceiveProps) == "function" then
			table.insert(Tbl2, p1)
		end
		if bit32.band(p1.mode, StrictMode) ~= 0 and typeof(p2.UNSAFE_componentWillReceiveProps) == "function" then
			table.insert(Tbl3, p1)
		end
		if typeof(p2.componentWillUpdate) == "function" then
			table.insert(Tbl4, p1)
		end
		if bit32.band(p1.mode, StrictMode) ~= 0 and typeof(p2.UNSAFE_componentWillUpdate) == "function" then
			table.insert(Tbl5, p1)
		end
	end
	
	function ReactStrictModeWarningsModule.flushPendingUnsafeLifecycleWarnings()
		-- upvalues: Tbl (copy), GetComponentNameFunction (copy), t (copy), Tbl1 (copy), Tbl2 (copy), Tbl3 (copy), Tbl4 (copy), Tbl5 (copy), v6 (copy), Console (copy)
		local t1 = {}
		
		if #Tbl > 0 then
			for _, value in Tbl do
				t1[GetComponentNameFunction(value.type) or "Component"] = true
				t[value.type] = true
			end
			table.clear(Tbl)
		end
		local t2 = {}
		
		if #Tbl1 > 0 then
			for _, value1 in Tbl1 do
				t2[GetComponentNameFunction(value1.type) or "Component"] = true
				t[value1.type] = true
			end
			table.clear(Tbl1)
		end
		local t3 = {}
		
		if #Tbl2 > 0 then
			for _, value2 in Tbl2 do
				t3[GetComponentNameFunction(value2.type) or "Component"] = true
				t[value2.type] = true
			end
			table.clear(Tbl2)
		end
		local t4 = {}
		
		if #Tbl3 > 0 then
			for _, value3 in Tbl3 do
				t4[GetComponentNameFunction(value3.type) or "Component"] = true
				t[value3.type] = true
			end
			table.clear(Tbl3)
		end
		local t5 = {}
		
		if #Tbl4 > 0 then
			for _, value4 in Tbl4 do
				t5[GetComponentNameFunction(value4.type) or "Component"] = true
				t[value4.type] = true
			end
			table.clear(Tbl4)
		end
		local t6 = {}
		
		if #Tbl5 > 0 then
			for _, value5 in Tbl5 do
				t6[GetComponentNameFunction(value5.type) or "Component"] = true
				t[value5.type] = true
			end
			table.clear(Tbl5)
		end
		if next(t2) ~= nil then
			Console.error("Using UNSAFE_componentWillMount in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n\nPlease update the following components: %s", (v6(t2)))
		end
		if next(t4) ~= nil then
			Console.error("Using UNSAFE_componentWillReceiveProps in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n\nPlease update the following components: %s", (v6(t4)))
		end
		if next(t6) ~= nil then
			Console.error("Using UNSAFE_componentWillUpdate in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n\nPlease update the following components: %s", (v6(t6)))
		end
		if next(t1) ~= nil then
			Console.warn("componentWillMount has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n* Rename componentWillMount to UNSAFE_componentWillMount to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", (v6(t1)))
		end
		if next(t3) ~= nil then
			Console.warn("componentWillReceiveProps has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n* Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", (v6(t3)))
		end
		if next(t5) ~= nil then
			Console.warn("componentWillUpdate has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* Rename componentWillUpdate to UNSAFE_componentWillUpdate to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", (v6(t5)))
		end
	end
	
	local Tbl6 = {}
	local t1 = {}
	
	function ReactStrictModeWarningsModule.recordLegacyContextWarning(Return, p1)
		-- upvalues: StrictMode (copy), Console (copy), t1 (copy), Tbl6 (copy)
		local v2 = nil
		local Return1 = Return
		while Return1 ~= nil do
			if bit32.band(Return1.mode, StrictMode) ~= 0 then
				v2 = Return1
			end
			Return1 = Return1.return_
		end
		local v3 = v2
		
		if v3 == nil then
			Console.error("Expected to find a StrictMode component in a strict mode tree. This error is likely caused by a bug in React. Please file an issue.")
			
			return
		end
		if t1[Return.type] then return end
		local Entry = Tbl6[v3]
		
		if typeof(Return.type) ~= "function" and (Return.type.contextTypes ~= nil or Return.type.childContextTypes ~= nil or p1 ~= nil and typeof(p1.getChildContext) == "function") then
			if Entry == nil then
				Entry = {}
				Tbl6[v3] = Entry
			end
			table.insert(Entry, Return)
		end
	end
	
	function ReactStrictModeWarningsModule.flushLegacyContextWarning()
		-- upvalues: Tbl6 (copy), GetComponentNameFunction (copy), t1 (copy), v6 (copy), SetCurrentFiberFunction (copy), Console (copy), ResetCurrentFiberFunction (copy)
		for _, value in Tbl6 do
			if #value == 0 then break end
			local Entry = value[1]
			local t = {}
			
			for _, value1 in value do
				t[GetComponentNameFunction(value1.type) or "Component"] = true
				t1[value1.type] = true
			end
			local v4 = v6(t)
			local Success, Result = pcall(function()
				-- upvalues: SetCurrentFiberFunction (upval), Entry (copy), Console (upval), v4 (copy)
				SetCurrentFiberFunction(Entry)
				Console.error("Legacy context API has been detected within a strict-mode tree.\n\nThe old API will be supported in all 16.x releases, but applications using it should migrate to the new version.\n\nPlease update the following components: %s\n\nLearn more about this warning here: https://reactjs.org/link/legacy-context", v4)
			end)
			ResetCurrentFiberFunction()
			
			if not Success then
				error(Result)
			end
		end
	end
	
	function ReactStrictModeWarningsModule.discardPendingWarnings()
		-- upvalues: Tbl (copy), Tbl1 (copy), Tbl2 (copy), Tbl3 (copy), Tbl4 (copy), Tbl5 (copy), Tbl6 (copy)
		table.clear(Tbl)
		table.clear(Tbl1)
		table.clear(Tbl2)
		table.clear(Tbl3)
		table.clear(Tbl4)
		table.clear(Tbl5)
		table.clear(Tbl6)
	end
end
return ReactStrictModeWarningsModule