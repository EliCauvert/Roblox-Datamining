local parent = script:FindFirstAncestor("AuthCommon").Parent
local promiseModule = require(parent.Promise)
local getFIntAccountSwitchRelaunchFallbackSeconds = require(parent.SharedFlags).GetFIntAccountSwitchRelaunchFallbackSeconds

return function(p0, p1)
	-- upvalues: promiseModule (ref), getFIntAccountSwitchRelaunchFallbackSeconds (ref)
	return ((p1 or {}).delay or promiseModule.delay)(getFIntAccountSwitchRelaunchFallbackSeconds()):andThen(function()
		-- upvalues: p0 (ref)
		p0()
	end)
end