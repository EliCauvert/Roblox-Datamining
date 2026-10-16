local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local ReactModule = require(CorePackages.Packages.React)

return function(p1) --[[ Line: 11 | Named "Tooltip" ]]
	-- upvalues: WithTooltipFunction (copy), TooltipOrientation (copy), ReactModule (copy)
	local ControllerPart = p1.controllerPart
	
	return WithTooltipFunction({ bodyText = p1.tooltipText }, {
		DisplayOrder = 0,
		triggerPointName = "TriggerPart",
		active = true,
		DEBUG_useTargetDirectly = true,
		preferredOrientation = TooltipOrientation.Bottom,
		guiTarget = ControllerPart:WaitForChild("BillboardGui")
	}, function(p2) --[[ Line: 24 ]]
		-- upvalues: ReactModule (upval), ControllerPart (copy)
		return ReactModule.createElement("BillboardGui", {
			AlwaysOnTop = true,
			Active = false,
			Parent = ControllerPart,
			Adornee = ControllerPart,
			Size = UDim2.new(0.5, 0, 0.5, 0)
		}, {
			TriggerBody = ReactModule.createElement("Frame", {
				Transparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0.49, 0, 1.02, 0),
				[ReactModule.Change.AbsoluteSize] = p2,
				[ReactModule.Change.AbsolutePosition] = p2
			})
		})
	end)
end