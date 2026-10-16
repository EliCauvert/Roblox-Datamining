local ReactSymbolsModule = require(script.Parent.ReactSymbols)
local REACTCONTEXTTYPE = ReactSymbolsModule.REACT_CONTEXT_TYPE
local REACTFORWARDREFTYPE = ReactSymbolsModule.REACT_FORWARD_REF_TYPE
local REACTFRAGMENTTYPE = ReactSymbolsModule.REACT_FRAGMENT_TYPE
local REACTPROFILERTYPE = ReactSymbolsModule.REACT_PROFILER_TYPE
local REACTPROVIDERTYPE = ReactSymbolsModule.REACT_PROVIDER_TYPE
local REACTDEBUGTRACINGMODETYPE = ReactSymbolsModule.REACT_DEBUG_TRACING_MODE_TYPE
local REACTSTRICTMODETYPE = ReactSymbolsModule.REACT_STRICT_MODE_TYPE
local REACTSUSPENSETYPE = ReactSymbolsModule.REACT_SUSPENSE_TYPE
local REACTMEMOTYPE = ReactSymbolsModule.REACT_MEMO_TYPE
local REACTLAZYTYPE = ReactSymbolsModule.REACT_LAZY_TYPE
local REACTFUNDAMENTALTYPE = ReactSymbolsModule.REACT_FUNDAMENTAL_TYPE
local REACTBLOCKTYPE = ReactSymbolsModule.REACT_BLOCK_TYPE
local REACTSERVERBLOCKTYPE = ReactSymbolsModule.REACT_SERVER_BLOCK_TYPE
local REACTLEGACYHIDDENTYPE = ReactSymbolsModule.REACT_LEGACY_HIDDEN_TYPE

return function(Entry): boolean --[[ Line: 31 ]]
	-- upvalues: REACTFRAGMENTTYPE (copy), REACTPROFILERTYPE (copy), REACTDEBUGTRACINGMODETYPE (copy), REACTSTRICTMODETYPE (copy), REACTSUSPENSETYPE (copy), REACTLEGACYHIDDENTYPE (copy), REACTLAZYTYPE (copy), REACTMEMOTYPE (copy), REACTPROVIDERTYPE (copy), REACTCONTEXTTYPE (copy), REACTFORWARDREFTYPE (copy), REACTFUNDAMENTALTYPE (copy), REACTBLOCKTYPE (copy), REACTSERVERBLOCKTYPE (copy)
	local ValueType = typeof(Entry)
	
	if ValueType == "string" or ValueType == "function" then
		return true
	elseif Entry == REACTFRAGMENTTYPE or Entry == REACTPROFILERTYPE or Entry == REACTDEBUGTRACINGMODETYPE or Entry == REACTSTRICTMODETYPE or Entry == REACTSUSPENSETYPE or Entry == REACTLEGACYHIDDENTYPE then
		return true
	elseif ValueType == "table" then
		if Entry.isReactComponent then
			return true
		elseif Entry["$$typeof"] == REACTLAZYTYPE or Entry["$$typeof"] == REACTMEMOTYPE or Entry["$$typeof"] == REACTPROVIDERTYPE or Entry["$$typeof"] == REACTCONTEXTTYPE or Entry["$$typeof"] == REACTFORWARDREFTYPE or Entry["$$typeof"] == REACTFUNDAMENTALTYPE or Entry["$$typeof"] == REACTBLOCKTYPE or Entry[1] == REACTSERVERBLOCKTYPE then
			return true
		end
	end
	return false
end