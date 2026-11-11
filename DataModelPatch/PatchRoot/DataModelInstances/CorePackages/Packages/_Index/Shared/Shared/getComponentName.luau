local ReactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local ConsoleModule = require(script.Parent.console)
local ReactSymbolsModule = require(script.Parent.ReactSymbols)
local REACTCONTEXTTYPE = ReactSymbolsModule.REACT_CONTEXT_TYPE
local REACTFORWARDREFTYPE = ReactSymbolsModule.REACT_FORWARD_REF_TYPE
local REACTFRAGMENTTYPE = ReactSymbolsModule.REACT_FRAGMENT_TYPE
local REACTPORTALTYPE = ReactSymbolsModule.REACT_PORTAL_TYPE
local REACTMEMOTYPE = ReactSymbolsModule.REACT_MEMO_TYPE
local REACTPROFILERTYPE = ReactSymbolsModule.REACT_PROFILER_TYPE
local REACTPROVIDERTYPE = ReactSymbolsModule.REACT_PROVIDER_TYPE
local REACTSTRICTMODETYPE = ReactSymbolsModule.REACT_STRICT_MODE_TYPE
local REACTSUSPENSETYPE = ReactSymbolsModule.REACT_SUSPENSE_TYPE
local REACTSUSPENSELISTTYPE = ReactSymbolsModule.REACT_SUSPENSE_LIST_TYPE
local REACTLAZYTYPE = ReactSymbolsModule.REACT_LAZY_TYPE
local REACTBLOCKTYPE = ReactSymbolsModule.REACT_BLOCK_TYPE
local _ = require(script.Parent.ReactTypes)
local DescribeError = require(script.Parent["ErrorHandling.roblox"]).describeError

local function _(p1, p2, p3)
	local DisplayName = if typeof(p2) == "table" then p2.displayName or (p2.name or "") else "<function>"
	
	return p1.displayName or (if DisplayName == "" then p3 else string.format("%s(%s)", p3, DisplayName) or p3)
end

local _ = function(p1)
	return p1.displayName or "Context"
end

local function getComponentName(Render)
	-- upvalues: ReactGlobalsModule (copy), ConsoleModule (copy), REACTFRAGMENTTYPE (copy), REACTPORTALTYPE (copy), REACTPROFILERTYPE (copy), REACTSTRICTMODETYPE (copy), REACTSUSPENSETYPE (copy), REACTSUSPENSELISTTYPE (copy), REACTCONTEXTTYPE (copy), REACTPROVIDERTYPE (copy), REACTFORWARDREFTYPE (copy), REACTMEMOTYPE (copy), getComponentName (copy), REACTBLOCKTYPE (copy), REACTLAZYTYPE (copy), DescribeError (copy)
	if Render == nil then
		return nil
	end
	local ValueType = typeof(Render)
	
	if ReactGlobalsModule.__DEV__ and ValueType == "table" and typeof(Render.tag) == "number" then
		ConsoleModule.warn("Received an unexpected object in getComponentName(). This is likely a bug in React. Please file an issue.")
	end
	if ValueType == "function" then
		local DebugInfo: string = debug.info(Render, "n")
		
		if DebugInfo and string.len(DebugInfo) > 0 then
			return DebugInfo
		else
			local DebugInfo1, DebugInfo2 = debug.info(Render, "sl")
			
			return string.format("%s:%d", DebugInfo1, DebugInfo2)
		end
	else
		if ValueType == "string" then
			return Render
		end
		if Render == REACTFRAGMENTTYPE then
			return "Fragment"
		end
		if Render == REACTPORTALTYPE then
			return "Portal"
		end
		if Render == REACTPROFILERTYPE then
			return "Profiler"
		end
		if Render == REACTSTRICTMODETYPE then
			return "StrictMode"
		end
		if Render == REACTSUSPENSETYPE then
			return "Suspense"
		end
		if Render == REACTSUSPENSELISTTYPE then
			return "SuspenseList"
		end
		if ValueType == "table" then
			local Typeof1 = Render["$$typeof"]
			
			if Typeof1 == REACTCONTEXTTYPE then
				return (Render.displayName or "Context") .. ".Consumer"
			end
			if Typeof1 == REACTPROVIDERTYPE then
				return (Render._context.displayName or "Context") .. ".Provider"
			end
			if Typeof1 == REACTFORWARDREFTYPE then
				local Render1 = Render.render
				local DisplayName = if typeof(Render1) == "table" then Render1.displayName or (Render1.name or "") else "<function>"
				
				return Render.displayName or (if DisplayName == "" then "ForwardRef" else string.format("%s(%s)", "ForwardRef", DisplayName) or "ForwardRef")
			end
			if Typeof1 == REACTMEMOTYPE then
				return getComponentName(Render.type)
			end
			if Typeof1 == REACTBLOCKTYPE then
				return getComponentName(Render._render)
			end
			if Typeof1 == REACTLAZYTYPE then
				local Success, Result = xpcall(Render._init, DescribeError, Render._payload)
				
				return if Success then getComponentName(Result) else nil
			end
			if Render.displayName then
				return Render.displayName
			end
			if Render.name then
				return Render.name
			end
			local Meta = getmetatable(Render)
			
			if Meta and rawget(Meta, "__tostring") then
				return (tostring(Render))
			end
		end
		return nil
	end
end

return getComponentName