-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:34 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local _ = require(parent.LuauPolyfill)
local t = {
	isDevToolsPresent = function() --[[ line: 64 ]]
		-- upvalues: reactGlobalsModule (ref)
		return reactGlobalsModule.__REACT_DEVTOOLS_GLOBAL_HOOK__ ~= nil
	end
}

local function _(p0) --[[ line: 29 | named "isCallable" ]]
	if typeof(p0) == "function" then
		return true
	elseif typeof(p0) == "table" then
		local var5 = getmetatable(p0)
		
		return if var5 and rawget(var5, "__call") then true else p0._isMockFunction
	end
end

local enableProfilerTimer = require(parent.Shared).ReactFeatureFlags.enableProfilerTimer
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(parent.Shared)
local didCapture = require(script.Parent.ReactFiberFlags).DidCapture
local var2 = nil
local var3 = nil
local var4 = false

function t.injectInternals(p1) --[[ line: 68 ]]
	-- upvalues: reactGlobalsModule (ref), console (ref), var2 (write), var3 (write)
	if reactGlobalsModule.__REACT_DEVTOOLS_GLOBAL_HOOK__ == nil then
		return false
	end
	local rEACTDEVTOOLSGLOBALHOOK = reactGlobalsModule.__REACT_DEVTOOLS_GLOBAL_HOOK__
	
	if rEACTDEVTOOLSGLOBALHOOK.isDisabled then
		return true
	elseif rEACTDEVTOOLSGLOBALHOOK.supportsFiber then
		local ok, status = pcall(function() --[[ line: 91 ]]
			-- upvalues: var2 (copy), rEACTDEVTOOLSGLOBALHOOK (ref), p1 (ref), var3 (copy)
			var2 = rEACTDEVTOOLSGLOBALHOOK.inject(p1)
			var3 = rEACTDEVTOOLSGLOBALHOOK
		end)
		
		if not ok and reactGlobalsModule.__DEV__ then
			console.error("React instrumentation encountered an error: %s.", status)
		end
		return true
	elseif reactGlobalsModule.__DEV__ then
		console.error("The installed version of React DevTools is too old and will not work with the current version of React. Please update React DevTools. https://reactjs.org/link/react-devtools")
	end
	return true
end

function t.onScheduleRoot(p2, p3) --[[ line: 107 ]]
	-- upvalues: reactGlobalsModule (ref), var3 (write), var2 (write), var4 (write), console (ref)
	if reactGlobalsModule.__DEV__ and var3 then
		local ok
		local status = var3.onScheduleFiberRoot
		
		if typeof(status) == "function" then
			ok = true
		elseif typeof(status) == "table" then
			local var7 = getmetatable(status)
			ok = if var7 and rawget(var7, "__call") then true elseif status._isMockFunction then true else false
		end
		if ok then
			ok, status = pcall(var3.onScheduleFiberRoot, var2, p2, p3)
			
			if not ok and reactGlobalsModule.__DEV__ and not var4 then
				var4 = true
				console.error("React instrumentation encountered an error: %s", status)
			end
		end
	end
end

function t.onCommitRoot(p4, p5) --[[ line: 127 ]]
	-- upvalues: var3 (write), didCapture (ref), enableProfilerTimer (ref), var2 (write), reactGlobalsModule (ref), var4 (write), console (ref)
	if var3 then
		local ok
		local status = var3.onCommitFiberRoot
		
		if typeof(status) == "function" then
			ok = true
		elseif typeof(status) == "table" then
			local var9 = getmetatable(status)
			ok = if var9 and rawget(var9, "__call") then true elseif status._isMockFunction then true else false
		end
		if ok then
			ok, status = pcall(function() --[[ line: 133 ]]
				-- upvalues: p4 (ref), didCapture (copy), enableProfilerTimer (copy), var3 (copy), var2 (copy), p5 (ref)
				local var10 = bit32.band(p4.current.flags, didCapture) == didCapture
				
				if enableProfilerTimer then
					var3.onCommitFiberRoot(var2, p4, p5, var10)
					
					return
				end
				var3.onCommitFiberRoot(var2, p4, nil, var10)
			end)
			
			if not ok and reactGlobalsModule.__DEV__ and not var4 then
				var4 = true
				console.error("React instrumentation encountered an error: %s", status)
			end
		end
	end
end

function t.onCommitUnmount(p6) --[[ line: 152 ]]
	-- upvalues: var3 (write), var2 (write), reactGlobalsModule (ref), var4 (write), console (ref)
	if var3 then
		local ok
		local status = var3.onCommitFiberUnmount
		
		if typeof(status) == "function" then
			ok = true
		elseif typeof(status) == "table" then
			local var12 = getmetatable(status)
			ok = if var12 and rawget(var12, "__call") then true elseif status._isMockFunction then true else false
		end
		if ok then
			ok, status = pcall(var3.onCommitFiberUnmount, var2, p6)
			
			if not ok and reactGlobalsModule.__DEV__ and not var4 then
				var4 = true
				console.error("React instrumentation encountered an error: %s", status)
			end
		end
	end
end

return t