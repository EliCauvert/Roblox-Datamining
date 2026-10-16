local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local Parent = AvatarExperienceSlotBasedEditor.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSlotBasedEditorContextModule = require(AvatarExperienceSlotBasedEditor.Context.useSlotBasedEditorContext)
local ScreenLayoutModule = require(AvatarExperienceSlotBasedEditor.Enums.ScreenLayout)
local AXCommonModule = require(Parent.AXCommon)
local SlotBasedEditorAnalytics = require(Parent.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local SafeAppStorageService = AXCommonModule.Lib.SafeAppStorageService
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local SelectIsFullViewFunction = AXCommonModule.State.Selectors.selectIsFullView
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial
local MenuItemEnum = require(Parent.AXControlBar).Enums.MenuItemEnum
local AXSlotBasedEditorCustomizeFtuxUseMemStorage2 = game:DefineFastFlag("AXSlotBasedEditorCustomizeFtuxUseMemStorage2", false)
local AXSlotBasedEditorCustomizeFtuxDelayRatio = game:DefineFastInt("AXSlotBasedEditorCustomizeFtuxDelay2", 3000) / 1000
local AXSlotBasedEditorAvatarSwitcherFtuxDelayRatio = game:DefineFastInt("AXSlotBasedEditorAvatarSwitcherFtuxDelay2", 1000) / 1000

local function v14(p1) --[[ Line: 42 ]]
	return p1.ScreenSize
end

return function(Callback) --[[ Line: 48 | Named "useSlotCustomizeFtux" ]]
	-- upvalues: UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseSlotBasedEditorContextModule (copy), UseSelectorFunction (copy), v14 (copy), UseIsSpatialFunction (copy), ReactModule (copy), SelectIsFullViewFunction (copy), SafeAppStorageService (copy), AXSlotBasedEditorCustomizeFtuxUseMemStorage2 (copy), AvatarScreen (copy), ScreenLayoutModule (copy), AXSlotBasedEditorCustomizeFtuxDelayRatio (copy), SlotBasedEditorAnalytics (copy), AXSlotBasedEditorAvatarSwitcherFtuxDelayRatio (copy), MenuItemEnum (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseSlotBasedEditorContextModuleResult = UseSlotBasedEditorContextModule()
	local ScreenLayout = UseSlotBasedEditorContextModuleResult and UseSlotBasedEditorContextModuleResult.screenLayout
	local UseSelectorResult = UseSelectorFunction(v14)
	local Inverted = not UseIsSpatialFunction()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 56 ]]
		-- upvalues: UseAvatarRouteResult (copy)
		return UseAvatarRouteResult and (UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name)
	end, { UseAvatarRouteResult })
	local UseSelectorResult1 = UseSelectorFunction((ReactModule.useCallback(function(p1) --[[ Line: 60 ]]
		-- upvalues: SelectIsFullViewFunction (upval), UseMemoResult (copy)
		return SelectIsFullViewFunction(p1, UseMemoResult)
	end, { UseMemoResult })))
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 66 ]]
		-- upvalues: Callback (copy), UseSelectorResult1 (copy)
		return Callback(UseSelectorResult1)
	end, { UseSelectorResult1 })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 70 ]]
		-- upvalues: SafeAppStorageService (upval), AXSlotBasedEditorCustomizeFtuxUseMemStorage2 (upval)
		return (SafeAppStorageService.getItem("AXSlotBasedEditorCustomizeFtux", AXSlotBasedEditorCustomizeFtuxUseMemStorage2))
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p1) --[[ Line: 76 ]]
		-- upvalues: SafeAppStorageService (upval), AXSlotBasedEditorCustomizeFtuxUseMemStorage2 (upval)
		SafeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", p1, AXSlotBasedEditorCustomizeFtuxUseMemStorage2)
		SafeAppStorageService.flush()
	end, {})
	ReactModule.useEffect(function() --[[ Line: 81 ]]
		-- upvalues: UseResult (copy), UseMemoResult (copy), AvatarScreen (upval), Inverted (copy), UseMemoResult1 (copy), ScreenLayout (copy), ScreenLayoutModule (upval), AXSlotBasedEditorCustomizeFtuxDelayRatio (upval), UseNavigationResult (copy), UseSelectorResult (copy), UseResult1 (copy), SlotBasedEditorAnalytics (upval), AXSlotBasedEditorAvatarSwitcherFtuxDelayRatio (upval)
		local UseResultResult = UseResult()
		local DelayedThread = if UseResultResult == "" and UseMemoResult == AvatarScreen.AvatarEditor and Inverted and UseMemoResult1 and (ScreenLayout == ScreenLayoutModule.LandscapeSplit or ScreenLayout == ScreenLayoutModule.PortraitSlots) then task.delay(AXSlotBasedEditorCustomizeFtuxDelayRatio, function() --[[ Line: 99 ]]
			-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), UseSelectorResult (upval), UseResult1 (upval), SlotBasedEditorAnalytics (upval)
			UseNavigationResult.navigate(AvatarScreen.SlotsCustomizeFtuxPrompt, {
				screenSize = UseSelectorResult,
				onConfirm = function() --[[ Line: 102 ]]
					-- upvalues: UseResult1 (upval), SlotBasedEditorAnalytics (upval)
					UseResult1("AVATAR_FOCUS_ICON")
					SlotBasedEditorAnalytics.trackSlotsCustomizeFtuxPrompt()
				end
			})
		end) elseif UseResultResult == "AVATAR_FOCUS_ICON" and UseMemoResult == AvatarScreen.AvatarSwitcher and Inverted and UseMemoResult1 then task.delay(AXSlotBasedEditorAvatarSwitcherFtuxDelayRatio, function() --[[ Line: 122 ]]
			-- upvalues: UseResult1 (upval), UseNavigationResult (upval), AvatarScreen (upval), UseSelectorResult (upval), SlotBasedEditorAnalytics (upval)
			UseResult1("PROFILE_REDIRECT")
			UseNavigationResult.navigate(AvatarScreen.SlotsAvatarSwitcherFtuxPrompt, {
				screenSize = UseSelectorResult,
				onConfirm = function() --[[ Line: 126 ]]
					-- upvalues: UseResult1 (upval), SlotBasedEditorAnalytics (upval)
					UseResult1("FINISHED")
					SlotBasedEditorAnalytics.trackSlotsAvatarSwitcherFtuxPrompt()
				end
			})
		end) else nil
		
		return function() --[[ Line: 134 ]]
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	end, {
		UseResult,
		UseResult1,
		UseMemoResult,
		UseMemoResult1,
		ScreenLayout
	})
	
	return {
		enabled = UseResult() == "AVATAR_FOCUS_ICON" and UseMemoResult == AvatarScreen.AvatarEditor,
		menuItemId = MenuItemEnum.Main.AvatarSwitcher
	}
end