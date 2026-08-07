-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:20 2026 Pacific Standard Time.

local invariantModule = require(script.Parent.invariant)
local invokeGuardedCallbackImplModule = require(script.Parent.invokeGuardedCallbackImpl)
local var2 = nil
local var3 = false
local var4 = nil
local var5 = false
local var6 = nil
local t = {
	onError = function(p0) --[[ line: 25 ]]
		-- upvalues: var3 (write), var4 (write)
		var3 = true
		var4 = p0
	end
}
local t_1 = {
	invokeGuardedCallback = function(...) --[[ line: 45 ]]
		-- upvalues: var3 (write), var4 (write), invokeGuardedCallbackImplModule (ref), t (ref)
		var3 = false
		var4 = nil
		invokeGuardedCallbackImplModule(t, ...)
	end
}

function t_1.invokeGuardedCallbackAndCatchFirstError(...) --[[ line: 62 ]]
	-- upvalues: t_1 (ref), var3 (write), var2 (write), var5 (write), var6 (write)
	t_1.invokeGuardedCallback(...)
	
	if var3 then
		local var9 = var2()
		
		if not var5 then
			var5 = true
			var6 = var9
		end
	end
end

function t_1.rethrowCaughtError() --[[ line: 80 ]]
	-- upvalues: var5 (write), var6 (write)
	if var5 then
		local var10 = var6
		var5 = false
		var6 = nil
		error(var10)
	end
end

function t_1.hasCaughtError() --[[ line: 89 ]]
	-- upvalues: var3 (write)
	return var3
end

function t_1.clearCaughtError() --[[ line: 93 ]]
	-- upvalues: var3 (write), var4 (write), invariantModule (ref)
	if var3 then
		local var11 = var4
		var3 = false
		var4 = nil
		
		return var11
	end
	invariantModule(false, "clearCaughtError was called but no error was captured. This error is likely caused by a bug in React. Please file an issue.")
	
	return nil
end

return t_1