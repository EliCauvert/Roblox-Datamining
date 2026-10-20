local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local SafeAppStorageServiceModule = require(AvatarExperienceCommon.Lib.SafeAppStorageService)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage = AvatarExperienceFlagsModule.FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage
local FIntAXEnhancedAvatarHeadsFtuxDelay = AvatarExperienceFlagsModule.FIntAXEnhancedAvatarHeadsFtuxDelay

local function v9(p1)
	return p1.ScreenSize
end

return function()
	-- upvalues: UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseSelectorFunction (copy), v9 (copy), ReactModule (copy), SafeAppStorageServiceModule (copy), FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage (copy), UseIsSpatialFunction (copy), AvatarScreen (copy), FIntAXEnhancedAvatarHeadsFtuxDelay (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseSelectorResult = UseSelectorFunction(v9)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseAvatarRouteResult (copy)
		return UseAvatarRouteResult and (UseAvatarRouteResult.opaque and UseAvatarRouteResult.opaque.name)
	end, { UseAvatarRouteResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SafeAppStorageServiceModule (upval), FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage (upval)
		return SafeAppStorageServiceModule.getItem("AXEnhancedAvatarHeadsFtux", FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: SafeAppStorageServiceModule (upval), FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage (upval)
		SafeAppStorageServiceModule.setItem("AXEnhancedAvatarHeadsFtux", "true", FFlagAXEnhancedAvatarHeadsFtuxUseMemStorage)
		SafeAppStorageServiceModule.flush()
	end, {})
	local UseIsSpatialResult = UseIsSpatialFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseIsSpatialResult (copy), UseResult (copy), UseMemoResult (copy), AvatarScreen (upval), FIntAXEnhancedAvatarHeadsFtuxDelay (upval), UseNavigationResult (copy), UseSelectorResult (copy), UseResult1 (copy)
		if UseIsSpatialResult then return end
		if UseResult() == "true" then return end
		if UseMemoResult ~= AvatarScreen.AvatarEditor then return end
		local DelayedThread = task.delay(FIntAXEnhancedAvatarHeadsFtuxDelay / 1000, function()
			-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), UseSelectorResult (upval), UseResult1 (upval)
			UseNavigationResult.navigate(AvatarScreen.EnhancedAvatarHeadsFtuxPrompt, {
				screenSize = UseSelectorResult,
				onConfirm = function()
					-- upvalues: UseResult1 (upval)
					UseResult1()
				end
			})
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	end, {
		UseResult, UseResult1, UseMemoResult, UseSelectorResult, UseNavigationResult,
		UseIsSpatialResult
	})
end