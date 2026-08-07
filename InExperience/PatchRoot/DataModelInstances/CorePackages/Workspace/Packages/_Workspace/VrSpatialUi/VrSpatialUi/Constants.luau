local var21
local parent = script:FindFirstAncestor("VrSpatialUi").Parent
local inExperienceUIVRIXP = require(parent.SharedExperimentDefinition).InExperienceUIVRIXP
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local var0 = if isInExperienceUIVREnabled then require(parent.LuauPolyfill) else nil
local vector2 = Vector2.new(0, 0)
local cFrame = CFrame.new(0, 0, 0)
local var3 = game:DefineFastInt("SpatialUIResolutionScale", 100) / 100
local spatialUIPanelDragBarDistance = game:DefineFastInt("SpatialUIPanelDragBarDistance", 10)
local spatialUIPanelZOffset = game:DefineFastInt("SpatialUIPanelZOffset", 100)
local fFlagEnableInExperienceUIPCVRFix = require(parent.SharedFlags).FFlagEnableInExperienceUIPCVRFix
local spatialUIChromeSubMenuHeight = game:DefineFastInt("SpatialUIChromeSubMenuHeight", 448)
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
	MoreMenu = "MoreMenu",
	ChromeSubMenu = "ChromeSubMenu",
	ToolTipsContainer = "ToolTipsContainer"
}
local t_2 = {
	MainUIGroup = "MainUIGroup",
	MenuUIGroup = "MenuUIGroup",
	ChatUIGroup = "ChatUIGroup",
	ChromeSubMenuUIGroup = "ChromeSubMenuUIGroup",
	WristUIGroup = "WristUIGroup"
}
local var10 = 800 / var3

local function _(p0) --[[ line: 173 | named "pixelToScaledSize" ]]
	-- upvalues: var10 (ref)
	return p0 / var10
end

local _ = function(p1, p2) --[[ line: 177 | named "getScaledResolutionForPart" ]]
	-- upvalues: var10 (ref)
	return Vector2.new(p1 / var10, p2 / var10)
end

local _ = function(p3, p4, p5) --[[ line: 181 | named "panelDistanceWithSpacing" ]]
	-- upvalues: var10 (ref)
	local var49 = p5 / var10
	
	return Vector2.new(p3.X * 0.5 + p4.X * 0.5 + var49, p3.Y * 0.5 + p4.Y * 0.5 + var49)
end

local _ = function(p6, p7) --[[ line: 188 | named "alignPanelLeftToAnchor" ]]
	return p7.X * 0.5 - p6.X * 0.5
end

local _ = function(p8, p9) --[[ line: 192 | named "alignPanelTopToAnchor" ]]
	return p8.Y * 0.5 - p9.Y * 0.5
end

local _ = function(p10, p11) --[[ line: 196 | named "alignPanelBottomToAnchor" ]]
	return p11.Y * 0.5 - p10.Y * 0.5
end

local _ = function() --[[ line: 200 | named "getAdditionalZOffsetIfNeeded" ]]
	-- upvalues: inExperienceUIVRIXP (ref), spatialUIPanelZOffset (ref)
	return if inExperienceUIVRIXP:isMovePanelToCenter() then spatialUIPanelZOffset / 1000 else 0
end

local t_3 = {
	PANEL_TO_PANEL = 10,
	PANEL_TO_BOTTOMBAR = 10,
	PANEL_TO_CHROME_BOTTOM_OFFSET = 24,
	PANEL_TO_DRAGBAR = spatialUIPanelDragBarDistance
}

local function getPanelAroundLeftOrRightEdgeRotation(value, p12) --[[ line: 217 ]]
	-- upvalues: t_3 (ref), var10 (ref)
	local var50 = value.X * 0.5 + t_3.PANEL_TO_PANEL / var10 * 0.5
	local var51 = if p12 > 0 then Vector3.new(var50, 0, 0) else Vector3.new(-1 * var50, 0, 0)
	
	return CFrame.new(var51) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), math.rad(p12)) * CFrame.new(-var51)
end

