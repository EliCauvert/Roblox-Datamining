local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local coreGuiService = game:GetService("CoreGui")
local appStyleProvider = require(corePackagesService.Packages.UIBlox).App.Style.AppStyleProvider
local dark = require(corePackagesService.Packages.Foundation).Enums.ColorMode.Dark
local promiseModule = require(corePackagesService.Packages.Promise)
local selfViewTooltipFTUXModule = require(script.Parent.SelfViewTooltipFTUX)

return function(p0) --[[ line: 15 ]]
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
			Position = p0.position,
			Size = p0.size,
			AnchorPoint = p0.anchorPoint
		}, {
			aspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
				AspectType = "ScaleWithParentSize",
				DominantAxis = "Width",
				AspectRatio = p0.aspectRatio
			}),
			sizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = p0.maxSize, MinSize = p0.minSize }),
			bottomButtonsMock = roactModule.createElement("Frame", {
				Visible = false,
				BackgroundTransparency = 0,
				Position = p0.bottomButtonsFramePosition,
				Size = p0.bottomButtonsFrameSize
			}, {
				tooltip = roactModule.createElement(selfViewTooltipFTUXModule, {
					fallbackText = p0.fallbackText,
					translationKey = p0.translationKey,
					tooltipLifetime = p0.tooltipLifetime
				})
			})
		})
	}), selfViewTooltipOnOpenGui, "SelfViewTooltipOnOpenGui")
	
	local var7 = function() --[[ line: 59 ]]
		-- upvalues: roactModule (copy), selfViewTooltipOnOpenGui_1 (ref)
		pcall(function() --[[ line: 60 ]]
			-- upvalues: roactModule (copy), selfViewTooltipOnOpenGui_1 (copy)
			roactModule.unmount(selfViewTooltipOnOpenGui_1)
		end)
	end
	
	promiseModule.delay(p0.tooltipLifetime + 5):andThen(function() --[[ line: 64 ]]
		-- upvalues: roactModule (copy), selfViewTooltipOnOpenGui_1 (ref)
		pcall(function() --[[ line: 60 ]]
			-- upvalues: roactModule (copy), selfViewTooltipOnOpenGui_1 (copy)
			roactModule.unmount(selfViewTooltipOnOpenGui_1)
		end)
	end)
	
	return { instance = selfViewTooltipOnOpenGui_1, unmount = var7 }
end