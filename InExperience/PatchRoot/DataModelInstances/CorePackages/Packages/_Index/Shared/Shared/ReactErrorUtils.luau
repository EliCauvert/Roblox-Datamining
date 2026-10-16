local InvariantModule = require(script.Parent.invariant)
local InvokeGuardedCallbackImplModule = require(script.Parent.invokeGuardedCallbackImpl)
local Callback = nil
local Flag = false
local v1 = nil
local Flag1 = false
local v2 = nil
local config = {
	onError = function(p1) --[[ Line: 25 ]]
		-- upvalues: Flag (ref), v1 (ref)
		Flag = true
		v1 = p1
	end
}
local ReactErrorUtils = {
	invokeGuardedCallback = function(...) --[[ Line: 45 ]]
		-- upvalues: Flag (ref), v1 (ref), InvokeGuardedCallbackImplModule (copy), config (copy)
		Flag = false
		v1 = nil
		InvokeGuardedCallbackImplModule(config, ...)
	end
}

function ReactErrorUtils.invokeGuardedCallbackAndCatchFirstError(...) --[[ Line: 62 ]]
	-- upvalues: ReactErrorUtils (copy), Flag (ref), Callback (ref), Flag1 (ref), v2 (ref)
	ReactErrorUtils.invokeGuardedCallback(...)
	
	if Flag then
		local CallbackResult = Callback()
		
		if not Flag1 then
			Flag1 = true
			v2 = CallbackResult
		end
	end
end

function ReactErrorUtils.rethrowCaughtError() --[[ Line: 80 ]]
	-- upvalues: Flag1 (ref), v2 (ref)
	if Flag1 then
		local v3 = v2
		Flag1 = false
		v2 = nil
		error(v3)
	end
end

function ReactErrorUtils.hasCaughtError() --[[ Line: 89 ]]
	-- upvalues: Flag (ref)
	return Flag
end

Callback = function() --[[ Line: 93 ]]
	-- upvalues: Flag (ref), v1 (ref), InvariantModule (copy)
	if Flag then
		local v3 = v1
		Flag = false
		v1 = nil
		
		return v3
	else
		InvariantModule(false, "clearCaughtError was called but no error was captured. This error is likely caused by a bug in React. Please file an issue.")
		
		return nil
	end
end

ReactErrorUtils.clearCaughtError = Callback

return ReactErrorUtils