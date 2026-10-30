local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local _ = require(BuildExperience.Analytics.AnalyticsMetric)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local _ = require(Parent.DataHydration.CreatorAnalytics)
local FFlagBuildAnalyticsGoalsModule = require(BuildExperience.Flags.FFlagBuildAnalyticsGoals)
local MetricDetailSheetModule = require(BuildExperience.Components.Analytics.MetricDetailSheet.MetricDetailSheet)
local _ = require(BuildExperience.Components.Analytics.StatsCard.StatsCard)
local StatsCardContainerModule = require(BuildExperience.Components.Analytics.StatsCardContainer)
local GoalsSectionModule = require(BuildExperience.Components.Analytics.Goals.GoalsSection)
local _ = require(script.Parent.InstantStatCard)
local InstantStatsRowModule = require(script.Parent.InstantStatsRow)
local WindowSegmentedControlModule = require(script.Parent.WindowSegmentedControl)

local function _(Text1, TestId)
	-- upvalues: ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		LayoutOrder = 1,
		tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
		Text = Text1,
		testId = TestId
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), InstantStatsRowModule (copy), FFlagBuildAnalyticsGoalsModule (copy), WindowSegmentedControlModule (copy), StatsCardContainerModule (copy), GoalsSectionModule (copy), MetricDetailSheetModule (copy)
	local TestId = p1.testId or "AnalyticsOverviewView"
	local Sheet = p1.sheet
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["col gap-xxlarge size-full-0 auto-y"] = true,
			["padding-bottom-xlarge"] = FFlagBuildAnalyticsGoalsModule
		},
		testId = TestId
	}, {
		Overview = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xlarge size-full-0 auto-y",
			testId = `{TestId}.Overview`
		}, {
			Heading = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
				Text = p1.overviewTitle,
				testId = `{TestId}.OverviewHeading`
			}),
			InstantStats = ReactModule.createElement(InstantStatsRowModule, { layoutOrder = 2, stats = p1.instantStats })
		}),
		KeyStats = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-large size-full-0 auto-y",
			testId = `{TestId}.KeyStats`
		}, {
			Heading = if FFlagBuildAnalyticsGoalsModule then nil else ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
				Text = p1.keyStatsTitle,
				testId = `{TestId}.KeyStatsHeading`
			}),
			WindowToggle = ReactModule.createElement(WindowSegmentedControlModule, {
				layoutOrder = 2,
				windows = p1.windows,
				selectedWindowId = p1.selectedWindowId,
				onWindowSelected = p1.onWindowSelected
			}),
			Cards = if FFlagBuildAnalyticsGoalsModule then nil else ReactModule.createElement(StatsCardContainerModule, { layoutOrder = 3, cards = p1.statsCards }),
			Goals = if FFlagBuildAnalyticsGoalsModule then ReactModule.createElement(GoalsSectionModule, {
				layoutOrder = 4,
				onOpenChat = p1.onOpenChat,
				universeId = p1.universeId,
				window = p1.window,
				testId = `{TestId}.Goals`
			}) else nil
		}),
		Sheet = if Sheet == nil then nil else ReactModule.createElement(MetricDetailSheetModule, {
			metricId = Sheet.metricId,
			universeId = Sheet.universeId,
			window = Sheet.window,
			latestAvailableTime = Sheet.latestAvailableTime,
			metadataStatus = Sheet.metadataStatus,
			onClose = p1.onSheetClose,
			onOpenChat = p1.onOpenChat
		})
	})
end