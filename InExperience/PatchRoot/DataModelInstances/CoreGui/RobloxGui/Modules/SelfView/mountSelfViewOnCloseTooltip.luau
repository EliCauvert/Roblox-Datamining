local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local coreGuiService = game:GetService("CoreGui")
local constantsModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.TopBar.Constants)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local dark = UIBloxModule.App.Style.Constants.ThemeName.Dark
local promiseModule = require(corePackagesService.Packages.Promise)
local selfViewTooltipFTUXModule = require(script.Parent.SelfViewTooltipFTUX)

return function(p0) --[[ line: 15 ]]
	-- upvalues: coreGuiService (ref), constantsModule (ref), roactModule (ref), appStyleProvider (ref), dark (ref), selfViewTooltipFTUXModule (ref), promiseModule (ref)
	local selfViewTooltipOnCloseGui = Instance.new("ScreenGui")
	selfViewTooltipOnCloseGui.Name = "SelfViewTooltipOnCloseGui"
	selfViewTooltipOnCloseGui.DisplayOrder = -1
	selfViewTooltipOnCloseGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	selfViewTooltipOnCloseGui.Parent = coreGuiService
	local var8 = constantsModule.useDisplayScaleState(constantsModule.TopBarButtonHeight)
	local selfViewTooltipOnClose = roactModule.mount(roactModule.createElement(appStyleProvider, { style = { themeName = dark } }, {
		frame = roactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			Visible = false,
			Position = UDim2.fromOffset(constantsModule.useDisplayScaleState(constantsModule.ScreenSideOffset), -var8),
			Size = UDim2.fromOffset(var8, var8)
		}, {
			tooltip = roactModule.createElement(selfViewTooltipFTUXModule, {
				fallbackText = p0.fallbackText,
				translationKey = p0.translationKey,
				tooltipLifetime = p0.tooltipLifetime
			})
		})
	}), selfViewTooltipOnCloseGui, "SelfViewTooltipOnClose")
	promiseModule.delay(p0.tooltipLifetime + 5):andThen(function() --[[ line: 46 ]]
		-- upvalues: roactModule (copy), selfViewTooltipOnClose (ref)
		pcall(function() --[[ line: 47 ]]
			-- upvalues: roactModule (copy), selfViewTooltipOnClose (copy)
			roactModule.unmount(selfViewTooltipOnClose)
		end)
	end)
end