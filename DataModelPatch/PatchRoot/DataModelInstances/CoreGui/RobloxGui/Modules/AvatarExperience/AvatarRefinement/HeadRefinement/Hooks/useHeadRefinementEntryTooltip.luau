local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local GetShouldShowAdjustmentTooltipFromTimeFunction = require(CorePackages.Workspace.Packages.AvatarExperienceHeadRefinement).Utils.getShouldShowAdjustmentTooltipFromTime
local SelectLastTryOnClassicHeadShapeModule = require(Modules.AvatarExperience.AvatarRefinement.HeadRefinement.Selectors.selectLastTryOnClassicHeadShape)
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local GetFFlagAXDisableHeadRefinementTooltipModule = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableHeadRefinementTooltip)
local AppStorageService = game:GetService("AppStorageService")

local function getMockAppStorageService()
	return {
		storage = {},
		GetItem = function(p1, p2)
			return p1.storage[p2]
		end,
		SetItem = function(p1, p2, p3)
			p1.storage[p2] = p3
		end,
		Flush = function(_) end
	}
end

if not game:GetEngineFeature("AXMarketplaceHeadTooltipKeys") then
	AppStorageService = getMockAppStorageService()
end
local function selectIsDynamicHeadEquipped(p1)
	-- upvalues: UtilsModule (copy)
	return UtilsModule.isDynamicHeadEquipped(p1.AvatarExperience.AvatarEditor.Character.EquippedAssets)
end

local function selectIsTryingOnDynamicHead(p1)
	-- upvalues: UtilsModule1 (copy)
	return UtilsModule1.isTryingOnDynamicHead(p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems or {})
end

return function(p1)
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy), selectIsDynamicHeadEquipped (copy), SelectIsFullViewModule (copy), selectIsTryingOnDynamicHead (copy), SelectLastTryOnClassicHeadShapeModule (copy), AppStorageService (ref), FullView (copy), GetFFlagAXDisableHeadRefinementTooltipModule (copy), GetShouldShowAdjustmentTooltipFromTimeFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSelectorResult = UseSelectorFunction(selectIsDynamicHeadEquipped)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), SelectIsFullViewModule (upval)
		return SelectIsFullViewModule(p2, p1.avatarRoute and (p1.avatarRoute.opaque and p1.avatarRoute.opaque.name))
	end)
	local UseSelectorResult2 = UseSelectorFunction(selectIsTryingOnDynamicHead)
	local UseSelectorResult3 = UseSelectorFunction(SelectLastTryOnClassicHeadShapeModule)
	local AppStorageService1 = p1.appStorageService or AppStorageService
	local NoUseSelectorResult2: boolean = p1.shouldBeVisible and (if UseSelectorResult3 then UseSelectorResult1 ~= FullView.SceneFullView and not UseSelectorResult2 else not UseSelectorResult and (UseSelectorResult1 ~= FullView.SceneFullView and not UseSelectorResult2))
	ReactModule.useEffect(function()
		-- upvalues: NoUseSelectorResult2 (copy), AppStorageService1 (copy), UseStateResult2 (copy), GetFFlagAXDisableHeadRefinementTooltipModule (upval), GetShouldShowAdjustmentTooltipFromTimeFunction (upval)
		if NoUseSelectorResult2 then
			local AXMarketplaceHeadAdjustmentTooltipSeenTimestampItem = AppStorageService1:GetItem("AXMarketplaceHeadAdjustmentTooltipSeenTimestamp")
			local Number = if AXMarketplaceHeadAdjustmentTooltipSeenTimestampItem then tonumber(AXMarketplaceHeadAdjustmentTooltipSeenTimestampItem) else nil
			UseStateResult2(not GetFFlagAXDisableHeadRefinementTooltipModule() and GetShouldShowAdjustmentTooltipFromTimeFunction({ prevTime = Number, currentTime = os.time() }))
			
			return
		else
			UseStateResult2(false)
		end
	end, { NoUseSelectorResult2, p1.shouldBeVisible })
	
	return UseStateResult, function(p2)
		-- upvalues: AppStorageService1 (copy), UseStateResult2 (copy)
		if p2.saveDismissTime then
			AppStorageService1:SetItem("AXMarketplaceHeadAdjustmentTooltipSeenTimestamp", (tostring(os.time())))
			AppStorageService1:Flush()
		end
		UseStateResult2(false)
	end
end