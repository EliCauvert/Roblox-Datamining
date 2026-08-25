local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local coreGuiService = game:GetService("CoreGui")
local constantsModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.TopBar.Constants)
local appStyleProvider = require(corePackagesService.Packages.UIBlox).App.Style.AppStyleProvider
local dark = require(corePackagesService.Packages.Foundation).Enums.ColorMode.Dark
local promiseModule = require(corePackagesService.Packages.Promise)
local selfViewTooltipFTUXModule = require(script.Parent.SelfViewTooltipFTUX)

return function(p0)
	-- upvalues: coreGuiService (ref), constantsModule (ref), roactModule (ref), appStyleProvider (ref), dark (ref), selfViewTooltipFTUXModule (ref), promiseModule (ref)
	local selfViewTooltipOnCloseGui = Instance.new("ScreenGui")
	selfViewTooltipOnCloseGui.Name = "SelfViewTooltipOnCloseGui"
	selfViewTooltipOnCloseGui.DisplayOrder = -1
	selfViewTooltipOnCloseGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	selfViewTooltipOnCloseGui.Parent = coreGuiService
	local var7 = constantsModule.useDisplayScaleState(constantsModule.TopBarButtonHeight)
	local selfViewTooltipOnClose = roactModule.mount(roactModule.createElement(appStyleProvider, { style = { themeName = dark } }, {
		frame = roactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			Visible = false,
			Position = UDim2.fromOffset(constantsModule.useDisplayScaleState(constantsModule.ScreenSideOffset), -var7),
			Size = UDim2.fromOffset(var7, var7)
		}, {
			tooltip = roactModule.createElement(selfViewTooltipFTUXModule, {
				fallbackText = p0.fallbackText,
				translationKey = p0.translationKey,
				tooltipLifetime = p0.tooltipLifetime
			})
		})
	}), selfViewTooltipOnCloseGui, "SelfViewTooltipOnClose")
	promiseModule.delay(p0.tooltipLifetime + 5):andThen(function()
		-- upvalues: roactModule (copy), selfViewTooltipOnClose (ref)
		pcall(function()
			-- upvalues: roactModule (copy), selfViewTooltipOnClose (copy)
			roactModule.unmount(selfViewTooltipOnClose)
		end)
	end)
end