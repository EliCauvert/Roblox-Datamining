local Parent = script.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local ReactSymbols = require(Parent.Shared).ReactSymbols
local REACTCONTEXTTYPE = ReactSymbols.REACT_CONTEXT_TYPE
local REACTELEMENTTYPE = ReactSymbols.REACT_ELEMENT_TYPE
local REACTFORWARDREFTYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACTFRAGMENTTYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACTLAZYTYPE = ReactSymbols.REACT_LAZY_TYPE
local REACTMEMOTYPE = ReactSymbols.REACT_MEMO_TYPE
local REACTPORTALTYPE = ReactSymbols.REACT_PORTAL_TYPE
local REACTPROFILERTYPE = ReactSymbols.REACT_PROFILER_TYPE
local REACTPROVIDERTYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACTSTRICTMODETYPE = ReactSymbols.REACT_STRICT_MODE_TYPE
local REACTSUSPENSETYPE = ReactSymbols.REACT_SUSPENSE_TYPE
local REACTSUSPENSELISTTYPE = ReactSymbols.REACT_SUSPENSE_LIST_TYPE
local REACTBINDINGTYPE = ReactSymbols.REACT_BINDING_TYPE
local v1 = require(Parent.SafeFlags).createGetFFlag("ReactIsProtectedTypeOf", false)()

local function typeOf(p1)
	-- upvalues: v1 (copy), REACTELEMENTTYPE (copy), REACTFRAGMENTTYPE (copy), REACTPROFILERTYPE (copy), REACTSTRICTMODETYPE (copy), REACTSUSPENSETYPE (copy), REACTSUSPENSELISTTYPE (copy), REACTCONTEXTTYPE (copy), REACTFORWARDREFTYPE (copy), REACTLAZYTYPE (copy), REACTMEMOTYPE (copy), REACTPROVIDERTYPE (copy), REACTPORTALTYPE (copy), REACTBINDINGTYPE (copy)
	if typeof(p1) == "table" and p1 ~= nil then
		local Result = nil
		if v1 then
			local Success
			Success, Result = pcall(function()
				-- upvalues: p1 (copy)
				return p1["$$typeof"]
			end)
			
			if not Success then
				return nil
			end
		else
			Result = p1["$$typeof"]
		end
		if Result == REACTELEMENTTYPE then
			local Type = p1.type
			
			if Type == REACTFRAGMENTTYPE or Type == REACTPROFILERTYPE or Type == REACTSTRICTMODETYPE or Type == REACTSUSPENSETYPE or Type == REACTSUSPENSELISTTYPE then
				return Type
			else
				local Typeof1 = Type and (typeof(Type) == "table" and Type["$$typeof"])
				
				return if Typeof1 == REACTCONTEXTTYPE or Typeof1 == REACTFORWARDREFTYPE or Typeof1 == REACTLAZYTYPE or Typeof1 == REACTMEMOTYPE or Typeof1 == REACTPROVIDERTYPE then Typeof1 else Result
			end
		elseif Result == REACTPORTALTYPE or Result == REACTBINDINGTYPE then
			return Result
		end
	end
	return nil
end

local Flag = false
local Flag1 = false

return {
	typeOf = typeOf,
	ContextConsumer = REACTCONTEXTTYPE,
	ContextProvider = REACTPROVIDERTYPE,
	Element = REACTELEMENTTYPE,
	ForwardRef = REACTFORWARDREFTYPE,
	Fragment = REACTFRAGMENTTYPE,
	Lazy = REACTLAZYTYPE,
	Memo = REACTMEMOTYPE,
	Portal = REACTPORTALTYPE,
	Profiler = REACTPROFILERTYPE,
	StrictMode = REACTSTRICTMODETYPE,
	Suspense = REACTSUSPENSETYPE,
	Binding = ReactSymbols.REACT_BINDING_TYPE,
	isValidElementType = require(Parent.Shared).isValidElementType,
	isAsyncMode = function(_): boolean
		-- upvalues: ReactGlobalsModule (copy), Flag (ref), Console (copy)
		if ReactGlobalsModule.__DEV__ and not Flag then
			Flag = true
			Console.warn("The ReactIs.isAsyncMode() alias has been deprecated, and will be removed in React 18+.")
		end
		return false
	end,
	isConcurrentMode = function(_): boolean
		-- upvalues: ReactGlobalsModule (copy), Flag1 (ref), Console (copy)
		if ReactGlobalsModule.__DEV__ and not Flag1 then
			Flag1 = true
			Console.warn("The ReactIs.isConcurrentMode() alias has been deprecated, and will be removed in React 18+.")
		end
		return false
	end,
	isContextConsumer = function(p1): boolean
		-- upvalues: typeOf (copy), REACTCONTEXTTYPE (copy)
		return typeOf(p1) == REACTCONTEXTTYPE
	end,
	isContextProvider = function(p1): boolean
		-- upvalues: typeOf (copy), REACTPROVIDERTYPE (copy)
		return typeOf(p1) == REACTPROVIDERTYPE
	end,
	isElement = function(p1): boolean
		-- upvalues: REACTELEMENTTYPE (copy)
		return typeof(p1) == "table" and (p1 ~= nil and p1["$$typeof"] == REACTELEMENTTYPE)
	end,
	isForwardRef = function(p1): boolean
		-- upvalues: typeOf (copy), REACTFORWARDREFTYPE (copy)
		return typeOf(p1) == REACTFORWARDREFTYPE
	end,
	isFragment = function(p1): boolean
		-- upvalues: typeOf (copy), REACTFRAGMENTTYPE (copy)
		return typeOf(p1) == REACTFRAGMENTTYPE
	end,
	isLazy = function(p1): boolean
		-- upvalues: typeOf (copy), REACTLAZYTYPE (copy)
		return typeOf(p1) == REACTLAZYTYPE
	end,
	isMemo = function(p1): boolean
		-- upvalues: typeOf (copy), REACTMEMOTYPE (copy)
		return typeOf(p1) == REACTMEMOTYPE
	end,
	isPortal = function(p1): boolean
		-- upvalues: typeOf (copy), REACTPORTALTYPE (copy)
		return typeOf(p1) == REACTPORTALTYPE
	end,
	isProfiler = function(p1): boolean
		-- upvalues: typeOf (copy), REACTPROFILERTYPE (copy)
		return typeOf(p1) == REACTPROFILERTYPE
	end,
	isStrictMode = function(p1): boolean
		-- upvalues: typeOf (copy), REACTSTRICTMODETYPE (copy)
		return typeOf(p1) == REACTSTRICTMODETYPE
	end,
	isSuspense = function(p1): boolean
		-- upvalues: typeOf (copy), REACTSUSPENSETYPE (copy)
		return typeOf(p1) == REACTSUSPENSETYPE
	end,
	isBinding = function(p1): boolean
		-- upvalues: typeOf (copy), REACTBINDINGTYPE (copy)
		return typeOf(p1) == REACTBINDINGTYPE
	end
}