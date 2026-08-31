local graphing = script:FindFirstAncestor("Graphing")
local parent = graphing.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local canvasContextModule = require(graphing.CanvasContext)
local inputDetectorModule = require(graphing.Components.InputDetector)
local panelModule = require(graphing.Components.Panel)
local typesModule = require(graphing.Types)

local function onDrag(p1, p2, p3)
	if not p1.SetRect then return end
	local minSize = p1.MinSize or Vector2.zero
	local x = p1.Rect.Min.X
	local y = p1.Rect.Min.Y
	local x_1 = p1.Rect.Max.X
	local y_1 = p1.Rect.Max.Y
	
	if p3.X == 0 then
		x = math.min(p2.X, x_1 - minSize.X)
	end
	if p3.X == 1 then
		x_1 = math.max(p2.X, x + minSize.X)
	end
	if p3.Y == 0 then
		y = math.min(p2.Y, y_1 - minSize.Y)
	end
	if p3.Y == 1 then
		y_1 = math.max(p2.Y, y + minSize.Y)
	end
	assert(p1.SetRect ~= nil, "props.SetRect is nil")
	p1.SetRect(Rect.new(x, y, x_1, y_1))
end

function ResizablePanel(p1)
	-- upvalues: reactModule (ref), canvasContextModule (ref), typesModule (ref), onDrag (ref), panelModule (ref), dashModule (ref), inputDetectorModule (ref)
	local var1 = reactModule.useContext(canvasContextModule)
	local var2 = var1.getXAxisScaling().Direction == typesModule.DIRECTION_REVERSED
	local var3 = var1.getYAxisScaling().Direction == typesModule.DIRECTION_REVERSED
	
	return reactModule.createElement(panelModule, dashModule.join(p1, {
		Rect = p1.Rect,
		children = dashModule.join(p1.children, {
			CenterInput = p1.DragEnabled and reactModule.createElement(inputDetectorModule, {
				ZIndex = 0,
				AnchorPoint = Vector2.new(0, 0),
				XSnap = p1.XSnap,
				YSnap = p1.YSnap,
				OnDragMoved = reactModule.useCallback(function(p2)
					-- upvalues: p1 (ref)
					if p1.SetRect then
						assert(p1.SetRect, "props.SetRect was nil")
						p1.SetRect(Rect.new(p2.X, p2.Y, p2.X + p1.Rect.Width, p2.Y + p1.Rect.Height))
						
						return
					end
				end, { p1.Rect, p1.SetRect })
			}),
			Left = p1.EdgeLeftEnabled and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 1,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(0, 1)
			}, {
				Input = reactModule.createElement(inputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = reactModule.useCallback(function(p2)
						-- upvalues: onDrag (copy), p1 (ref), var2 (ref)
						onDrag(p1, p2, Vector2.new(if var2 then 1 else 0, 0.5))
					end, { p1.Rect, p1.SetRect, p1.MinSize, var2 })
				})
			}),
			Right = p1.EdgeRightEnabled and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 1,
				Position = UDim2.fromScale(1, 0),
				Size = UDim2.fromScale(0, 1)
			}, {
				Input = reactModule.createElement(inputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = reactModule.useCallback(function(p2)
						-- upvalues: onDrag (copy), p1 (ref), var2 (ref)
						onDrag(p1, p2, Vector2.new(if var2 then 0 else 1, 0.5))
					end, { p1.Rect, p1.SetRect, p1.MinSize, var2 })
				})
			}),
			Top = p1.EdgeTopEnabled and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 1,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 0)
			}, {
				Input = reactModule.createElement(inputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = reactModule.useCallback(function(p2)
						-- upvalues: onDrag (copy), p1 (ref), var3 (ref)
						onDrag(p1, p2, Vector2.new(0.5, if var3 then 0 else 1))
					end, { p1.Rect, p1.SetRect, p1.MinSize, var3 })
				})
			}),
			Bottom = p1.EdgeBottomEnabled and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 1,
				Position = UDim2.fromScale(0, 1),
				Size = UDim2.fromScale(1, 0)
			}, {
				Input = reactModule.createElement(inputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = reactModule.useCallback(function(p2)
						-- upvalues: onDrag (copy), p1 (ref), var3 (ref)
						onDrag(p1, p2, Vector2.new(0.5, if var3 then 1 else 0))
					end, { p1.Rect, p1.SetRect, p1.MinSize, var3 })
				})
			}),
			TopLeft = p1.CornerTopLeftEnabled and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(0, 0)
			}, {
				Input = reactModule.createElement(inputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = reactModule.useCallback(function(p2)
						-- upvalues: onDrag (copy), p1 (ref), var2 (ref), var3 (ref)
						onDrag(p1, p2, Vector2.new(if var2 then 1 else 0, if var3 then 0 else 1))
					end, {
						p1.Rect,
						p1.SetRect,
						p1.MinSize,
						var2,
						var3
					})
				})
			}),
			TopRight = p1.CornerTopRightEnabled and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = UDim2.fromScale(1, 0),
				Size = UDim2.fromScale(0, 0)
			}, {
				Input = reactModule.createElement(inputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = reactModule.useCallback(function(p2)
						-- upvalues: onDrag (copy), p1 (ref), var2 (ref), var3 (ref)
						onDrag(p1, p2, Vector2.new(if var2 then 0 else 1, if var3 then 0 else 1))
					end, {
						p1.Rect,
						p1.SetRect,
						p1.MinSize,
						var2,
						var3
					})
				})
			}),
			BottomLeft = p1.CornerBottomLeftEnabled and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = UDim2.fromScale(0, 1),
				Size = UDim2.fromScale(0, 0)
			}, {
				Input = reactModule.createElement(inputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = reactModule.useCallback(function(p2)
						-- upvalues: onDrag (copy), p1 (ref), var2 (ref), var3 (ref)
						onDrag(p1, p2, Vector2.new(if var2 then 1 else 0, if var3 then 1 else 0))
					end, {
						p1.Rect,
						p1.SetRect,
						p1.MinSize,
						var2,
						var3
					})
				})
			}),
			BottomRight = p1.CornerBottomRightEnabled and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = UDim2.fromScale(1, 1),
				Size = UDim2.fromScale(0, 0)
			}, {
				Input = reactModule.createElement(inputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = reactModule.useCallback(function(p2)
						-- upvalues: onDrag (copy), p1 (ref), var2 (ref), var3 (ref)
						onDrag(p1, p2, Vector2.new(if var2 then 0 else 1, if var3 then 1 else 0))
					end, {
						p1.Rect,
						p1.SetRect,
						p1.MinSize,
						var2,
						var3
					})
				})
			})
		})
	}))
end

return ResizablePanel