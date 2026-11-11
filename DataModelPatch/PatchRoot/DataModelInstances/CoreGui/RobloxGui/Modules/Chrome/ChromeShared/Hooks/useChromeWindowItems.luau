local ChromeShared = script:FindFirstAncestor("ChromeShared")
local ServiceModule = require(ChromeShared.Service)
local _ = require(game:GetService("CorePackages").Workspace.Packages.Chrome)
local UseObservableValueModule = require(ChromeShared.Hooks.useObservableValue)

return function()
	-- upvalues: UseObservableValueModule (copy), ServiceModule (copy)
	return UseObservableValueModule(ServiceModule:windowList()) or {}
end