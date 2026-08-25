local reactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local consoleModule = require(script.Parent.console)
local reactSymbolsModule = require(script.Parent.ReactSymbols)
local REACT_CONTEXT_TYPE = reactSymbolsModule.REACT_CONTEXT_TYPE
local REACT_FORWARD_REF_TYPE = reactSymbolsModule.REACT_FORWARD_REF_TYPE
local REACT_FRAGMENT_TYPE = reactSymbolsModule.REACT_FRAGMENT_TYPE
local REACT_PORTAL_TYPE = reactSymbolsModule.REACT_PORTAL_TYPE
local REACT_MEMO_TYPE = reactSymbolsModule.REACT_MEMO_TYPE
local REACT_PROFILER_TYPE = reactSymbolsModule.REACT_PROFILER_TYPE
local REACT_PROVIDER_TYPE = reactSymbolsModule.REACT_PROVIDER_TYPE
local REACT_STRICT_MODE_TYPE = reactSymbolsModule.REACT_STRICT_MODE_TYPE
local REACT_SUSPENSE_TYPE = reactSymbolsModule.REACT_SUSPENSE_TYPE
local REACT_SUSPENSE_LIST_TYPE = reactSymbolsModule.REACT_SUSPENSE_LIST_TYPE
local REACT_LAZY_TYPE = reactSymbolsModule.REACT_LAZY_TYPE
local REACT_BLOCK_TYPE = reactSymbolsModule.REACT_BLOCK_TYPE
local _ = require(script.Parent.ReactTypes)
local describeError = require(script.Parent["ErrorHandling.roblox"]).describeError

local function _(p0, p1, p2)
	local var4 = "<function>"
	
	if typeof(p1) == "table" then
		var4 = p1.displayName or (p1.name or "")
	end
	return p0.displayName or (var4 ~= "" and string.format("%s(%s)", p2, var4) or p2)
end

local _ = function(p3)
	return p3.displayName or "Context"
end

local function getComponentName(p4)
	-- upvalues: reactGlobalsModule (ref), consoleModule (ref), REACT_FRAGMENT_TYPE (ref), REACT_PORTAL_TYPE (ref), REACT_PROFILER_TYPE (ref), REACT_STRICT_MODE_TYPE (ref), REACT_SUSPENSE_TYPE (ref), REACT_SUSPENSE_LIST_TYPE (ref), REACT_CONTEXT_TYPE (ref), REACT_PROVIDER_TYPE (ref), REACT_FORWARD_REF_TYPE (ref), REACT_MEMO_TYPE (ref), getComponentName (ref), REACT_BLOCK_TYPE (ref), REACT_LAZY_TYPE (ref), describeError (ref)
	if p4 == nil then
		return nil
	end
	local var5 = typeof(p4)
	
	if reactGlobalsModule.__DEV__ and var5 == "table" and typeof(p4.tag) == "number" then
		consoleModule.warn("Received an unexpected object in getComponentName(). This is likely a bug in React. Please file an issue.")
	end
	if var5 == "function" then
		local debugInfo = debug.info(p4, "n")
		
		if debugInfo and string.len(debugInfo) > 0 then
			return debugInfo
		end
		local debugInfo_1, debugInfo_2 = debug.info(p4, "sl")
		
		return string.format("%s:%d", debugInfo_1, debugInfo_2)
	elseif var5 == "string" then
		return p4
	elseif p4 == REACT_FRAGMENT_TYPE then
		return "Fragment"
	elseif p4 == REACT_PORTAL_TYPE then
		return "Portal"
	elseif p4 == REACT_PROFILER_TYPE then
		return "Profiler"
	elseif p4 == REACT_STRICT_MODE_TYPE then
		return "StrictMode"
	elseif p4 == REACT_SUSPENSE_TYPE then
		return "Suspense"
	elseif p4 == REACT_SUSPENSE_LIST_TYPE then
		return "SuspenseList"
	elseif var5 == "table" then
		local var9 = p4["$$typeof"]
		
		if var9 == REACT_CONTEXT_TYPE then
			return (p4.displayName or "Context") .. ".Consumer"
		elseif var9 == REACT_PROVIDER_TYPE then
			return (p4._context.displayName or "Context") .. ".Provider"
		elseif var9 == REACT_FORWARD_REF_TYPE then
			local render = p4.render
			local var10 = "<function>"
			
			if typeof(render) == "table" then
				var10 = render.displayName or (render.name or "")
			end
			return p4.displayName or (if var10 ~= "" then string.format("%s(%s)", "ForwardRef", var10) else "ForwardRef")
		elseif var9 == REACT_MEMO_TYPE then
			return getComponentName(p4.type)
		elseif var9 == REACT_BLOCK_TYPE then
			return getComponentName(p4._render)
		elseif var9 == REACT_LAZY_TYPE then
			local ok, status = xpcall(p4._init, describeError, p4._payload)
			
			return if ok then getComponentName(status) else nil
		elseif p4.displayName then
			return p4.displayName
		elseif p4.name then
			return p4.name
		end
		local var11 = getmetatable(p4)
		
		return if var11 and rawget(var11, "__tostring") then tostring(p4) else nil
	end
end

return getComponentName