local UiShellEvents = script:FindFirstAncestor("UiShellEvents")
local TModule = require(UiShellEvents.Parent.t)
local LoggerModule = require(UiShellEvents.Logger)
local StrictInterfaceResult = TModule.strictInterface({ page = TModule.string })

return function(p1, p2, p3)
	-- upvalues: StrictInterfaceResult (copy), LoggerModule (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p3)
	
	if not StrictInterfaceResultResult then
		LoggerModule:error(StrictInterfaceResultResult2)
	end
	p1:sendEventDeferred(p2, "uiShellStatusBarTapped", p3)
end