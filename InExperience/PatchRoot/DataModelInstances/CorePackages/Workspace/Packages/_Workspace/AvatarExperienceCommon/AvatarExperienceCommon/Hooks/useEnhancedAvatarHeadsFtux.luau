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

local var6 = function(p0)
	return p0.ScreenSize
end

return function()
	-- upvalues: useNavigation (ref), useAvatarRoute (ref), useSelector (ref), var6 (ref), reactModule (ref), safeAppStorageServiceModule (ref), fFlagAXEnhancedAvatarHeadsFtuxUseMemStorage (ref), useIsSpatial (ref), avatarScreen (ref), fIntAXEnhancedAvatarHeadsFtuxDelay (ref)
	local var7 = useNavigation()
	local var8 = useAvatarRoute()
	local var9 = useSelector(var6)
	local var10 = reactModule.useMemo(function()
		-- upvalues: var8 (ref)
		return var8 and (var8.opaque and var8.opaque.name)
	end, { var8 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: safeAppStorageServiceModule (copy), fFlagAXEnhancedAvatarHeadsFtuxUseMemStorage (copy)
		return safeAppStorageServiceModule.getItem("AXEnhancedAvatarHeadsFtux", fFlagAXEnhancedAvatarHeadsFtuxUseMemStorage)
	end, {})
	local var12 = reactModule.useCallback(function()
		-- upvalues: safeAppStorageServiceModule (copy), fFlagAXEnhancedAvatarHeadsFtuxUseMemStorage (copy)
		safeAppStorageServiceModule.setItem("AXEnhancedAvatarHeadsFtux", "true", fFlagAXEnhancedAvatarHeadsFtuxUseMemStorage)
		safeAppStorageServiceModule.flush()
	end, {})
	local var13 = useIsSpatial()
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var11 (ref), var10 (ref), avatarScreen (copy), fIntAXEnhancedAvatarHeadsFtuxDelay (copy), var7 (ref), var9 (ref), var12 (ref)
		if var13 then return end
		if var11() == "true" then return end
		if var10 == avatarScreen.AvatarEditor then
			local delayedThread = task.delay(fIntAXEnhancedAvatarHeadsFtuxDelay / 1000, function()
				-- upvalues: var7 (copy), avatarScreen (copy), var9 (copy), var12 (copy)
				var7.navigate(avatarScreen.EnhancedAvatarHeadsFtuxPrompt, {
					screenSize = var9,
					onConfirm = function()
						-- upvalues: var12 (copy)
						var12()
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
		var11, var12, var10, var9, var7, var13
	})
end