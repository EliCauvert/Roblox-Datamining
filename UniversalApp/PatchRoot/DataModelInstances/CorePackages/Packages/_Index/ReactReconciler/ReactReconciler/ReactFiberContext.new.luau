local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local object = luauPolyfillModule.Object
local error = luauPolyfillModule.Error
local dEV = reactGlobalsModule.__DEV__
local dISABLEALLWARNINGSEXCEPTPROPVALIDATION = reactGlobalsModule.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local console = require(parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local unknownModule = require(script.Parent["ReactFiberStack.new"])
local isFiberMounted = require(script.Parent.ReactFiberTreeReflection).isFiberMounted
local disableLegacyContext = require(parent.Shared).ReactFeatureFlags.disableLegacyContext
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local classComponent = reactWorkTagsModule.ClassComponent
local hostRoot = reactWorkTagsModule.HostRoot
local getComponentName = require(parent.Shared).getComponentName
local checkPropTypes = require(parent.Shared).checkPropTypes
local createCursor = unknownModule.createCursor
local push = unknownModule.push
local pop = unknownModule.pop
local var1 = if dEV then {} else nil
local t = {}

if dEV then
	object.freeze(t)
end
local var2 = createCursor(t)
local var3 = createCursor(false)
local var4 = t
local var5 = nil

local function processChildContext(p1, p2, p3)
	-- upvalues: dEV (ref), getComponentName (ref), var1 (write), console (ref), error (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), object (ref)
	local stateNode = p1.stateNode
	local childContextTypes = p2.childContextTypes
	
	if stateNode.getChildContext == nil or type(stateNode.getChildContext) ~= "function" then
		if dEV then
			local var6 = getComponentName(p2) or "Unknown"
			
			if not var1[var6] then
				var1[var6] = true
				console.error("%s.childContextTypes is specified but there is no getChildContext() method on the instance. You can either define getChildContext() on %s or remove childContextTypes from it.", var6, var6)
			end
		end
		return p3
	else
		local childContext = stateNode:getChildContext()
		
		for i, v in childContext do
			if childContextTypes[i] == nil then
				error(error.new(string.format("%s.getChildContext(): key \"%s\" is not defined in childContextTypes.", getComponentName(p2) or "Unknown", i)))
			end
		end
		if dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION then
			checkPropTypes(childContextTypes, nil, childContext, "child context", getComponentName(p2) or "Unknown")
		end
		return object.assign({}, p3, childContext)
	end
end

return {
	emptyContextObject = t,
	getUnmaskedContext = function(_, p4, p5)
		-- upvalues: var5 (write), var4 (write), var2 (ref)
		return if p5 and var5(p4) then var4 else var2.current
	end,
	cacheContext = function(p4, p5, p6)
		local stateNode = p4.stateNode
		stateNode.__reactInternalMemoizedUnmaskedChildContext = p5
		stateNode.__reactInternalMemoizedMaskedChildContext = p6
	end,
	getMaskedContext = function(p4, p5)
		-- upvalues: t (ref), dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), getComponentName (ref), checkPropTypes (ref)
		local type = p4.type
		
		if type(type) == "function" then
			return p5
		end
		local contextTypes = type.contextTypes
		
		if not contextTypes then
			return t
		end
		local stateNode = p4.stateNode
		
		if stateNode and stateNode.__reactInternalMemoizedUnmaskedChildContext == p5 then
			return stateNode.__reactInternalMemoizedMaskedChildContext
		end
		local t_1 = {}
		
		for i, v in contextTypes do
			t_1[i] = p5[i]
		end
		if dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION then
			checkPropTypes(contextTypes, nil, t_1, "context", getComponentName(type) or "Unknown")
		end
		if stateNode then
			local stateNode_1 = p4.stateNode
			stateNode_1.__reactInternalMemoizedUnmaskedChildContext = p5
			stateNode_1.__reactInternalMemoizedMaskedChildContext = t_1
		end
		return t_1
	end,
	hasContextChanged = function()
		-- upvalues: disableLegacyContext (ref), var3 (ref)
		return if disableLegacyContext then false else var3.current
	end,
	popContext = function(p6)
		-- upvalues: pop (ref), var3 (ref), var2 (ref)
		pop(var3, p6)
		pop(var2, p6)
	end,
	popTopLevelContextObject = function(p6)
		-- upvalues: pop (ref), var3 (ref), var2 (ref)
		pop(var3, p6)
		pop(var2, p6)
	end,
	pushTopLevelContextObject = function(p6, p7, p8)
		-- upvalues: var2 (ref), t (ref), error (ref), push (ref), var3 (ref)
		if var2.current ~= t then
			error(error.new("Unexpected context found on stack. This error is likely caused by a bug in React. Please file an issue."))
		end
		push(var2, p7, p6)
		push(var3, p8, p6)
	end,
	processChildContext = processChildContext,
	isContextProvider = function(p6)
		return if type(p6) == "function" then false else p6.childContextTypes ~= nil
	end,
	pushContextProvider = function(p6)
		-- upvalues: t (ref), var4 (write), var2 (ref), push (ref), var3 (ref)
		local stateNode = p6.stateNode
		var4 = var2.current
		push(var2, if stateNode then stateNode.__reactInternalMemoizedMergedChildContext else t, p6)
		push(var3, var3.current, p6)
		
		return true
	end,
	invalidateContextProvider = function(p6, p7, p8)
		-- upvalues: error (ref), processChildContext (ref), var4 (write), pop (ref), var3 (ref), var2 (ref), push (ref)
		local stateNode = p6.stateNode
		
		if not stateNode then
			error(error.new("Expected to have an instance by this point. This error is likely caused by a bug in React. Please file an issue."))
		end
		if p8 then
			local var7 = processChildContext(p6, p7, var4)
			stateNode.__reactInternalMemoizedMergedChildContext = var7
			pop(var3, p6)
			pop(var2, p6)
			push(var2, var7, p6)
			push(var3, p8, p6)
			
			return
		end
		pop(var3, p6)
		push(var3, p8, p6)
	end,
	findCurrentUnmaskedContext = function(p6)
		-- upvalues: classComponent (ref), isFiberMounted (ref), error (ref), hostRoot (ref)
		if p6.tag ~= classComponent or not isFiberMounted(p6) then
			error(error.new("Expected subtree parent to be a mounted class component. This error is likely caused by a bug in React. Please file an issue."))
		end
		local var7 = p6
		repeat
			if var7.tag ~= hostRoot then
				if var7.tag ~= classComponent or var7.type.childContextTypes == nil then
					var7 = var7.return_
					continue
				end
				return var7.stateNode.__reactInternalMemoizedMergedChildContext
			end
			return var7.stateNode.context
		until var7 == nil
		error(error.new("Found unexpected detached subtree parent. This error is likely caused by a bug in React. Please file an issue."))
	end
}