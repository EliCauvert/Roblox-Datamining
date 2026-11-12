local AnalyticsMetricChart = script:FindFirstAncestor("AnalyticsMetricChart")
local Parent = AnalyticsMetricChart.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local _ = require(script.Parent.MetricChartTypes)
local _ = require(script.Parent.MetricChartView)
local DeriveChartAxesModule = require(AnalyticsMetricChart.Utils.deriveChartAxes)

return function(p1)
	-- upvalues: FoundationModule (copy), FoundationFontFaceMigration (copy), ReactModule (copy), DeriveChartAxesModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local BodySmall = UseTokensResult.Typography.BodySmall
	local BodySmallFont = BodySmall.Font
	local BodySmallFont1 = if FoundationFontFaceMigration then BodySmallFont elseif typeof(BodySmallFont) == "EnumItem" then BodySmallFont else Enum.Font.BuilderSans
	local NewFontSize = BodySmall.FontSize + (FoundationModule.Hooks.useTextSizeOffset() or 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local Sery = if p1.series == nil then nil else p1.series[1]
	local Points = if Sery == nil then nil else Sery.points
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DeriveChartAxesModule (upval), Points (copy)
		return DeriveChartAxesModule(Points)
	end, { Points })
	local CountPoints = #UseMemoResult.points
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: CountPoints (copy), UseStateResult2 (copy)
		if CountPoints ~= 0 then
			UseStateResult2((math.clamp(math.round(p2.X) + 1, 1, CountPoints)))
			
			return
		end
	end, { CountPoints })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult2 (copy)
		if not UseStateResult1 then
			UseStateResult2(nil)
		end
	end, { UseStateResult1 })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy), UseResult (copy)
		UseStateResult2_1(true)
		UseResult(p2)
	end, { UseResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy)
		UseStateResult2_1(false)
		UseStateResult2(nil)
	end, {})
	local List = { p1.plotId }
	
	if Points ~= nil then
		for _, point in Points do
			table.insert(List, `{point.time}:{point.value}`)
		end
	end
	local Joined = table.concat(List, "|")
	local YTicks = {}
	
	for i, yTick in UseMemoResult.yTicks do
		YTicks[i] = {
			position = yTick,
			label = p1.yAxisFormatter({ value = yTick })
		}
	end
	local XAxisLabels = {}
	
	if Points ~= nil then
		for i1, point1 in Points do
			XAxisLabels[i1] = p1.xAxisFormatter({ value = point1.time })
		end
	end
	local Tooltip = nil
	
	if UseStateResult ~= nil and Points ~= nil and UseStateResult >= 1 and UseStateResult <= #Points then
		local Point = Points[UseStateResult]
		Tooltip = {
			date = p1.tooltipFormatters.formatXForPoint(Point.time),
			valueText = p1.tooltipFormatters.formatSeriesValueForPoint({
				y = Point.value,
				seriesId = if Sery == nil then nil else Sery.id
			})
		}
	end
	local Success = UseTokensResult.Color.System.Success
	
	return {
		layoutOrder = p1.layoutOrder,
		plotKey = Joined,
		title = p1.title,
		summary = p1.summary,
		valueText = p1.valueText,
		icon = p1.icon,
		deltaText = p1.deltaText,
		isDeltaPositive = p1.isDeltaPositive,
		hasData = p1.hasData,
		points = UseMemoResult.points,
		minX = UseMemoResult.minX,
		maxX = UseMemoResult.maxX,
		minY = UseMemoResult.minY,
		maxY = UseMemoResult.maxY,
		yTicks = YTicks,
		xAxisLabels = XAxisLabels,
		labelFont = BodySmallFont1,
		labelFontSize = NewFontSize,
		inspectedIndex = UseStateResult,
		tooltip = Tooltip,
		onHoverStart = UseResult,
		onHoverMoved = UseResult,
		onHoverEnded = UseResult1,
		onPress = UseResult,
		onDragStart = UseResult2,
		onDragMoved = UseResult,
		onDragEnded = UseResult3,
		colors = {
			line = UseTokensResult.Color.System.Emphasis,
			grid = UseTokensResult.Color.Stroke.Default,
			axisLabel = UseTokensResult.Color.Content.Default,
			muted = UseTokensResult.Color.Content.Muted,
			emphasis = UseTokensResult.Color.Content.Emphasis,
			surface = UseTokensResult.Color.Surface.Surface_100,
			positive = Success,
			positiveBackground = {
				Color3 = Success.Color3,
				Transparency = UseTokensResult.Color.Shift.Shift_300.Transparency
			},
			tooltipBackground = UseTokensResult.Color.System.Contrast,
			tooltipContent = UseTokensResult.Inverse.Content.Emphasis
		},
		testId = p1.testId
	}
end