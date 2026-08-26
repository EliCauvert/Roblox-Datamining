local packages = game:GetService("CorePackages").Packages
local reactModule = require(packages.React)
local UIBloxModule = require(packages.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useCameraOnModule = require(script.Parent.Parent.Hooks.useCameraOn)
local uDim2 = UDim2.fromScale(1, 1)

return function(p1)
	-- upvalues: useCameraOnModule (ref), reactModule (ref), imageSetLabel (ref), images (ref), uDim2 (ref)
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		Icon = reactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Image = if useCameraOnModule() then images["icons/controls/video"] else images["icons/controls/videoOff"],
			Size = p1.iconSize or uDim2,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageTransparency = p1.transparency or 0
		})
	})
end