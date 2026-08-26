local var1
local parent = script:FindFirstAncestor("VrSpatialUi").Parent
local inExperienceUIVRIXP = require(parent.SharedExperimentDefinition).InExperienceUIVRIXP
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled
local var2 = if isInExperienceUIVREnabled then require(parent.LuauPolyfill) else nil
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
local var4 = 800 / var3

local function _(p1)
	-- upvalues: var4 (ref)
	return p1 / var4
end

local _ = function(p1, p2)
	-- upvalues: var4 (ref)
	return Vector2.new(p1 / var4, p2 / var4)
end

local _ = function(p1, p2, p3)
	-- upvalues: var4 (ref)
	local var5 = p3 / var4
	
	return Vector2.new(p1.X * 0.5 + p2.X * 0.5 + var5, p1.Y * 0.5 + p2.Y * 0.5 + var5)
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

local _ = function()
	-- upvalues: inExperienceUIVRIXP (ref), spatialUIPanelZOffset (ref)
	return if inExperienceUIVRIXP:isMovePanelToCenter() then spatialUIPanelZOffset / 1000 else 0
end

local t_3 = {
	PANEL_TO_PANEL = 10,
	PANEL_TO_BOTTOMBAR = 10,
	PANEL_TO_CHROME_BOTTOM_OFFSET = 24,
	PANEL_TO_DRAGBAR = spatialUIPanelDragBarDistance
}

local function getPanelAroundLeftOrRightEdgeRotation(value, p1)
	-- upvalues: t_3 (ref), var4 (ref)
	local var5 = value.X * 0.5 + t_3.PANEL_TO_PANEL / var4 * 0.5
	local var6 = if p1 > 0 then Vector3.new(var5, 0, 0) else Vector3.new(-1 * var5, 0, 0)
	
	return CFrame.new(var6) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), math.rad(p1)) * CFrame.new(-var6)
end

local var5 = if isInExperienceUIVREnabled then Vector2.new(943 / var4, 640 / var4) else Vector2.new(0.532, 0.3395) * 3.333333333333
local var6 = if isInExperienceUIVREnabled then Vector2.new(434 / var4, 264 / var4) else Vector2.new(0.1365, 0.1995) * 3.333333333333
local var7 = if isInExperienceUIVREnabled then Vector2.new(800 / var4, 640 / var4) else Vector2.new(0.532, 0.3395) * 3.333333333333
local var8 = if isInExperienceUIVREnabled then Vector2.new(317 / var4, (if fFlagEnableInExperienceUIPCVRFix then spatialUIChromeSubMenuHeight else 292) / var4) else vector2
local var9 = if isInExperienceUIVREnabled then Vector2.new(943 / var4, 64 / var4) else vector2
local var10 = if isInExperienceUIVREnabled then Vector2.new(var9.X, 120 / var4) else vector2
local var11 = if isInExperienceUIVREnabled then Vector2.new(296 / var4, 40 / var4) else vector2
local var12 = if isInExperienceUIVREnabled then {
	[t_2.MenuUIGroup] = getPanelAroundLeftOrRightEdgeRotation(var7, if inExperienceUIVRIXP:isMovePanelToCenter() then 0 else 15),
	[t_2.ChatUIGroup] = getPanelAroundLeftOrRightEdgeRotation(var6, if inExperienceUIVRIXP:isMovePanelToCenter() then 0 else -15)
} else {}

if isInExperienceUIVREnabled then
	local var13
	local new = CFrame.new
	
	if inExperienceUIVRIXP:isMovePanelToCenter() then
		var13 = 0
	else
		local var14 = t_3.PANEL_TO_PANEL / var4
		var13 = -1 * Vector2.new(var5.X * 0.5 + var7.X * 0.5 + var14, var5.Y * 0.5 + var7.Y * 0.5 + var14).X
	end
	var1 = new(var13, var5.Y * 0.5 - var7.Y * 0.5, if inExperienceUIVRIXP:isMovePanelToCenter() then spatialUIPanelZOffset / 1000 else 0) * var12[t_2.MenuUIGroup]
else
	var1 = CFrame.new(0.4, -0.36, 0) * CFrame.Angles(0, 3.14159265359, 0)
end
local var15
if isInExperienceUIVREnabled then
	local var16
	local new = CFrame.new
	
	if inExperienceUIVRIXP:isMovePanelToCenter() then
		var16 = var6.X * 0.5 - var5.X * 0.5
	else
		local var17 = t_3.PANEL_TO_PANEL / var4
		var16 = Vector2.new(var5.X * 0.5 + var6.X * 0.5 + var17, var5.Y * 0.5 + var6.Y * 0.5 + var17).X
	end
	var15 = new(var16, var5.Y * 0.5 - var6.Y * 0.5, if inExperienceUIVRIXP:isMovePanelToCenter() then spatialUIPanelZOffset / 1000 else 0) * var12[t_2.ChatUIGroup]
