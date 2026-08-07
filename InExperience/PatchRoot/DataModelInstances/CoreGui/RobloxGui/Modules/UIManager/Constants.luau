local t = {
	ScreenUI = "ScreenUI",
	SpatialUI = "SpatialUI",
	SpatialUIPartOnly = "SpatialUIPartOnly",
	SpatialUIRoact = "SpatialUIRoact"
}
local t_1 = {
	Chat = "Chat",
	RobloxGui = "RobloxGui",
	BottomBar = "BottomBar",
	MoreMenu = "MoreMenu"
}
local t_2 = {
	MainUIGroup = "MainUIGroup",
	WristUIGroup = "WristUIGroup"
}
local var3 = Vector2.new(0.1365, 0.1995) * 3.333333333333
local var4 = Vector2.new(0.532, 0.3395) * 3.333333333333

return {
	VR_PANEL_RESOLUTION_MULTIPLIER = 800,
	BOTTOM_BAR_BASE_PART_SIZE = 0.15,
	SpatialUIType = t,
	SpatialUIGroupType = t_2,
	PanelType = t_1,
	DEFAULT_VR_PANEL_SIZE = Vector2.new(10, 10),
	COMPAT_PANEL_PROPS_MAP = {
		[t_1.Chat] = {
			type = t.SpatialUI,
			spatialPanelProps = {
				name = "ExperienceChat",
				faceCamera = true,
				lerp = true,
				partSize = var3,
				virtualScreenSize = var3 * 800
			}
		},
		[t_1.RobloxGui] = {
			type = t.SpatialUIPartOnly,
			spatialPanelProps = {
				name = "RobloxGuiPanel-PartOnly",
				faceCamera = true,
				lerp = true,
				transparency = 0.5,
				partSize = var4
			}
		}
	},
	SPATIAL_PANEL_POSITION_PROPS_MAP = {
		[t_1.Chat] = {
			uiGroup = t_2.MainUIGroup,
			cameraFixedPanelProp = {
				uiGroupElementOffset = CFrame.new(var4.X * 0.5 + var3.X * 0.5 + 0.066666666667, (var4.Y - var3.Y) / 2, 0)
			}
		},
		[t_1.RobloxGui] = {
			uiGroup = t_2.MainUIGroup,
			cameraFixedPanelProp = { uiGroupElementOffset = CFrame.new(0, 0, 0) }
		}
	},
	ROACT_PANEL_UIGROUP_MAP = {
		[t_1.BottomBar] = t_2.MainUIGroup,
		[t_1.MoreMenu] = t_2.MainUIGroup
	},
	ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP = {
		[t_1.BottomBar] = CFrame.new(0, -var4.Y * 0.5 - 0.075 - 0.033333333333, 0) * CFrame.Angles(0, 3.14159265359, 0),
		[t_1.MoreMenu] = CFrame.new(0.4, -0.36, 0) * CFrame.Angles(0, 3.14159265359, 0)
	}
}