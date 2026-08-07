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
local var4 = if dEV then {} else nil
local t = {}

if dEV then
	object.freeze(t)
end
local var6 = createCursor(t)
local var7 = createCursor(false)
local var8 = t
local var9 = nil

local function processChildContext(p0, p1, p2) --[[ line: 221 ]]
	-- upvalues: dEV (ref), getComponentName (ref), var4 (write), console (ref), error (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), checkPropTypes (ref), object (ref)
	local stateNode = p0.stateNode
	local childContextTypes = p1.childContextTypes
	
	if stateNode.getChildContext == nil or type(stateNode.getChildContext) ~= "function" then
		if dEV then
			local var11 = getComponentName(p1) or "Unknown"
			
			if not var4[var11] then
				var4[var11] = true
				console.error("%s.childContextTypes is specified but there is no getChildContext() method on the instance. You can either define getChildContext() on %s or remove childContextTypes from it.", var11, var11)
			end
		end
		return p2
	else
		local childContext = stateNode:getChildContext()
		
		for i, v in childContext do
			if childContextTypes[i] == nil then
				error(error.new(string.format("%s.getChildContext(): key \"%s\" is not defined in childContextTypes.", getComponentName(p1) or "Unknown", i)))
			end
		end
		if dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION then
			checkPropTypes(childContextTypes, nil, childContext, "child context", getComponentName(p1) or "Unknown")
		end
		return object.assign({}, p2, childContext)
	end
end

return {
	emptyContextObject = t,
	getUnmaskedContext = function(_, p3, p4) --[[ line: 70 ]]
		-- upvalues: var9 (write), var8 (write), var6 (ref)
		return if p4 and var9(p3) then var8 else var6.current
	end,
	cacheContext = function(p5, p6, p7) --[[ line: 90 ]]
		local stateNode = p5.stateNode
		stateNode.__reactInternalMemoizedUnmaskedChildContext = p6
		stateNode.__reactInternalMemoizedMaskedChildContext = p7
	end,
	getMaskedContext = function(p8, p9) --[[ line: 105 ]]
		-- upvalues: t (ref), dEV (ref), dISABLEALLWARNINGSEXCEPTPROPVALIDATION (ref), getComponentName (ref), checkPropTypes (ref)
		local type = p8.type
		
		if type(type) == "function" then
			return p9
		end
		local contextTypes = type.contextTypes
		
		if not contextTypes then
			return t
		end
		local stateNode = p8.stateNode
		
		if stateNode and stateNode.__reactInternalMemoizedUnmaskedChildContext == p9 then
			return stateNode.__reactInternalMemoizedMaskedChildContext
		end
		local t_1 = {}
		
		for i, v in contextTypes do
			t_1[i] = p9[i]
		end
		if dEV or dISABLEALLWARNINGSEXCEPTPROPVALIDATION then
			checkPropTypes(contextTypes, nil, t_1, "context", getComponentName(type) or "Unknown")
		end
		if stateNode then
			local stateNode_1 = p8.stateNode
			stateNode_1.__reactInternalMemoizedUnmaskedChildContext = p9
			stateNode_1.__reactInternalMemoizedMaskedChildContext = t_1
		end
		return t_1
	end,
	hasContextChanged = function() --[[ line: 154 ]]
		-- upvalues: disableLegacyContext (ref), var7 (ref)
		return if disableLegacyContext then false else var7.current
	end,
	popContext = function(p10) --[[ line: 178 ]]
		-- upvalues: pop (ref), var7 (ref), var6 (ref)
		pop(var7, p10)
		pop(var6, p10)
	end,
	popTopLevelContextObject = function(p11) --[[ line: 188 ]]
		-- upvalues: pop (ref), var7 (ref), var6 (ref)
		pop(var7, p11)
		pop(var6, p11)
	end,
	pushTopLevelContextObject = function(p12, p13, p14) --[[ line: 198 ]]
		-- upvalues: var6 (ref), t (ref), error (ref), push (ref), var7 (ref)
		if var6.current ~= t then
			error(error.new("Unexpected context found on stack. This error is likely caused by a bug in React. Please file an issue."))
		end
		push(var6, p13, p12)
		push(var7, p14, p12)
	end,
	processChildContext = processChildContext,
	isContextProvider = function(p15) --[[ line: 163 ]]
		return if type(p15) == "function" then false else p15.childContextTypes ~= nil
	end,
	pushContextProvider = function(p16) --[[ line: 281 ]]
		-- upvalues: t (ref), var8 (write), var6 (ref), push (ref), var7 (ref)
		local stateNode = p16.stateNode
		var8 = var6.current
		push(var6, if stateNode then stateNode.__reactInternalMemoizedMergedChildContext else t, p16)
		push(var7, var7.current, p16)
		
		return true
	end,
	invalidateContextProvider = function(p17, p18, p19) --[[ line: 304 ]]
		-- upvalues: error (ref), processChildContext (ref), var8 (write), pop (ref), var7 (ref), var6 (ref), push (ref)
		local stateNode = p17.stateNode
		
		if not stateNode then
			error(error.new("Expected to have an instance by this point. This error is likely caused by a bug in React. Please file an issue."))
		end
		if p19 then
			local var14 = processChildContext(p17, p18, var8)
			stateNode.__reactInternalMemoizedMergedChildContext = var14
			pop(var7, p17)
			pop(var6, p17)
			push(var6, var14, p17)
			push(var7, p19, p17)
			
			return
		end
		pop(var7, p17)
		push(var7, p19, p17)
	end,
	findCurrentUnmaskedContext = function(p20) --[[ line: 345 ]]
		-- upvalues: classComponent (ref), isFiberMounted (ref), error (ref), hostRoot (ref)
		if p20.tag ~= classComponent or not isFiberMounted(p20) then
			error(error.new("Expected subtree parent to be a mounted class component. This error is likely caused by a bug in React. Please file an issue."))
		end
		local var15 = p20
		repeat
			if var15.tag ~= hostRoot then
				if var15.tag ~= classComponent or var15.type.childContextTypes == nil then
					var15 = var15.return_
					continue
				end
				return var15.stateNode.__reactInternalMemoizedMergedChildContext
			end
			return var15.stateNode.context
		until var15 == nil
		error(error.new("Found unexpected detached subtree parent. This error is likely caused by a bug in React. Please file an issue."))
	end
}