local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local CoreGui = game:GetService("CoreGui")
local AppStyleProvider = require(CorePackages.Packages.UIBlox).App.Style.AppStyleProvider
local Dark = require(CorePackages.Packages.Foundation).Enums.ColorMode.Dark
local PromiseModule = require(CorePackages.Packages.Promise)
local SelfViewTooltipFTUXModule = require(script.Parent.SelfViewTooltipFTUX)

return function(p1) --[[ Line: 15 ]]
	-- upvalues: CoreGui (copy), RoactModule (copy), AppStyleProvider (copy), Dark (copy), SelfViewTooltipFTUXModule (copy), PromiseModule (copy)
	local SelfViewTooltipOnOpenGui = Instance.new("ScreenGui")
	SelfViewTooltipOnOpenGui.Name = "SelfViewTooltipOnOpenGui"
	SelfViewTooltipOnOpenGui.DisplayOrder = -1
	SelfViewTooltipOnOpenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SelfViewTooltipOnOpenGui.Parent = CoreGui
	local SelfViewTooltipOnOpenGui1 = RoactModule.mount(RoactModule.createElement(AppStyleProvider, { style = { themeName = Dark } }, {
		frame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			Visible = false,
			Position = p1.position,
			Size = p1.size,
			AnchorPoint = p1.anchorPoint
		}, {
			aspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
				AspectType = "ScaleWithParentSize",
				DominantAxis = "Width",
				AspectRatio = p1.aspectRatio
			}),
			sizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = p1.maxSize, MinSize = p1.minSize }),
			bottomButtonsMock = RoactModule.createElement("Frame", {
				Visible = false,
				BackgroundTransparency = 0,
				Position = p1.bottomButtonsFramePosition,
				Size = p1.bottomButtonsFrameSize
			}, {
				tooltip = RoactModule.createElement(SelfViewTooltipFTUXModule, {
					fallbackText = p1.fallbackText,
					translationKey = p1.translationKey,
					tooltipLifetime = p1.tooltipLifetime
				})
			})
		})
	}), SelfViewTooltipOnOpenGui, "SelfViewTooltipOnOpenGui")
	
	local function Unmount() --[[ Line: 59 ]]
		-- upvalues: RoactModule (upval), SelfViewTooltipOnOpenGui1 (copy)
		pcall(function() --[[ Line: 60 ]]
			-- upvalues: RoactModule (upval), SelfViewTooltipOnOpenGui1 (upval)
			RoactModule.unmount(SelfViewTooltipOnOpenGui1)
		end)
	end
	
	PromiseModule.delay(p1.tooltipLifetime + 5):andThen(function() --[[ Line: 64 ]]
		-- upvalues: RoactModule (upval), SelfViewTooltipOnOpenGui1 (copy)
		pcall(function() --[[ Line: 60 ]]
			-- upvalues: RoactModule (upval), SelfViewTooltipOnOpenGui1 (upval)
			RoactModule.unmount(SelfViewTooltipOnOpenGui1)
		end)
	end)
	
	return { instance = SelfViewTooltipOnOpenGui1, unmount = Unmount }
end