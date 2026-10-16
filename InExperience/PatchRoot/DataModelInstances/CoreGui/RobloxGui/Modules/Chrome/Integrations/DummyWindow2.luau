local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)

return ServiceModule:register({
	id = "dummy_window_2",
	label = "CoreScripts.TopBar.Menu",
	persistWindowState = true,
	initialAvailability = if require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations() then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable,
	startingWindowPosition = UDim2.new(1, -245, 0, 95),
	components = {
		Icon = function(_) --[[ Line: 22 ]]
			-- upvalues: CommonIconModule (copy)
			return CommonIconModule("icons/menu/home_on")
		end,
		Window = function(_) --[[ Line: 25 ]]
			-- upvalues: ReactModule (copy), ConstantsModule (copy)
			return ReactModule.createElement("Frame", { BackgroundTransparency = 0, Size = UDim2.new(1, 0, 1, 0) }, {
				Corner = ReactModule.createElement("UICorner", { CornerRadius = ConstantsModule.CORNER_RADIUS })
			})
		end
	}
})