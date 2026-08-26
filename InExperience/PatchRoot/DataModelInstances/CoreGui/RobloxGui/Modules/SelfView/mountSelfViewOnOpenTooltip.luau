local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local coreGuiService = game:GetService("CoreGui")
local appStyleProvider = require(corePackagesService.Packages.UIBlox).App.Style.AppStyleProvider
local dark = require(corePackagesService.Packages.Foundation).Enums.ColorMode.Dark
local promiseModule = require(corePackagesService.Packages.Promise)
local selfViewTooltipFTUXModule = require(script.Parent.SelfViewTooltipFTUX)

return function(p1)
	-- upvalues: coreGuiService (ref), roactModule (ref), appStyleProvider (ref), dark (ref), selfViewTooltipFTUXModule (ref), promiseModule (ref)
	local selfViewTooltipOnOpenGui = Instance.new("ScreenGui")
	selfViewTooltipOnOpenGui.Name = "SelfViewTooltipOnOpenGui"
	selfViewTooltipOnOpenGui.DisplayOrder = -1
	selfViewTooltipOnOpenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	selfViewTooltipOnOpenGui.Parent = coreGuiService
	local selfViewTooltipOnOpenGui_1 = roactModule.mount(roactModule.createElement(appStyleProvider, { style = { themeName = dark } }, {
		frame = roactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			Visible = false,
			Position = p1.position,
			Size = p1.size,
			AnchorPoint = p1.anchorPoint
		}, {
			aspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
				AspectType = "ScaleWithParentSize",
				DominantAxis = "Width",
				AspectRatio = p1.aspectRatio
			}),
			sizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = p1.maxSize, MinSize = p1.minSize }),
			bottomButtonsMock = roactModule.createElement("Frame", {
				Visible = false,
				BackgroundTransparency = 0,
				Position = p1.bottomButtonsFramePosition,
				Size = p1.bottomButtonsFrameSize
			}, {
				tooltip = roactModule.createElement(selfViewTooltipFTUXModule, {
					fallbackText = p1.fallbackText,
					translationKey = p1.translationKey,
					tooltipLifetime = p1.tooltipLifetime
				})
			})
		})
	}), selfViewTooltipOnOpenGui, "SelfViewTooltipOnOpenGui")
	
	local var1 = function()
		-- upvalues: roactModule (copy), selfViewTooltipOnOpenGui_1 (ref)
		pcall(function()
			-- upvalues: roactModule (copy), selfViewTooltipOnOpenGui_1 (copy)
			roactModule.unmount(selfViewTooltipOnOpenGui_1)
		end)
	end
	
	promiseModule.delay(p1.tooltipLifetime + 5):andThen(function()
		-- upvalues: roactModule (copy), selfViewTooltipOnOpenGui_1 (ref)
		pcall(function()
			-- upvalues: roactModule (copy), selfViewTooltipOnOpenGui_1 (copy)
			roactModule.unmount(selfViewTooltipOnOpenGui_1)
		end)
	end)
	
	return { instance = selfViewTooltipOnOpenGui_1, unmount = var1 }
end