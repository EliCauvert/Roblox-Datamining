local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseMetricChartContentModule = require(script.Parent.useMetricChartContent)
local DeriveChartAxesFunction = require(Parent.AnalyticsMetricChart).deriveChartAxes

return function(p1)
	-- upvalues: UseMetricChartContentModule (copy), FoundationModule (copy), FoundationFontFaceMigration (copy), ReactModule (copy), DeriveChartAxesFunction (copy)
	local UseMetricChartContentModuleResult = UseMetricChartContentModule(p1)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local BodySmall = UseTokensResult.Typography.BodySmall
	local BodySmallFont = BodySmall.Font
	local BodySmallFont1 = if FoundationFontFaceMigration then BodySmallFont elseif typeof(BodySmallFont) == "EnumItem" then BodySmallFont else Enum.Font.BuilderSans
	local NewFontSize = BodySmall.FontSize + (FoundationModule.Hooks.useTextSizeOffset() or 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local Sery = if UseMetricChartContentModuleResult.series == nil then nil else UseMetricChartContentModuleResult.series[1]
	local Points = if Sery == nil then nil else Sery.points
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DeriveChartAxesFunction (upval), Points (copy)
		return DeriveChartAxesFunction(Points)
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
	local List = { UseMetricChartContentModuleResult.plotId }
	
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
			label = UseMetricChartContentModuleResult.yAxisFormatter({ value = yTick })
		}
	end
	local XAxisLabels = {}
	
	if Points ~= nil then
		for i1, point1 in Points do
			XAxisLabels[i1] = UseMetricChartContentModuleResult.xAxisFormatter({ value = point1.time })
		end
	end
	local Tooltip = nil
	
	if UseStateResult ~= nil and Points ~= nil and UseStateResult >= 1 and UseStateResult <= #Points then
		local Point = Points[UseStateResult]
		Tooltip = {
			date = UseMetricChartContentModuleResult.tooltipFormatters.formatXForPoint(Point.time),
			valueText = UseMetricChartContentModuleResult.tooltipFormatters.formatSeriesValueForPoint({
				y = Point.value,
				seriesId = if Sery == nil then nil else Sery.id
			})
		}
	end
	local Success = UseTokensResult.Color.System.Success
	
	return {
		layoutOrder = UseMetricChartContentModuleResult.layoutOrder,
		plotKey = Joined,
		title = UseMetricChartContentModuleResult.title,
		summary = UseMetricChartContentModuleResult.summary,
		valueText = UseMetricChartContentModuleResult.valueText,
		icon = UseMetricChartContentModuleResult.icon,
		deltaText = UseMetricChartContentModuleResult.deltaText,
		isDeltaPositive = UseMetricChartContentModuleResult.isDeltaPositive,
		hasData = UseMetricChartContentModuleResult.hasData,
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
		testId = UseMetricChartContentModuleResult.testId
	}
end