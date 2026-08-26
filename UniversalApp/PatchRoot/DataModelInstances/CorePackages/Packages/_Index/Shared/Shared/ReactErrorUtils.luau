local invariantModule = require(script.Parent.invariant)
local invokeGuardedCallbackImplModule = require(script.Parent.invokeGuardedCallbackImpl)
local var1 = nil
local var2 = false
local var3 = nil
local var4 = false
local var5 = nil
local t = {
	onError = function(p1)
		-- upvalues: var2 (write), var3 (write)
		var2 = true
		var3 = p1
	end
}
local t_1 = {
	invokeGuardedCallback = function(...)
		-- upvalues: var2 (write), var3 (write), invokeGuardedCallbackImplModule (ref), t (ref)
		var2 = false
		var3 = nil
		invokeGuardedCallbackImplModule(t, ...)
	end
}

function t_1.invokeGuardedCallbackAndCatchFirstError(...)
	-- upvalues: t_1 (ref), var2 (write), var1 (write), var4 (write), var5 (write)
	t_1.invokeGuardedCallback(...)
	
	if var2 then
		local var6 = var1()
		
		if not var4 then
			var4 = true
			var5 = var6
		end
	end
end

function t_1.rethrowCaughtError()
	-- upvalues: var4 (write), var5 (write)
	if var4 then
		local var6 = var5
		var4 = false
		var5 = nil
		error(var6)
	end
end

function t_1.hasCaughtError()
	-- upvalues: var2 (write)
	return var2
end

function t_1.clearCaughtError()
	-- upvalues: var2 (write), var3 (write), invariantModule (ref)
	if var2 then
		local var6 = var3
		var2 = false
		var3 = nil
		
		return var6
	end
	invariantModule(false, "clearCaughtError was called but no error was captured. This error is likely caused by a bug in React. Please file an issue.")
	
	return nil
end

return t_1