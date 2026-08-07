local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local windowSizeSignalModule = require(chrome.ChromeShared.Service.WindowSizeSignal)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local iconButton = UIBloxModule.App.Button.IconButton
local getFFlagDebugEnableUnibarDummyIntegrations = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagDebugEnableUnibarDummyIntegrations
local cycleUp = images["icons/navigation/cycleUp"]
local var8 = false
local var9 = windowSizeSignalModule.new(constantsModule.DEFAULT_WIDTH, constantsModule.DEFAULT_HEIGHT)

return serviceModule:register({
	id = "dummy_window",
	label = "CoreScripts.TopBar.Menu",
	draggable = true,
	cachePosition = true,
	persistWindowState = true,
	initialAvailability = if getFFlagDebugEnableUnibarDummyIntegrations() then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable,
	startingWindowPosition = UDim2.new(1, -95, 0, 165),
	windowSize = var9,
	components = {
		Icon = function(_) --[[ line: 35 ]]
			-- upvalues: commonIconModule (ref)
			return commonIconModule("icons/menu/avatar_on")
		end,
		Window = function(_) --[[ line: 38 ]]
			-- upvalues: reactModule (ref), constantsModule (ref), iconButton (ref), cycleUp (ref), var8 (write), var9 (ref)
			return reactModule.createElement("Frame", { BackgroundTransparency = 0, Size = UDim2.new(1, 0, 1, 0) }, {
				Corner = reactModule.createElement("UICorner", { CornerRadius = constantsModule.CORNER_RADIUS }),
				SizeIcon = reactModule.createElement(iconButton, {
					backgroundTransparency = 0.5,
					icon = cycleUp,
					iconSize = constantsModule.CLOSE_ICON_SIZE,
					anchorPoint = Vector2.new(0.5, 1),
					position = UDim2.new(0.5, 0, 1, 0),
					onActivated = function() --[[ line: 52 ]]
						-- upvalues: var8 (copy), var9 (copy), constantsModule (copy)
						if var8 then
							var9:requestSize(constantsModule.DEFAULT_WIDTH, constantsModule.DEFAULT_HEIGHT)
							var8 = false
							
							return
						end
						var9:requestSize(constantsModule.DEFAULT_WIDTH_LARGE, constantsModule.DEFAULT_HEIGHT_LARGE)
						var8 = true
					end
				})
			})
		end
	}
})