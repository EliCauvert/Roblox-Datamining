local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SafeAppStorageService = AvatarExperienceCommonModule.Lib.SafeAppStorageService
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
local AXCategoryButtonTooltipUseMemStorage = game:DefineFastFlag("AXCategoryButtonTooltipUseMemStorage", false)
local AXCategoryButtonTooltipTimeToDismiss = game:DefineFastInt("AXCategoryButtonTooltipTimeToDismiss", 5)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoryTooltip = AvatarExperienceFlagsModule.FFlagAXCatalogCategoryTooltip
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlagsModule.FFlagAXRemoveCatalogCategoryNavKey
local config = {
	enableTooltip = false,
	titleText = nil,
	FTUXStorageKey = "",
	tooltipSeen = ""
}
local config1 = {
	[if FFlagAXCatalogCategoryTooltip then "BodyCategoryCatalogTooltip" elseif FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Body:rawValue() else CatalogCategories.Body] = {
		enableTooltip = true,
		titleText = "Feature.Catalog.Message.BodyCategoryTooltip",
		FTUXStorageKey = "AXAvatarsTabFtux",
		tooltipSeen = game:DefineFastString("AXBodyCategoryTooltipSeen", "BodyCategoryTooltipSeen")
	}
}

return function(p1, Name, p2)
	-- upvalues: config1 (copy), FFlagAXCatalogCategoryTooltip (copy), config (copy), UseIsSpatialFunction (copy), UseAvatarRouteFunction (copy), ReactModule (copy), SafeAppStorageService (copy), AXCategoryButtonTooltipUseMemStorage (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), AXCategoryButtonTooltipTimeToDismiss (copy)
	local Entry = config1[if FFlagAXCatalogCategoryTooltip then p2 else p1] or config
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local IsItemMatch = SafeAppStorageService.getItem(Entry.FTUXStorageKey, AXCategoryButtonTooltipUseMemStorage) == Entry.tooltipSeen
	local UseStateResult, UseStateResult2 = ReactModule.useState(IsItemMatch)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), SafeAppStorageService (upval), Entry (copy), AXCategoryButtonTooltipUseMemStorage (upval), UseRefResult1 (copy), SendAXCounterV2Function (upval), ConstantsModule (upval)
		UseStateResult2(true)
		SafeAppStorageService.setItem(Entry.FTUXStorageKey, Entry.tooltipSeen, AXCategoryButtonTooltipUseMemStorage)
		SafeAppStorageService.flush()
		
		if not UseRefResult1.current then
			SendAXCounterV2Function(ConstantsModule.Counter.CategoryButtonTooltip.ClickDismiss, {
				FTUXStorageKey = Entry.FTUXStorageKey,
				FStringTooltipSeen = Entry.tooltipSeen
			})
			UseRefResult1.current = true
		end
	end, { Entry })
	ReactModule.useEffect(function()
		-- upvalues: Entry (copy), IsItemMatch (copy), UseIsSpatialResult (copy), AXCategoryButtonTooltipTimeToDismiss (upval), UseRefResult1 (copy), SendAXCounterV2Function (upval), ConstantsModule (upval), UseResult (copy)
		if Entry.enableTooltip and not IsItemMatch and not UseIsSpatialResult then
			task.spawn(function()
				-- upvalues: AXCategoryButtonTooltipTimeToDismiss (upval), UseRefResult1 (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), Entry (upval), UseResult (upval)
				task.wait(AXCategoryButtonTooltipTimeToDismiss)
				
				if not UseRefResult1.current then
					SendAXCounterV2Function(ConstantsModule.Counter.CategoryButtonTooltip.AutoDismiss, {
						FTUXStorageKey = Entry.FTUXStorageKey,
						FStringTooltipSeen = Entry.tooltipSeen
					})
					UseRefResult1.current = true
				end
				UseResult()
			end)
		end
	end, {})
	local NoUseStateResult: boolean = Entry.enableTooltip and (not UseIsSpatialResult and (UseAvatarRouteResult.opaque.name == Name and not UseStateResult))
	
	if NoUseStateResult and not UseRefResult.current then
		SendAXCounterV2Function(ConstantsModule.Counter.CategoryButtonTooltip.Seen, {
			FTUXStorageKey = Entry.FTUXStorageKey,
			FStringTooltipSeen = Entry.tooltipSeen
		})
		UseRefResult.current = true
	end
	return NoUseStateResult, UseResult, Entry.titleText
end