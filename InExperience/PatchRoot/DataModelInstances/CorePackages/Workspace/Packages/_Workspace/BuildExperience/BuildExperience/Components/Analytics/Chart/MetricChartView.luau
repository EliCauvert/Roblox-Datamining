local TextService = game:GetService("TextService")
local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local GraphingModule = require(Parent.Graphing)
local ReactModule = require(Parent.React)
local StyleModule = require(Parent.Style)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local Canvas = GraphingModule.Canvas
local Curve = GraphingModule.Curve
local GridLine = GraphingModule.GridLine
local InputDetector = GraphingModule.InputDetector
local Point = GraphingModule.Point
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local PLOTHEIGHT: number = require(script.Parent.chartLayout).PLOT_HEIGHT
local PLOTHEIGHTDelta = PLOTHEIGHT - 28
local YOffset = PLOTHEIGHTDelta + -1

local function renderTooltip(Position, Tooltip, Colors, TestId, Name, OnAbsoluteSizeChanged)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), Icon (copy), IconSize (copy)
	return ReactModule.createElement(View, {
		ZIndex = 30,
		tag = "row align-y-center gap-large anchor-top-center auto-x padding-x-xsmall radius-small",
		Size = UDim2.fromOffset(0, 30),
		Position = Position,
		backgroundStyle = Colors.tooltipBackground,
		onAbsoluteSizeChanged = OnAbsoluteSizeChanged,
		testId = `{TestId}.Tooltip`
	}, {
		Date = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "auto-xy text-caption-medium content-inverse-default",
			Text = Tooltip.date,
			testId = `{TestId}.TooltipDate`
		}),
		ValueGroup = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-xsmall auto-xy"
		}, {
			Icon = if Name == nil then nil else ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = Name,
				size = IconSize.XSmall,
				style = Colors.tooltipContent,
				testId = `{TestId}.TooltipIcon`
			}),
			Value = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-caption-medium content-inverse-emphasis",
				Text = Tooltip.valueText,
				testId = `{TestId}.TooltipValue`
			})
		})
	})
end

local function _(p1, p2)
	-- upvalues: ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		LayoutOrder = 1,
		tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-default",
		Text = p1.title,
		testId = `{p2}.Title`
	})
end

local _ = function(p1, p2)
	-- upvalues: ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		LayoutOrder = 2,
		tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
		Text = p1.summary,
		testId = `{p2}.Summary`
	})
end

local function renderValueRow(p1, TestId)
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy), IconName (copy), IconVariant (copy)
	local Colors = p1.colors
	
	return ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-small size-full-0 auto-y"
	}, {
		Stat = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall auto-xy"
		}, {
			Icon = if p1.icon == nil then nil else ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = p1.icon,
				size = IconSize.Medium,
				style = Colors.emphasis,
				testId = `{TestId}.Icon`
			}),
			Value = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-heading-large content-emphasis",
				Text = p1.valueText,
				testId = `{TestId}.Value`
			})
		}),
		Delta = if p1.deltaText == nil then nil else ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["row align-y-center gap-xxsmall auto-xy padding-y-xxsmall padding-left-xsmall padding-right-small radius-small"] = true,
				["bg-shift-200"] = not p1.isDeltaPositive
			},
			backgroundStyle = if p1.isDeltaPositive then Colors.positiveBackground else nil,
			testId = `{TestId}.Delta`
		}, {
			Arrow = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = if p1.isDeltaPositive then IconName.ArrowWideShortUp else IconName.ArrowWideShortDown,
				size = IconSize.XSmall,
				variant = IconVariant.Filled,
				style = if p1.isDeltaPositive then Colors.positive else Colors.muted
			}),
			Value = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-caption-medium content-default",
				Text = p1.deltaText
			})
		})
	})
end

local function measureGutter(YTicks, LabelFontSize, LabelFont): number
	-- upvalues: FoundationFontFaceMigration (copy), StyleModule (copy), TextService (copy)
	local Value = 0
	
	for _, yTick in YTicks do
		Value = math.max(Value, (if FoundationFontFaceMigration then StyleModule.GetTextSize(yTick.label, LabelFontSize, LabelFont, Vector2.new(1000, 100), { addTemporaryPadding = false }) else TextService:GetTextSize(yTick.label, LabelFontSize, LabelFont, Vector2.new(1000, 100))).X)
	end
	return (math.max(60, math.ceil(Value) + 2 + 12))
end

