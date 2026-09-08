local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local var1 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local _ = require(buildExperience.Analytics.AnalyticsMetric)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local _ = require(parent.DataHydration.ExperienceAnalytics)
local metricChartContainerModule = require(buildExperience.Components.Analytics.Chart.MetricChartContainer)

return function(p1)
	-- upvalues: reactModule (ref), var1 (ref), text (ref), view (ref), metricChartContainerModule (ref), button (ref), inputSize (ref), buttonVariant (ref), fillBehavior (ref), iconName (ref)
	local testId = p1.testId or "MetricDetailSheetView"
	
	return reactModule.createElement(var1.Root, { isOpen = true, onClose = p1.onClose }, {
		Header = reactModule.createElement(var1.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				tag = "shrink auto-xy text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = p1.titleText,
				testId = `{testId}.Title`
			})
		}),
		Content = reactModule.createElement(var1.Content, nil, {
			Body = reactModule.createElement(view, {
				tag = "col gap-large size-full-0 auto-y padding-top-medium"
			}, {
				ChartCard = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "col size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
					testId = `{testId}.ChartCard`
				}, {
					Chart = reactModule.createElement(metricChartContainerModule, {
						hideIcon = true,
						universeId = p1.universeId,
						metric = p1.metric,
						window = p1.window,
						latestAvailableTime = p1.latestAvailableTime,
						metadataStatus = p1.metadataStatus,
						summary = p1.summaryText
					})
				}),
				Description = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
					Text = p1.descriptionText,
					testId = `{testId}.Description`
				})
			})
		}),
		Actions = reactModule.createElement(var1.Actions, nil, {
			Analyze = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = p1.analyzeText,
				size = inputSize.Medium,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				width = UDim.new(1, 0),
				onActivated = p1.onAnalyze,
				testId = `{testId}.Analyze`
			}),
			ViewInOverview = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = p1.viewInOverviewText,
				icon = iconName.ArrowUpRightFromSquare,
				size = inputSize.Medium,
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fill,
				width = UDim.new(1, 0),
				onActivated = p1.onViewInOverview,
				testId = `{testId}.ViewInOverview`
			})
		})
	})
end