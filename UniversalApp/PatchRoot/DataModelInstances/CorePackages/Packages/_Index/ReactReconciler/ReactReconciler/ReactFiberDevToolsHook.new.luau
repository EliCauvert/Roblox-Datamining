local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local _ = require(parent.LuauPolyfill)
local t = {
	isDevToolsPresent = function()
		-- upvalues: reactGlobalsModule (ref)
		return reactGlobalsModule.__REACT_DEVTOOLS_GLOBAL_HOOK__ ~= nil
	end
}

local function _(p1)
	if typeof(p1) == "function" then
		return true
	elseif typeof(p1) == "table" then
		local var1 = getmetatable(p1)
		
		return if var1 and rawget(var1, "__call") then true else p1._isMockFunction
	end
end

local enableProfilerTimer = require(parent.Shared).ReactFeatureFlags.enableProfilerTimer
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(parent.Shared)
local didCapture = require(script.Parent.ReactFiberFlags).DidCapture
local var1 = nil
local var2 = nil
local var3 = false

function t.injectInternals(p1)
	-- upvalues: reactGlobalsModule (ref), console (ref), var1 (write), var2 (write)
	if reactGlobalsModule.__REACT_DEVTOOLS_GLOBAL_HOOK__ == nil then
		return false
	end
	local rEACTDEVTOOLSGLOBALHOOK = reactGlobalsModule.__REACT_DEVTOOLS_GLOBAL_HOOK__
	
	if rEACTDEVTOOLSGLOBALHOOK.isDisabled then
		return true
	elseif rEACTDEVTOOLSGLOBALHOOK.supportsFiber then
		local ok, status = pcall(function()
			-- upvalues: var1 (copy), rEACTDEVTOOLSGLOBALHOOK (ref), p1 (ref), var2 (copy)
			var1 = rEACTDEVTOOLSGLOBALHOOK.inject(p1)
			var2 = rEACTDEVTOOLSGLOBALHOOK
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

function t.onScheduleRoot(p1, p2)
	-- upvalues: reactGlobalsModule (ref), var2 (write), var1 (write), var3 (write), console (ref)
	if reactGlobalsModule.__DEV__ and var2 then
		local ok
		local status = var2.onScheduleFiberRoot
		
		if typeof(status) == "function" then
			ok = true
		elseif typeof(status) == "table" then
			local var4 = getmetatable(status)
			ok = if var4 and rawget(var4, "__call") then true elseif status._isMockFunction then true else false
		end
		if ok then
			ok, status = pcall(var2.onScheduleFiberRoot, var1, p1, p2)
			
			if not ok and reactGlobalsModule.__DEV__ and not var3 then
				var3 = true
				console.error("React instrumentation encountered an error: %s", status)
			end
		end
	end
end

function t.onCommitRoot(p1, p2)
	-- upvalues: var2 (write), didCapture (ref), enableProfilerTimer (ref), var1 (write), reactGlobalsModule (ref), var3 (write), console (ref)
	if var2 then
		local ok
		local status = var2.onCommitFiberRoot
		
		if typeof(status) == "function" then
			ok = true
		elseif typeof(status) == "table" then
			local var4 = getmetatable(status)
			ok = if var4 and rawget(var4, "__call") then true elseif status._isMockFunction then true else false
		end
		if ok then
			ok, status = pcall(function()
				-- upvalues: p1 (ref), didCapture (copy), enableProfilerTimer (copy), var2 (copy), var1 (copy), p2 (ref)
				local var5 = bit32.band(p1.current.flags, didCapture) == didCapture
				
				if enableProfilerTimer then
					var2.onCommitFiberRoot(var1, p1, p2, var5)
					
					return
				end
				var2.onCommitFiberRoot(var1, p1, nil, var5)
			end)
			
			if not ok and reactGlobalsModule.__DEV__ and not var3 then
				var3 = true
				console.error("React instrumentation encountered an error: %s", status)
			end
		end
	end
end

function t.onCommitUnmount(p1)
	-- upvalues: var2 (write), var1 (write), reactGlobalsModule (ref), var3 (write), console (ref)
	if var2 then
		local ok
		local status = var2.onCommitFiberUnmount
		
		if typeof(status) == "function" then
			ok = true
		elseif typeof(status) == "table" then
			local var4 = getmetatable(status)
			ok = if var4 and rawget(var4, "__call") then true elseif status._isMockFunction then true else false
		end
		if ok then
			ok, status = pcall(var2.onCommitFiberUnmount, var1, p1)
			
			if not ok and reactGlobalsModule.__DEV__ and not var3 then
				var3 = true
				console.error("React instrumentation encountered an error: %s", status)
			end
		end
	end
end

return t