local function renderYAxisLabels(p1)
	-- upvalues: PLOTHEIGHT (copy), ReactModule (copy), Text (copy)
	local AxisLabel = p1.colors.axisLabel
	local PLOTHEIGHTDelta = PLOTHEIGHT - 12 - 28
	local Largest = math.max(p1.maxY - p1.minY, 0.000001)
	local Elements = {}
	
	for _, yTick in p1.yTicks do
		Elements[`YLabel_{yTick.position}`] = ReactModule.createElement(Text, {
			tag = "anchor-center-left auto-xy text-body-small",
			ZIndex = 4,
			Position = UDim2.new(0, 2, 0, 12 + (p1.maxY - yTick.position) / Largest * PLOTHEIGHTDelta),
			Text = yTick.label,
			textStyle = AxisLabel,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	end
	return Elements
end

local function selectXAxisTicks(XAxisLabels, p2: number, FontSize, p3)
	-- upvalues: FoundationFontFaceMigration (copy), StyleModule (copy), TextService (copy)
	local CountXAxisLabels = #XAxisLabels
	
	if CountXAxisLabels <= 2 or p2 <= 0 then
		return {}
	end
	local Largest = 0
	
	for _, xAxisLabel in XAxisLabels do
		Largest = math.max(Largest, (if FoundationFontFaceMigration then StyleModule.GetTextSize(xAxisLabel, FontSize, p3, Vector2.new(1000, 100), { addTemporaryPadding = false }) else TextService:GetTextSize(xAxisLabel, FontSize, p3, Vector2.new(1000, 100))).X)
	end
	if p2 < Largest then
		return {}
	end
	local NewLargest = Largest + 24
	local v1 = p2 / (CountXAxisLabels - 1)
	local List = nil
	local IsIMatch = nil
	
	for i = math.min(3, CountXAxisLabels - 2), 1, -1 do
		List = {}
		local t = {}
		
		for i1 = 1, i do
			local ClampedValue = math.clamp(math.round(CountXAxisLabels * i1 / (i + 1)), 1, CountXAxisLabels - 2)
			
			if not t[ClampedValue] then
				t[ClampedValue] = true
				table.insert(List, ClampedValue)
			end
		end
		IsIMatch = #List == i
		for i2 = 2, #List do
			if (List[i2] - List[i2 - 1]) * v1 >= NewLargest then
				continue
			end
			IsIMatch = false
			break
		end
		if not IsIMatch then
			continue
		end
		local List1 = {}
		
		for _, Position in List do
			table.insert(List1, { position = Position, label = XAxisLabels[Position + 1] })
		end
		return List1
	end
	return {}
end

local function renderXAxisLabels(p4, Offset, p5, LabelFontSize, LabelFont)
	-- upvalues: selectXAxisTicks (copy), ReactModule (copy), Text (copy), PLOTHEIGHTDelta (copy)
	local AxisLabel = p4.colors.axisLabel
	local Largest = math.max(p4.maxX - p4.minX, 0.000001)
	local Elements = {}
	
	for _, value in selectXAxisTicks(p4.xAxisLabels, p5, LabelFontSize, LabelFont) do
		Elements[`XLabel_{value.position}`] = ReactModule.createElement(Text, {
			tag = "anchor-top-center auto-xy text-body-small",
			ZIndex = 4,
			Position = UDim2.new(0, Offset + (value.position - p4.minX) / Largest * p5, 0, PLOTHEIGHTDelta + 4),
			Text = value.label,
			textStyle = AxisLabel,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Top
		})
	end
	return Elements
end

return function(p6)
	-- upvalues: ReactModule (copy), renderValueRow (copy), measureGutter (copy), Curve (copy), InputDetector (copy), GridLine (copy), renderYAxisLabels (copy), renderXAxisLabels (copy), Point (copy), YOffset (copy), renderTooltip (copy), Canvas (copy), View (copy), PLOTHEIGHT (copy), Text (copy)
	local TestId = p6.testId or "MetricChartView"
	local Colors = p6.colors
	local LabelFont = p6.labelFont
	local LabelFontSize = p6.labelFontSize
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local config = { ValueRow = renderValueRow(p6, TestId) }
	
	if p6.hasData then
		local MeasureGutterResult: number = measureGutter(p6.yTicks, LabelFontSize, LabelFont)
		local Points = {}
		
		for i, point in p6.points do
			Points[i] = { Position = point }
		end
		local config1 = {
			Curve = ReactModule.createElement(Curve, {
				Thickness = 3,
				ZIndex = 3,
				Points = Points,
				Color3 = Colors.line.Color3,
				Tag = `data-testid={TestId}.Curve`
			}),
			Input = ReactModule.createElement(InputDetector, {
				TreatMouseAsAnchor = true,
				ZIndex = 20,
				OnHoverStart = p6.onHoverStart,
				OnHoverMoved = p6.onHoverMoved,
				OnHoverEnded = p6.onHoverEnded,
				OnPress = p6.onPress,
				OnDragStart = p6.onDragStart,
				OnDragMoved = p6.onDragMoved,
				OnDragEnded = p6.onDragEnded
			})
		}
		
		for _, yTick in p6.yTicks do
			config1[`Grid_{yTick.position}`] = ReactModule.createElement(GridLine, {
				Orientation = "Horizontal",
				Thickness = 1,
				ZIndex = 1,
				Position = yTick.position,
				Color3 = Colors.grid.Color3,
				Transparency = Colors.grid.Transparency
			})
		end
		local RenderYAxisLabelsResult = renderYAxisLabels(p6)
		
		for i1, value in renderXAxisLabels(p6, MeasureGutterResult, UseStateResult - MeasureGutterResult - 8, LabelFontSize, LabelFont) do
			RenderYAxisLabelsResult[i1] = value
		end
		local ChildrenUnclipped = {}
		local Tooltip = nil
		local InspectedIndex: number = p6.inspectedIndex
		
		if InspectedIndex ~= nil and InspectedIndex >= 1 and InspectedIndex <= #p6.points then
			local Point1 = p6.points[InspectedIndex]
			ChildrenUnclipped.InspectionLine = ReactModule.createElement(GridLine, {
				Orientation = "Vertical",
				Transparency = 0,
				Thickness = 2,
				ZIndex = 5,
				Position = Point1.X,
				Color3 = Colors.emphasis.Color3
			})
			ChildrenUnclipped.InspectionPoint = ReactModule.createElement(Point, {
				OutlineThickness = 2,
				Size = 7,
				ZIndex = 6,
				Position = Point1,
				Color3 = Colors.line.Color3,
				OutlineColor3 = Colors.surface.Color3,
				Tag = `data-testid={TestId}.InspectionPoint`
			})
			
			if p6.tooltip ~= nil then
				local XRatio = (Point1.X - p6.minX) / math.max(p6.maxX - p6.minX, 0.000001)
				local UseStateResultDelta = UseStateResult - 8
				Tooltip = renderTooltip(UseBindingResult:map(function(p7: number): UDim2
					-- upvalues: MeasureGutterResult (copy), XRatio (copy), UseStateResultDelta (copy), YOffset (upval)
					local NewMeasureGutterResult = MeasureGutterResult + XRatio * (UseStateResultDelta - MeasureGutterResult)
					local v2 = p7 / 2
					local NewMeasureGutterResult1 = MeasureGutterResult + v2
					local UseStateResultDeltaDelta = UseStateResultDelta - v2
					
					return UDim2.new(0, if NewMeasureGutterResult1 <= UseStateResultDeltaDelta then math.clamp(NewMeasureGutterResult, NewMeasureGutterResult1, UseStateResultDeltaDelta) else (MeasureGutterResult + UseStateResultDelta) / 2, 0, YOffset)
				end), p6.tooltip, Colors, TestId, p6.icon, function(Frame)
					-- upvalues: UseBindingResult2 (copy)
					UseBindingResult2(Frame.AbsoluteSize.X)
				end)
			end
		end
		RenderYAxisLabelsResult[`Canvas_{p6.plotKey}`] = ReactModule.createElement(Canvas, {
			CanvasBackgroundTransparency = 1,
			ViewportBackgroundTransparency = 1,
			GraphRect = Rect.new(p6.minX, p6.minY, p6.maxX, p6.maxY),
			ViewportPaddingLeft = UDim.new(0, MeasureGutterResult),
			ViewportPaddingRight = UDim.new(0, 8),
			ViewportPaddingTop = UDim.new(0, 12),
			ViewportPaddingBottom = UDim.new(0, 28),
			childrenUnclipped = ChildrenUnclipped
		}, config1)
		RenderYAxisLabelsResult.Tooltip = Tooltip
		config.Chart = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "clip",
			Size = UDim2.new(1, 0, 0, PLOTHEIGHT),
			testId = `{TestId}.Chart`,
			onAbsoluteSizeChanged = function(Frame)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(Frame.AbsoluteSize.X)
			end
		}, RenderYAxisLabelsResult)
	end
	return ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = p6.layoutOrder,
		testId = TestId
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-default",
				Text = p6.title,
				testId = `{TestId}.Title`
			}),
			Summary = if p6.summary == nil then nil else ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = p6.summary,
				testId = `{TestId}.Summary`
			})
		}),
		Slot = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-large size-full-0 auto-y"
		}, config)
	})
end