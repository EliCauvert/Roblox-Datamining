local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local fFlagBuildAnalyticsGoalsModule = require(buildExperience.Flags.FFlagBuildAnalyticsGoals)
local var1 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local _ = require(buildExperience.Analytics.AnalyticsMetric)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local _ = require(parent.DataHydration.ExperienceAnalytics)
local metricChartContainerModule = require(buildExperience.Components.Analytics.Chart.MetricChartContainer)

return function(p1)
	-- upvalues: fFlagBuildAnalyticsGoalsModule (ref), reactModule (ref), view (ref), text (ref), metricChartContainerModule (ref), var1 (ref), iconButton (ref), iconName (ref), inputSize (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local testId = p1.testId or "MetricDetailSheetView"
	local var2 = if fFlagBuildAnalyticsGoalsModule then p1.navigation else nil
	
	return reactModule.createElement(var1.Root, {
		isOpen = true,
		ref = p1.focusRootRef,
		onClose = p1.onClose,
		testId = testId
	}, {
		Header = reactModule.createElement(var1.Header, { hasCloseAffordance = p1.showCloseButton ~= false }, {
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
				Navigation = if var2 == nil or var2.count <= 1 then nil else reactModule.createElement(view, {
					LayoutOrder = 0,
					tag = "row align-x-right gap-small size-full-0 auto-y",
					testId = `{testId}.Navigation`
				}, {
					Previous = reactModule.createElement(iconButton, {
						LayoutOrder = 1,
						icon = iconName.ChevronLargeLeft,
						size = inputSize.Small,
						onActivated = var2.onPrevious,
						isDisabled = var2.index == 1,
						testId = `{testId}.Previous`
					}),
					Next = reactModule.createElement(iconButton, {
						LayoutOrder = 2,
						icon = iconName.ChevronLargeRight,
						size = inputSize.Small,
						onActivated = var2.onNext,
						isDisabled = var2.index == var2.count,
						testId = `{testId}.Next`
					})
				}),
				ChartCard = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "col size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
					testId = `{testId}.ChartCard`
				}, {
					[if var2 ~= nil then "Chart" else `Chart{var2.index}`] = reactModule.createElement(metricChartContainerModule, {
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
				}),
				HowToImprove = if fFlagBuildAnalyticsGoalsModule and p1.improvementText ~= nil and p1.improvementText ~= "" then reactModule.createElement(view, {
					LayoutOrder = 3,
					tag = "col gap-small size-full-0 auto-y",
					testId = `{testId}.HowToImprove`
				}, {
					Title = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
						Text = p1.improvementTitleText,
						testId = `{testId}.HowToImproveTitle`
					}),
					Tips = reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
						Text = p1.improvementText,
						testId = `{testId}.ImprovementText`
					})
				}) else nil
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