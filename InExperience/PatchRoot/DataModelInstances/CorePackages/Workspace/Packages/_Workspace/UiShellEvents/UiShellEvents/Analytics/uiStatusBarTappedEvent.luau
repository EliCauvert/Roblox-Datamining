local uiShellEvents = script:FindFirstAncestor("UiShellEvents")
local tModule = require(uiShellEvents.Parent.t)
local loggerModule = require(uiShellEvents.Logger)
local var3 = tModule.strictInterface({ page = tModule.string })

return function(p0, p1, p2)
	-- upvalues: var3 (ref), loggerModule (ref)
	local var4, var5 = var3(p2)
	
	if not var4 then
		loggerModule:error(var5)
	end
	p0:sendEventDeferred(p1, "uiShellStatusBarTapped", p2)
end