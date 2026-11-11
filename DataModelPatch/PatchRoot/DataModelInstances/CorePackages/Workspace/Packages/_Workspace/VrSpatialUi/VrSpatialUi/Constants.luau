local Parent = script:FindFirstAncestor("VrSpatialUi").Parent
local InExperienceUIVRIXP = require(Parent.SharedExperimentDefinition).InExperienceUIVRIXP
local IsInExperienceUIVREnabled = require(Parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local LuauPolyfillModule = if IsInExperienceUIVREnabled then require(Parent.LuauPolyfill) else nil
local _Vector2 = Vector2.new(0, 0)
local _CFrame = CFrame.new(0, 0, 0)
local SpatialUIPanelZOffset: number = game:DefineFastInt("SpatialUIPanelZOffset", 100)
local FFlagEnableInExperienceUIPCVRFix = require(Parent.SharedFlags).FFlagEnableInExperienceUIPCVRFix
local SpatialUIChromeSubMenuHeight = game:DefineFastInt("SpatialUIChromeSubMenuHeight", 448)
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
	MoreMenu = "MoreMenu",
	ChromeSubMenu = "ChromeSubMenu",
	ToolTipsContainer = "ToolTipsContainer"
}
local SpatialUIGroupType = {
	MainUIGroup = "MainUIGroup",
	MenuUIGroup = "MenuUIGroup",
	ChatUIGroup = "ChatUIGroup",
	ChromeSubMenuUIGroup = "ChromeSubMenuUIGroup",
	WristUIGroup = "WristUIGroup"
}
local v1 = 800 / (game:DefineFastInt("SpatialUIResolutionScale", 100) / 100)

local function _(p1)
	-- upvalues: v1 (copy)
	return p1 / v1
end

local _ = function(p1, p2): Vector2
	-- upvalues: v1 (copy)
	return Vector2.new(p1 / v1, p2 / v1)
end

local _ = function(Vector, Vector1, p1): Vector2
	-- upvalues: v1 (copy)
	local v2 = p1 / v1
	
	return Vector2.new(Vector.X * 0.5 + Vector1.X * 0.5 + v2, Vector.Y * 0.5 + Vector1.Y * 0.5 + v2)
end

local _ = function(p1, p2)
	return p2.X * 0.5 - p1.X * 0.5
end

local _ = function(p1, p2)
	return p1.Y * 0.5 - p2.Y * 0.5
end

local _ = function(p1, p2)
	return p2.Y * 0.5 - p1.Y * 0.5
end

local _ = function(): number
	-- upvalues: InExperienceUIVRIXP (copy), SpatialUIPanelZOffset (copy)
	return if InExperienceUIVRIXP:isMovePanelToCenter() then SpatialUIPanelZOffset / 1000 else 0
end

local config = {
	PANEL_TO_PANEL = 10,
	PANEL_TO_BOTTOMBAR = 10,
	PANEL_TO_CHROME_BOTTOM_OFFSET = 24,
	PANEL_TO_DRAGBAR = game:DefineFastInt("SpatialUIPanelDragBarDistance", 10)
}

local function getPanelAroundLeftOrRightEdgeRotation(Vector, Degrees: number): CFrame
	-- upvalues: config (copy), v1 (copy)
	local NewX = Vector.X * 0.5 + config.PANEL_TO_PANEL / v1 * 0.5
	local _Vector3: Vector3 = if Degrees > 0 then Vector3.new(NewX, 0, 0) else Vector3.new(-1 * NewX, 0, 0)
	
	return CFrame.new(_Vector3) * CFrame.fromAxisAngle(vector.create(0, 1, 0), (math.rad(Degrees))) * CFrame.new(-_Vector3)
end

local _Vector2_1: Vector2 = if IsInExperienceUIVREnabled then Vector2.new(943 / v1, 640 / v1) else Vector2.new(0.532, 0.3395) * 3.3333333333333335
local _Vector2_2: Vector2 = if IsInExperienceUIVREnabled then Vector2.new(434 / v1, 264 / v1) else Vector2.new(0.1365, 0.1995) * 3.3333333333333335
local _Vector2_3: Vector2 = if IsInExperienceUIVREnabled then Vector2.new(800 / v1, 640 / v1) else Vector2.new(0.532, 0.3395) * 3.3333333333333335
local _Vector2_4: Vector2 = if IsInExperienceUIVREnabled then Vector2.new(317 / v1, (if FFlagEnableInExperienceUIPCVRFix then SpatialUIChromeSubMenuHeight else 292) / v1) else _Vector2
local _Vector2_5: Vector2 = if IsInExperienceUIVREnabled then Vector2.new(943 / v1, 64 / v1) else _Vector2
local _Vector2_6: Vector2 = if IsInExperienceUIVREnabled then Vector2.new(_Vector2_5.X, 120 / v1) else _Vector2
local _Vector2_7: Vector2 = if IsInExperienceUIVREnabled then Vector2.new(296 / v1, 40 / v1) else _Vector2
local Config = if IsInExperienceUIVREnabled then {
	[SpatialUIGroupType.MenuUIGroup] = getPanelAroundLeftOrRightEdgeRotation(_Vector2_3, if InExperienceUIVRIXP:isMovePanelToCenter() then 0 else 15),
	[SpatialUIGroupType.ChatUIGroup] = getPanelAroundLeftOrRightEdgeRotation(_Vector2_2, if InExperienceUIVRIXP:isMovePanelToCenter() then 0 else -15)
} else {}
local UiGroupElementOffset = nil

