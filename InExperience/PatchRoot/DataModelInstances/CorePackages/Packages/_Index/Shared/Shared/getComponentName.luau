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

local function _(p1, p2, p3)
	local var1 = "<function>"
	
	if typeof(p2) == "table" then
		var1 = p2.displayName or (p2.name or "")
	end
	return p1.displayName or (var1 ~= "" and string.format("%s(%s)", p3, var1) or p3)
end

local _ = function(p1)
	return p1.displayName or "Context"
end

local function getComponentName(p1)
	-- upvalues: reactGlobalsModule (ref), consoleModule (ref), REACT_FRAGMENT_TYPE (ref), REACT_PORTAL_TYPE (ref), REACT_PROFILER_TYPE (ref), REACT_STRICT_MODE_TYPE (ref), REACT_SUSPENSE_TYPE (ref), REACT_SUSPENSE_LIST_TYPE (ref), REACT_CONTEXT_TYPE (ref), REACT_PROVIDER_TYPE (ref), REACT_FORWARD_REF_TYPE (ref), REACT_MEMO_TYPE (ref), getComponentName (ref), REACT_BLOCK_TYPE (ref), REACT_LAZY_TYPE (ref), describeError (ref)
	if p1 == nil then
		return nil
	end
	local var1 = typeof(p1)
	
	if reactGlobalsModule.__DEV__ and var1 == "table" and typeof(p1.tag) == "number" then
		consoleModule.warn("Received an unexpected object in getComponentName(). This is likely a bug in React. Please file an issue.")
	end
	if var1 == "function" then
		local debugInfo = debug.info(p1, "n")
		
		if debugInfo and string.len(debugInfo) > 0 then
			return debugInfo
		end
		local debugInfo_1, debugInfo_2 = debug.info(p1, "sl")
		
		return string.format("%s:%d", debugInfo_1, debugInfo_2)
	elseif var1 == "string" then
		return p1
	elseif p1 == REACT_FRAGMENT_TYPE then
		return "Fragment"
	elseif p1 == REACT_PORTAL_TYPE then
		return "Portal"
	elseif p1 == REACT_PROFILER_TYPE then
		return "Profiler"
	elseif p1 == REACT_STRICT_MODE_TYPE then
		return "StrictMode"
	elseif p1 == REACT_SUSPENSE_TYPE then
		return "Suspense"
	elseif p1 == REACT_SUSPENSE_LIST_TYPE then
		return "SuspenseList"
	elseif var1 == "table" then
		local var2 = p1["$$typeof"]
		
		if var2 == REACT_CONTEXT_TYPE then
			return (p1.displayName or "Context") .. ".Consumer"
		elseif var2 == REACT_PROVIDER_TYPE then
			return (p1._context.displayName or "Context") .. ".Provider"
		elseif var2 == REACT_FORWARD_REF_TYPE then
			local render = p1.render
			local var3 = "<function>"
			
			if typeof(render) == "table" then
				var3 = render.displayName or (render.name or "")
			end
			return p1.displayName or (if var3 ~= "" then string.format("%s(%s)", "ForwardRef", var3) else "ForwardRef")
		elseif var2 == REACT_MEMO_TYPE then
			return getComponentName(p1.type)
		elseif var2 == REACT_BLOCK_TYPE then
			return getComponentName(p1._render)
		elseif var2 == REACT_LAZY_TYPE then
			local ok, status = xpcall(p1._init, describeError, p1._payload)
			
			return if ok then getComponentName(status) else nil
		elseif p1.displayName then
			return p1.displayName
		elseif p1.name then
			return p1.name
		end
		local var4 = getmetatable(p1)
		
		return if var4 and rawget(var4, "__tostring") then tostring(p1) else nil
	end
end

return getComponentName