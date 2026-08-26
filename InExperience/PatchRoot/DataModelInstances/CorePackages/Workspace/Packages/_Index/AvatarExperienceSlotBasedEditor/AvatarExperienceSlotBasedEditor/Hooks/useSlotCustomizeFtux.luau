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
local var1 = game:DefineFastInt("AXSlotBasedEditorCustomizeFtuxDelay2", 3000) / 1000
local var2 = game:DefineFastInt("AXSlotBasedEditorAvatarSwitcherFtuxDelay2", 1000) / 1000
local _ = {
	INIT = "",
	AVATAR_FOCUS_ICON = "AVATAR_FOCUS_ICON",
	PROFILE_REDIRECT = "PROFILE_REDIRECT",
	FINISHED = "FINISHED"
}

local var3 = function(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: useNavigation (ref), useAvatarRoute (ref), useSlotBasedEditorContextModule (ref), useSelector (ref), var3 (ref), useIsSpatial (ref), reactModule (ref), selectIsFullView (ref), safeAppStorageService (ref), AXSlotBasedEditorCustomizeFtuxUseMemStorage2 (ref), avatarScreen (ref), screenLayoutModule (ref), var1 (ref), slotBasedEditorAnalytics (ref), var2 (ref), menuItemEnum (ref)
	local var4 = useNavigation()
	local var5 = useAvatarRoute()
	local var6 = useSlotBasedEditorContextModule()
	local screenLayout = var6 and var6.screenLayout
	local var7 = useSelector(var3)
	local var8 = not useIsSpatial()
	local var9 = reactModule.useMemo(function()
		-- upvalues: var5 (ref)
		return var5 and (var5.opaque and var5.opaque.name)
	end, { var5 })
	local var10 = useSelector(reactModule.useCallback(function(p2)
		-- upvalues: selectIsFullView (copy), var9 (ref)
		return selectIsFullView(p2, var9)
	end, { var9 }))
	local var11 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var10 (ref)
		return p1(var10)
	end, { var10 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: safeAppStorageService (copy), AXSlotBasedEditorCustomizeFtuxUseMemStorage2 (copy)
		return safeAppStorageService.getItem("AXSlotBasedEditorCustomizeFtux", AXSlotBasedEditorCustomizeFtuxUseMemStorage2)
	end, {})
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: safeAppStorageService (copy), AXSlotBasedEditorCustomizeFtuxUseMemStorage2 (copy)
		safeAppStorageService.setItem("AXSlotBasedEditorCustomizeFtux", p2, AXSlotBasedEditorCustomizeFtuxUseMemStorage2)
		safeAppStorageService.flush()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var9 (ref), avatarScreen (copy), var8 (ref), var11 (ref), screenLayout (ref), screenLayoutModule (copy), var1 (copy), var4 (ref), var7 (ref), var13 (ref), slotBasedEditorAnalytics (copy), var2 (copy)
		local var14 = var12()
		local delayedThread = nil
		
		if var14 == "" and var9 == avatarScreen.AvatarEditor and (var8 and var11) and (screenLayout == screenLayoutModule.LandscapeSplit or screenLayout == screenLayoutModule.PortraitSlots) then
			delayedThread = task.delay(var1, function()
				-- upvalues: var4 (copy), avatarScreen (copy), var7 (copy), var13 (copy), slotBasedEditorAnalytics (copy)
				var4.navigate(avatarScreen.SlotsCustomizeFtuxPrompt, {
					screenSize = var7,
					onConfirm = function()
						-- upvalues: var13 (copy), slotBasedEditorAnalytics (copy)
						var13("AVATAR_FOCUS_ICON")
						slotBasedEditorAnalytics.trackSlotsCustomizeFtuxPrompt()
					end
				})
			end)
		elseif var14 == "AVATAR_FOCUS_ICON" and var9 == avatarScreen.AvatarSwitcher and (var8 and var11) then
			delayedThread = task.delay(var2, function()
				-- upvalues: var13 (copy), var4 (copy), avatarScreen (copy), var7 (copy), slotBasedEditorAnalytics (copy)
				var13("PROFILE_REDIRECT")
				var4.navigate(avatarScreen.SlotsAvatarSwitcherFtuxPrompt, {
					screenSize = var7,
					onConfirm = function()
						-- upvalues: var13 (copy), slotBasedEditorAnalytics (copy)
						var13("FINISHED")
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
		var12,
		var13,
		var9,
		var11,
		screenLayout
	})
	
	return {
		enabled = var12() == "AVATAR_FOCUS_ICON" and var9 == avatarScreen.AvatarEditor,
		menuItemId = menuItemEnum.Main.AvatarSwitcher
	}
end