local var13 = if isInExperienceUIVREnabled then Vector2.new(943 / var10, 640 / var10) else Vector2.new(0.532, 0.3395) * 3.333333333333
local var14 = if isInExperienceUIVREnabled then Vector2.new(434 / var10, 264 / var10) else Vector2.new(0.1365, 0.1995) * 3.333333333333
local var15 = if isInExperienceUIVREnabled then Vector2.new(800 / var10, 640 / var10) else Vector2.new(0.532, 0.3395) * 3.333333333333
local var16 = if isInExperienceUIVREnabled then Vector2.new(317 / var10, (if fFlagEnableInExperienceUIPCVRFix then spatialUIChromeSubMenuHeight else 292) / var10) else vector2
local var17 = if isInExperienceUIVREnabled then Vector2.new(943 / var10, 64 / var10) else vector2
local var18 = if isInExperienceUIVREnabled then Vector2.new(var17.X, 120 / var10) else vector2
local var19 = if isInExperienceUIVREnabled then Vector2.new(296 / var10, 40 / var10) else vector2
local var20 = if isInExperienceUIVREnabled then {
	[t_2.MenuUIGroup] = getPanelAroundLeftOrRightEdgeRotation(var15, if inExperienceUIVRIXP:isMovePanelToCenter() then 0 else 15),
	[t_2.ChatUIGroup] = getPanelAroundLeftOrRightEdgeRotation(var14, if inExperienceUIVRIXP:isMovePanelToCenter() then 0 else -15)
} else {}

if isInExperienceUIVREnabled then
	local var22
	local new = CFrame.new
	
	if inExperienceUIVRIXP:isMovePanelToCenter() then
		var22 = 0
	else
		local var23 = t_3.PANEL_TO_PANEL / var10
		var22 = -1 * Vector2.new(var13.X * 0.5 + var15.X * 0.5 + var23, var13.Y * 0.5 + var15.Y * 0.5 + var23).X
	end
	var21 = new(var22, var13.Y * 0.5 - var15.Y * 0.5, if inExperienceUIVRIXP:isMovePanelToCenter() then spatialUIPanelZOffset / 1000 else 0) * var20[t_2.MenuUIGroup]
else
	var21 = CFrame.new(0.4, -0.36, 0) * CFrame.Angles(0, 3.14159265359, 0)
end
local var26
if isInExperienceUIVREnabled then
	local var24
	local new = CFrame.new
	
	if inExperienceUIVRIXP:isMovePanelToCenter() then
		var24 = var14.X * 0.5 - var13.X * 0.5
	else
		local var25 = t_3.PANEL_TO_PANEL / var10
		var24 = Vector2.new(var13.X * 0.5 + var14.X * 0.5 + var25, var13.Y * 0.5 + var14.Y * 0.5 + var25).X
	end
	var26 = new(var24, var13.Y * 0.5 - var14.Y * 0.5, if inExperienceUIVRIXP:isMovePanelToCenter() then spatialUIPanelZOffset / 1000 else 0) * var20[t_2.ChatUIGroup]
else
	var26 = CFrame.new(var13.X * 0.5 + var14.X * 0.5 + 0.066666666667, (var13.Y - var14.Y) / 2, 0)
end
local var27 = if isInExperienceUIVREnabled then CFrame.new(0, var16.Y * 0.5 - var13.Y * 0.5 + t_3.PANEL_TO_CHROME_BOTTOM_OFFSET / var10, if inExperienceUIVRIXP:isMovePanelToCenter() then spatialUIPanelZOffset / 1000 else 0) * CFrame.Angles(0, 3.14159265359, 0) else cFrame
local var28 = if isInExperienceUIVREnabled then CFrame.new(0, var18.Y * 0.5 - var13.Y * 0.5 - t_3.PANEL_TO_BOTTOMBAR / var10, if inExperienceUIVRIXP:isMovePanelToCenter() then spatialUIPanelZOffset / 1000 else 0) * CFrame.Angles(0, 3.14159265359, 0) else cFrame
local t_4 = {
	[t_1.Chat] = {
		type = t.SpatialUI,
		spatialPanelProps = {
			name = "ExperienceChat",
			faceCamera = true,
			lerp = true,
			partSize = var14,
			virtualScreenSize = var14 * var10
		}
	},
	[t_1.RobloxGui] = {
		type = t.SpatialUIPartOnly,
		spatialPanelProps = {
			name = "RobloxGuiPanel-PartOnly",
			faceCamera = true,
			lerp = true,
			transparency = 0.5,
			partSize = var13
		}
	}
}

