local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local reactModule = require(corePackagesService.Packages.React)

return function(p0)
	-- upvalues: withTooltip (ref), tooltipOrientation (ref), reactModule (ref)
	local controllerPart = p0.controllerPart
	
	return withTooltip({ bodyText = p0.tooltipText }, {
		DisplayOrder = 0,
		triggerPointName = "TriggerPart",
		active = true,
		DEBUG_useTargetDirectly = true,
		preferredOrientation = tooltipOrientation.Bottom,
		guiTarget = controllerPart:WaitForChild("BillboardGui")
	}, function(p1)
		-- upvalues: reactModule (copy), controllerPart (ref)
		return reactModule.createElement("BillboardGui", {
			AlwaysOnTop = true,
			Active = false,
			Parent = controllerPart,
			Adornee = controllerPart,
			Size = UDim2.new(0.5, 0, 0.5, 0)
		}, {
			TriggerBody = reactModule.createElement("Frame", {
				Transparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0.49, 0, 1.02, 0),
				[reactModule.Change.AbsoluteSize] = p1,
				[reactModule.Change.AbsolutePosition] = p1
			})
		})
	end)
end