local chromeShared = script:FindFirstAncestor("ChromeShared")
local reactModule = require(game:GetService("CorePackages").Packages.React)
local serviceModule = require(chromeShared.Service)
local useChromeWindowItemsModule = require(chromeShared.Hooks.useChromeWindowItems)
local windowHostModule = require(chromeShared.Unibar.ComponentHosts.WindowHost)

return function(_)
	-- upvalues: useChromeWindowItemsModule (ref), reactModule (ref), windowHostModule (ref), serviceModule (ref)
	local t = {}
	
	for i, v in useChromeWindowItemsModule() do
		t["window_" .. v.integration.id] = reactModule.createElement(windowHostModule, {
			position = serviceModule:windowPosition(v.integration.id),
			integration = v
		})
	end
	return t
end