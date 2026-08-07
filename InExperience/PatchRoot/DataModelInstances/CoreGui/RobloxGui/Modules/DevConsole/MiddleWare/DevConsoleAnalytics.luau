local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local dashModule = require(game:GetService("CorePackages").Packages.Dash)
local setActiveTabModule = require(script.Parent.Parent.Actions.SetActiveTab)
local setDevConsoleVisibilityModule = require(script.Parent.Parent.Actions.SetDevConsoleVisibility)
local setDevConsoleMinimizedModule = require(script.Parent.Parent.Actions.SetDevConsoleMinimized)
local reportDevConsoleTabEventsThrottleHundredthsPercent = game:DefineFastInt("ReportDevConsoleTabEventsThrottleHundredthsPercent", 0)

function ReportDevConsoleOpenClose(p0, p1) --[[ line: 23 ]]
	-- upvalues: setDevConsoleVisibilityModule (ref), rbxAnalyticsService (ref)
	if p1.type == setDevConsoleVisibilityModule.name then
		local visibleStartTime = p0:getState().DisplayOptions.visibleStartTime
		
		if p1.isVisible ~= p0:getState().DisplayOptions.isVisible then
			if p1.isVisible then
				rbxAnalyticsService:ReportCounter("DevConsoleStartVisible", 1)
				
				return
			end
			rbxAnalyticsService:ReportStats("DevConsoleSessionTime", tick() - visibleStartTime)
		end
	end
end

function getTabAnalyticsKeyName(p2, p3) --[[ line: 39 ]]
	return if p3 == nil then string.format("%s", p2) else string.format("%s_%s", p2, if p3 then "Client" else "Server")
end

function dispatchTabAnalytics(p4) --[[ line: 47 ]]
	-- upvalues: dashModule (ref), rbxAnalyticsService (ref), reportDevConsoleTabEventsThrottleHundredthsPercent (ref)
	rbxAnalyticsService:ReportInfluxSeries("devConsoleMetric", dashModule.join({
		calledFrom = "devConsoleTabChange",
		placeId = game.PlaceId
	}, p4), reportDevConsoleTabEventsThrottleHundredthsPercent)
end

function ReportTabChange(p5, p6) --[[ line: 59 ]]
	-- upvalues: setActiveTabModule (ref), setDevConsoleVisibilityModule (ref), setDevConsoleMinimizedModule (ref)
	if p6.type == setActiveTabModule.name then
		local mainView = p5:getState().MainView
		local newTabIndex = p6.newTabIndex
		local isClientView = p6.isClientView
		
		if newTabIndex == mainView.currTabIndex and (isClientView == nil or isClientView == mainView.isClientView) then
			return
		else
			dispatchTabAnalytics({
				initTab = getTabAnalyticsKeyName(mainView.currTabIndex, mainView.isClientView),
				endTab = getTabAnalyticsKeyName(newTabIndex, isClientView)
			})
			
			return
		end
	elseif p6.type == setDevConsoleVisibilityModule.name then
		local mainView = p5:getState().MainView
		dispatchTabAnalytics(if p6.isVisible then {
			initTab = "StartVisible",
			endTab = getTabAnalyticsKeyName(mainView.currTabIndex, mainView.isClientView)
		} elseif p5:getState().DisplayOptions.isMinimized then { initTab = "Minimized", endTab = "EndVisible" } else {
			endTab = "EndVisible",
			initTab = getTabAnalyticsKeyName(mainView.currTabIndex, mainView.isClientView)
		})
		
		return
	elseif p6.type == setDevConsoleMinimizedModule.name then
		local mainView = p5:getState().MainView
		dispatchTabAnalytics(if p6.isMinimized then {
			endTab = "Minimized",
			initTab = getTabAnalyticsKeyName(mainView.currTabIndex, mainView.isClientView)
		} else {
			initTab = "Minimized",
			endTab = getTabAnalyticsKeyName(mainView.currTabIndex, mainView.isClientView)
		})
	end
end

return function(p7, p8) --[[ line: 117 ]]
	return function(p9) --[[ line: 118 ]]
		-- upvalues: p8 (ref), p7 (ref)
		ReportTabChange(p8, p9)
		ReportDevConsoleOpenClose(p8, p9)
		p7(p9)
	end
end