-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:20 2026 Pacific Standard Time.

local t = {
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

function t.getIteratorFn(p0) --[[ line: 84 ]]
	-- upvalues: t (ref)
	return if typeof(p0) == "table" then if p0["$$typeof"] == t.REACT_PORTAL_TYPE then nil else function() --[[ line: 91 ]]
		-- upvalues: p0 (ref)
		local var1 = nil
		local var2 = nil
		
		return {
			next = function() --[[ line: 94 ]]
				-- upvalues: var1 (write), var2 (write), p0 (copy)
				local var3, var4 = next(p0, var1)
				var1 = var3
				var2 = var4
				
				return { done = var2 == nil, key = var1, value = var2 }
			end
		}
	end else nil
end

return t