if isInExperienceUIVREnabled then
	t_4 = var0.Object.assign(t_4, {
		[t_1.MoreMenu] = {
			type = t.SpatialUI,
			spatialPanelProps = {
				name = "MoreMenu",
				faceCamera = true,
				lerp = true,
				partSize = var15,
				virtualScreenSize = var15 * var10
			}
		},
		[t_1.ChromeSubMenu] = {
			type = t.SpatialUI,
			spatialPanelProps = {
				name = "ChromeSubMenu",
				faceCamera = true,
				lerp = true,
				partSize = var16,
				virtualScreenSize = var16 * var10
			}
		},
		[t_1.ToolTipsContainer] = {
			type = t.SpatialUI,
			spatialPanelProps = {
				name = "ToolTipsContainer",
				faceCamera = true,
				lerp = true,
				partSize = var18,
				virtualScreenSize = var18 * var10
			}
		}
	})
end
local var32
local t_5 = {
	[t_1.Chat] = {
		uiGroup = if isInExperienceUIVREnabled then t_2.ChatUIGroup else t_2.MainUIGroup,
		cameraFixedPanelProp = { uiGroupElementOffset = var26 }
	},
	[t_1.RobloxGui] = {
		uiGroup = t_2.MainUIGroup,
		cameraFixedPanelProp = { uiGroupElementOffset = CFrame.new(0, 0, 0) }
	}
}

if isInExperienceUIVREnabled then
	t_5 = var0.Object.assign(t_5, {
		[t_1.MoreMenu] = {
			uiGroup = t_2.MenuUIGroup,
			cameraFixedPanelProp = { uiGroupElementOffset = var21 }
		},
		[t_1.ChromeSubMenu] = {
			uiGroup = t_2.ChromeSubMenuUIGroup,
			cameraFixedPanelProp = { uiGroupElementOffset = var27 }
		},
		[t_1.ToolTipsContainer] = {
			uiGroup = t_2.MainUIGroup,
			cameraFixedPanelProp = { uiGroupElementOffset = var28 }
		}
	})
end
if isInExperienceUIVREnabled then
	local var31 = t_3.PANEL_TO_BOTTOMBAR / var10
	var32 = CFrame.new(0, -1 * Vector2.new(var13.X * 0.5 + var17.X * 0.5 + var31, var13.Y * 0.5 + var17.Y * 0.5 + var31).Y, 0) * CFrame.Angles(0, 3.14159265359, 0)
else
	var32 = CFrame.new(0, -var13.Y * 0.5 - 0.075 - 0.033333333333, 0) * CFrame.Angles(0, 3.14159265359, 0)
end
local t_6 = {
	[t_1.BottomBar] = t_2.MainUIGroup,
	[t_1.MoreMenu] = if isInExperienceUIVREnabled then t_2.MenuUIGroup else t_2.MainUIGroup
}

if isInExperienceUIVREnabled then
	t_6 = var0.Object.assign(t_6, {
		[t_1.Chat] = t_2.ChatUIGroup,
		[t_1.ChromeSubMenu] = t_2.ChromeSubMenuUIGroup,
		[t_1.ToolTipsContainer] = t_2.MainUIGroup
	})
end
local t_7 = { [t_1.BottomBar] = var32, [t_1.MoreMenu] = var21 }

if isInExperienceUIVREnabled then
	t_7 = var0.Object.assign(t_7, {
		[t_1.Chat] = var26,
		[t_1.ChromeSubMenu] = var27,
		[t_1.ToolTipsContainer] = var28
	})
