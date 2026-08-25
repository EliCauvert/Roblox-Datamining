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

return function(p0)
	-- upvalues: getMenuItemSizingsModule (ref), reactModule (ref), reportExperienceUIStateReducerModule (ref), constantsModule (ref), getMenuItemsFromConfigsModule (ref), reportExperienceMenuItemConfigListModule (ref), cryoModule (ref)
	local var9 = getMenuItemSizingsModule()
	local var10, var11 = reactModule.useReducer(reportExperienceUIStateReducerModule, constantsModule.InitExperienceUIState)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), constantsModule (copy)
		if p0.utilityProps.isReportTabVisible then
			p0.utilityProps.analyticsDispatch({
				type = constantsModule.AnalyticsActions.SwitchToExperienceInitialSelections
			})
		end
	end, { p0.utilityProps.isReportTabVisible })
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		MenuItems = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, cryoModule.Dictionary.join({
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var9.ItemPadding)
			})
		}, getMenuItemsFromConfigsModule(var10, var11, p0.utilityProps, reportExperienceMenuItemConfigListModule, p0.isSmallPortraitViewport)))
	})
end