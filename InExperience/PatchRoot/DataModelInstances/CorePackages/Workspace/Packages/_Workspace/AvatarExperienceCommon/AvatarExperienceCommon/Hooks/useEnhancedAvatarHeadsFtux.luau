local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local navigationModule = require(parent.Navigation)
local safeAppStorageServiceModule = require(avatarExperienceCommon.Lib.SafeAppStorageService)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local useNavigation = navigationModule.useNavigation
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useIsSpatial = require(parent.Responsive).useIsSpatial
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXEnhancedAvatarHeadsFtuxUseMemStorage = avatarExperienceFlagsModule.FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage
local fIntAXEnhancedAvatarHeadsFtuxDelay = avatarExperienceFlagsModule.FIntAXEnhancedAvatarHeadsFtuxDelay

local var1 = function(p1)
	return p1.ScreenSize
end

return function()
	-- upvalues: useNavigation (ref), useAvatarRoute (ref), useSelector (ref), var1 (ref), reactModule (ref), safeAppStorageServiceModule (ref), fFlagAXEnhancedAvatarHeadsFtuxUseMemStorage (ref), useIsSpatial (ref), avatarScreen (ref), fIntAXEnhancedAvatarHeadsFtuxDelay (ref)
	local var2 = useNavigation()
	local var3 = useAvatarRoute()
	local var4 = useSelector(var1)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var3 (ref)
		return var3 and (var3.opaque and var3.opaque.name)
	end, { var3 })
	local var6 = reactModule.useCallback(function()
		-- upvalues: safeAppStorageServiceModule (copy), fFlagAXEnhancedAvatarHeadsFtuxUseMemStorage (copy)
		return safeAppStorageServiceModule.getItem("AXEnhancedAvatarHeadsFtux", fFlagAXEnhancedAvatarHeadsFtuxUseMemStorage)
	end, {})
	local var7 = reactModule.useCallback(function()
		-- upvalues: safeAppStorageServiceModule (copy), fFlagAXEnhancedAvatarHeadsFtuxUseMemStorage (copy)
		safeAppStorageServiceModule.setItem("AXEnhancedAvatarHeadsFtux", "true", fFlagAXEnhancedAvatarHeadsFtuxUseMemStorage)
		safeAppStorageServiceModule.flush()
	end, {})
	local var8 = useIsSpatial()
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var6 (ref), var5 (ref), avatarScreen (copy), fIntAXEnhancedAvatarHeadsFtuxDelay (copy), var2 (ref), var4 (ref), var7 (ref)
		if var8 then return end
		if var6() == "true" then return end
		if var5 == avatarScreen.AvatarEditor then
			local delayedThread = task.delay(fIntAXEnhancedAvatarHeadsFtuxDelay / 1000, function()
				-- upvalues: var2 (copy), avatarScreen (copy), var4 (copy), var7 (copy)
				var2.navigate(avatarScreen.EnhancedAvatarHeadsFtuxPrompt, {
					screenSize = var4,
					onConfirm = function()
						-- upvalues: var7 (copy)
						var7()
					end
				})
			end)
			
			return function()
				-- upvalues: delayedThread (ref)
				if delayedThread then
					task.cancel(delayedThread)
				end
			end
		end
	end, {
		var6, var7, var5, var4, var2, var8
	})
end