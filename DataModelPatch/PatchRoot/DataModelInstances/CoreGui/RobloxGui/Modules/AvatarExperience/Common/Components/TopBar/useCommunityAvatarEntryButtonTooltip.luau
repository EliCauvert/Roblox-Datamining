local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Utils)
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
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

if not game:GetEngineFeature("AXMarketplaceCommunityAvatarsTooltipKeys") then
	AppStorageService = getMockAppStorageService()
end
return function(p1)
	-- upvalues: ReactModule (copy), UseAvatarRouteFunction (copy), FFlagSignalsNavP3gAvatarExperience (copy), UseSignalStateFunction (copy), UtilsModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), AvatarScreen (copy), AppStorageService (ref), UseIsSpatialFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local IsNameMatch: boolean = (if FFlagSignalsNavP3gAvatarExperience then UseSignalStateFunction(UtilsModule.getIsAvatarExperienceRoute()) else UseSelectorFunction(UtilsModule.isAvatarExperienceRoute, GetUseSelectorDeepEqualsFunction())) and UseAvatarRouteResult.current.name == AvatarScreen.AvatarEditor
	local AppStorageService1 = p1.appStorageService or AppStorageService
	local UseIsSpatialResult = UseIsSpatialFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseIsSpatialResult (copy), UseStateResult2 (copy), IsNameMatch (copy), AppStorageService1 (copy)
		if UseIsSpatialResult then
			UseStateResult2(false)
			
			return
		end
		if IsNameMatch then
			local AXMarketplaceCommunityAvatarsTooltipSeenTimestampItem = AppStorageService1:GetItem("AXMarketplaceCommunityAvatarsTooltipSeenTimestamp")
			UseStateResult2(AXMarketplaceCommunityAvatarsTooltipSeenTimestampItem == "" or AXMarketplaceCommunityAvatarsTooltipSeenTimestampItem == nil)
			
			return
		else
			UseStateResult2(false)
		end
	end, { IsNameMatch, UseIsSpatialResult })
	
	return UseStateResult, function(p2)
		-- upvalues: AppStorageService1 (copy), UseStateResult2 (copy)
		if p2.saveDismissTime then
			AppStorageService1:SetItem("AXMarketplaceCommunityAvatarsTooltipSeenTimestamp", (tostring(os.time())))
			AppStorageService1:Flush()
		end
		UseStateResult2(false)
	end
end