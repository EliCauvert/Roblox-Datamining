local ReactSymbolsModule = {
	REACT_ELEMENT_TYPE = 60103,
	REACT_PORTAL_TYPE = 60106,
	REACT_FRAGMENT_TYPE = 60107,
	REACT_STRICT_MODE_TYPE = 60108,
	REACT_PROFILER_TYPE = 60114,
	REACT_PROVIDER_TYPE = 60109,
	REACT_CONTEXT_TYPE = 60110,
	REACT_FORWARD_REF_TYPE = 60112,
	REACT_SUSPENSE_TYPE = 60113,
	REACT_SUSPENSE_LIST_TYPE = 60120,
	REACT_MEMO_TYPE = 60115,
	REACT_LAZY_TYPE = 60116,
	REACT_BLOCK_TYPE = 60121,
	REACT_SERVER_BLOCK_TYPE = 60122,
	REACT_FUNDAMENTAL_TYPE = 60117,
	REACT_SCOPE_TYPE = 60119,
	REACT_OPAQUE_ID_TYPE = 60128,
	REACT_DEBUG_TRACING_MODE_TYPE = 60129,
	REACT_OFFSCREEN_TYPE = 60130,
	REACT_LEGACY_HIDDEN_TYPE = 60131,
	REACT_BINDING_TYPE = 60132
}

function ReactSymbolsModule.getIteratorFn(p1)
	-- upvalues: ReactSymbolsModule (copy)
	return if typeof(p1) == "table" then if p1["$$typeof"] == ReactSymbolsModule.REACT_PORTAL_TYPE then nil else function()
		-- upvalues: p1 (copy)
		local Key = nil
		local Value = nil
		
		return {
			next = function()
				-- upvalues: Key (ref), Value (ref), p1 (upval)
				Key, Value = next(p1, Key)
				
				return { done = Value == nil, key = Key, value = Value }
			end
		}
	end else nil
end

return ReactSymbolsModule