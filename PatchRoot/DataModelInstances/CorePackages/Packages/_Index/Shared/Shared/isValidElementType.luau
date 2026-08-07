-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:20 2026 Pacific Standard Time.

local reactSymbolsModule = require(script.Parent.ReactSymbols)
local REACT_CONTEXT_TYPE = reactSymbolsModule.REACT_CONTEXT_TYPE
local REACT_FORWARD_REF_TYPE = reactSymbolsModule.REACT_FORWARD_REF_TYPE
local REACT_FRAGMENT_TYPE = reactSymbolsModule.REACT_FRAGMENT_TYPE
local REACT_PROFILER_TYPE = reactSymbolsModule.REACT_PROFILER_TYPE
local REACT_PROVIDER_TYPE = reactSymbolsModule.REACT_PROVIDER_TYPE
local REACT_DEBUG_TRACING_MODE_TYPE = reactSymbolsModule.REACT_DEBUG_TRACING_MODE_TYPE
local REACT_STRICT_MODE_TYPE = reactSymbolsModule.REACT_STRICT_MODE_TYPE
local REACT_SUSPENSE_TYPE = reactSymbolsModule.REACT_SUSPENSE_TYPE
local REACT_MEMO_TYPE = reactSymbolsModule.REACT_MEMO_TYPE
local REACT_LAZY_TYPE = reactSymbolsModule.REACT_LAZY_TYPE
local REACT_FUNDAMENTAL_TYPE = reactSymbolsModule.REACT_FUNDAMENTAL_TYPE
local REACT_BLOCK_TYPE = reactSymbolsModule.REACT_BLOCK_TYPE
local REACT_SERVER_BLOCK_TYPE = reactSymbolsModule.REACT_SERVER_BLOCK_TYPE
local REACT_LEGACY_HIDDEN_TYPE = reactSymbolsModule.REACT_LEGACY_HIDDEN_TYPE

return function(p0) --[[ line: 31 ]]
	-- upvalues: REACT_FRAGMENT_TYPE (ref), REACT_PROFILER_TYPE (ref), REACT_DEBUG_TRACING_MODE_TYPE (ref), REACT_STRICT_MODE_TYPE (ref), REACT_SUSPENSE_TYPE (ref), REACT_LEGACY_HIDDEN_TYPE (ref), REACT_LAZY_TYPE (ref), REACT_MEMO_TYPE (ref), REACT_PROVIDER_TYPE (ref), REACT_CONTEXT_TYPE (ref), REACT_FORWARD_REF_TYPE (ref), REACT_FUNDAMENTAL_TYPE (ref), REACT_BLOCK_TYPE (ref), REACT_SERVER_BLOCK_TYPE (ref)
	local var1 = typeof(p0)
	
	if var1 == "string" or var1 == "function" then
		return true
	elseif p0 == REACT_FRAGMENT_TYPE or p0 == REACT_PROFILER_TYPE or (p0 == REACT_DEBUG_TRACING_MODE_TYPE or p0 == REACT_STRICT_MODE_TYPE) or (p0 == REACT_SUSPENSE_TYPE or p0 == REACT_LEGACY_HIDDEN_TYPE) then
		return true
	elseif var1 == "table" then
		return if p0.isReactComponent then true else p0["$$typeof"] == REACT_LAZY_TYPE or p0["$$typeof"] == REACT_MEMO_TYPE or (p0["$$typeof"] == REACT_PROVIDER_TYPE or p0["$$typeof"] == REACT_CONTEXT_TYPE) or (p0["$$typeof"] == REACT_FORWARD_REF_TYPE or p0["$$typeof"] == REACT_FUNDAMENTAL_TYPE or (p0["$$typeof"] == REACT_BLOCK_TYPE or p0[1] == REACT_SERVER_BLOCK_TYPE))
	end
end