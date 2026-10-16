local Parent = script:FindFirstAncestor("AuthCommon").Parent
local PromiseModule = require(Parent.Promise)
local GetFIntAccountSwitchRelaunchFallbackSecondsFunction = require(Parent.SharedFlags).GetFIntAccountSwitchRelaunchFallbackSeconds

return function(Callback, p1) --[[ Line: 28 | Named "scheduleAccountSwitchRelaunchFallback" ]]
	-- upvalues: PromiseModule (copy), GetFIntAccountSwitchRelaunchFallbackSecondsFunction (copy)
	return ((p1 or {}).delay or PromiseModule.delay)(GetFIntAccountSwitchRelaunchFallbackSecondsFunction()):andThen(function() --[[ Line: 32 ]]
		-- upvalues: Callback (copy)
		Callback()
	end)
end