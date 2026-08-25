local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: withTooltip (ref), coreGuiService (ref), tooltipOrientation (ref), reactModule (ref)
	return withTooltip({
		ref = p1,
		headerText = p0.headerText,
		bodyText = p0.bodyText
	}, {
		DisplayOrder = 10,
		active = p0.shouldShowTooltip,
		guiTarget = coreGuiService,
		preferredOrientation = tooltipOrientation.Bottom
	}, function(p2)
		-- upvalues: reactModule (copy)
		return reactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[reactModule.Change.AbsoluteSize] = p2,
			[reactModule.Change.AbsolutePosition] = p2
		})
	end)
end)