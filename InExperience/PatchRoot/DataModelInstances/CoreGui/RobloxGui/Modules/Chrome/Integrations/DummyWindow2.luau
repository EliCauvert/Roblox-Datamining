local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)

return serviceModule:register({
	id = "dummy_window_2",
	label = "CoreScripts.TopBar.Menu",
	persistWindowState = true,
	initialAvailability = if require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations() then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable,
	startingWindowPosition = UDim2.new(1, -245, 0, 95),
	components = {
		Icon = function(_) --[[ line: 22 ]]
			-- upvalues: commonIconModule (ref)
			return commonIconModule("icons/menu/home_on")
		end,
		Window = function(_) --[[ line: 25 ]]
			-- upvalues: reactModule (ref), constantsModule (ref)
			return reactModule.createElement("Frame", { BackgroundTransparency = 0, Size = UDim2.new(1, 0, 1, 0) }, {
				Corner = reactModule.createElement("UICorner", { CornerRadius = constantsModule.CORNER_RADIUS })
			})
		end
	}
})