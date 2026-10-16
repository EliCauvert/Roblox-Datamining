local ChromeShared = script:FindFirstAncestor("ChromeShared")
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ServiceModule = require(ChromeShared.Service)
local UseChromeWindowItemsModule = require(ChromeShared.Hooks.useChromeWindowItems)
local WindowHostModule = require(ChromeShared.Unibar.ComponentHosts.WindowHost)

return function(_) --[[ Line: 13 ]]
	-- upvalues: UseChromeWindowItemsModule (copy), ReactModule (copy), WindowHostModule (copy), ServiceModule (copy)
	local Elements = {}
	
	for _, Integration in UseChromeWindowItemsModule() do
		Elements["window_" .. Integration.integration.id] = ReactModule.createElement(WindowHostModule, {
			position = ServiceModule:windowPosition(Integration.integration.id),
			integration = Integration
		})
	end
	return Elements
end