else
	var15 = CFrame.new(var5.X * 0.5 + var6.X * 0.5 + 0.066666666667, (var5.Y - var6.Y) / 2, 0)
end
local var18 = if isInExperienceUIVREnabled then CFrame.new(0, var8.Y * 0.5 - var5.Y * 0.5 + t_3.PANEL_TO_CHROME_BOTTOM_OFFSET / var4, if inExperienceUIVRIXP:isMovePanelToCenter() then spatialUIPanelZOffset / 1000 else 0) * CFrame.Angles(0, 3.14159265359, 0) else cFrame
local var19 = if isInExperienceUIVREnabled then CFrame.new(0, var10.Y * 0.5 - var5.Y * 0.5 - t_3.PANEL_TO_BOTTOMBAR / var4, if inExperienceUIVRIXP:isMovePanelToCenter() then spatialUIPanelZOffset / 1000 else 0) * CFrame.Angles(0, 3.14159265359, 0) else cFrame
local t_4 = {
	[t_1.Chat] = {
		type = t.SpatialUI,
		spatialPanelProps = {
			name = "ExperienceChat",
			faceCamera = true,
			lerp = true,
			partSize = var6,
			virtualScreenSize = var6 * var4
		}
	},
	[t_1.RobloxGui] = {
		type = t.SpatialUIPartOnly,
		spatialPanelProps = {
			name = "RobloxGuiPanel-PartOnly",
			faceCamera = true,
			lerp = true,
			transparency = 0.5,
			partSize = var5
		}
	}
}

if isInExperienceUIVREnabled then
	t_4 = var2.Object.assign(t_4, {
		[t_1.MoreMenu] = {
			type = t.SpatialUI,
			spatialPanelProps = {
				name = "MoreMenu",
				faceCamera = true,
				lerp = true,
				partSize = var7,
				virtualScreenSize = var7 * var4
			}
		},
		[t_1.ChromeSubMenu] = {
			type = t.SpatialUI,
			spatialPanelProps = {
				name = "ChromeSubMenu",
				faceCamera = true,
				lerp = true,
				partSize = var8,
				virtualScreenSize = var8 * var4
			}
		},
		[t_1.ToolTipsContainer] = {
			type = t.SpatialUI,
			spatialPanelProps = {
				name = "ToolTipsContainer",
				faceCamera = true,
				lerp = true,
				partSize = var10,
				virtualScreenSize = var10 * var4
			}
		}
	})
end
local var20
local t_5 = {
	[t_1.Chat] = {
		uiGroup = if isInExperienceUIVREnabled then t_2.ChatUIGroup else t_2.MainUIGroup,
		cameraFixedPanelProp = { uiGroupElementOffset = var15 }
	},
	[t_1.RobloxGui] = {
		uiGroup = t_2.MainUIGroup,
		cameraFixedPanelProp = { uiGroupElementOffset = CFrame.new(0, 0, 0) }
	}
}

if isInExperienceUIVREnabled then
	t_5 = var2.Object.assign(t_5, {
		[t_1.MoreMenu] = {
			uiGroup = t_2.MenuUIGroup,
			cameraFixedPanelProp = { uiGroupElementOffset = var1 }
		},
		[t_1.ChromeSubMenu] = {
			uiGroup = t_2.ChromeSubMenuUIGroup,
			cameraFixedPanelProp = { uiGroupElementOffset = var18 }
		},
		[t_1.ToolTipsContainer] = {
			uiGroup = t_2.MainUIGroup,
			cameraFixedPanelProp = { uiGroupElementOffset = var19 }
		}
	})
end
if isInExperienceUIVREnabled then
	local var21 = t_3.PANEL_TO_BOTTOMBAR / var4
	var20 = CFrame.new(0, -1 * Vector2.new(var5.X * 0.5 + var9.X * 0.5 + var21, var5.Y * 0.5 + var9.Y * 0.5 + var21).Y, 0) * CFrame.Angles(0, 3.14159265359, 0)
else
	var20 = CFrame.new(0, -var5.Y * 0.5 - 0.075 - 0.033333333333, 0) * CFrame.Angles(0, 3.14159265359, 0)
end
local t_6 = {
	[t_1.BottomBar] = t_2.MainUIGroup,
	[t_1.MoreMenu] = if isInExperienceUIVREnabled then t_2.MenuUIGroup else t_2.MainUIGroup
}

if isInExperienceUIVREnabled then
	t_6 = var2.Object.assign(t_6, {
		[t_1.Chat] = t_2.ChatUIGroup,
		[t_1.ChromeSubMenu] = t_2.ChromeSubMenuUIGroup,
		[t_1.ToolTipsContainer] = t_2.MainUIGroup
	})
end
local t_7 = { [t_1.BottomBar] = var20, [t_1.MoreMenu] = var1 }

