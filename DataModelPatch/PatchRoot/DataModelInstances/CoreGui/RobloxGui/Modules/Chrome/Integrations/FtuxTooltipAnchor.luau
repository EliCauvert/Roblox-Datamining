local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithTooltipFunction (copy), CoreGui (copy), TooltipOrientation (copy), ReactModule (copy)
	return WithTooltipFunction({
		ref = Ref,
		headerText = p1.headerText,
		bodyText = p1.bodyText
	}, {
		DisplayOrder = 10,
		active = p1.shouldShowTooltip,
		guiTarget = CoreGui,
		preferredOrientation = TooltipOrientation.Bottom
	}, function(p2)
		-- upvalues: ReactModule (upval)
		return ReactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[ReactModule.Change.AbsoluteSize] = p2,
			[ReactModule.Change.AbsolutePosition] = p2
		})
	end)
end))