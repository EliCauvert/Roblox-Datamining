local config = {
	OnBecomeActive = require(script:FindFirstAncestor("CrossPlay").Parent.AppCommonLib).Signal.new()
}
local AppLifecycleObserverService = nil
pcall(function()
	-- upvalues: AppLifecycleObserverService (ref)
	AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
end)

return AppLifecycleObserverService or config