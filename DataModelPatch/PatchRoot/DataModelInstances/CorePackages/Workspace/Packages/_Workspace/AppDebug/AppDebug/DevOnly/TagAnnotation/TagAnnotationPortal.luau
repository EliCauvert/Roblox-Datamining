local CoreGui = game:GetService("CoreGui")
local Parent = script:FindFirstAncestor("AppDebug").Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ParentModule = require(script.Parent)

return function()
	-- upvalues: ParentModule (copy), ReactRobloxModule (copy), ReactModule (copy), CoreGui (copy)
	local Config = ParentModule.useContext().config
	local IsOverlay = Config.displayMode == "overlay"
	local UseTagScannerResult = ParentModule.useTagScanner()
	
	return ReactRobloxModule.createPortal({
		TagAnnotation = ReactModule.createElement("ScreenGui", {
			Name = "TagAnnotation",
			DisplayOrder = 9999,
			ResetOnSpawn = false,
			IgnoreGuiInset = false,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			Enabled = IsOverlay
		}, {
			Overlay = if IsOverlay then ReactModule.createElement(ParentModule.Overlay, {
				tags = UseTagScannerResult.tags,
				showClassName = Config.showClassName,
				showPosition = Config.showPosition,
				filterPattern = Config.filterPattern,
				tooltipOpacity = Config.tooltipOpacity,
				highlightOnHover = Config.highlightOnHover
			}) else nil
		})
	}, CoreGui)
end