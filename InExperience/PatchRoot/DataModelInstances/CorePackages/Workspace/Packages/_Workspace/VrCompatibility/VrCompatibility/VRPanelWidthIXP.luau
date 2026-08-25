local parent = script.Parent.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagVRPanelWidthIXPEnabled = sharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local ixpUtilsModule = require(parent.IxpUtils)
game:DefineFastInt("VrAvatarPanelsSpreadMultiplierPercentageOverride", 96)
game:DefineFastInt("SystemBarHeightMultiplierPercentageOverride", 80)
game:DefineFastString("VrAvatarPanelsDistanceOffsetOverride", "-1.8")
local fFlagVRPanelWidthIXPLocalOverrideEnabled = sharedFlagsModule.GetFFlagVRPanelWidthIXPLocalOverrideEnabled()
local fIntVrAppPanelCurvatureOverride = sharedFlagsModule.GetFIntVrAppPanelCurvatureOverride()
local fIntVrAppPanelWidthMultiplierPercentageOverride = sharedFlagsModule.GetFIntVrAppPanelWidthMultiplierPercentageOverride()
local vrAvatarPanelsSpreadMultiplierPercentageOverrideFastInt = game:GetFastInt("VrAvatarPanelsSpreadMultiplierPercentageOverride")
local systemBarHeightMultiplierPercentageOverrideFastInt = game:GetFastInt("SystemBarHeightMultiplierPercentageOverride")
local vrAvatarPanelsDistanceOffsetOverrideFastString = game:GetFastString("VrAvatarPanelsDistanceOffsetOverride")
local fStringVrSystemBarXOffSetOverride = sharedFlagsModule.GetFStringVrSystemBarXOffSetOverride()
local fStringVrSystemBarYOffSetOverride = sharedFlagsModule.GetFStringVrSystemBarYOffSetOverride()
local fStringVrSystemBarZOffSetOverride = sharedFlagsModule.GetFStringVrSystemBarZOffSetOverride()

return ixpUtilsModule.defineIXPTest({
	name = "PlatformExcellence.QualityImprovement.App.VR.AppPanelWidth",
	recordExposure = false,
	layer = appUserLayers.PlatformExcellenceQualityImprovementVR,
	getDependentFlagsEnabled = function()
		return true
	end,
	getEnabledFlag = function()
		-- upvalues: getFFlagVRPanelWidthIXPEnabled (ref)
		return getFFlagVRPanelWidthIXPEnabled()
	end,
	getEnabledForAllFlag = function()
		return false
	end,
	variables = {
		VrAppPanelWidthMultiplier = function(p0, _)
			-- upvalues: fFlagVRPanelWidthIXPLocalOverrideEnabled (ref), fIntVrAppPanelWidthMultiplierPercentageOverride (ref)
			if fFlagVRPanelWidthIXPLocalOverrideEnabled then
				return fIntVrAppPanelWidthMultiplierPercentageOverride / 100
			end
			local var11 = tonumber(p0.vr_app_panel_width_multiplier_percentage)
			
			return if var11 then var11 / 100 else nil
		end,
		VrAppPanelCurvature = function(p1, _)
			-- upvalues: fFlagVRPanelWidthIXPLocalOverrideEnabled (ref), fIntVrAppPanelCurvatureOverride (ref)
			return if fFlagVRPanelWidthIXPLocalOverrideEnabled then fIntVrAppPanelCurvatureOverride else tonumber(p1.vr_app_panel_curvature) or nil
		end,
		VrAvatarPanelsSpreadMultiplier = function(p2, _)
			-- upvalues: fFlagVRPanelWidthIXPLocalOverrideEnabled (ref), vrAvatarPanelsSpreadMultiplierPercentageOverrideFastInt (ref)
			if fFlagVRPanelWidthIXPLocalOverrideEnabled then
				return vrAvatarPanelsSpreadMultiplierPercentageOverrideFastInt / 100
			end
			local var12 = tonumber(p2.vr_avatar_panels_spread_multiplier_percentage)
			
			return if var12 then var12 / 100 else nil
		end,
		VrAvatarPanelsDistanceOffset = function(value, _)
			-- upvalues: fFlagVRPanelWidthIXPLocalOverrideEnabled (ref), vrAvatarPanelsDistanceOffsetOverrideFastString (ref)
			return if fFlagVRPanelWidthIXPLocalOverrideEnabled then tonumber(vrAvatarPanelsDistanceOffsetOverrideFastString) else tonumber(value.vr_avatar_panels_distance_offset) or nil
		end,
		VrSystemBarXOffSet = function(value, _)
			-- upvalues: fFlagVRPanelWidthIXPLocalOverrideEnabled (ref), fStringVrSystemBarXOffSetOverride (ref)
			return if fFlagVRPanelWidthIXPLocalOverrideEnabled then tonumber(fStringVrSystemBarXOffSetOverride) else tonumber(value.vr_system_bar_x_offset) or nil
		end,
		VrSystemBarYOffSet = function(value, _)
			-- upvalues: fFlagVRPanelWidthIXPLocalOverrideEnabled (ref), fStringVrSystemBarYOffSetOverride (ref)
			return if fFlagVRPanelWidthIXPLocalOverrideEnabled then tonumber(fStringVrSystemBarYOffSetOverride) else tonumber(value.vr_system_bar_y_offset) or nil
		end,
		VrSystemBarZOffSet = function(value, _)
			-- upvalues: fFlagVRPanelWidthIXPLocalOverrideEnabled (ref), fStringVrSystemBarZOffSetOverride (ref)
			return if fFlagVRPanelWidthIXPLocalOverrideEnabled then tonumber(fStringVrSystemBarZOffSetOverride) else tonumber(value.vr_system_bar_z_offset) or nil
		end,
		SystemBarHeightMultiplier = function(p3, _)
			-- upvalues: fFlagVRPanelWidthIXPLocalOverrideEnabled (ref), systemBarHeightMultiplierPercentageOverrideFastInt (ref)
			if fFlagVRPanelWidthIXPLocalOverrideEnabled then
				return systemBarHeightMultiplierPercentageOverrideFastInt / 100
			end
			local var13 = tonumber(p3.system_bar_height_percentage)
			
			return if var13 then var13 / 100 else nil
		end
	}
})