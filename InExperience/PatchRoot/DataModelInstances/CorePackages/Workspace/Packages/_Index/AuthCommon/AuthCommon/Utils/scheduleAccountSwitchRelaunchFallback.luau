local Parent = script:FindFirstAncestor("AuthCommon").Parent
local PromiseModule = require(Parent.Promise)
local GetFIntAccountSwitchRelaunchFallbackSecondsFunction = require(Parent.SharedFlags).GetFIntAccountSwitchRelaunchFallbackSeconds

return function(Callback, p1)
	-- upvalues: PromiseModule (copy), GetFIntAccountSwitchRelaunchFallbackSecondsFunction (copy)
	return ((p1 or {}).delay or PromiseModule.delay)(GetFIntAccountSwitchRelaunchFallbackSecondsFunction()):andThen(function()
		-- upvalues: Callback (copy)
		Callback()
	end)
end