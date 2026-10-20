local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local AXPrefetchMarketplaceIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseMarketplaceResultsFetcherModule = require(script.Parent.useMarketplaceResultsFetcher)
local UseMarketplaceResultsFetcherSduiModule = require(script.Parent.useMarketplaceResultsFetcherSdui)
local UseResultsAreSduiEnabledModule = require(script.Parent.useResultsAreSduiEnabled)
local UseIsHomepageReadyModule = require(script.Parent.useIsHomepageReady)
local UseGetSelectedCategoryAndSubcategoryIdModule = require(Modules.AvatarExperience.Catalog.Hooks.useGetSelectedCategoryAndSubcategoryId)
local AXDebugForceIsRecentMarketplaceEnabled = game:DefineFastFlag("AXDebugForceIsRecentMarketplaceEnabled", false)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXStrictCheckForPrefetchMarketplace = AvatarExperienceFlagsModule.FFlagAXStrictCheckForPrefetchMarketplace
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagsAXPrefetchMarketplaceThumbnailsXP = AvatarExperienceFlagsModule.FFlagsAXPrefetchMarketplaceThumbnailsXP
local UserIsInTreatment = FFlagAXStrictCheckForPrefetchMarketplace and FFlagsAXPrefetchMarketplaceThumbnailsXP.UserIsInTreatment
local UsePrefetchMarketplaceThumbnailsModule = require(Modules.AvatarExperience.Common.Components.WidgetList.Hooks.usePrefetchMarketplaceThumbnails)
local AXAppLaunchedCounterEnabled = game:DefineFastFlag("AXAppLaunchedCounterEnabled", false)
local FFlagAXFixPrefetchMarketplaceStartupCrash = AvatarExperienceFlagsModule.FFlagAXFixPrefetchMarketplaceStartupCrash

local function selectIsRecentMarketplaceUser(p1)
	-- upvalues: AXDebugForceIsRecentMarketplaceEnabled (copy), FFlagAXFixPrefetchMarketplaceStartupCrash (copy)
	return if AXDebugForceIsRecentMarketplaceEnabled then true else (not FFlagAXFixPrefetchMarketplaceStartupCrash or p1.AvatarExperience and p1.AvatarExperience.Catalog and p1.AvatarExperience.Catalog.Metadata) and p1.AvatarExperience.Catalog.Metadata.isRecentMarketplaceUser
end

return function()
	-- upvalues: AXPrefetchMarketplaceIXP (copy), IxpUtilsModule (copy), UseIsHomepageReadyModule (copy), UseSelectorFunction (copy), selectIsRecentMarketplaceUser (copy), UseMarketplaceResultsFetcherModule (copy), FFlagAXMigrateAllTabToSduiDev (copy), UseGetSelectedCategoryAndSubcategoryIdModule (copy), UseMarketplaceResultsFetcherSduiModule (copy), ConstantsModule (copy), UseResultsAreSduiEnabledModule (copy), FFlagAXStrictCheckForPrefetchMarketplace (copy), ReactModule (copy), UserIsInTreatment (copy), UsePrefetchMarketplaceThumbnailsModule (copy), AXAppLaunchedCounterEnabled (copy), SendAXCounterV2Function (copy)
	local TestVariable = if AXPrefetchMarketplaceIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser) else nil
	local UseIsHomepageReadyModuleResult = UseIsHomepageReadyModule()
	local UseSelectorResult = UseSelectorFunction(selectIsRecentMarketplaceUser)
	local UseMarketplaceResultsFetcherModuleResult = UseMarketplaceResultsFetcherModule()
	local HasFetched = UseMarketplaceResultsFetcherModuleResult.hasFetched
	local IsFetching = UseMarketplaceResultsFetcherModuleResult.isFetching
	local FetchMarketplaceFunction = UseMarketplaceResultsFetcherModuleResult.fetchMarketplace
	
	if FFlagAXMigrateAllTabToSduiDev then
		local UseGetSelectedCategoryAndSubcategoryIdModuleResult, _ = UseGetSelectedCategoryAndSubcategoryIdModule()
		local UseMarketplaceResultsFetcherSduiModuleResult = UseMarketplaceResultsFetcherSduiModule({
			categoryId = UseGetSelectedCategoryAndSubcategoryIdModuleResult or ConstantsModule.DefaultCatalogCategoryId
		})
		
		if UseResultsAreSduiEnabledModule() then
			HasFetched = UseMarketplaceResultsFetcherSduiModuleResult.hasFetched
			IsFetching = UseMarketplaceResultsFetcherSduiModuleResult.isFetching
			FetchMarketplaceFunction = UseMarketplaceResultsFetcherSduiModuleResult.fetchMarketplace
		end
	end
	local UseRefResult = if FFlagAXStrictCheckForPrefetchMarketplace then ReactModule.useRef(false) else nil
	local Callback = nil
	local UseRefResult1 = nil
	
	if UserIsInTreatment then
		UseRefResult1 = ReactModule.useRef(false)
		Callback = UsePrefetchMarketplaceThumbnailsModule()
	end
	if AXAppLaunchedCounterEnabled then
		ReactModule.useEffect(function()
			-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval)
			SendAXCounterV2Function(ConstantsModule.Counter.PrefetchMarketplace.appLaunched)
		end, {})
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagAXStrictCheckForPrefetchMarketplace (upval), UseRefResult (copy), TestVariable (copy), UseSelectorResult (copy), HasFetched (ref), IsFetching (ref), UseIsHomepageReadyModuleResult (copy), SendAXCounterV2Function (upval), ConstantsModule (upval), FetchMarketplaceFunction (ref)
		if FFlagAXStrictCheckForPrefetchMarketplace and UseRefResult and UseRefResult.current then return end
		if not TestVariable then return end
		if not UseSelectorResult then return end
		if HasFetched or IsFetching then return end
		if not UseIsHomepageReadyModuleResult then return end
		SendAXCounterV2Function(ConstantsModule.Counter.PrefetchMarketplace.isRecentMarketplaceUser)
		FetchMarketplaceFunction()
		
		if FFlagAXStrictCheckForPrefetchMarketplace and UseRefResult then
			UseRefResult.current = true
		end
	end, {
		HasFetched, IsFetching, UseIsHomepageReadyModuleResult, TestVariable,
		UseSelectorResult,
		if FFlagAXMigrateAllTabToSduiDev then FetchMarketplaceFunction else nil
	})
	
	if UserIsInTreatment then
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult1 (ref), UseRefResult (copy), HasFetched (ref), Callback (ref)
			if UseRefResult1.current then return end
			if UseRefResult and not UseRefResult.current then return end
			if not HasFetched then return end
			if Callback then
				Callback()
				UseRefResult1.current = true
			end
		end, { Callback, HasFetched })
	end
end