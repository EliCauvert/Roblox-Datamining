local textService = game:GetService("TextService")
local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local graphingModule = require(parent.Graphing)
local reactModule = require(parent.React)
local chartLayoutModule = require(script.Parent.chartLayout)
local canvas = graphingModule.Canvas
local curve = graphingModule.Curve
local gridLine = graphingModule.GridLine
local inputDetector = graphingModule.InputDetector
local point = graphingModule.Point
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local PLOT_HEIGHT = chartLayoutModule.PLOT_HEIGHT
local var1 = PLOT_HEIGHT - 28
local var2 = var1 + -1

local function renderTooltip(p1, p2, p3, p4, p5, p6)
	-- upvalues: reactModule (ref), view (ref), text (ref), icon (ref), iconSize (ref)
	return reactModule.createElement(view, {
		ZIndex = 30,
		tag = "row align-y-center gap-large anchor-top-center auto-x padding-x-xsmall radius-small",
		Size = UDim2.fromOffset(0, 30),
		Position = p1,
		backgroundStyle = p3.tooltipBackground,
		onAbsoluteSizeChanged = p6,
		testId = `{p4}.Tooltip`
	}, {
		Date = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "auto-xy text-caption-medium content-inverse-default",
			Text = p2.date,
			testId = `{p4}.TooltipDate`
		}),
		ValueGroup = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-xsmall auto-xy"
		}, {
			Icon = if p5 ~= nil then nil else reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = p5,
				size = iconSize.XSmall,
				style = p3.tooltipContent,
				testId = `{p4}.TooltipIcon`
			}),
			Value = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-caption-medium content-inverse-emphasis",
				Text = p2.valueText,
				testId = `{p4}.TooltipValue`
			})
		})
	})
end

local function _(p1, p2)
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		LayoutOrder = 1,
		tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-default",
		Text = p1.title,
		testId = `{p2}.Title`
	})
end

local _ = function(p1, p2)
	-- upvalues: reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		LayoutOrder = 2,
		tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
		Text = p1.summary,
		testId = `{p2}.Summary`
	})
end

local function renderValueRow(p1, p2)
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref), iconName (ref), iconVariant (ref)
	local colors = p1.colors
	
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-small size-full-0 auto-y"
	}, {
		Stat = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-xsmall auto-xy"
		}, {
			Icon = if p1.icon ~= nil then nil else reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = p1.icon,
				size = iconSize.Medium,
				style = colors.emphasis,
				testId = `{p2}.Icon`
			}),
			Value = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-heading-large content-emphasis",
				Text = p1.valueText,
				testId = `{p2}.Value`
			})
		}),
		Delta = if p1.deltaText ~= nil then nil else reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["row align-y-center gap-xxsmall auto-xy padding-y-xxsmall padding-left-xsmall padding-right-small radius-small"] = true,
				["bg-shift-200"] = not p1.isDeltaPositive
			},
			backgroundStyle = if p1.isDeltaPositive then colors.positiveBackground else nil,
			testId = `{p2}.Delta`
		}, {
			Arrow = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = if p1.isDeltaPositive then iconName.ArrowWideShortUp else iconName.ArrowWideShortDown,
				size = iconSize.XSmall,
				variant = iconVariant.Filled,
				style = if p1.isDeltaPositive then colors.positive else colors.muted
			}),
			Value = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-caption-medium content-default",
				Text = p1.deltaText
			})
		})
	})
end

local function measureGutter(p1, p2, p3)
	-- upvalues: textService (ref)
	local var3 = 0
	
	for i, v in p1 do
		var3 = math.max(var3, textService:GetTextSize(v.label, p2, p3, Vector2.new(1000, 100)).X)
	end
	return math.max(60, math.ceil(var3) + 2 + 12)
end

