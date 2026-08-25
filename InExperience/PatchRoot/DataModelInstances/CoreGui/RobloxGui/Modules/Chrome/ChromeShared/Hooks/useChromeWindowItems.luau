local chromeShared = script:FindFirstAncestor("ChromeShared")
local serviceModule = require(chromeShared.Service)
local _ = require(game:GetService("CorePackages").Workspace.Packages.Chrome)
local useObservableValueModule = require(chromeShared.Hooks.useObservableValue)

return function()
	-- upvalues: useObservableValueModule (ref), serviceModule (ref)
	return useObservableValueModule(serviceModule:windowList()) or {}
end