end
local function getDragBarOffsetForPanel(value, p13, p14, p15) --[[ line: 451 ]]
	-- upvalues: t_4 (write), vector2 (ref), t_3 (ref), t_7 (write), var19 (ref), var10 (ref)
	local var52
	local _ = nil
	
	if p13 then
		var52 = p13
	else
		local spatialPanelProps = t_4[value].spatialPanelProps
		var52 = if spatialPanelProps then spatialPanelProps.partSize else vector2
	end
	local PANEL_TO_DRAGBAR = t_3.PANEL_TO_DRAGBAR
	
	if p15 then
		PANEL_TO_DRAGBAR += p15
	end
	local var53 = t_7[value]
	
	if p14 == true then
		var53 *= CFrame.Angles(0, -3.14159265359, 0)
	end
	local var54 = PANEL_TO_DRAGBAR / var10
	
	return var53 * CFrame.new(0, -1 * Vector2.new(var52.X * 0.5 + var19.X * 0.5 + var54, var52.Y * 0.5 + var19.Y * 0.5 + var54).Y, 0)
end

local t_8 = {
	[t_2.MainUIGroup] = CFrame.new(0, t_7[t_1.BottomBar].Y - 0.075 - 0.066666666667, 0)
}

if isInExperienceUIVREnabled then
	local assign = var0.Object.assign
	local var37 = t_8
	local t_9 = {
		[t_2.MainUIGroup] = getDragBarOffsetForPanel(t_1.BottomBar, var17, true)
	}
	local chatUIGroup = t_2.ChatUIGroup
	local chat = t_1.Chat
	local _ = nil
	local spatialPanelProps = t_4[chat].spatialPanelProps
	local var39 = if spatialPanelProps then spatialPanelProps.partSize else vector2
	local var40 = t_3.PANEL_TO_DRAGBAR / var10
	t_9[chatUIGroup] = t_7[chat] * CFrame.new(0, -1 * Vector2.new(var39.X * 0.5 + var19.X * 0.5 + var40, var39.Y * 0.5 + var19.Y * 0.5 + var40).Y, 0)
	local menuUIGroup = t_2.MenuUIGroup
	local moreMenu = t_1.MoreMenu
	local _ = nil
	local spatialPanelProps_1 = t_4[moreMenu].spatialPanelProps
	local var41 = if spatialPanelProps_1 then spatialPanelProps_1.partSize else vector2
	local var42 = t_3.PANEL_TO_DRAGBAR / var10
	t_9[menuUIGroup] = t_7[moreMenu] * CFrame.new(0, -1 * Vector2.new(var41.X * 0.5 + var19.X * 0.5 + var42, var41.Y * 0.5 + var19.Y * 0.5 + var42).Y, 0)
	local chromeSubMenuUIGroup = t_2.ChromeSubMenuUIGroup
	local chromeSubMenu = t_1.ChromeSubMenu
	local _ = nil
	local spatialPanelProps_2 = t_4[chromeSubMenu].spatialPanelProps
	local var43 = if spatialPanelProps_2 then spatialPanelProps_2.partSize else vector2
	local PANEL_TO_DRAGBAR = t_3.PANEL_TO_DRAGBAR
	local var44 = t_7[chromeSubMenu] * CFrame.Angles(0, -3.14159265359, 0)
	local new = CFrame.new
	local var45 = 0
	local var46 = -1
	local var47 = var43
	local var48 = PANEL_TO_DRAGBAR / var10
	t_9[chromeSubMenuUIGroup] = var44 * new(var45, var46 * Vector2.new(var47.X * 0.5 + var19.X * 0.5 + var48, var47.Y * 0.5 + var19.Y * 0.5 + var48).Y, 0)
	t_8 = assign(var37, t_9)
end
return {
	BOTTOM_BAR_BASE_PART_SIZE = 0.15,
	SPATIAL_TOOLTIP_SPACING = 2,
	SpatialUIType = t,
	SpatialUIGroupType = t_2,
	PanelType = t_1,
	DEFAULT_VR_PANEL_SIZE = Vector2.new(10, 10),
	VR_PANEL_RESOLUTION_MULTIPLIER = var10,
	COMPAT_PANEL_PROPS_MAP = t_4,
	SPATIAL_PANEL_POSITION_PROPS_MAP = t_5,
	ROACT_PANEL_UIGROUP_MAP = t_6,
	ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP = t_7,
	UIGROUP_DRAGBAR_OFFSET_MAP = t_8,
	UIGROUP_INITITIAL_ROTATION_MAP = var20,
	DRAG_BAR_SIZE = var19,
	BOTTOM_BAR_SIZE = var17
}