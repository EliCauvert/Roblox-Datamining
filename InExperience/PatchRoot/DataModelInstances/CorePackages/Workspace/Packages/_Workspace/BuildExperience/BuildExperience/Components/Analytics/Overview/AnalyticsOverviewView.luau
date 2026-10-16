local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local _ = require(buildExperience.Analytics.AnalyticsMetric)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local _ = require(parent.DataHydration.ExperienceAnalytics)
local metricDetailSheetModule = require(buildExperience.Components.Analytics.MetricDetailSheet.MetricDetailSheet)
local _ = require(buildExperience.Components.Analytics.StatsCard.StatsCard)
local statsCardContainerModule = require(buildExperience.Components.Analytics.StatsCardContainer)
local _ = require(script.Parent.InstantStatCard)
local instantStatsRowModule = require(script.Parent.InstantStatsRow)
local windowSegmentedControlModule = require(script.Parent.WindowSegmentedControl)

local function _(p1, p2)
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		LayoutOrder = 1,
		tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
		Text = p1,
		testId = p2
	})
end

return function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref), instantStatsRowModule (ref), windowSegmentedControlModule (ref), statsCardContainerModule (ref), metricDetailSheetModule (ref)
	local testId = p1.testId or "AnalyticsOverviewView"
	local sheet = p1.sheet
	
	return reactModule.createElement(view, {
		tag = "col gap-xxlarge size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Overview = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xlarge size-full-0 auto-y",
			testId = `{testId}.Overview`
		}, {
			Heading = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
				Text = p1.overviewTitle,
				testId = `{testId}.OverviewHeading`
			}),
			InstantStats = reactModule.createElement(instantStatsRowModule, { layoutOrder = 2, stats = p1.instantStats })
		}),
		KeyStats = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-large size-full-0 auto-y",
			testId = `{testId}.KeyStats`
		}, {
			Heading = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
				Text = p1.keyStatsTitle,
				testId = `{testId}.KeyStatsHeading`
			}),
			WindowToggle = reactModule.createElement(windowSegmentedControlModule, {
				layoutOrder = 2,
				windows = p1.windows,
				selectedWindowId = p1.selectedWindowId,
				onWindowSelected = p1.onWindowSelected
			}),
			Cards = reactModule.createElement(statsCardContainerModule, { layoutOrder = 3, cards = p1.statsCards })
		}),
		Sheet = if sheet ~= nil then nil else reactModule.createElement(metricDetailSheetModule, {
			metricId = sheet.metricId,
			universeId = sheet.universeId,
			window = sheet.window,
			latestAvailableTime = sheet.latestAvailableTime,
			metadataStatus = sheet.metadataStatus,
			onClose = p1.onSheetClose,
			onOpenChat = p1.onOpenChat
		})
	})
end