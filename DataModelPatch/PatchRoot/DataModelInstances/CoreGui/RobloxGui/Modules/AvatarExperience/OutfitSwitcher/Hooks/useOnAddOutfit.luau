local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local CharacterManagerUtilsModule = require(Modules.AvatarExperience.Common.Util.CharacterManagerUtils)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local CreateOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.CreateOutfit)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService

local function v10(p1)
	-- upvalues: CharacterManagerUtilsModule (copy)
	return CharacterManagerUtilsModule.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(p1)
end

local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

return function(p1, OutfitType, OnOverlayClosed, p2)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), AnalyticsModule (copy), UseAppPolicyFunction (copy), UseSelectorFunction (copy), v10 (copy), GetUseSelectorDeepEqualsFunction (copy), ReactModule (copy), NavigationUtilsModule (copy), CreateOutfitModule (copy), AvatarScreen (copy), NavigateWithLockFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AnalyticsModule)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p3)
		return p3.getCustomOutfitNames()
	end)
	local UseSelectorResult = UseSelectorFunction(v10, GetUseSelectorDeepEqualsFunction())
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = true
		
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, { UseRefResult })
	local UseResult1 = ReactModule.useCallback(function(p3, p4)
		-- upvalues: UseDispatchResult (copy), CreateOutfitModule (upval), UseRoactServiceResult (copy), UseResult (copy), UseSelectorResult (copy)
		UseDispatchResult(CreateOutfitModule(p3, UseRoactServiceResult, UseResult, p4, UseSelectorResult))
	end, {
		UseDispatchResult,
		UseRoactServiceResult,
		UseResult,
		UseSelectorResult
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: OutfitType (copy), UseResult1 (copy), OnOverlayClosed (copy)
		return {
			outfitType = OutfitType,
			onComplete = UseResult1,
			onOverlayClosed = OnOverlayClosed
		}
	end, { OutfitType, UseResult1, OnOverlayClosed })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p2 (copy), NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval), UseMemoResult (copy)
		if p2 then
			NavigationUtilsModule.navigateToNextOverlay(p1, AvatarScreen.AddOutfitDialog, UseMemoResult)
			
			return
		else
			p1.navigate(AvatarScreen.AddOutfitDialog, UseMemoResult)
		end
	end, { p1, UseMemoResult, p2 })
	
	return ReactModule.useCallback(function()
		-- upvalues: UseAppPolicyResult (copy), UseDispatchResult (copy), NavigateWithLockFunction (upval), UseResult2 (copy), UseResult1 (copy)
		if UseAppPolicyResult then
			UseDispatchResult(NavigateWithLockFunction(UseResult2))
			
			return
		else
			UseResult1("", function()
				return nil
			end)
		end
	end, {
		p1,
		UseResult1,
		UseAppPolicyResult,
		UseResult2,
		UseDispatchResult,
		(ReactModule.useCallback(function()
			-- upvalues: NavigationUtilsModule (upval), p1 (copy)
			NavigationUtilsModule.closeOverlay(p1)
		end, { p1 }))
	})
end