if isInExperienceUIVREnabled then
	t_7 = var2.Object.assign(t_7, {
		[t_1.Chat] = var15,
		[t_1.ChromeSubMenu] = var18,
		[t_1.ToolTipsContainer] = var19
	})
end
local function getDragBarOffsetForPanel(value, p1, p2, p3)
	-- upvalues: t_4 (write), vector2 (ref), t_3 (ref), t_7 (write), var11 (ref), var4 (ref)
	local var22
	local _ = nil
	
	if p1 then
		var22 = p1
	else
		local spatialPanelProps = t_4[value].spatialPanelProps
		var22 = if spatialPanelProps then spatialPanelProps.partSize else vector2
	end
	local PANEL_TO_DRAGBAR = t_3.PANEL_TO_DRAGBAR
	
	if p3 then
		PANEL_TO_DRAGBAR += p3
	end
	local var23 = t_7[value]
	
	if p2 == true then
		var23 *= CFrame.Angles(0, -3.14159265359, 0)
	end
	local var24 = PANEL_TO_DRAGBAR / var4
	
	return var23 * CFrame.new(0, -1 * Vector2.new(var22.X * 0.5 + var11.X * 0.5 + var24, var22.Y * 0.5 + var11.Y * 0.5 + var24).Y, 0)
end

local t_8 = {
	[t_2.MainUIGroup] = CFrame.new(0, t_7[t_1.BottomBar].Y - 0.075 - 0.066666666667, 0)
}

if isInExperienceUIVREnabled then
	local assign = var2.Object.assign
	local var22 = t_8
	local t_9 = {
		[t_2.MainUIGroup] = getDragBarOffsetForPanel(t_1.BottomBar, var9, true)
	}
	local chatUIGroup = t_2.ChatUIGroup
	local chat = t_1.Chat
	local _ = nil
	local spatialPanelProps = t_4[chat].spatialPanelProps
	local var23 = if spatialPanelProps then spatialPanelProps.partSize else vector2
	local var24 = t_3.PANEL_TO_DRAGBAR / var4
	t_9[chatUIGroup] = t_7[chat] * CFrame.new(0, -1 * Vector2.new(var23.X * 0.5 + var11.X * 0.5 + var24, var23.Y * 0.5 + var11.Y * 0.5 + var24).Y, 0)
	local menuUIGroup = t_2.MenuUIGroup
	local moreMenu = t_1.MoreMenu
	local _ = nil
	local spatialPanelProps_1 = t_4[moreMenu].spatialPanelProps
	local var25 = if spatialPanelProps_1 then spatialPanelProps_1.partSize else vector2
	local var26 = t_3.PANEL_TO_DRAGBAR / var4
	t_9[menuUIGroup] = t_7[moreMenu] * CFrame.new(0, -1 * Vector2.new(var25.X * 0.5 + var11.X * 0.5 + var26, var25.Y * 0.5 + var11.Y * 0.5 + var26).Y, 0)
	local chromeSubMenuUIGroup = t_2.ChromeSubMenuUIGroup
	local chromeSubMenu = t_1.ChromeSubMenu
	local _ = nil
	local spatialPanelProps_2 = t_4[chromeSubMenu].spatialPanelProps
	local var27 = if spatialPanelProps_2 then spatialPanelProps_2.partSize else vector2
	local PANEL_TO_DRAGBAR = t_3.PANEL_TO_DRAGBAR
	local var28 = t_7[chromeSubMenu] * CFrame.Angles(0, -3.14159265359, 0)
	local new = CFrame.new
	local var29 = 0
	local var30 = -1
	local var31 = var27
	local var32 = PANEL_TO_DRAGBAR / var4
	t_9[chromeSubMenuUIGroup] = var28 * new(var29, var30 * Vector2.new(var31.X * 0.5 + var11.X * 0.5 + var32, var31.Y * 0.5 + var11.Y * 0.5 + var32).Y, 0)
	t_8 = assign(var22, t_9)
end
return {
	BOTTOM_BAR_BASE_PART_SIZE = 0.15,
	SPATIAL_TOOLTIP_SPACING = 2,
	SpatialUIType = t,
	SpatialUIGroupType = t_2,
	PanelType = t_1,
	DEFAULT_VR_PANEL_SIZE = Vector2.new(10, 10),
	VR_PANEL_RESOLUTION_MULTIPLIER = var4,
	COMPAT_PANEL_PROPS_MAP = t_4,
	SPATIAL_PANEL_POSITION_PROPS_MAP = t_5,
	ROACT_PANEL_UIGROUP_MAP = t_6,
	ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP = t_7,
	UIGROUP_DRAGBAR_OFFSET_MAP = t_8,
	UIGROUP_INITITIAL_ROTATION_MAP = var12,
	DRAG_BAR_SIZE = var11,
	BOTTOM_BAR_SIZE = var9
}