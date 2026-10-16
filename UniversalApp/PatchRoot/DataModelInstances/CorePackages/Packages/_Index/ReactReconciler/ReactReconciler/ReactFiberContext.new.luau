local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Object = LuauPolyfillModule.Object
local Error1 = LuauPolyfillModule.Error
local DEV = ReactGlobalsModule.__DEV__
local DISABLEALLWARNINGSEXCEPTPROPVALIDATION = ReactGlobalsModule.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local Console = require(Parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local ReactFiberStackNewModule = require(script.Parent["ReactFiberStack.new"])
local IsFiberMountedFunction = require(script.Parent.ReactFiberTreeReflection).isFiberMounted
local DisableLegacyContext = require(Parent.Shared).ReactFeatureFlags.disableLegacyContext
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local ClassComponent = ReactWorkTagsModule.ClassComponent
local HostRoot = ReactWorkTagsModule.HostRoot
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local CheckPropTypesFunction = require(Parent.Shared).checkPropTypes
local CreateCursorFunction = ReactFiberStackNewModule.createCursor
local PushFunction = ReactFiberStackNewModule.push
local PopFunction = ReactFiberStackNewModule.pop
local T = if DEV then {} else nil
local EmptyContextObject = {}

if DEV then
	Object.freeze(EmptyContextObject)
end
local Cursor = CreateCursorFunction(EmptyContextObject)
local Cursor1 = CreateCursorFunction(false)
local Current = EmptyContextObject
local Callback = nil

local function getUnmaskedContext(_, p1, p2) --[[ Line: 70 ]]
	-- upvalues: Callback (ref), Current (ref), Cursor (copy)
	return if p2 and Callback(p1) then Current else Cursor.current
end

Callback = function(Callback): boolean --[[ Line: 163 | Named "isContextProvider" ]]
	return type(Callback) ~= "function" and Callback.childContextTypes ~= nil
end

local function processChildContext(p1, p2, Current) --[[ Line: 221 ]]
	-- upvalues: DEV (copy), GetComponentNameFunction (copy), T (ref), Console (copy), Error1 (copy), DISABLEALLWARNINGSEXCEPTPROPVALIDATION (copy), CheckPropTypesFunction (copy), Object (copy)
	local StateNode = p1.stateNode
	local ChildContextTypes = p2.childContextTypes
	
	if StateNode.getChildContext == nil or type(StateNode.getChildContext) ~= "function" then
		if DEV then
			local ComponentName = GetComponentNameFunction(p2) or "Unknown"
			
			if not T[ComponentName] then
				T[ComponentName] = true
				Console.error("%s.childContextTypes is specified but there is no getChildContext() method on the instance. You can either define getChildContext() on %s or remove childContextTypes from it.", ComponentName, ComponentName)
			end
		end
		return Current
	else
		local ChildContext = StateNode:getChildContext()
		
		for i, _ in ChildContext do
			if ChildContextTypes[i] == nil then
				error(Error1.new(string.format("%s.getChildContext(): key \"%s\" is not defined in childContextTypes.", GetComponentNameFunction(p2) or "Unknown", i)))
			end
		end
		if DEV or DISABLEALLWARNINGSEXCEPTPROPVALIDATION then
			CheckPropTypesFunction(ChildContextTypes, nil, ChildContext, "child context", GetComponentNameFunction(p2) or "Unknown")
		end
		return Object.assign({}, Current, ChildContext)
	end
end

return {
	emptyContextObject = EmptyContextObject,
	getUnmaskedContext = getUnmaskedContext,
	cacheContext = function(p3, p4, p5) --[[ Line: 90 ]]
		local StateNode = p3.stateNode
		StateNode.__reactInternalMemoizedUnmaskedChildContext = p4
		StateNode.__reactInternalMemoizedMaskedChildContext = p5
	end,
	getMaskedContext = function(p3, ReactInternalMemoizedUnmaskedChildContext) --[[ Line: 105 ]]
		-- upvalues: EmptyContextObject (copy), DEV (copy), DISABLEALLWARNINGSEXCEPTPROPVALIDATION (copy), GetComponentNameFunction (copy), CheckPropTypesFunction (copy)
		local TypeFunction = p3.type
		
		if type(TypeFunction) == "function" then
			return ReactInternalMemoizedUnmaskedChildContext
		end
		local ContextTypes = TypeFunction.contextTypes
		
		if not ContextTypes then
			return EmptyContextObject
		end
		local StateNode = p3.stateNode
		
		if StateNode and StateNode.__reactInternalMemoizedUnmaskedChildContext == ReactInternalMemoizedUnmaskedChildContext then
			return StateNode.__reactInternalMemoizedMaskedChildContext
		end
		local t = {}
		
		for i, _ in ContextTypes do
			t[i] = ReactInternalMemoizedUnmaskedChildContext[i]
		end
		if DEV or DISABLEALLWARNINGSEXCEPTPROPVALIDATION then
			CheckPropTypesFunction(ContextTypes, nil, t, "context", GetComponentNameFunction(TypeFunction) or "Unknown")
		end
		if StateNode then
			local StateNode1 = p3.stateNode
			StateNode1.__reactInternalMemoizedUnmaskedChildContext = ReactInternalMemoizedUnmaskedChildContext
			StateNode1.__reactInternalMemoizedMaskedChildContext = t
		end
		return t
	end,
	hasContextChanged = function() --[[ Line: 154 ]]
		-- upvalues: DisableLegacyContext (copy), Cursor1 (copy)
		return not DisableLegacyContext and Cursor1.current
	end,
	popContext = function(p4) --[[ Line: 178 ]]
		-- upvalues: PopFunction (copy), Cursor1 (copy), Cursor (copy)
		PopFunction(Cursor1, p4)
		PopFunction(Cursor, p4)
	end,
	popTopLevelContextObject = function(p4) --[[ Line: 188 ]]
		-- upvalues: PopFunction (copy), Cursor1 (copy), Cursor (copy)
		PopFunction(Cursor1, p4)
		PopFunction(Cursor, p4)
	end,
	pushTopLevelContextObject = function(p4, p5, p6) --[[ Line: 198 ]]
		-- upvalues: Cursor (copy), EmptyContextObject (copy), Error1 (copy), PushFunction (copy), Cursor1 (copy)
		if Cursor.current ~= EmptyContextObject then
			error(Error1.new("Unexpected context found on stack. This error is likely caused by a bug in React. Please file an issue."))
		end
		PushFunction(Cursor, p5, p4)
		PushFunction(Cursor1, p6, p4)
	end,
	processChildContext = processChildContext,
	isContextProvider = Callback,
	pushContextProvider = function(p4): boolean --[[ Line: 281 ]]
		-- upvalues: EmptyContextObject (copy), Current (ref), Cursor (copy), PushFunction (copy), Cursor1 (copy)
		local StateNode = p4.stateNode
		Current = Cursor.current
		PushFunction(Cursor, StateNode and StateNode.__reactInternalMemoizedMergedChildContext or EmptyContextObject, p4)
		PushFunction(Cursor1, Cursor1.current, p4)
		
		return true
	end,
	invalidateContextProvider = function(p4, p5, p6) --[[ Line: 304 ]]
		-- upvalues: Error1 (copy), processChildContext (copy), Current (ref), PopFunction (copy), Cursor1 (copy), Cursor (copy), PushFunction (copy)
		local StateNode = p4.stateNode
		
		if not StateNode then
			error(Error1.new("Expected to have an instance by this point. This error is likely caused by a bug in React. Please file an issue."))
		end
		if p6 then
			local ProcessChildContextResult = processChildContext(p4, p5, Current)
			StateNode.__reactInternalMemoizedMergedChildContext = ProcessChildContextResult
			PopFunction(Cursor1, p4)
			PopFunction(Cursor, p4)
			PushFunction(Cursor, ProcessChildContextResult, p4)
			PushFunction(Cursor1, p6, p4)
			
			return
		else
			PopFunction(Cursor1, p4)
			PushFunction(Cursor1, p6, p4)
		end
	end,
	findCurrentUnmaskedContext = function(Return) --[[ Line: 345 ]]
		-- upvalues: ClassComponent (copy), IsFiberMountedFunction (copy), Error1 (copy), HostRoot (copy)
		if Return.tag ~= ClassComponent or not IsFiberMountedFunction(Return) then
			error(Error1.new("Expected subtree parent to be a mounted class component. This error is likely caused by a bug in React. Please file an issue."))
		end
		local Return1 = Return
		repeat
			if Return1.tag == HostRoot then
				return Return1.stateNode.context
			elseif Return1.tag == ClassComponent and Return1.type.childContextTypes ~= nil then
				return Return1.stateNode.__reactInternalMemoizedMergedChildContext
			else
				Return1 = Return1.return_
			end
		until Return1 == nil
		error(Error1.new("Found unexpected detached subtree parent. This error is likely caused by a bug in React. Please file an issue."))
	end
}