local function renderYAxisLabels(p4)
	-- upvalues: PLOT_HEIGHT (ref), reactModule (ref), text (ref)
	local axisLabel = p4.colors.axisLabel
	local var4 = PLOT_HEIGHT - 12 - 28
	local maxValue = math.max(p4.maxY - p4.minY, 0.000001)
	local t = {}
	
	for i, v in p4.yTicks do
		t[`YLabel_{v.position}`] = reactModule.createElement(text, {
			tag = "anchor-center-left auto-xy text-body-small",
			ZIndex = 4,
			Position = UDim2.new(0, 2, 0, 12 + (p4.maxY - v.position) / maxValue * var4),
			Text = v.label,
			textStyle = axisLabel,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	end
	return t
end

local function selectXAxisTicks(p5, p6, p7, p8)
	-- upvalues: textService (ref)
	local p16Count = #p5
	
	if p16Count <= 2 or p6 <= 0 then
		return {}
	end
	local var5 = 0
	
	for i, v in p5 do
		var5 = math.max(var5, textService:GetTextSize(v, p7, p8, Vector2.new(1000, 100)).X)
	end
	if p6 < var5 then
		return {}
	end
	local var6
	local var7 = var5 + 24
	local var8 = p6 / (p16Count - 1)
	
	for i_2 = math.min(3, p16Count - 2), 1, -1 do
		local clampedValue
		local t = {}
		local t_1 = {}
		
		for i_1 = 1, i_2 do
			clampedValue = math.clamp(math.round(p16Count * i_1 / (i_2 + 1)), 1, p16Count - 2)
			
			if not t_1[clampedValue] then
				t_1[clampedValue] = true
				table.insert(t, clampedValue)
			end
		end
		var6 = #t == i_2
		
		for clampedValue = 2, #t do
			if (t[clampedValue] - t[clampedValue - 1]) * var8 >= var7 then
				continue
			end
			var6 = false
			break
		end
		if not var6 then
			continue
		end
		local t_2 = {}
		
		for i_2, v_1 in t do
			table.insert(t_2, { position = v_1, label = p5[v_1 + 1] })
		end
		return t_2
	end
	return {}
end

local function renderXAxisLabels(p9, p10, p11, p12, p13)
	-- upvalues: selectXAxisTicks (ref), reactModule (ref), text (ref), var1 (ref)
	local axisLabel = p9.colors.axisLabel
	local maxValue = math.max(p9.maxX - p9.minX, 0.000001)
	local t = {}
	
	for i, v in selectXAxisTicks(p9.xAxisLabels, p11, p12, p13) do
		t[`XLabel_{v.position}`] = reactModule.createElement(text, {
			tag = "anchor-top-center auto-xy text-body-small",
			ZIndex = 4,
			Position = UDim2.new(0, p10 + (v.position - p9.minX) / maxValue * p11, 0, var1 + 4),
			Text = v.label,
			textStyle = axisLabel,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Top
		})
	end
	return t
end

return function(p14)
	-- upvalues: reactModule (ref), renderValueRow (ref), measureGutter (ref), curve (ref), inputDetector (ref), gridLine (ref), renderYAxisLabels (ref), renderXAxisLabels (ref), point (ref), var2 (ref), renderTooltip (ref), canvas (ref), view (ref), PLOT_HEIGHT (ref), text (ref)
	local testId = p14.testId or "MetricChartView"
	local colors = p14.colors
	local labelFont = p14.labelFont
	local labelFontSize = p14.labelFontSize
	local var9, var10 = reactModule.useState(0)
	local var11, var12 = reactModule.useBinding(0)
	local t = { ValueRow = renderValueRow(p14, testId) }
	
	if p14.hasData then
		local var13 = measureGutter(p14.yTicks, labelFontSize, labelFont)
		local t_1 = {}
		
		for i, v in p14.points do
			t_1[i] = { Position = v }
		end
		local t_2 = {
			Curve = reactModule.createElement(curve, {
				Thickness = 3,
				ZIndex = 3,
				Points = t_1,
				Color3 = colors.line.Color3,
				Tag = `data-testid={testId}.Curve`
			}),
			Input = reactModule.createElement(inputDetector, {
				TreatMouseAsAnchor = true,
				ZIndex = 20,
				OnHoverStart = p14.onHoverStart,
				OnHoverMoved = p14.onHoverMoved,
				OnHoverEnded = p14.onHoverEnded,
				OnPress = p14.onPress,
				OnDragStart = p14.onDragStart,
				OnDragMoved = p14.onDragMoved,
				OnDragEnded = p14.onDragEnded
			})
		}
		
		for i_1, v_1 in p14.yTicks do
			t_2[`Grid_{v_1.position}`] = reactModule.createElement(gridLine, {
				Orientation = "Horizontal",
				Thickness = 1,
				ZIndex = 1,
				Position = v_1.position,
				Color3 = colors.grid.Color3,
				Transparency = colors.grid.Transparency
			})
		end
		local var14 = renderYAxisLabels(p14)
		
		for i_2, v_2 in renderXAxisLabels(p14, var13, var9 - var13 - 8, labelFontSize, labelFont) do
			var14[i_2] = v_2
		end
		local t_3 = {}
		local var15 = nil
		local inspectedIndex = p14.inspectedIndex
		
		if inspectedIndex ~= nil and inspectedIndex >= 1 and inspectedIndex <= #p14.points then
			local var16 = p14.points[inspectedIndex]
			t_3.InspectionLine = reactModule.createElement(gridLine, {
				Orientation = "Vertical",
				Transparency = 0,
				Thickness = 2,
				ZIndex = 5,
				Position = var16.X,
				Color3 = colors.emphasis.Color3
			})
			t_3.InspectionPoint = reactModule.createElement(point, {
				OutlineThickness = 2,
				Size = 7,
				ZIndex = 6,
				Position = var16,
				Color3 = colors.line.Color3,
				OutlineColor3 = colors.surface.Color3,
				Tag = `data-testid={testId}.InspectionPoint`
			})
			
			if p14.tooltip ~= nil then
				local var17 = (var16.X - p14.minX) / math.max(p14.maxX - p14.minX, 0.000001)
				local var18 = var9 - 8
				var15 = renderTooltip(var11:map(function(p15)
					-- upvalues: var13 (ref), var17 (ref), var18 (ref), var2 (copy)
					local var19 = var13 + var17 * (var18 - var13)
					local var20 = p15 / 2
					local var21 = var13 + var20
					local var22 = var18 - var20
					
					return UDim2.new(0, if var21 <= var22 then math.clamp(var19, var21, var22) else (var13 + var18) / 2, 0, var2)
				end), p14.tooltip, colors, testId, p14.icon, function(p15)
					-- upvalues: var12 (ref)
					var12(p15.AbsoluteSize.X)
				end)
			end
		end
		var14[`Canvas_{p14.plotKey}`] = reactModule.createElement(canvas, {
			CanvasBackgroundTransparency = 1,
			ViewportBackgroundTransparency = 1,
			GraphRect = Rect.new(p14.minX, p14.minY, p14.maxX, p14.maxY),
			ViewportPaddingLeft = UDim.new(0, var13),
			ViewportPaddingRight = UDim.new(0, 8),
			ViewportPaddingTop = UDim.new(0, 12),
			ViewportPaddingBottom = UDim.new(0, 28),
			childrenUnclipped = t_3
		}, t_2)
		var14.Tooltip = var15
		t.Chart = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "clip",
			Size = UDim2.new(1, 0, 0, PLOT_HEIGHT),
			testId = `{testId}.Chart`,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var10 (ref)
				var10(value.AbsoluteSize.X)
			end
		}, var14)
	end
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = p14.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-default",
				Text = p14.title,
				testId = `{testId}.Title`
			}),
			Summary = if p14.summary ~= nil then nil else reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = p14.summary,
				testId = `{testId}.Summary`
			})
		}),
		Slot = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-large size-full-0 auto-y"
		}, t)
	})
end