local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local WindowSizeSignalModule = require(Chrome.ChromeShared.Service.WindowSizeSignal)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local IconButton = UIBloxModule.App.Button.IconButton
local GetFFlagDebugEnableUnibarDummyIntegrationsFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations
local IconsNavigationCycleUp = Images["icons/navigation/cycleUp"]
local Flag = false
local NewWindowSizeSignal = WindowSizeSignalModule.new(ConstantsModule.DEFAULT_WIDTH, ConstantsModule.DEFAULT_HEIGHT)

return (ServiceModule:register({
	id = "dummy_window",
	label = "CoreScripts.TopBar.Menu",
	draggable = true,
	cachePosition = true,
	persistWindowState = true,
	initialAvailability = if GetFFlagDebugEnableUnibarDummyIntegrationsFunction() then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable,
	startingWindowPosition = UDim2.new(1, -95, 0, 165),
	windowSize = NewWindowSizeSignal,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy)
			return CommonIconModule("icons/menu/avatar_on")
		end,
		Window = function(_)
			-- upvalues: ReactModule (copy), ConstantsModule (copy), IconButton (copy), IconsNavigationCycleUp (copy), Flag (ref), NewWindowSizeSignal (copy)
			return ReactModule.createElement("Frame", { BackgroundTransparency = 0, Size = UDim2.new(1, 0, 1, 0) }, {
				Corner = ReactModule.createElement("UICorner", { CornerRadius = ConstantsModule.CORNER_RADIUS }),
				SizeIcon = ReactModule.createElement(IconButton, {
					backgroundTransparency = 0.5,
					icon = IconsNavigationCycleUp,
					iconSize = ConstantsModule.CLOSE_ICON_SIZE,
					anchorPoint = Vector2.new(0.5, 1),
					position = UDim2.new(0.5, 0, 1, 0),
					onActivated = function()
						-- upvalues: Flag (upval), NewWindowSizeSignal (upval), ConstantsModule (upval)
						if Flag then
							NewWindowSizeSignal:requestSize(ConstantsModule.DEFAULT_WIDTH, ConstantsModule.DEFAULT_HEIGHT)
							Flag = false
							
							return
						else
							NewWindowSizeSignal:requestSize(ConstantsModule.DEFAULT_WIDTH_LARGE, ConstantsModule.DEFAULT_HEIGHT_LARGE)
							Flag = true
						end
					end
				})
			})
		end
	}
}))