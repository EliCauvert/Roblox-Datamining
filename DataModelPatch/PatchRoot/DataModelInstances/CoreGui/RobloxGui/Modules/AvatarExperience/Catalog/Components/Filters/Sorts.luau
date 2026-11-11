local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local _ = require(Modules.AvatarExperience.Catalog.Hooks.useSortsController)
local UseIsGamepadFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useIsGamepad
local RadioButtonGroupModule = require(Modules.AvatarExperience.Catalog.Components.Filters.RadioButtonGroup)
local SortAggregationGroupModule = require(Modules.AvatarExperience.Catalog.Components.Filters.SortAggregationGroup)
local SortTypeModule = require(Modules.AvatarExperience.Common.Enum.SortType)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local FilterUtilsModule = require(Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local _UDim = UDim.new(0, 12)
local NewSortAndFiltersSmallRowHeight = 6 + ConstantsModule.SortAndFiltersSmallRowHeight * 3

local function _(p1)
	-- upvalues: _UDim (copy)
	return p1 + _UDim.Offset * 2
end

return function(Gui)
	-- upvalues: UseLocalizationFunction (copy), CatalogConstantsModule (copy), SortTypeModule (copy), NewSortAndFiltersSmallRowHeight (copy), ReactModule (copy), SortAggregationGroupModule (copy), UseIsGamepadFunction (copy), _UDim (copy), Focusable (copy), FilterUtilsModule (copy), RadioButtonGroupModule (copy), ConstantsModule (copy)
	local SortsController = Gui.sortsController
	local UseLocalizationResult = UseLocalizationFunction(CatalogConstantsModule.SortTypeLocalization)
	local RecentlyCreated = SortTypeModule.RecentlyCreated
	local Items = {
		{
			text = UseLocalizationResult.Relevance,
			id = SortTypeModule.Relevance
		},
		{
			text = UseLocalizationResult.MostFavorited,
			id = SortTypeModule.MostFavorited,
			expandedViewHeight = NewSortAndFiltersSmallRowHeight,
			expandedView = ReactModule.createElement(SortAggregationGroupModule, {
				sortAggregation = SortsController.mostFavoritedAggregation,
				setSortAggregation = SortsController.setMostFavoritedAggregation
			})
		},
		{
			text = UseLocalizationResult.Bestselling,
			id = SortTypeModule.Bestselling,
			expandedViewHeight = NewSortAndFiltersSmallRowHeight,
			expandedView = ReactModule.createElement(SortAggregationGroupModule, {
				sortAggregation = SortsController.bestSellingAggregation,
				setSortAggregation = SortsController.setBestSellingAggregation
			})
		},
		{
			text = UseLocalizationResult[RecentlyCreated],
			id = RecentlyCreated
		},
		{
			text = UseLocalizationResult.PriceLowToHigh,
			id = SortTypeModule.PriceLowToHigh
		},
		{
			text = UseLocalizationResult.PriceHighToLow,
			id = SortTypeModule.PriceHighToLow
		}
	}
	local UseIsGamepadResult = UseIsGamepadFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UseBindingResult:map(function(p1): UDim2
			-- upvalues: _UDim (upval)
			return UDim2.new(1, 0, 0, p1 + _UDim.Offset * 2)
		end),
		ref = Gui.frameRef,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = _UDim
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = _UDim,
			PaddingBottom = _UDim,
			PaddingLeft = _UDim
		}),
		RadioButtonGroupContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UseBindingResult:map(FilterUtilsModule.mapHeightToSize)
		}, {
			SortRadioButtons = ReactModule.createElement(RadioButtonGroupModule, {
				items = Items,
				itemHeight = ConstantsModule.SortAndFiltersRowHeight,
				selectedValue = SortsController.sortType,
				onActivated = function(p1)
					-- upvalues: SortsController (copy)
					SortsController.setSortType(p1)
				end,
				useDefaultControlState = UseIsGamepadResult,
				onHeightChanged = function(NewOffset)
					-- upvalues: UseBindingResult2 (copy), Gui (copy), _UDim (upval)
					UseBindingResult2(NewOffset)
					
					if Gui.onHeightChanged then
						Gui.onHeightChanged(NewOffset + _UDim.Offset * 2)
					end
				end
			})
		})
	})
end