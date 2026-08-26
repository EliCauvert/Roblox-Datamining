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
local var1 = require(parent.SafeFlags).createGetFFlag("ReactIsProtectedTypeOf", false)()

local function typeOf(p1)
	-- upvalues: var1 (ref), REACT_ELEMENT_TYPE (ref), REACT_FRAGMENT_TYPE (ref), REACT_PROFILER_TYPE (ref), REACT_STRICT_MODE_TYPE (ref), REACT_SUSPENSE_TYPE (ref), REACT_SUSPENSE_LIST_TYPE (ref), REACT_CONTEXT_TYPE (ref), REACT_FORWARD_REF_TYPE (ref), REACT_LAZY_TYPE (ref), REACT_MEMO_TYPE (ref), REACT_PROVIDER_TYPE (ref), REACT_PORTAL_TYPE (ref), REACT_BINDING_TYPE (ref)
	if typeof(p1) == "table" and p1 ~= nil then
		local var2
		local _ = nil
		
		if var1 then
			local _ = nil
			local ok, status = pcall(function()
				-- upvalues: p1 (ref)
				return p1["$$typeof"]
			end)
			var2 = status
			
			if not ok then
				return nil
			elseif var2 == REACT_ELEMENT_TYPE then
				local type = p1.type
				
				if type == REACT_FRAGMENT_TYPE or type == REACT_PROFILER_TYPE or (type == REACT_STRICT_MODE_TYPE or type == REACT_SUSPENSE_TYPE) or type == REACT_SUSPENSE_LIST_TYPE then
					return type
				end
				local var3 = type and (typeof(type) == "table" and type["$$typeof"])
				
				return if var3 == REACT_CONTEXT_TYPE or var3 == REACT_FORWARD_REF_TYPE or (var3 == REACT_LAZY_TYPE or var3 == REACT_MEMO_TYPE) or var3 == REACT_PROVIDER_TYPE then var3 else var2
			else
				return if var2 == REACT_PORTAL_TYPE or var2 == REACT_BINDING_TYPE then var2 else nil
			end
		else
			var2 = p1["$$typeof"]
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
local var2 = false
local var3 = false

function t.isAsyncMode(_)
	-- upvalues: reactGlobalsModule (ref), var2 (write), console (ref)
	if reactGlobalsModule.__DEV__ and not var2 then
		var2 = true
		console.warn("The ReactIs.isAsyncMode() alias has been deprecated, and will be removed in React 18+.")
	end
	return false
end

function t.isConcurrentMode(_)
	-- upvalues: reactGlobalsModule (ref), var3 (write), console (ref)
	if reactGlobalsModule.__DEV__ and not var3 then
		var3 = true
		console.warn("The ReactIs.isConcurrentMode() alias has been deprecated, and will be removed in React 18+.")
	end
	return false
end

function t.isContextConsumer(p1)
	-- upvalues: typeOf (ref), REACT_CONTEXT_TYPE (ref)
	return typeOf(p1) == REACT_CONTEXT_TYPE
end

function t.isContextProvider(p1)
	-- upvalues: typeOf (ref), REACT_PROVIDER_TYPE (ref)
	return typeOf(p1) == REACT_PROVIDER_TYPE
end

function t.isElement(p1)
	-- upvalues: REACT_ELEMENT_TYPE (ref)
	return typeof(p1) == "table" and (p1 ~= nil and p1["$$typeof"] == REACT_ELEMENT_TYPE)
end

function t.isForwardRef(p1)
	-- upvalues: typeOf (ref), REACT_FORWARD_REF_TYPE (ref)
	return typeOf(p1) == REACT_FORWARD_REF_TYPE
end

function t.isFragment(p1)
	-- upvalues: typeOf (ref), REACT_FRAGMENT_TYPE (ref)
	return typeOf(p1) == REACT_FRAGMENT_TYPE
end

function t.isLazy(p1)
	-- upvalues: typeOf (ref), REACT_LAZY_TYPE (ref)
	return typeOf(p1) == REACT_LAZY_TYPE
end

function t.isMemo(p1)
	-- upvalues: typeOf (ref), REACT_MEMO_TYPE (ref)
	return typeOf(p1) == REACT_MEMO_TYPE
end

function t.isPortal(p1)
	-- upvalues: typeOf (ref), REACT_PORTAL_TYPE (ref)
	return typeOf(p1) == REACT_PORTAL_TYPE
end

function t.isProfiler(p1)
	-- upvalues: typeOf (ref), REACT_PROFILER_TYPE (ref)
	return typeOf(p1) == REACT_PROFILER_TYPE
end

function t.isStrictMode(p1)
	-- upvalues: typeOf (ref), REACT_STRICT_MODE_TYPE (ref)
	return typeOf(p1) == REACT_STRICT_MODE_TYPE
end

function t.isSuspense(p1)
	-- upvalues: typeOf (ref), REACT_SUSPENSE_TYPE (ref)
	return typeOf(p1) == REACT_SUSPENSE_TYPE
end

function t.isBinding(p1)
	-- upvalues: typeOf (ref), REACT_BINDING_TYPE (ref)
	return typeOf(p1) == REACT_BINDING_TYPE
end

return t