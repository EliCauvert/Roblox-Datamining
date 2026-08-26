local parent = script:FindFirstAncestor("AuthCommon").Parent
local promiseModule = require(parent.Promise)
local getFIntAccountSwitchRelaunchFallbackSeconds = require(parent.SharedFlags).GetFIntAccountSwitchRelaunchFallbackSeconds

return function(p1, p2)
	-- upvalues: promiseModule (ref), getFIntAccountSwitchRelaunchFallbackSeconds (ref)
	return ((p2 or {}).delay or promiseModule.delay)(getFIntAccountSwitchRelaunchFallbackSeconds()):andThen(function()
		-- upvalues: p1 (ref)
		p1()
	end)
end