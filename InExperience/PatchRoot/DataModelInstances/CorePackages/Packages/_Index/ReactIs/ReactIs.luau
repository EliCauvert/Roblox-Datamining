local parent = script.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local t = {}
local reactSymbols = require(parent.Shared).ReactSymbols
local REACT_CONTEXT_TYPE = reactSymbols.REACT_CONTEXT_TYPE
local REACT_ELEMENT_TYPE = reactSymbols.REACT_ELEMENT_TYPE
local REACT_FORWARD_REF_TYPE = reactSymbols.REACT_FORWARD_REF_TYPE
local REACT_FRAGMENT_TYPE = reactSymbols.REACT_FRAGMENT_TYPE
local REACT_LAZY_TYPE = reactSymbols.REACT_LAZY_TYPE
local REACT_MEMO_TYPE = reactSymbols.REACT_MEMO_TYPE
local REACT_PORTAL_TYPE = reactSymbols.REACT_PORTAL_TYPE
local REACT_PROFILER_TYPE = reactSymbols.REACT_PROFILER_TYPE
local REACT_PROVIDER_TYPE = reactSymbols.REACT_PROVIDER_TYPE
local REACT_STRICT_MODE_TYPE = reactSymbols.REACT_STRICT_MODE_TYPE
local REACT_SUSPENSE_TYPE = reactSymbols.REACT_SUSPENSE_TYPE
local REACT_SUSPENSE_LIST_TYPE = reactSymbols.REACT_SUSPENSE_LIST_TYPE
local isValidElementType = require(parent.Shared).isValidElementType
local REACT_BINDING_TYPE = reactSymbols.REACT_BINDING_TYPE
local var2 = require(parent.SafeFlags).createGetFFlag("ReactIsProtectedTypeOf", false)()

local function typeOf(p0) --[[ line: 50 ]]
	-- upvalues: var2 (ref), REACT_ELEMENT_TYPE (ref), REACT_FRAGMENT_TYPE (ref), REACT_PROFILER_TYPE (ref), REACT_STRICT_MODE_TYPE (ref), REACT_SUSPENSE_TYPE (ref), REACT_SUSPENSE_LIST_TYPE (ref), REACT_CONTEXT_TYPE (ref), REACT_FORWARD_REF_TYPE (ref), REACT_LAZY_TYPE (ref), REACT_MEMO_TYPE (ref), REACT_PROVIDER_TYPE (ref), REACT_PORTAL_TYPE (ref), REACT_BINDING_TYPE (ref)
	if typeof(p0) == "table" and p0 ~= nil then
		local var6
		local _ = nil
		
		if var2 then
			local _ = nil
			local ok, status = pcall(function() --[[ line: 58 ]]
				-- upvalues: p0 (ref)
				return p0["$$typeof"]
			end)
			var6 = status
			
			if not ok then
				return nil
			elseif var6 == REACT_ELEMENT_TYPE then
				local type = p0.type
				
				if type == REACT_FRAGMENT_TYPE or type == REACT_PROFILER_TYPE or (type == REACT_STRICT_MODE_TYPE or type == REACT_SUSPENSE_TYPE) or type == REACT_SUSPENSE_LIST_TYPE then
					return type
				end
				local var7 = type and (typeof(type) == "table" and type["$$typeof"])
				
				return if var7 == REACT_CONTEXT_TYPE or var7 == REACT_FORWARD_REF_TYPE or (var7 == REACT_LAZY_TYPE or var7 == REACT_MEMO_TYPE) or var7 == REACT_PROVIDER_TYPE then var7 else var6
			else
				return if var6 == REACT_PORTAL_TYPE or var6 == REACT_BINDING_TYPE then var6 else nil
			end
		else
			var6 = p0["$$typeof"]
		end
	end
end

