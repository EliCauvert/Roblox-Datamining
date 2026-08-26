local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local getMenuItemsFromConfigsModule = require(abuseReportMenu.MenuConfigs.getMenuItemsFromConfigs)
local getMenuItemSizingsModule = require(abuseReportMenu.Utility.getMenuItemSizings)
local reportExperienceMenuItemConfigListModule = require(abuseReportMenu.MenuConfigs.Experience.ReportExperienceMenuItemConfigList)
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local cryoModule = require(corePackagesService.Packages.Cryo)
local reportExperienceUIStateReducerModule = require(abuseReportMenu.Reducers.reportExperienceUIStateReducer)

return function(p1)
	-- upvalues: getMenuItemSizingsModule (ref), reactModule (ref), reportExperienceUIStateReducerModule (ref), constantsModule (ref), getMenuItemsFromConfigsModule (ref), reportExperienceMenuItemConfigListModule (ref), cryoModule (ref)
	local var1 = getMenuItemSizingsModule()
	local var2, var3 = reactModule.useReducer(reportExperienceUIStateReducerModule, constantsModule.InitExperienceUIState)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), constantsModule (copy)
		if p1.utilityProps.isReportTabVisible then
			p1.utilityProps.analyticsDispatch({
				type = constantsModule.AnalyticsActions.SwitchToExperienceInitialSelections
			})
		end
	end, { p1.utilityProps.isReportTabVisible })
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		MenuItems = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, cryoModule.Dictionary.join({
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var1.ItemPadding)
			})
		}, getMenuItemsFromConfigsModule(var2, var3, p1.utilityProps, reportExperienceMenuItemConfigListModule, p1.isSmallPortraitViewport)))
	})
end