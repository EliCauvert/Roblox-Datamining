local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local DashModule = require(game:GetService("CorePackages").Packages.Dash)
local SetActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)
local SetDevConsoleVisibilityModule = require(script.Parent.Parent.Actions.SetDevConsoleVisibility)
local SetDevConsoleMinimizedModule = require(script.Parent.Parent.Actions.SetDevConsoleMinimized)
local ReportDevConsoleTabEventsThrottleHundredthsPercent = game:DefineFastInt("ReportDevConsoleTabEventsThrottleHundredthsPercent", 0)

function ReportDevConsoleOpenClose(p1, p2)
	-- upvalues: SetDevConsoleVisibilityModule (copy), RbxAnalyticsService (copy)
	if p2.type == SetDevConsoleVisibilityModule.name then
		local VisibleStartTime = p1:getState().DisplayOptions.visibleStartTime
		
		if p2.isVisible ~= p1:getState().DisplayOptions.isVisible then
			if p2.isVisible then
				RbxAnalyticsService:ReportCounter("DevConsoleStartVisible", 1)
				
				return
			end
			RbxAnalyticsService:ReportStats("DevConsoleSessionTime", tick() - VisibleStartTime)
		end
	end
end

function getTabAnalyticsKeyName(p1, p2): string
	return if p2 == nil then string.format("%s", p1) else string.format("%s_%s", p1, if p2 then "Client" else "Server")
end

function dispatchTabAnalytics(p1)
	-- upvalues: DashModule (copy), RbxAnalyticsService (copy), ReportDevConsoleTabEventsThrottleHundredthsPercent (copy)
	RbxAnalyticsService:ReportInfluxSeries("devConsoleMetric", DashModule.join({
		calledFrom = "devConsoleTabChange",
		placeId = game.PlaceId
	}, p1), ReportDevConsoleTabEventsThrottleHundredthsPercent)
end

function ReportTabChange(p1, p2)
	-- upvalues: SetActiveTabModule (copy), SetDevConsoleVisibilityModule (copy), SetDevConsoleMinimizedModule (copy)
	if p2.type == SetActiveTabModule.name then
		local MainView = p1:getState().MainView
		local NewTabIndex = p2.newTabIndex
		local IsClientView = p2.isClientView
		
		if NewTabIndex ~= MainView.currTabIndex or IsClientView ~= nil and IsClientView ~= MainView.isClientView then
			dispatchTabAnalytics({
				initTab = getTabAnalyticsKeyName(MainView.currTabIndex, MainView.isClientView),
				endTab = getTabAnalyticsKeyName(NewTabIndex, IsClientView)
			})
			
			return
		end
	elseif p2.type == SetDevConsoleVisibilityModule.name then
		local MainView = p1:getState().MainView
		local DisplayOptions = p1:getState().DisplayOptions
		dispatchTabAnalytics(if p2.isVisible then {
			initTab = "StartVisible",
			endTab = getTabAnalyticsKeyName(MainView.currTabIndex, MainView.isClientView)
		} elseif DisplayOptions.isMinimized then { initTab = "Minimized", endTab = "EndVisible" } else {
			endTab = "EndVisible",
			initTab = getTabAnalyticsKeyName(MainView.currTabIndex, MainView.isClientView)
		})
		
		return
	else
		if p2.type == SetDevConsoleMinimizedModule.name then
			local MainView = p1:getState().MainView
			dispatchTabAnalytics(if p2.isMinimized then {
				endTab = "Minimized",
				initTab = getTabAnalyticsKeyName(MainView.currTabIndex, MainView.isClientView)
			} else {
				initTab = "Minimized",
				endTab = getTabAnalyticsKeyName(MainView.currTabIndex, MainView.isClientView)
			})
		end
	end
end

return function(Callback, p1)
	return function(p2)
		-- upvalues: p1 (copy), Callback (copy)
		ReportTabChange(p1, p2)
		ReportDevConsoleOpenClose(p1, p2)
		Callback(p2)
	end
end