local uiShellEvents = script:FindFirstAncestor("UiShellEvents")
local tModule = require(uiShellEvents.Parent.t)
local loggerModule = require(uiShellEvents.Logger)
local var1 = tModule.strictInterface({ page = tModule.string })

return function(p1, p2, p3)
	-- upvalues: var1 (ref), loggerModule (ref)
	local var2, var3 = var1(p3)
	
	if not var2 then
		loggerModule:error(var3)
	end
	p1:sendEventDeferred(p2, "uiShellStatusBarTapped", p3)
end