local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local GetMenuItemsFromConfigsModule = require(AbuseReportMenu.MenuConfigs.getMenuItemsFromConfigs)
local GetMenuItemSizingsModule = require(AbuseReportMenu.Utility.getMenuItemSizings)
local ReportExperienceMenuItemConfigListModule = require(AbuseReportMenu.MenuConfigs.Experience.ReportExperienceMenuItemConfigList)
local _ = require(AbuseReportMenu.Components.Types)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local CryoModule = require(CorePackages.Packages.Cryo)
local ReportExperienceUIStateReducerModule = require(AbuseReportMenu.Reducers.reportExperienceUIStateReducer)

return function(p1) --[[ Line: 17 | Named "ReportExperienceMenuItemsContainer" ]]
	-- upvalues: GetMenuItemSizingsModule (copy), ReactModule (copy), ReportExperienceUIStateReducerModule (copy), ConstantsModule (copy), GetMenuItemsFromConfigsModule (copy), ReportExperienceMenuItemConfigListModule (copy), CryoModule (copy)
	local MenuItemSizingsModule = GetMenuItemSizingsModule()
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(ReportExperienceUIStateReducerModule, ConstantsModule.InitExperienceUIState)
	ReactModule.useEffect(function() --[[ Line: 21 ]]
		-- upvalues: p1 (copy), ConstantsModule (upval)
		if p1.utilityProps.isReportTabVisible then
			p1.utilityProps.analyticsDispatch({
				type = ConstantsModule.AnalyticsActions.SwitchToExperienceInitialSelections
			})
		end
	end, { p1.utilityProps.isReportTabVisible })
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		MenuItems = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, (CryoModule.Dictionary.join({
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, MenuItemSizingsModule.ItemPadding)
			})
		}, (GetMenuItemsFromConfigsModule(UseReducerResult, UseReducerResult2, p1.utilityProps, ReportExperienceMenuItemConfigListModule, p1.isSmallPortraitViewport)))))
	})
end