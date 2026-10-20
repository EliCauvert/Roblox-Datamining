local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local FilterSubsectionModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterSubsection)
local CreatorFilterModule = require(Modules.AvatarExperience.Common.Enum.CreatorFilter)
local PriceFilterModule = require(Modules.AvatarExperience.Common.Enum.PriceFilter)
local SalesTypeFilterModule = require(Modules.AvatarExperience.Common.Enum.SalesTypeFilter)
local UnavailableItemFilterModule = require(Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)
local WearTimeFilter = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.WearTimeFilter
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local _ = require(Modules.AvatarExperience.Catalog.Hooks.useFiltersController)
local FilterTextBoxModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterTextBox)
local PriceRangeInputModule = require(Modules.AvatarExperience.Catalog.Components.Filters.PriceRangeInput)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local AXDurablesFilters = game:DefineFastFlag("AXDurablesFilters", false)
local Focusable = RoactGamepadModule.Focusable
local _UDim = UDim.new(0, 20)
local _UDim1 = UDim.new(0, 12)

return function(Gui)
	-- upvalues: RoactGamepadModule (copy), UseLocalizationFunction (copy), ReactModule (copy), AXDurablesFilters (copy), _UDim1 (copy), _UDim (copy), Focusable (copy), FilterUtilsModule (copy), FilterSubsectionModule (copy), SalesTypeFilterModule (copy), CreatorFilterModule (copy), FilterTextBoxModule (copy), WearTimeFilter (copy), PriceFilterModule (copy), ConstantsModule (copy), PriceRangeInputModule (copy), UnavailableItemFilterModule (copy)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local FiltersController = Gui.filtersController
	local UseLocalizationResult = UseLocalizationFunction({
		salesType = "Feature.Catalog.Label.Filter.SalesType",
		all = "Feature.Avatar.Heading.All",
		limited = "Feature.Catalog.Label.Limited",
		premium = "Feature.Catalog.Label.Premium",
		timedOptions = "Feature.Durables.Filter.Title",
		creator = "Feature.Catalog.Label.Filter.Creator",
		allCreators = "Feature.Catalog.LabelAllCreators",
		username = "Feature.Catalog.Label.Username",
		creatorName = "Feature.Catalog.Label.CreatorName",
		price = "Feature.Catalog.Label.Price",
		anyPrice = "Feature.Catalog.LabelAnyPrice",
		priceRange = "Feature.Catalog.Label.PriceRange",
		unavailableItems = "Feature.Catalog.Label.Filter.UnavailableItems",
		show = "Feature.Catalog.Label.Filter.Show",
		hide = "Feature.Catalog.Label.Filter.Hide",
		wearTimeTitle = "Feature.Durables.Filter.Title",
		wearTimeAll = "Feature.Durables.Filter.All",
		wearTimeTimedOptionsOnly = "Feature.Durables.Filter.TimedOptions"
	})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefCacheResult1 = RoactGamepadModule.useRefCache()
	
	local function updateTotalHeight()
		-- upvalues: AXDurablesFilters (upval), UseRefCacheResult1 (copy), _UDim1 (upval), _UDim (upval), UseBindingResult2 (copy), Gui (copy)
		local NewOffset = _UDim1.Offset * 2 + _UDim.Offset * 3 + (UseRefCacheResult1.SalesType.current or 0) + (UseRefCacheResult1.Creator.current or 0) + (AXDurablesFilters and UseRefCacheResult1.WearTime.current or 0) + (UseRefCacheResult1.Price.current or 0) + (UseRefCacheResult1.UnavailableItems.current or 0)
		UseBindingResult2(NewOffset)
		
		if Gui.onHeightChanged then
			Gui.onHeightChanged(NewOffset)
		end
	end
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		restorePreviousChildFocus = true,
		Size = UseBindingResult:map(FilterUtilsModule.mapHeightToSize),
		ref = Gui.frameRef,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown,
		defaultChild = UseRefCacheResult.SalesType
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = _UDim
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = _UDim1,
			PaddingBottom = _UDim1,
			PaddingLeft = _UDim1
		}),
		SalesType = ReactModule.createElement(FilterSubsectionModule, {
			LayoutOrder = 1,
			title = UseLocalizationResult.salesType,
			items = {
				{
					text = UseLocalizationResult.all,
					id = SalesTypeFilterModule.All
				},
				{
					text = UseLocalizationResult.limited,
					id = SalesTypeFilterModule.Collectibles
				},
				{
					text = UseLocalizationResult.timedOptions,
					id = SalesTypeFilterModule.TimedOptions
				}
			},
			selectedValue = FiltersController.salesTypeFilter,
			setSelectedValue = FiltersController.setSalesTypeFilter,
			frameRef = UseRefCacheResult.SalesType,
			NextSelectionDown = UseRefCacheResult.Creator,
			onHeightChanged = function(Current)
				-- upvalues: UseRefCacheResult1 (copy), updateTotalHeight (copy)
				UseRefCacheResult1.SalesType.current = Current
				updateTotalHeight()
			end
		}),
		Creator = ReactModule.createElement(FilterSubsectionModule, {
			LayoutOrder = 2,
			title = UseLocalizationResult.creator,
			items = {
				{
					text = UseLocalizationResult.allCreators,
					id = CreatorFilterModule.AllCreators
				},
				{
					id = CreatorFilterModule.Username,
					customView = ReactModule.createElement(FilterTextBoxModule, {
						text = FiltersController.creatorUsername,
						placeholderText = UseLocalizationResult.creatorName,
						onTextChanged = FiltersController.setCreatorUsername,
						onFocused = function()
							-- upvalues: FiltersController (copy), CreatorFilterModule (upval)
							FiltersController.setCreatorFilter(CreatorFilterModule.Username)
						end
					})
				}
			},
			selectedValue = FiltersController.creatorFilter,
			setSelectedValue = FiltersController.setCreatorFilter,
			frameRef = UseRefCacheResult.Creator,
			NextSelectionUp = UseRefCacheResult.SalesType,
			NextSelectionDown = UseRefCacheResult.Price,
			onHeightChanged = function(Current)
				-- upvalues: UseRefCacheResult1 (copy), updateTotalHeight (copy)
				UseRefCacheResult1.Creator.current = Current
				updateTotalHeight()
			end
		}),
		WearTime = if AXDurablesFilters then ReactModule.createElement(FilterSubsectionModule, {
			LayoutOrder = 3,
			selectionMode = "single",
			title = UseLocalizationResult.wearTimeTitle,
			items = {
				{
					text = UseLocalizationResult.wearTimeAll,
					id = WearTimeFilter.All
				},
				{
					text = UseLocalizationResult.wearTimeTimedOptionsOnly,
					id = WearTimeFilter.TimedOptionsOnly
				}
			},
			selectedValue = FiltersController.wearTimeFilter,
			setSelectedValue = FiltersController.setWearTimeFilter,
			frameRef = UseRefCacheResult.WearTime,
			NextSelectionUp = UseRefCacheResult.Creator,
			NextSelectionDown = UseRefCacheResult.Price,
			onHeightChanged = function(Current)
				-- upvalues: UseRefCacheResult1 (copy), updateTotalHeight (copy)
				UseRefCacheResult1.WearTime.current = Current
				updateTotalHeight()
			end
		}) else nil,
		Price = ReactModule.createElement(FilterSubsectionModule, {
			LayoutOrder = if AXDurablesFilters then 4 else 3,
			title = UseLocalizationResult.price,
			items = {
				{
					text = UseLocalizationResult.anyPrice,
					id = PriceFilterModule.AnyPrice
				},
				{
					text = UseLocalizationResult.priceRange,
					id = PriceFilterModule.PriceRange,
					expandedViewHeight = ConstantsModule.SortAndFiltersRowHeight,
					expandedView = ReactModule.createElement(PriceRangeInputModule, {
						minPrice = FiltersController.minPrice,
						maxPrice = FiltersController.maxPrice,
						setMinPrice = FiltersController.setMinPrice,
						setMaxPrice = FiltersController.setMaxPrice,
						onFocused = function()
							-- upvalues: FiltersController (copy), PriceFilterModule (upval)
							FiltersController.setPriceFilter(PriceFilterModule.PriceRange)
						end
					})
				}
			},
			selectedValue = FiltersController.priceFilter,
			setSelectedValue = FiltersController.setPriceFilter,
			frameRef = UseRefCacheResult.Price,
			NextSelectionUp = UseRefCacheResult.Creator,
			NextSelectionDown = UseRefCacheResult.UnavailableItems,
			onHeightChanged = function(Current)
				-- upvalues: UseRefCacheResult1 (copy), updateTotalHeight (copy)
				UseRefCacheResult1.Price.current = Current
				updateTotalHeight()
			end
		}),
		UnavailableItems = ReactModule.createElement(FilterSubsectionModule, {
			LayoutOrder = if AXDurablesFilters then 5 else 4,
			title = UseLocalizationResult.unavailableItems,
			items = {
				{
					text = UseLocalizationResult.hide,
					id = UnavailableItemFilterModule.Hide
				},
				{
					text = UseLocalizationResult.show,
					id = UnavailableItemFilterModule.Show
				}
			},
			selectedValue = FiltersController.unavailableItemFilter,
			setSelectedValue = FiltersController.setUnavailableItemFilter,
			frameRef = UseRefCacheResult.UnavailableItems,
			NextSelectionUp = UseRefCacheResult.Price,
			onHeightChanged = function(Current)
				-- upvalues: UseRefCacheResult1 (copy), updateTotalHeight (copy)
				UseRefCacheResult1.UnavailableItems.current = Current
				updateTotalHeight()
			end
		})
	})
end