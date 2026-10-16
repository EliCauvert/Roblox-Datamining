local Graphing = script:FindFirstAncestor("Graphing")
local ReactModule = require(Graphing.Parent.React)
local CanvasContextModule = require(Graphing.CanvasContext)
local ScrollbarButtonModule = require(Graphing.Components.ScrollbarButton)
local StyleUtilModule = require(Graphing.Util.StyleUtil)
local TypesModule = require(Graphing.Types)
local UseViewportBindingFunction = require(Graphing.Util.useViewportBinding).useViewportBinding

local function _(Vector, AXISX) --[[ Line: 43 | Named "getDim" ]]
	-- upvalues: TypesModule (copy)
	return if AXISX == TypesModule.AXIS_X then Vector.X else Vector.Y
end

local _ = function(XScale, XOffset, AXISX): UDim2 --[[ Line: 47 | Named "makeUDim2" ]]
	-- upvalues: TypesModule (copy)
	return if AXISX == TypesModule.AXIS_X then UDim2.new(XScale, XOffset) else UDim2.new(XOffset, XScale)
end

function Scrollbar(p1) --[[ Line: 51 ]]
	-- upvalues: StyleUtilModule (copy), ReactModule (copy), CanvasContextModule (copy), UseViewportBindingFunction (copy), TypesModule (copy), ScrollbarButtonModule (copy)
	local Distance = p1.Distance or StyleUtilModule.SCROLLBAR_DISTANCE
	local Size = p1.Size or StyleUtilModule.SCROLLBAR_SIZE
	local ScrollButtonSize = p1.ScrollButtonSize or StyleUtilModule.SCROLLBAR_SCROLL_BUTTON_SIZE
	local ZoomButtonSize = p1.ZoomButtonSize or StyleUtilModule.SCROLLBAR_ZOOM_BUTTON_SIZE
	local UseContextResult = ReactModule.useContext(CanvasContextModule)
	local UseViewportBindingResult = UseViewportBindingFunction(function(p2) --[[ Line: 59 ]]
		-- upvalues: p1 (copy), TypesModule (upval)
		local PlotToGraphX = if p1.Axis == TypesModule.AXIS_X then p2.plotToGraphX else p2.plotToGraphY
		local ViewportRect = p2.getViewportRect()
		local Min = ViewportRect.Min
		local Scale = PlotToGraphX(if p1.Axis == TypesModule.AXIS_X then Min.X else Min.Y)
		local Max = ViewportRect.Max
		local PlotToGraphXResult = PlotToGraphX(if p1.Axis == TypesModule.AXIS_X then Max.X else Max.Y)
		local _UDim = UDim.new(Scale, 0)
		local _UDim1 = UDim.new(0, 0)
		local _UDim2: UDim2 = if p1.Axis == TypesModule.AXIS_X then UDim2.new(_UDim, _UDim1) else UDim2.new(_UDim1, _UDim)
		local _UDim3 = UDim.new(PlotToGraphXResult - Scale)
		local _UDim31 = UDim.new(1, 0)
		
		return {
			position = _UDim2,
			size = if p1.Axis == TypesModule.AXIS_X then UDim2.new(_UDim3, _UDim31) else UDim2.new(_UDim31, _UDim3)
		}
	end, { p1.Axis })
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 72 ]]
		-- upvalues: p1 (copy), TypesModule (upval), UseContextResult (copy)
		if p1.OnViewChanged then
			local PlotToGraphX = if p1.Axis == TypesModule.AXIS_X then UseContextResult.plotToGraphX else UseContextResult.plotToGraphY
			local GraphToPlotX = if p1.Axis == TypesModule.AXIS_X then UseContextResult.graphToPlotX else UseContextResult.graphToPlotY
			local ViewportRect = UseContextResult.getViewportRect()
			local Min = ViewportRect.Min
			local PlotToGraphXResult = PlotToGraphX(if p1.Axis == TypesModule.AXIS_X then Min.X else Min.Y)
			local Max = ViewportRect.Max
			local PlotToGraphXResult1 = PlotToGraphX(if p1.Axis == TypesModule.AXIS_X then Max.X else Max.Y)
			local PlotToGraphXResult2 = if p1.ExpandedBounds then PlotToGraphX(p1.ExpandedBounds.Min) else 0
			local PlotToGraphXResult3 = if p1.ExpandedBounds then PlotToGraphX(p1.ExpandedBounds.Max) else 1
			local NewPlotToGraphXResult = PlotToGraphXResult + p2
			local NewPlotToGraphXResult1 = PlotToGraphXResult1 + p2
			local v1 = 0
			local Smallest = math.min(NewPlotToGraphXResult, NewPlotToGraphXResult1)
			local Largest = math.max(NewPlotToGraphXResult, NewPlotToGraphXResult1)
			
			if Smallest < PlotToGraphXResult2 then
				v1 = PlotToGraphXResult2 - Smallest
			elseif PlotToGraphXResult3 < Largest then
				v1 = PlotToGraphXResult3 - Largest
			end
			p1.OnViewChanged(GraphToPlotX(NewPlotToGraphXResult + v1), (GraphToPlotX(NewPlotToGraphXResult1 + v1)))
		end
	end, { p1.OnViewChanged, p1.Axis, p1.ExpandedBounds })
	local _UDim = UDim.new(0, -ScrollButtonSize - ZoomButtonSize)
	local XOffset = UDim.new(1, 0) + Distance
	local _UDim2: UDim2 = if p1.Axis == TypesModule.AXIS_X then UDim2.new(_UDim, XOffset) else UDim2.new(XOffset, _UDim)
	local _UDim1 = UDim.new(1, 0)
	local _UDim2_1: UDim2 = if p1.Axis == TypesModule.AXIS_X then UDim2.new(_UDim1, Size) else UDim2.new(Size, _UDim1)
	local _UDim3 = UDim.new(0, (ScrollButtonSize + ZoomButtonSize) * 2)
	local _UDim11 = UDim.new(0, 0)
	local _UDim2_2: UDim2 = if p1.Axis == TypesModule.AXIS_X then UDim2.new(_UDim3, _UDim11) else UDim2.new(_UDim11, _UDim3)
	local _UDim4 = UDim.new(0, ScrollButtonSize)
	local _UDim31 = UDim.new(1, 0)
	local _UDim2_3: UDim2 = if p1.Axis == TypesModule.AXIS_X then UDim2.new(_UDim4, _UDim31) else UDim2.new(_UDim31, _UDim4)
	local _UDim5 = UDim.new(0, ZoomButtonSize)
	local _UDim41 = UDim.new(1, 0)
	local _UDim2_4: UDim2 = if p1.Axis == TypesModule.AXIS_X then UDim2.new(_UDim5, _UDim41) else UDim2.new(_UDim41, _UDim5)
	local Rotation: number = if p1.Axis == TypesModule.AXIS_X then 0 else 90
	local _UDim6 = UDim.new(1, 0)
	local _UDim51 = UDim.new(0, 0)
	
	return ReactModule.createElement("Frame", {
		Position = _UDim2,
		Size = _UDim2_1 + _UDim2_2,
		BorderSizePixel = p1.OutlineThickness or StyleUtilModule.SCROLLBAR_OUTLINE_THICKNESS,
		BorderColor3 = p1.OutlineColor3 or StyleUtilModule.SCROLLBAR_OUTLINE_COLOR3,
		BackgroundColor3 = p1.Color3 or StyleUtilModule.SCROLLBAR_COLOR3,
		ZIndex = p1.ZIndex,
		[ReactModule.Tag] = "ScrollbarFrame"
	}, {
		MinScrollButton = ReactModule.createElement(ScrollbarButtonModule, {
			Position = UDim2.fromScale(0, 0),
			Rotation = Rotation,
			Size = _UDim2_3,
			Image = StyleUtilModule.SCROLLBAR_LEFT_SCROLL_BUTTON_IMAGE,
			OnClick = ReactModule.useCallback(function() --[[ Line: 155 ]]
				-- upvalues: UseResult (copy)
				UseResult(-0.04)
			end, { UseResult })
		}),
		MaxScrollButton = ReactModule.createElement(ScrollbarButtonModule, {
			AnchorPoint = if p1.Axis == TypesModule.AXIS_X then Vector2.new(1, 0) else Vector2.new(0, 1),
			Position = if p1.Axis == TypesModule.AXIS_X then UDim2.new(_UDim6, _UDim51) else UDim2.new(_UDim51, _UDim6),
			Rotation = Rotation,
			Size = _UDim2_3,
			Image = StyleUtilModule.SCROLLBAR_RIGHT_SCROLL_BUTTON_IMAGE,
			OnClick = ReactModule.useCallback(function() --[[ Line: 159 ]]
				-- upvalues: UseResult (copy)
				UseResult(0.04)
			end, { UseResult })
		}),
		Inner = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(1, 1) - _UDim2_2
		}, {
			Body = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UseViewportBindingResult:map(function(p2) --[[ Line: 204 ]]
					return p2.position
				end),
				Size = UseViewportBindingResult:map(function(p2) --[[ Line: 207 ]]
					return p2.size
				end)
			}, {
				MainButton = ReactModule.createElement(ScrollbarButtonModule, {
					AnchorPoint = if p1.Axis == TypesModule.AXIS_X then Vector2.new(0, 0) else Vector2.new(0, 1),
					Position = if p1.Axis == TypesModule.AXIS_X then UDim2.fromScale(0, 0) else UDim2.fromScale(0, 1),
					Size = UDim2.fromScale(1, 1),
					OnMoved = ReactModule.useCallback(function(p2) --[[ Line: 109 ]]
						-- upvalues: p1 (copy), TypesModule (upval), UseContextResult (copy), UseResult (copy)
						local Min = UseContextResult.getViewportRect().Min
						local PlotToViewResult = UseContextResult.plotToView(p2)
						UseResult((if p1.Axis == TypesModule.AXIS_X then PlotToViewResult.X else PlotToViewResult.Y) - (if p1.Axis == TypesModule.AXIS_X then UseContextResult.plotToGraphX else UseContextResult.plotToGraphY)(if p1.Axis == TypesModule.AXIS_X then Min.X else Min.Y))
					end, { UseResult, p1.Axis })
				}),
				LeftButton = ReactModule.createElement(ScrollbarButtonModule, {
					AnchorPoint = if p1.Axis == TypesModule.AXIS_X then Vector2.new(1, 0) else Vector2.new(0, 0),
					Position = if p1.Axis == TypesModule.AXIS_X then UDim2.fromScale(0, 0) else UDim2.fromScale(0, 1),
					Rotation = Rotation,
					Size = _UDim2_4,
					Image = StyleUtilModule.SCROLLBAR_LEFT_ZOOM_BUTTON_IMAGE,
					OnMoved = ReactModule.useCallback(function(p2) --[[ Line: 119 ]]
						-- upvalues: p1 (copy), UseContextResult (copy), TypesModule (upval)
						if p1.OnViewChanged then
							local GraphToPlotResult = UseContextResult.graphToPlot((UseContextResult.plotToView(p2)))
							local Min = UseContextResult.getGraphRect().Min
							local Max = UseContextResult.getViewportRect().Max
							local X = if p1.Axis == TypesModule.AXIS_X then Max.X else Max.Y
							p1.OnViewChanged(math.max(math.min(if p1.Axis == TypesModule.AXIS_X then GraphToPlotResult.X else GraphToPlotResult.Y, X - p1.MinZoom), if p1.Axis == TypesModule.AXIS_X then Min.X else Min.Y), X)
						end
					end, { p1.OnViewChanged, p1.Axis, p1.MinZoom })
				}),
				RightButton = ReactModule.createElement(ScrollbarButtonModule, {
					AnchorPoint = if p1.Axis == TypesModule.AXIS_X then Vector2.new(0, 0) else Vector2.new(0, 1),
					Position = if p1.Axis == TypesModule.AXIS_X then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 0),
					Rotation = Rotation,
					Size = _UDim2_4,
					Image = StyleUtilModule.SCROLLBAR_RIGHT_ZOOM_BUTTON_IMAGE,
					OnMoved = ReactModule.useCallback(function(p2) --[[ Line: 137 ]]
						-- upvalues: p1 (copy), UseContextResult (copy), TypesModule (upval)
						if p1.OnViewChanged then
							local GraphToPlotResult = UseContextResult.graphToPlot((UseContextResult.plotToView(p2)))
							local Max = UseContextResult.getGraphRect().Max
							local Min = UseContextResult.getViewportRect().Min
							local X = if p1.Axis == TypesModule.AXIS_X then Min.X else Min.Y
							p1.OnViewChanged(X, (math.min(math.max(if p1.Axis == TypesModule.AXIS_X then GraphToPlotResult.X else GraphToPlotResult.Y, X + p1.MinZoom), if p1.Axis == TypesModule.AXIS_X then Max.X else Max.Y)))
						end
					end, { p1.OnViewChanged, p1.Axis, p1.MinZoom })
				})
			})
		})
	})
end

return Scrollbar