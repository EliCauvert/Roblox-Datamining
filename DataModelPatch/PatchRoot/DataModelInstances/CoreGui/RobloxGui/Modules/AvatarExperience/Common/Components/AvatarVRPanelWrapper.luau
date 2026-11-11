local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Modules = CoreGui.RobloxGui.Modules
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local Panel3D = UIBloxModule.Core.VR.Panel3D
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local CurrentTabContextModule = require(Modules.LuaApp.Navigation.CurrentTabContext)
local SwitchNavigatorVisibleContextModule = require(Modules.LuaApp.Navigation.SwitchNavigatorVisibleContext)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local RoundedCornersFrame = require(CorePackages.Workspace.Packages.VrCompatibility).RoundedCornersFrame
local GetFFlagVRPanelWidthIXPEnabledFunction = SharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local FFlagAXFixAvatarScreenVR = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixAvatarScreenVR
local OverlayProvider = require(CorePackages.Packages.Foundation).OverlayProvider
local VRPanelWidthIXP = require(CorePackages.Workspace.Packages.VrCompatibility).VRPanelWidthIXP
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local Config = if FFlagAXFixAvatarScreenVR then {
	Left = "Left_SurfaceGui",
	Right = "Right_SurfaceGui",
	Center = "Center_SurfaceGui",
	None = "Left_SurfaceGui"
} else nil

local function getZOffset(p1, PanelPlacement): Vector3
	-- upvalues: AvatarScreenProperties (copy), ConstantsModule (copy)
	local t = {}
	local PreviousPages = p1.previousPages or {}
	for _, previousPage in PreviousPages do
		local VRPanelPlacement = AvatarScreenProperties[previousPage.name].VRPanelPlacement
		
		if VRPanelPlacement == "None" then
			VRPanelPlacement = "Left"
		end
		local VRPanelPlacement1: string = VRPanelPlacement or "Left"
		t[VRPanelPlacement1] = (t[VRPanelPlacement1] or 0) + 1
	end
	local Entry = t[PanelPlacement] or 0
	
	if p1.isOverlayVisible then
		Entry += 1
	end
	return (Vector3.new(0, 0, Entry * ConstantsModule.VR.SPACE_BETWEEN_STACKED_PANELS))
end

return function(p2)
	-- upvalues: UseAvatarRouteFunction (copy), UseStyleFunction (copy), ConstantsModule (copy), FFlagLuaAppForceVrAppPanelWidthRollout (copy), GetFFlagVRPanelWidthIXPEnabledFunction (copy), IxpUtilsModule (copy), VRPanelWidthIXP (copy), ReactModule (copy), getZOffset (copy), CurrentTabContextModule (copy), RoactModule (copy), SwitchNavigatorVisibleContextModule (copy), Panel3D (copy), AvatarScreen (copy), RoundedCornersFrame (copy), FFlagAXFixAvatarScreenVR (copy), CoreGui (copy), Config (copy), OverlayProvider (copy)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseStyleResult = UseStyleFunction()
	local Panel = ConstantsModule.VR.PanelInfo[p2.panelPlacement or "Left"]
	
	if p2.panelPlacement == "None" then
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = false,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, p2[RoactModule.Children])
	end
	local UseTestVariablesResult = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabledFunction() then nil else IxpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAvatarPanelsSpreadMultiplier)
	local UseTestVariablesResult1 = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabledFunction() then nil else IxpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAvatarPanelsDistanceOffset)
	local Offset = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabledFunction() or not Panel then Panel.Offset else CFrame.lookAt(Vector3.new(if UseTestVariablesResult then Panel.Offset.Position.X * UseTestVariablesResult else Panel.Offset.Position.X, Panel.Offset.Position.Y, if UseTestVariablesResult1 then Panel.Offset.Position.Z + UseTestVariablesResult1 else Panel.Offset.Position.Z), (Vector3.new(0, ConstantsModule.VR.PANELS_HEIGHT_OFFSET, 0)))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: getZOffset (upval), UseAvatarRouteResult (copy), p2 (copy)
		return (getZOffset(UseAvatarRouteResult, p2.panelPlacement))
	end, {})
	local Element = ReactModule.createElement(CurrentTabContextModule.Consumer, {
		render = function(AvatarExperienceRoot)
			-- upvalues: RoactModule (upval), SwitchNavigatorVisibleContextModule (upval), ReactModule (upval), Panel3D (upval), p2 (copy), AvatarScreen (upval), Panel (copy), Offset (copy), UseMemoResult (copy), RoundedCornersFrame (upval), UseStyleResult (copy)
			return RoactModule.createElement(SwitchNavigatorVisibleContextModule.Consumer, {
				render = function(p3)
					-- upvalues: ReactModule (upval), Panel3D (upval), p2 (upval), AvatarExperienceRoot (copy), AvatarScreen (upval), Panel (upval), Offset (upval), UseMemoResult (upval), RoundedCornersFrame (upval), UseStyleResult (upval), RoactModule (upval)
					return ReactModule.createElement(Panel3D, {
						hidden = not p3 or (p2.visible == false or AvatarExperienceRoot ~= AvatarScreen.AvatarExperienceRoot),
						partSize = Panel.PartSize,
						offset = Offset + UseMemoResult,
						virtualScreenSize = Panel.VirtualScreenSize,
						panelName = p2.panelPlacement
					}, if p2.roundedCornersFrame then ReactModule.createElement(RoundedCornersFrame, {
						cornerRadius = 10,
						backgroundTransparency = 0,
						backgroundColor = UseStyleResult.Theme.BackgroundDefault.Color
					}, p2[RoactModule.Children]) else p2[RoactModule.Children])
				end
			})
		end
	})
	
	if FFlagAXFixAvatarScreenVR then
		local LuaAppScreenGui = CoreGui:WaitForChild("LuaAppScreenGui", 5)
		
		if LuaAppScreenGui then
			local Child = LuaAppScreenGui:FindFirstChild(Config[p2.panelPlacement or "Left"], true)
			
			if Child then
				return ReactModule.createElement(OverlayProvider, { gui = Child }, Element)
			end
		end
	end
	return Element
end