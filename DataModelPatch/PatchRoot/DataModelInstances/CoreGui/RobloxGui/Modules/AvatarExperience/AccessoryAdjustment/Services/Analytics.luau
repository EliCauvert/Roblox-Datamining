local CorePackages = game:GetService("CorePackages")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local AnalyticsService = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService
local AdjustmentSliderTypeModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType)
local FFlagAXCustomizeMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(p1)
	-- upvalues: FFlagAXCustomizeMakeupSupport (copy), RbxAnalyticsService (copy), AdjustmentSliderTypeModule (copy)
	local config = {
		avatarAARefineNavigationTap = function(p2, Uid, Category)
			-- upvalues: p1 (copy)
			p1.EventStream:sendTelemetryEvent(p2, "avatarRefineNavigationTap", { navTab = "Accessory", category = Category, uid = Uid })
		end,
		avatarLCRefineNavigationTap = function(p2, Uid, Category)
			-- upvalues: p1 (copy)
			p1.EventStream:sendTelemetryEvent(p2, "avatarRefineNavigationTap", { navTab = "Clothing", category = Category, uid = Uid })
		end
	}
	
	if FFlagAXCustomizeMakeupSupport then
		function config.avatarLayeredMakeupNavigationTap(p2, Uid, Category)
			-- upvalues: p1 (copy)
			p1.EventStream:sendTelemetryEvent(p2, "avatarRefineNavigationTap", { navTab = "Makeup", category = Category, uid = Uid })
		end
	end
	function config.avatarRefineAccessoryResetConfirm(p2, Uid, _, AssetId)
		-- upvalues: RbxAnalyticsService (upval), p1 (copy)
		p1.EventStream:sendTelemetryEvent(p2, "avatarRefineAccessoryResetConfirm", {
			uid = Uid,
			refineSessionId = RbxAnalyticsService:GetSessionId(),
			assetId = AssetId
		})
	end
	
	function config.avatarRefineAccessoryStart(p2, Uid, _, AssetId)
		-- upvalues: RbxAnalyticsService (upval), p1 (copy)
		p1.EventStream:sendTelemetryEvent(p2, "avatarRefineAccessoryStart", {
			uid = Uid,
			refineSessionId = RbxAnalyticsService:GetSessionId(),
			assetId = AssetId
		})
	end
	
	function config.avatarRefineAccessoryAdjustTap(AdjustTab)
		-- upvalues: p1 (copy)
		return function(p2, Uid, _, AssetId)
			-- upvalues: AdjustTab (copy), p1 (upval)
			p1.EventStream:sendTelemetryEvent(p2, "avatarRefineAccessoryAdjustTap", { uid = Uid, assetId = AssetId, adjustTab = AdjustTab })
		end
	end
	
	function config.avatarRefineAccessoryApply(p2)
		-- upvalues: AdjustmentSliderTypeModule (upval), p1 (copy)
		return function(p3, Uid, _, AssetId)
			-- upvalues: p2 (copy), AdjustmentSliderTypeModule (upval), p1 (upval)
			p1.EventStream:sendTelemetryEvent(p3, "avatarRefineAccessoryApply", {
				assetId = AssetId,
				uid = Uid,
				move_x = p2[AdjustmentSliderTypeModule.PositionX],
				move_y = p2[AdjustmentSliderTypeModule.PositionY],
				move_z = p2[AdjustmentSliderTypeModule.PositionZ],
				rotation_x = p2[AdjustmentSliderTypeModule.RotationX],
				rotation_y = p2[AdjustmentSliderTypeModule.RotationY],
				rotation_z = p2[AdjustmentSliderTypeModule.RotationZ],
				scale = p2[AdjustmentSliderTypeModule.Scale]
			})
		end
	end
	
	return config
end)

return {
	get = function(_)
		-- upvalues: AnalyticsService (copy), MemoizeResult (copy)
		return MemoizeResult(AnalyticsService)
	end
}