t.typeOf = typeOf
t.ContextConsumer = REACT_CONTEXT_TYPE
t.ContextProvider = REACT_PROVIDER_TYPE
t.Element = REACT_ELEMENT_TYPE
t.ForwardRef = REACT_FORWARD_REF_TYPE
t.Fragment = REACT_FRAGMENT_TYPE
t.Lazy = REACT_LAZY_TYPE
t.Memo = REACT_MEMO_TYPE
t.Portal = REACT_PORTAL_TYPE
t.Profiler = REACT_PROFILER_TYPE
t.StrictMode = REACT_STRICT_MODE_TYPE
t.Suspense = REACT_SUSPENSE_TYPE
t.Binding = reactSymbols.REACT_BINDING_TYPE
t.isValidElementType = isValidElementType
local var4 = false
local var5 = false

function t.isAsyncMode(_) --[[ line: 183 ]]
	-- upvalues: reactGlobalsModule (ref), var4 (write), console (ref)
	if reactGlobalsModule.__DEV__ and not var4 then
		var4 = true
		console.warn("The ReactIs.isAsyncMode() alias has been deprecated, and will be removed in React 18+.")
	end
	return false
end

function t.isConcurrentMode(_) --[[ line: 200 ]]
	-- upvalues: reactGlobalsModule (ref), var5 (write), console (ref)
	if reactGlobalsModule.__DEV__ and not var5 then
		var5 = true
		console.warn("The ReactIs.isConcurrentMode() alias has been deprecated, and will be removed in React 18+.")
	end
	return false
end

function t.isContextConsumer(p1) --[[ line: 217 ]]
	-- upvalues: typeOf (ref), REACT_CONTEXT_TYPE (ref)
	return typeOf(p1) == REACT_CONTEXT_TYPE
end

function t.isContextProvider(p2) --[[ line: 221 ]]
	-- upvalues: typeOf (ref), REACT_PROVIDER_TYPE (ref)
	return typeOf(p2) == REACT_PROVIDER_TYPE
end

function t.isElement(p3) --[[ line: 225 ]]
	-- upvalues: REACT_ELEMENT_TYPE (ref)
	return typeof(p3) == "table" and (p3 ~= nil and p3["$$typeof"] == REACT_ELEMENT_TYPE)
end

function t.isForwardRef(p4) --[[ line: 231 ]]
	-- upvalues: typeOf (ref), REACT_FORWARD_REF_TYPE (ref)
	return typeOf(p4) == REACT_FORWARD_REF_TYPE
end

function t.isFragment(p5) --[[ line: 235 ]]
	-- upvalues: typeOf (ref), REACT_FRAGMENT_TYPE (ref)
	return typeOf(p5) == REACT_FRAGMENT_TYPE
end

function t.isLazy(p6) --[[ line: 239 ]]
	-- upvalues: typeOf (ref), REACT_LAZY_TYPE (ref)
	return typeOf(p6) == REACT_LAZY_TYPE
end

function t.isMemo(p7) --[[ line: 243 ]]
	-- upvalues: typeOf (ref), REACT_MEMO_TYPE (ref)
	return typeOf(p7) == REACT_MEMO_TYPE
end

function t.isPortal(p8) --[[ line: 247 ]]
	-- upvalues: typeOf (ref), REACT_PORTAL_TYPE (ref)
	return typeOf(p8) == REACT_PORTAL_TYPE
end

function t.isProfiler(p9) --[[ line: 251 ]]
	-- upvalues: typeOf (ref), REACT_PROFILER_TYPE (ref)
	return typeOf(p9) == REACT_PROFILER_TYPE
end

function t.isStrictMode(p10) --[[ line: 255 ]]
	-- upvalues: typeOf (ref), REACT_STRICT_MODE_TYPE (ref)
	return typeOf(p10) == REACT_STRICT_MODE_TYPE
end

function t.isSuspense(p11) --[[ line: 259 ]]
	-- upvalues: typeOf (ref), REACT_SUSPENSE_TYPE (ref)
	return typeOf(p11) == REACT_SUSPENSE_TYPE
end

function t.isBinding(p12) --[[ line: 264 ]]
	-- upvalues: typeOf (ref), REACT_BINDING_TYPE (ref)
	return typeOf(p12) == REACT_BINDING_TYPE
end

return t