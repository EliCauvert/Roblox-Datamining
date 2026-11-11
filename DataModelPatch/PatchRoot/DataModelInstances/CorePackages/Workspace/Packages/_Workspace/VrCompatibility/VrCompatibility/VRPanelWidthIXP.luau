local Parent = script.Parent.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagVRPanelWidthIXPEnabledFunction = SharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(Parent.IxpUtils)
game:DefineFastInt("VrAvatarPanelsSpreadMultiplierPercentageOverride", 96)
game:DefineFastInt("SystemBarHeightMultiplierPercentageOverride", 80)
game:DefineFastString("VrAvatarPanelsDistanceOffsetOverride", "-1.8")
local FFlagVRPanelWidthIXPLocalOverrideEnabled = SharedFlagsModule.GetFFlagVRPanelWidthIXPLocalOverrideEnabled()
local FIntVrAppPanelCurvatureOverride = SharedFlagsModule.GetFIntVrAppPanelCurvatureOverride()
local FIntVrAppPanelWidthMultiplierPercentageOverride = SharedFlagsModule.GetFIntVrAppPanelWidthMultiplierPercentageOverride()
local VrAvatarPanelsSpreadMultiplierPercentageOverrideFastInt = game:GetFastInt("VrAvatarPanelsSpreadMultiplierPercentageOverride")
local SystemBarHeightMultiplierPercentageOverrideFastInt = game:GetFastInt("SystemBarHeightMultiplierPercentageOverride")
local VrAvatarPanelsDistanceOffsetOverrideFastString = game:GetFastString("VrAvatarPanelsDistanceOffsetOverride")
local FStringVrSystemBarXOffSetOverride = SharedFlagsModule.GetFStringVrSystemBarXOffSetOverride()
local FStringVrSystemBarYOffSetOverride = SharedFlagsModule.GetFStringVrSystemBarYOffSetOverride()
local FStringVrSystemBarZOffSetOverride = SharedFlagsModule.GetFStringVrSystemBarZOffSetOverride()

return IxpUtilsModule.defineIXPTest({
	name = "PlatformExcellence.QualityImprovement.App.VR.AppPanelWidth",
	recordExposure = false,
	layer = AppUserLayers.PlatformExcellenceQualityImprovementVR,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		-- upvalues: GetFFlagVRPanelWidthIXPEnabledFunction (copy)
		return GetFFlagVRPanelWidthIXPEnabledFunction()
	end,
	getEnabledForAllFlag = function(): boolean
		return false
	end,
	variables = {
		VrAppPanelWidthMultiplier = function(p1, _)
			-- upvalues: FFlagVRPanelWidthIXPLocalOverrideEnabled (copy), FIntVrAppPanelWidthMultiplierPercentageOverride (copy)
			if FFlagVRPanelWidthIXPLocalOverrideEnabled then
				return FIntVrAppPanelWidthMultiplierPercentageOverride / 100
			else
				local Number: number? = tonumber(p1.vr_app_panel_width_multiplier_percentage)
				
				return if Number then Number / 100 else nil
			end
		end,
		VrAppPanelCurvature = function(p1, _)
			-- upvalues: FFlagVRPanelWidthIXPLocalOverrideEnabled (copy), FIntVrAppPanelCurvatureOverride (copy)
			return if FFlagVRPanelWidthIXPLocalOverrideEnabled then FIntVrAppPanelCurvatureOverride else tonumber(p1.vr_app_panel_curvature) or nil
		end,
		VrAvatarPanelsSpreadMultiplier = function(p1, _)
			-- upvalues: FFlagVRPanelWidthIXPLocalOverrideEnabled (copy), VrAvatarPanelsSpreadMultiplierPercentageOverrideFastInt (copy)
			if FFlagVRPanelWidthIXPLocalOverrideEnabled then
				return VrAvatarPanelsSpreadMultiplierPercentageOverrideFastInt / 100
			else
				local Number: number? = tonumber(p1.vr_avatar_panels_spread_multiplier_percentage)
				
				return if Number then Number / 100 else nil
			end
		end,
		VrAvatarPanelsDistanceOffset = function(p1, _): number
			-- upvalues: FFlagVRPanelWidthIXPLocalOverrideEnabled (copy), VrAvatarPanelsDistanceOffsetOverrideFastString (copy)
			return if FFlagVRPanelWidthIXPLocalOverrideEnabled then tonumber(VrAvatarPanelsDistanceOffsetOverrideFastString) else tonumber(p1.vr_avatar_panels_distance_offset) or nil
		end,
		VrSystemBarXOffSet = function(p1, _): number
			-- upvalues: FFlagVRPanelWidthIXPLocalOverrideEnabled (copy), FStringVrSystemBarXOffSetOverride (copy)
			return if FFlagVRPanelWidthIXPLocalOverrideEnabled then tonumber(FStringVrSystemBarXOffSetOverride) else tonumber(p1.vr_system_bar_x_offset) or nil
		end,
		VrSystemBarYOffSet = function(p1, _): number
			-- upvalues: FFlagVRPanelWidthIXPLocalOverrideEnabled (copy), FStringVrSystemBarYOffSetOverride (copy)
			return if FFlagVRPanelWidthIXPLocalOverrideEnabled then tonumber(FStringVrSystemBarYOffSetOverride) else tonumber(p1.vr_system_bar_y_offset) or nil
		end,
		VrSystemBarZOffSet = function(p1, _): number
			-- upvalues: FFlagVRPanelWidthIXPLocalOverrideEnabled (copy), FStringVrSystemBarZOffSetOverride (copy)
			return if FFlagVRPanelWidthIXPLocalOverrideEnabled then tonumber(FStringVrSystemBarZOffSetOverride) else tonumber(p1.vr_system_bar_z_offset) or nil
		end,
		SystemBarHeightMultiplier = function(p1, _)
			-- upvalues: FFlagVRPanelWidthIXPLocalOverrideEnabled (copy), SystemBarHeightMultiplierPercentageOverrideFastInt (copy)
			if FFlagVRPanelWidthIXPLocalOverrideEnabled then
				return SystemBarHeightMultiplierPercentageOverrideFastInt / 100
			else
				local Number: number? = tonumber(p1.system_bar_height_percentage)
				
				return if Number then Number / 100 else nil
			end
		end
	}
})