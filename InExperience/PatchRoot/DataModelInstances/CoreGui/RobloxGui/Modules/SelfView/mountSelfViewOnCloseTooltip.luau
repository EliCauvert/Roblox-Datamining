local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local CoreGui = game:GetService("CoreGui")
local ConstantsModule = require(CoreGui:WaitForChild("RobloxGui").Modules.TopBar.Constants)
local AppStyleProvider = require(CorePackages.Packages.UIBlox).App.Style.AppStyleProvider
local Dark = require(CorePackages.Packages.Foundation).Enums.ColorMode.Dark
local PromiseModule = require(CorePackages.Packages.Promise)
local SelfViewTooltipFTUXModule = require(script.Parent.SelfViewTooltipFTUX)

return function(p1) --[[ Line: 17 ]]
	-- upvalues: CoreGui (copy), ConstantsModule (copy), RoactModule (copy), AppStyleProvider (copy), Dark (copy), SelfViewTooltipFTUXModule (copy), PromiseModule (copy)
	local SelfViewTooltipOnCloseGui = Instance.new("ScreenGui")
	SelfViewTooltipOnCloseGui.Name = "SelfViewTooltipOnCloseGui"
	SelfViewTooltipOnCloseGui.DisplayOrder = -1
	SelfViewTooltipOnCloseGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SelfViewTooltipOnCloseGui.Parent = CoreGui
	local UseDisplayScaleStateResult = ConstantsModule.useDisplayScaleState(ConstantsModule.TopBarButtonHeight)
	local SelfViewTooltipOnClose = RoactModule.mount(RoactModule.createElement(AppStyleProvider, { style = { themeName = Dark } }, {
		frame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			Visible = false,
			Position = UDim2.fromOffset(ConstantsModule.useDisplayScaleState(ConstantsModule.ScreenSideOffset), -UseDisplayScaleStateResult),
			Size = UDim2.fromOffset(UseDisplayScaleStateResult, UseDisplayScaleStateResult)
		}, {
			tooltip = RoactModule.createElement(SelfViewTooltipFTUXModule, {
				fallbackText = p1.fallbackText,
				translationKey = p1.translationKey,
				tooltipLifetime = p1.tooltipLifetime
			})
		})
	}), SelfViewTooltipOnCloseGui, "SelfViewTooltipOnClose")
	PromiseModule.delay(p1.tooltipLifetime + 5):andThen(function() --[[ Line: 48 ]]
		-- upvalues: RoactModule (upval), SelfViewTooltipOnClose (copy)
		pcall(function() --[[ Line: 49 ]]
			-- upvalues: RoactModule (upval), SelfViewTooltipOnClose (upval)
			RoactModule.unmount(SelfViewTooltipOnClose)
		end)
	end)
end