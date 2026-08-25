local avatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local parent = avatarExperienceSlotBasedEditor.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSlotBasedEditorContextModule = require(avatarExperienceSlotBasedEditor.Context.useSlotBasedEditorContext)
local screenLayoutModule = require(avatarExperienceSlotBasedEditor.Enums.ScreenLayout)
local navigationModule = require(parent.Navigation)
local AXCommonModule = require(parent.AXCommon)
local slotBasedEditorAnalytics = require(parent.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local safeAppStorageService = AXCommonModule.Lib.SafeAppStorageService
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local useNavigation = navigationModule.useNavigation
local selectIsFullView = AXCommonModule.State.Selectors.selectIsFullView
local useIsSpatial = require(parent.Responsive).useIsSpatial
local menuItemEnum = require(parent.AXControlBar).Enums.MenuItemEnum
local AXSlotBasedEditorCustomizeFtuxUseMemStorage2 = game:DefineFastFlag("AXSlotBasedEditorCustomizeFtuxUseMemStorage2", false)
local var8 = game:DefineFastInt("AXSlotBasedEditorCustomizeFtuxDelay2", 3000) / 1000
local var9 = game:DefineFastInt("AXSlotBasedEditorAvatarSwitcherFtuxDelay2", 1000) / 1000
local _ = {
	INIT = "",
	AVATAR_FOCUS_ICON = "AVATAR_FOCUS_ICON",
	PROFILE_REDIRECT = "PROFILE_REDIRECT",
	FINISHED = "FINISHED"
}

local var10 = function(p0)
	return p0.ScreenSize
end

return function(p1)
	-- upvalues: useNavigation (ref), useAvatarRoute (ref), useSlotBasedEditorContextModule (ref), useSelector (ref), var10 (ref), useIsSpatial (ref), reactModule (ref), selectIsFullView (ref), safeAppStorageService (ref), AXSlotBasedEditorCustomizeFtuxUseMemStorage2 (ref), avatarScreen (ref), screenLayoutModule (ref), var8 (ref), slotBasedEditorAnalytics (ref), var9 (ref), menuItemEnum (ref)
	local var11 = useNavigation()
	local var12 = useAvatarRoute()
	local var13 = useSlotBasedEditorContextModule()
	local screenLayout = var13 and var13.screenLayout
	local var15 = useSelector(var10)
	local var16 = not useIsSpatial()
	local var17 = reactModule.useMemo(function()
		-- upvalues: var12 (ref)
		return var12 and (var12.opaque and var12.opaque.name)
	end, { var12 })
	local var18 = useSelector(reactModule.useCallback(function(p2)
		-- upvalues: selectIsFullView (copy), var17 (ref)
		return selectIsFullView(p2, var17)
	end, { var17 }))
	local var19 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var18 (ref)
		return p1(var18)
	end, { var18 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: safeAppStorageService (copy), AXSlotBasedEditorCustomizeFtuxUseMemStorage2 (copy)
		return safeAppStorageService.getItem("AXSlotBasedEditorCustomizeFtux", AXSlotBasedEditorCustomizeFtuxUseMemStorage2)
	end, {})
	local var21 = reactModule.useCallback(function(p3)
		-- upvalues: safeAppStorageService (copy), AXSlotBasedEditorCustomizeFtuxUseMemStorage2 (copy)
		safeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", p3, AXSlotBasedEditorCustomizeFtuxUseMemStorage2)
		safeAppStorageService.flush()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), var17 (ref), avatarScreen (copy), var16 (ref), var19 (ref), screenLayout (ref), screenLayoutModule (copy), var8 (copy), var11 (ref), var15 (ref), var21 (ref), slotBasedEditorAnalytics (copy), var9 (copy)
		local var22 = var20()
		local delayedThread = nil
		
		if var22 == "" and var17 == avatarScreen.AvatarEditor and (var16 and var19) and (screenLayout == screenLayoutModule.LandscapeSplit or screenLayout == screenLayoutModule.PortraitSlots) then
			delayedThread = task.delay(var8, function()
				-- upvalues: var11 (copy), avatarScreen (copy), var15 (copy), var21 (copy), slotBasedEditorAnalytics (copy)
				var11.navigate(avatarScreen.SlotsCustomizeFtuxPrompt, {
					screenSize = var15,
					onConfirm = function()
						-- upvalues: var21 (copy), slotBasedEditorAnalytics (copy)
						var21("AVATAR_FOCUS_ICON")
						slotBasedEditorAnalytics.trackSlotsCustomizeFtuxPrompt()
					end
				})
			end)
		elseif var22 == "AVATAR_FOCUS_ICON" and var17 == avatarScreen.AvatarSwitcher and (var16 and var19) then
			delayedThread = task.delay(var9, function()
				-- upvalues: var21 (copy), var11 (copy), avatarScreen (copy), var15 (copy), slotBasedEditorAnalytics (copy)
				var21("PROFILE_REDIRECT")
				var11.navigate(avatarScreen.SlotsAvatarSwitcherFtuxPrompt, {
					screenSize = var15,
					onConfirm = function()
						-- upvalues: var21 (copy), slotBasedEditorAnalytics (copy)
						var21("FINISHED")
						slotBasedEditorAnalytics.trackSlotsAvatarSwitcherFtuxPrompt()
					end
				})
			end)
		end
		return function()
			-- upvalues: delayedThread (write)
			if delayedThread then
				task.cancel(delayedThread)
			end
		end
	end, {
		var20,
		var21,
		var17,
		var19,
		screenLayout
	})
	
	return {
		enabled = var20() == "AVATAR_FOCUS_ICON" and var17 == avatarScreen.AvatarEditor,
		menuItemId = menuItemEnum.Main.AvatarSwitcher
	}
end