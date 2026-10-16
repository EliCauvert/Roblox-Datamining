local SpatialUIType = {
	ScreenUI = "ScreenUI",
	SpatialUI = "SpatialUI",
	SpatialUIPartOnly = "SpatialUIPartOnly",
	SpatialUIRoact = "SpatialUIRoact"
}
local PanelType = {
	Chat = "Chat",
	RobloxGui = "RobloxGui",
	BottomBar = "BottomBar",
	MoreMenu = "MoreMenu"
}
local SpatialUIGroupType = {
	MainUIGroup = "MainUIGroup",
	WristUIGroup = "WristUIGroup"
}
local ScaledVector = Vector2.new(0.1365, 0.1995) * 3.3333333333333335
local ScaledVector1 = Vector2.new(0.532, 0.3395) * 3.3333333333333335

return {
	VR_PANEL_RESOLUTION_MULTIPLIER = 800,
	BOTTOM_BAR_BASE_PART_SIZE = 0.15,
	SpatialUIType = SpatialUIType,
	SpatialUIGroupType = SpatialUIGroupType,
	PanelType = PanelType,
	DEFAULT_VR_PANEL_SIZE = Vector2.new(10, 10),
	COMPAT_PANEL_PROPS_MAP = {
		[PanelType.Chat] = {
			type = SpatialUIType.SpatialUI,
			spatialPanelProps = {
				name = "ExperienceChat",
				faceCamera = true,
				lerp = true,
				partSize = ScaledVector,
				virtualScreenSize = ScaledVector * 800
			}
		},
		[PanelType.RobloxGui] = {
			type = SpatialUIType.SpatialUIPartOnly,
			spatialPanelProps = {
				name = "RobloxGuiPanel-PartOnly",
				faceCamera = true,
				lerp = true,
				transparency = 0.5,
				partSize = ScaledVector1
			}
		}
	},
	SPATIAL_PANEL_POSITION_PROPS_MAP = {
		[PanelType.Chat] = {
			uiGroup = SpatialUIGroupType.MainUIGroup,
			cameraFixedPanelProp = {
				uiGroupElementOffset = CFrame.new(ScaledVector1.X * 0.5 + ScaledVector.X * 0.5 + 0.06666666666666667, (ScaledVector1.Y - ScaledVector.Y) / 2, 0)
			}
		},
		[PanelType.RobloxGui] = {
			uiGroup = SpatialUIGroupType.MainUIGroup,
			cameraFixedPanelProp = { uiGroupElementOffset = CFrame.new(0, 0, 0) }
		}
	},
	ROACT_PANEL_UIGROUP_MAP = {
		[PanelType.BottomBar] = SpatialUIGroupType.MainUIGroup,
		[PanelType.MoreMenu] = SpatialUIGroupType.MainUIGroup
	},
	ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP = {
		[PanelType.BottomBar] = CFrame.new(0, -ScaledVector1.Y * 0.5 - 0.075 - 0.03333333333333333, 0) * CFrame.Angles(0, 3.141592653589793, 0),
		[PanelType.MoreMenu] = CFrame.new(0.4, -0.36, 0) * CFrame.Angles(0, 3.141592653589793, 0)
	}
}