local Packages = game:GetService("CorePackages").Packages
local ReactModule = require(Packages.React)
local UIBloxModule = require(Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseCameraOnModule = require(script.Parent.Parent.Hooks.useCameraOn)
local _UDim2 = UDim2.fromScale(1, 1)

return function(p1) --[[ Line: 18 | Named "CameraStatusIcon" ]]
	-- upvalues: UseCameraOnModule (copy), ReactModule (copy), ImageSetLabel (copy), Images (copy), _UDim2 (copy)
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		Icon = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Image = UseCameraOnModule() and Images["icons/controls/video"] or Images["icons/controls/videoOff"],
			Size = p1.iconSize or _UDim2,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ImageTransparency = p1.transparency or 0
		})
	})
end