if IsInExperienceUIVREnabled then
	local NewFunction1 = CFrame.new
	local ScaledX = nil
	
	if InExperienceUIVRIXP:isMovePanelToCenter() then
		ScaledX = 0
	else
		local PANELTOPANELRatio = config.PANEL_TO_PANEL / v1
		ScaledX = -1 * Vector2.new(_Vector2_1.X * 0.5 + _Vector2_3.X * 0.5 + PANELTOPANELRatio, _Vector2_1.Y * 0.5 + _Vector2_3.Y * 0.5 + PANELTOPANELRatio).X
	end
	UiGroupElementOffset = NewFunction1(ScaledX, _Vector2_1.Y * 0.5 - _Vector2_3.Y * 0.5, if InExperienceUIVRIXP:isMovePanelToCenter() then SpatialUIPanelZOffset / 1000 else 0) * Config[SpatialUIGroupType.MenuUIGroup]
else
	UiGroupElementOffset = CFrame.new(0.4, -0.36, 0) * CFrame.Angles(0, 3.141592653589793, 0)
end
local _CFrame1 = nil
if IsInExperienceUIVREnabled then
	local NewFunction = CFrame.new
	local XDelta = nil
	
	if InExperienceUIVRIXP:isMovePanelToCenter() then
		XDelta = _Vector2_2.X * 0.5 - _Vector2_1.X * 0.5
	else
		local PANELTOPANELRatio = config.PANEL_TO_PANEL / v1
		XDelta = Vector2.new(_Vector2_1.X * 0.5 + _Vector2_2.X * 0.5 + PANELTOPANELRatio, _Vector2_1.Y * 0.5 + _Vector2_2.Y * 0.5 + PANELTOPANELRatio).X
	end
	_CFrame1 = NewFunction(XDelta, _Vector2_1.Y * 0.5 - _Vector2_2.Y * 0.5, if InExperienceUIVRIXP:isMovePanelToCenter() then SpatialUIPanelZOffset / 1000 else 0) * Config[SpatialUIGroupType.ChatUIGroup]
else
	_CFrame1 = CFrame.new(_Vector2_1.X * 0.5 + _Vector2_2.X * 0.5 + 0.06666666666666667, (_Vector2_1.Y - _Vector2_2.Y) / 2, 0)
end
local _CFrame2: CFrame = if IsInExperienceUIVREnabled then CFrame.new(0, _Vector2_4.Y * 0.5 - _Vector2_1.Y * 0.5 + config.PANEL_TO_CHROME_BOTTOM_OFFSET / v1, if InExperienceUIVRIXP:isMovePanelToCenter() then SpatialUIPanelZOffset / 1000 else 0) * CFrame.Angles(0, 3.141592653589793, 0) else _CFrame
local _CFrame3: CFrame = if IsInExperienceUIVREnabled then CFrame.new(0, _Vector2_6.Y * 0.5 - _Vector2_1.Y * 0.5 - config.PANEL_TO_BOTTOMBAR / v1, if InExperienceUIVRIXP:isMovePanelToCenter() then SpatialUIPanelZOffset / 1000 else 0) * CFrame.Angles(0, 3.141592653589793, 0) else _CFrame
local AssignResult = {
	[PanelType.Chat] = {
		type = SpatialUIType.SpatialUI,
		spatialPanelProps = {
			name = "ExperienceChat",
			faceCamera = true,
			lerp = true,
			partSize = _Vector2_2,
			virtualScreenSize = _Vector2_2 * v1
		}
	},
	[PanelType.RobloxGui] = {
		type = SpatialUIType.SpatialUIPartOnly,
		spatialPanelProps = {
			name = "RobloxGuiPanel-PartOnly",
			faceCamera = true,
			lerp = true,
			transparency = 0.5,
			partSize = _Vector2_1
		}
	}
}

