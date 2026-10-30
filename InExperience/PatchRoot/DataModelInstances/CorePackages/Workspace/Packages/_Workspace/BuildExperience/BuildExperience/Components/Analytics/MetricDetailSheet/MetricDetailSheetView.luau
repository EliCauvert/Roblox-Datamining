local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local FFlagBuildAnalyticsGoalsModule = require(BuildExperience.Flags.FFlagBuildAnalyticsGoals)
local Sheet = FoundationModule.Sheet
local _ = require(BuildExperience.Analytics.AnalyticsMetric)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local _ = require(Parent.DataHydration.CreatorAnalytics)
local MetricChartContainerModule = require(BuildExperience.Components.Analytics.Chart.MetricChartContainer)

return function(p1)
	-- upvalues: FFlagBuildAnalyticsGoalsModule (copy), ReactModule (copy), View (copy), Text (copy), MetricChartContainerModule (copy), Sheet (copy), IconButton (copy), IconName (copy), InputSize (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local TestId = p1.testId or "MetricDetailSheetView"
	local Navigation = if FFlagBuildAnalyticsGoalsModule then p1.navigation else nil
	
	return ReactModule.createElement(Sheet.Root, {
		isOpen = true,
		ref = p1.focusRootRef,
		onClose = p1.onClose,
		testId = TestId
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = p1.showCloseButton ~= false }, {
			Title = ReactModule.createElement(Text, {
				tag = "shrink auto-xy text-heading-small text-wrap text-align-x-left content-emphasis",
				Text = p1.titleText,
				testId = `{TestId}.Title`
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, nil, {
			Body = ReactModule.createElement(View, {
				tag = "col gap-large size-full-0 auto-y padding-top-medium"
			}, {
				Navigation = if Navigation == nil or Navigation.count <= 1 then nil else ReactModule.createElement(View, {
					LayoutOrder = 0,
					tag = "row align-x-right gap-small size-full-0 auto-y",
					testId = `{TestId}.Navigation`
				}, {
					Previous = ReactModule.createElement(IconButton, {
						LayoutOrder = 1,
						icon = IconName.ChevronLargeLeft,
						size = InputSize.Small,
						onActivated = Navigation.onPrevious,
						isDisabled = Navigation.index == 1,
						testId = `{TestId}.Previous`
					}),
					Next = ReactModule.createElement(IconButton, {
						LayoutOrder = 2,
						icon = IconName.ChevronLargeRight,
						size = InputSize.Small,
						onActivated = Navigation.onNext,
						isDisabled = Navigation.index == Navigation.count,
						testId = `{TestId}.Next`
					})
				}),
				ChartCard = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "col size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
					testId = `{TestId}.ChartCard`
				}, {
					[if Navigation == nil then "Chart" else `Chart{Navigation.index}`] = ReactModule.createElement(MetricChartContainerModule, {
						hideIcon = true,
						universeId = p1.universeId,
						metric = p1.metric,
						window = p1.window,
						latestAvailableTime = p1.latestAvailableTime,
						metadataStatus = p1.metadataStatus,
						summary = p1.summaryText
					})
				}),
				Description = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
					Text = p1.descriptionText,
					testId = `{TestId}.Description`
				}),
				HowToImprove = if FFlagBuildAnalyticsGoalsModule and p1.improvementText ~= nil and p1.improvementText ~= "" then ReactModule.createElement(View, {
					LayoutOrder = 3,
					tag = "col gap-small size-full-0 auto-y",
					testId = `{TestId}.HowToImprove`
				}, {
					Title = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
						Text = p1.improvementTitleText,
						testId = `{TestId}.HowToImproveTitle`
					}),
					Tips = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
						Text = p1.improvementText,
						testId = `{TestId}.ImprovementText`
					})
				}) else nil
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Analyze = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = p1.analyzeText,
				size = InputSize.Medium,
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				width = UDim.new(1, 0),
				isDisabled = p1.isAnalyzeDisabled,
				onActivated = p1.onAnalyze,
				testId = `{TestId}.Analyze`
			}),
			ViewInOverview = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				text = p1.viewInOverviewText,
				icon = IconName.ArrowUpRightFromSquare,
				size = InputSize.Medium,
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fill,
				width = UDim.new(1, 0),
				onActivated = p1.onViewInOverview,
				testId = `{TestId}.ViewInOverview`
			})
		})
	})
end