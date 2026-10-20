local CorePackages = game:GetService("CorePackages")
local Constants = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Constants
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local AdjustmentTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType)
local AdjustmentSliderTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType)
local AxisTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AxisType)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local ConstantsModule = {
	XAxisColor = Color3.fromRGB(242, 64, 68),
	YAxisColor = Color3.fromRGB(11, 151, 88),
	ZAxisColor = Color3.fromRGB(86, 122, 252),
	LineDiameter = 0.05,
	LineThickness = 5
}
ConstantsModule.LineHandleData = {
	[1] = {
		LimitKey = "xPosition",
		Direction = -1,
		Color3 = ConstantsModule.XAxisColor,
		Orientation = CFrame.Angles(0, 0, 0),
		AxisType = AxisTypeModule.X
	},
	[2] = {
		LimitKey = "xPosition",
		Direction = 1,
		Color3 = ConstantsModule.XAxisColor,
		Orientation = CFrame.Angles(0, 3.141592653589793, 0),
		AxisType = AxisTypeModule.X
	},
	[3] = {
		LimitKey = "yPosition",
		Direction = 1,
		Color3 = ConstantsModule.YAxisColor,
		Orientation = CFrame.Angles(0, 0, -1.5707963267948966),
		AxisType = AxisTypeModule.Y
	},
	[4] = {
		LimitKey = "yPosition",
		Direction = -1,
		Color3 = ConstantsModule.YAxisColor,
		Orientation = CFrame.Angles(0, 0, 1.5707963267948966),
		AxisType = AxisTypeModule.Y
	},
	[5] = {
		LimitKey = "zPosition",
		Direction = -1,
		Color3 = ConstantsModule.ZAxisColor,
		Orientation = CFrame.Angles(0, 1.5707963267948966, 0),
		AxisType = AxisTypeModule.Z
	},
	[6] = {
		LimitKey = "zPosition",
		Direction = 1,
		Color3 = ConstantsModule.ZAxisColor,
		Orientation = CFrame.Angles(0, -1.5707963267948966, 0),
		AxisType = AxisTypeModule.Z
	}
}
ConstantsModule.RingData = {
	[1] = {
		Color3 = ConstantsModule.XAxisColor,
		Orientation = CFrame.Angles(0, 0, 1.5707963267948966)
	},
	[2] = {
		Color3 = ConstantsModule.YAxisColor,
		Orientation = CFrame.Angles(0, 0, 0)
	},
	[3] = {
		Color3 = ConstantsModule.ZAxisColor,
		Orientation = CFrame.Angles(1.5707963267948966, 0, 0)
	}
}
ConstantsModule.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
ConstantsModule.CameraCategories = {
	[Enum.AccessoryType.Hat] = {
		Name = "Hat",
		Title = "Hat",
		CameraFocus = ConstantsModule1.FocusType.Head,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Hat
	},
	[Enum.AccessoryType.Face] = {
		Name = "Face",
		Title = "Face",
		CameraFocus = ConstantsModule1.FocusType.Face,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Face
	},
	[Enum.AccessoryType.Neck] = {
		Name = "Neck",
		Title = "Neck",
		CameraFocus = ConstantsModule1.FocusType.Neck,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Neck
	},
	[Enum.AccessoryType.Shoulder] = {
		Name = "Shoulder",
		Title = "Shoulder",
		CameraFocus = ConstantsModule1.FocusType.Shoulders,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Shoulder
	},
	[Enum.AccessoryType.Front] = {
		Name = "Front",
		Title = "Front",
		CameraFocus = ConstantsModule1.FocusType.Arms,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Front
	},
	[Enum.AccessoryType.Back] = {
		Name = "Back",
		Title = "Back",
		CameraFocus = ConstantsModule1.FocusType.Arms,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Back
	},
	[Enum.AccessoryType.Waist] = {
		Name = "Waist",
		Title = "Waist",
		CameraFocus = ConstantsModule1.FocusType.Waist,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.AccessoryAdjustment.Waist
	}
}
ConstantsModule.DefaultSliderValues = {
	[AdjustmentSliderTypeModule.PositionX] = 0,
	[AdjustmentSliderTypeModule.PositionY] = 0,
	[AdjustmentSliderTypeModule.PositionZ] = 0,
	[AdjustmentSliderTypeModule.RotationX] = 0,
	[AdjustmentSliderTypeModule.RotationY] = 0,
	[AdjustmentSliderTypeModule.RotationZ] = 0,
	[AdjustmentSliderTypeModule.Scale] = 1
}
ConstantsModule.AdjustmentSliderTypeToAdjustmentType = {
	[AdjustmentSliderTypeModule.PositionX] = AdjustmentTypeModule.Position,
	[AdjustmentSliderTypeModule.PositionY] = AdjustmentTypeModule.Position,
	[AdjustmentSliderTypeModule.PositionZ] = AdjustmentTypeModule.Position,
	[AdjustmentSliderTypeModule.RotationX] = AdjustmentTypeModule.Rotation,
	[AdjustmentSliderTypeModule.RotationY] = AdjustmentTypeModule.Rotation,
	[AdjustmentSliderTypeModule.RotationZ] = AdjustmentTypeModule.Rotation,
	[AdjustmentSliderTypeModule.Scale] = AdjustmentTypeModule.Scale
}

return ConstantsModule