if IsInExperienceUIVREnabled then
	AssignResult = LuauPolyfillModule.Object.assign(AssignResult, {
		[PanelType.MoreMenu] = {
			type = SpatialUIType.SpatialUI,
			spatialPanelProps = {
				name = "MoreMenu",
				faceCamera = true,
				lerp = true,
				partSize = _Vector2_3,
				virtualScreenSize = _Vector2_3 * v1
			}
		},
		[PanelType.ChromeSubMenu] = {
			type = SpatialUIType.SpatialUI,
			spatialPanelProps = {
				name = "ChromeSubMenu",
				faceCamera = true,
				lerp = true,
				partSize = _Vector2_4,
				virtualScreenSize = _Vector2_4 * v1
			}
		},
		[PanelType.ToolTipsContainer] = {
			type = SpatialUIType.SpatialUI,
			spatialPanelProps = {
				name = "ToolTipsContainer",
				faceCamera = true,
				lerp = true,
				partSize = _Vector2_6,
				virtualScreenSize = _Vector2_6 * v1
			}
		}
	})
end
local AssignResult1 = {
	[PanelType.Chat] = {
		uiGroup = if IsInExperienceUIVREnabled then SpatialUIGroupType.ChatUIGroup else SpatialUIGroupType.MainUIGroup,
		cameraFixedPanelProp = { uiGroupElementOffset = _CFrame1 }
	},
	[PanelType.RobloxGui] = {
		uiGroup = SpatialUIGroupType.MainUIGroup,
		cameraFixedPanelProp = { uiGroupElementOffset = CFrame.new(0, 0, 0) }
	}
}

if IsInExperienceUIVREnabled then
	AssignResult1 = LuauPolyfillModule.Object.assign(AssignResult1, {
		[PanelType.MoreMenu] = {
			uiGroup = SpatialUIGroupType.MenuUIGroup,
			cameraFixedPanelProp = { uiGroupElementOffset = UiGroupElementOffset }
		},
		[PanelType.ChromeSubMenu] = {
			uiGroup = SpatialUIGroupType.ChromeSubMenuUIGroup,
			cameraFixedPanelProp = { uiGroupElementOffset = _CFrame2 }
		},
		[PanelType.ToolTipsContainer] = {
			uiGroup = SpatialUIGroupType.MainUIGroup,
			cameraFixedPanelProp = { uiGroupElementOffset = _CFrame3 }
		}
	})
end
local v2 = nil
if IsInExperienceUIVREnabled then
	local PANELTOBOTTOMBARRatio = config.PANEL_TO_BOTTOMBAR / v1
	v2 = CFrame.new(0, -1 * Vector2.new(_Vector2_1.X * 0.5 + _Vector2_5.X * 0.5 + PANELTOBOTTOMBARRatio, _Vector2_1.Y * 0.5 + _Vector2_5.Y * 0.5 + PANELTOBOTTOMBARRatio).Y, 0) * CFrame.Angles(0, 3.141592653589793, 0)
else
	v2 = CFrame.new(0, -_Vector2_1.Y * 0.5 - 0.075 - 0.03333333333333333, 0) * CFrame.Angles(0, 3.141592653589793, 0)
end
local AssignResult2 = {
	[PanelType.BottomBar] = SpatialUIGroupType.MainUIGroup,
	[PanelType.MoreMenu] = if IsInExperienceUIVREnabled then SpatialUIGroupType.MenuUIGroup else SpatialUIGroupType.MainUIGroup
}

if IsInExperienceUIVREnabled then
	AssignResult2 = LuauPolyfillModule.Object.assign(AssignResult2, {
		[PanelType.Chat] = SpatialUIGroupType.ChatUIGroup,
		[PanelType.ChromeSubMenu] = SpatialUIGroupType.ChromeSubMenuUIGroup,
		[PanelType.ToolTipsContainer] = SpatialUIGroupType.MainUIGroup
	})
end
local AssignResult3 = {
	[PanelType.BottomBar] = v2,
	[PanelType.MoreMenu] = UiGroupElementOffset
}

if IsInExperienceUIVREnabled then
	AssignResult3 = LuauPolyfillModule.Object.assign(AssignResult3, {
		[PanelType.Chat] = _CFrame1,
		[PanelType.ChromeSubMenu] = _CFrame2,
		[PanelType.ToolTipsContainer] = _CFrame3
	})
