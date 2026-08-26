local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local dashModule = require(game:GetService("CorePackages").Packages.Dash)
local setActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)
local setDevConsoleVisibilityModule = require(script.Parent.Parent.Actions.SetDevConsoleVisibility)
local setDevConsoleMinimizedModule = require(script.Parent.Parent.Actions.SetDevConsoleMinimized)
local reportDevConsoleTabEventsThrottleHundredthsPercent = game:DefineFastInt("ReportDevConsoleTabEventsThrottleHundredthsPercent", 0)

function ReportDevConsoleOpenClose(p1, p2)
	-- upvalues: setDevConsoleVisibilityModule (ref), rbxAnalyticsService (ref)
	if p2.type == setDevConsoleVisibilityModule.name then
		local visibleStartTime = p1:getState().DisplayOptions.visibleStartTime
		
		if p2.isVisible ~= p1:getState().DisplayOptions.isVisible then
			if p2.isVisible then
				rbxAnalyticsService:ReportCounter("DevConsoleStartVisible", 1)
				
				return
			end
			rbxAnalyticsService:ReportStats("DevConsoleSessionTime", tick() - visibleStartTime)
		end
	end
end

function getTabAnalyticsKeyName(p1, p2)
	return if p2 == nil then string.format("%s", p1) else string.format("%s_%s", p1, if p2 then "Client" else "Server")
end

function dispatchTabAnalytics(p1)
	-- upvalues: dashModule (ref), rbxAnalyticsService (ref), reportDevConsoleTabEventsThrottleHundredthsPercent (ref)
	rbxAnalyticsService:ReportInfluxSeries("devConsoleMetric", dashModule.join({
		calledFrom = "devConsoleTabChange",
		placeId = game.PlaceId
	}, p1), reportDevConsoleTabEventsThrottleHundredthsPercent)
end

function ReportTabChange(p1, p2)
	-- upvalues: setActiveTabModule (ref), setDevConsoleVisibilityModule (ref), setDevConsoleMinimizedModule (ref)
	if p2.type == setActiveTabModule.name then
		local mainView = p1:getState().MainView
		local newTabIndex = p2.newTabIndex
		local isClientView = p2.isClientView
		
		if newTabIndex == mainView.currTabIndex and (isClientView == nil or isClientView == mainView.isClientView) then
			return
		else
			dispatchTabAnalytics({
				initTab = getTabAnalyticsKeyName(mainView.currTabIndex, mainView.isClientView),
				endTab = getTabAnalyticsKeyName(newTabIndex, isClientView)
			})
			
			return
		end
	elseif p2.type == setDevConsoleVisibilityModule.name then
		local mainView = p1:getState().MainView
		dispatchTabAnalytics(if p2.isVisible then {
			initTab = "StartVisible",
			endTab = getTabAnalyticsKeyName(mainView.currTabIndex, mainView.isClientView)
		} elseif p1:getState().DisplayOptions.isMinimized then { initTab = "Minimized", endTab = "EndVisible" } else {
			endTab = "EndVisible",
			initTab = getTabAnalyticsKeyName(mainView.currTabIndex, mainView.isClientView)
		})
		
		return
	elseif p2.type == setDevConsoleMinimizedModule.name then
		local mainView = p1:getState().MainView
		dispatchTabAnalytics(if p2.isMinimized then {
			endTab = "Minimized",
			initTab = getTabAnalyticsKeyName(mainView.currTabIndex, mainView.isClientView)
		} else {
			initTab = "Minimized",
			endTab = getTabAnalyticsKeyName(mainView.currTabIndex, mainView.isClientView)
		})
	end
end

return function(p1, p2)
	return function(p3)
		-- upvalues: p2 (ref), p1 (ref)
		ReportTabChange(p2, p3)
		ReportDevConsoleOpenClose(p2, p3)
		p1(p3)
	end
end