end
local function getDragBarOffsetForPanel(BottomBar, Vector, Enabled, Amount): CFrame
	-- upvalues: AssignResult (ref), _Vector2 (copy), config (copy), AssignResult3 (ref), _Vector2_7 (copy), v1 (copy)
	local PartSize = nil
	if Vector then
		PartSize = Vector
	else
		local SpatialPanelProps = AssignResult[BottomBar].spatialPanelProps
		PartSize = if SpatialPanelProps then SpatialPanelProps.partSize else _Vector2
	end
	local PANELTODRAGBAR = config.PANEL_TO_DRAGBAR
	
	if Amount then
		PANELTODRAGBAR += Amount
	end
	local AssignResultEntry = AssignResult3[BottomBar]
	
	if Enabled == true then
		AssignResultEntry *= CFrame.Angles(0, -3.141592653589793, 0)
	end
	local PANELTODRAGBARRatio = PANELTODRAGBAR / v1
	
	return AssignResultEntry * CFrame.new(0, -1 * Vector2.new(PartSize.X * 0.5 + _Vector2_7.X * 0.5 + PANELTODRAGBARRatio, PartSize.Y * 0.5 + _Vector2_7.Y * 0.5 + PANELTODRAGBARRatio).Y, 0)
end

local AssignResult4 = {
	[SpatialUIGroupType.MainUIGroup] = CFrame.new(0, AssignResult3[PanelType.BottomBar].Y - 0.075 - 0.06666666666666667, 0)
}

if IsInExperienceUIVREnabled then
	local Chat = PanelType.Chat
	local SpatialPanelProps = AssignResult[Chat].spatialPanelProps
	local PartSize = if SpatialPanelProps then SpatialPanelProps.partSize else _Vector2
	local PANELTODRAGBARRatio = config.PANEL_TO_DRAGBAR / v1
	local MoreMenu = PanelType.MoreMenu
	local SpatialPanelProps1 = AssignResult[MoreMenu].spatialPanelProps
	local PartSize1 = if SpatialPanelProps1 then SpatialPanelProps1.partSize else _Vector2
	local PANELTODRAGBARRatio1 = config.PANEL_TO_DRAGBAR / v1
	local ChromeSubMenu = PanelType.ChromeSubMenu
	local SpatialPanelProps2 = AssignResult[ChromeSubMenu].spatialPanelProps
	local PartSize2 = if SpatialPanelProps2 then SpatialPanelProps2.partSize else _Vector2
	local PANELTODRAGBARRatio2 = config.PANEL_TO_DRAGBAR / v1
	AssignResult4 = LuauPolyfillModule.Object.assign(AssignResult4, {
		[SpatialUIGroupType.MainUIGroup] = getDragBarOffsetForPanel(PanelType.BottomBar, _Vector2_5, true),
		[SpatialUIGroupType.ChatUIGroup] = AssignResult3[Chat] * CFrame.new(0, -1 * Vector2.new(PartSize.X * 0.5 + _Vector2_7.X * 0.5 + PANELTODRAGBARRatio, PartSize.Y * 0.5 + _Vector2_7.Y * 0.5 + PANELTODRAGBARRatio).Y, 0),
		[SpatialUIGroupType.MenuUIGroup] = AssignResult3[MoreMenu] * CFrame.new(0, -1 * Vector2.new(PartSize1.X * 0.5 + _Vector2_7.X * 0.5 + PANELTODRAGBARRatio1, PartSize1.Y * 0.5 + _Vector2_7.Y * 0.5 + PANELTODRAGBARRatio1).Y, 0),
		[SpatialUIGroupType.ChromeSubMenuUIGroup] = AssignResult3[ChromeSubMenu] * CFrame.Angles(0, -3.141592653589793, 0) * CFrame.new(0, -1 * Vector2.new(PartSize2.X * 0.5 + _Vector2_7.X * 0.5 + PANELTODRAGBARRatio2, PartSize2.Y * 0.5 + _Vector2_7.Y * 0.5 + PANELTODRAGBARRatio2).Y, 0)
	})
end
return {
	BOTTOM_BAR_BASE_PART_SIZE = 0.15,
	SPATIAL_TOOLTIP_SPACING = 2,
	SpatialUIType = SpatialUIType,
	SpatialUIGroupType = SpatialUIGroupType,
	PanelType = PanelType,
	DEFAULT_VR_PANEL_SIZE = Vector2.new(10, 10),
	VR_PANEL_RESOLUTION_MULTIPLIER = v1,
	COMPAT_PANEL_PROPS_MAP = AssignResult,
	SPATIAL_PANEL_POSITION_PROPS_MAP = AssignResult1,
	ROACT_PANEL_UIGROUP_MAP = AssignResult2,
	ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP = AssignResult3,
	UIGROUP_DRAGBAR_OFFSET_MAP = AssignResult4,
	UIGROUP_INITITIAL_ROTATION_MAP = Config,
	DRAG_BAR_SIZE = _Vector2_7,
	BOTTOM_BAR_SIZE = _Vector2_5
}