local Graphing = script:FindFirstAncestor("Graphing")
local Parent = Graphing.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local CanvasContextModule = require(Graphing.CanvasContext)
local InputDetectorModule = require(Graphing.Components.InputDetector)
local PanelModule = require(Graphing.Components.Panel)
local TypesModule = require(Graphing.Types)

local function onDrag(p1, Vector, Vector1)
	if not p1.SetRect then return end
	local MinSize = p1.MinSize or Vector2.zero
	local X = p1.Rect.Min.X
	local Y = p1.Rect.Min.Y
	local X1 = p1.Rect.Max.X
	local Y1 = p1.Rect.Max.Y
	
	if Vector1.X == 0 then
		X = math.min(Vector.X, X1 - MinSize.X)
	end
	if Vector1.X == 1 then
		X1 = math.max(Vector.X, X + MinSize.X)
	end
	if Vector1.Y == 0 then
		Y = math.min(Vector.Y, Y1 - MinSize.Y)
	end
	if Vector1.Y == 1 then
		Y1 = math.max(Vector.Y, Y + MinSize.Y)
	end
	assert(p1.SetRect ~= nil, "props.SetRect is nil")
	p1.SetRect(Rect.new(X, Y, X1, Y1))
end

function ResizablePanel(p1)
	-- upvalues: ReactModule (copy), CanvasContextModule (copy), TypesModule (copy), onDrag (copy), PanelModule (copy), DashModule (copy), InputDetectorModule (copy)
	local UseContextResult = ReactModule.useContext(CanvasContextModule)
	local IsDirectionMatch = UseContextResult.getXAxisScaling().Direction == TypesModule.DIRECTION_REVERSED
	local IsDirectionMatch1 = UseContextResult.getYAxisScaling().Direction == TypesModule.DIRECTION_REVERSED
	local UseResult = ReactModule.useCallback(function(Vector)
		-- upvalues: p1 (copy)
		if p1.SetRect then
			assert(p1.SetRect, "props.SetRect was nil")
			p1.SetRect(Rect.new(Vector.X, Vector.Y, Vector.X + p1.Rect.Width, Vector.Y + p1.Rect.Height))
			
			return
		end
	end, { p1.Rect, p1.SetRect })
	local UseResult1 = ReactModule.useCallback(function(Vector)
		-- upvalues: onDrag (upval), p1 (copy), IsDirectionMatch (copy)
		onDrag(p1, Vector, Vector2.new(if IsDirectionMatch then 1 else 0, 0.5))
	end, { p1.Rect, p1.SetRect, p1.MinSize, IsDirectionMatch })
	local UseResult2 = ReactModule.useCallback(function(Vector)
		-- upvalues: onDrag (upval), p1 (copy), IsDirectionMatch (copy)
		onDrag(p1, Vector, Vector2.new(if IsDirectionMatch then 0 else 1, 0.5))
	end, { p1.Rect, p1.SetRect, p1.MinSize, IsDirectionMatch })
	local UseResult3 = ReactModule.useCallback(function(Vector)
		-- upvalues: onDrag (upval), p1 (copy), IsDirectionMatch1 (copy)
		onDrag(p1, Vector, Vector2.new(0.5, if IsDirectionMatch1 then 0 else 1))
	end, { p1.Rect, p1.SetRect, p1.MinSize, IsDirectionMatch1 })
	local UseResult4 = ReactModule.useCallback(function(Vector)
		-- upvalues: onDrag (upval), p1 (copy), IsDirectionMatch1 (copy)
		onDrag(p1, Vector, Vector2.new(0.5, if IsDirectionMatch1 then 1 else 0))
	end, { p1.Rect, p1.SetRect, p1.MinSize, IsDirectionMatch1 })
	local UseResult5 = ReactModule.useCallback(function(Vector)
		-- upvalues: onDrag (upval), p1 (copy), IsDirectionMatch (copy), IsDirectionMatch1 (copy)
		onDrag(p1, Vector, Vector2.new(if IsDirectionMatch then 1 else 0, if IsDirectionMatch1 then 0 else 1))
	end, {
		p1.Rect,
		p1.SetRect,
		p1.MinSize,
		IsDirectionMatch,
		IsDirectionMatch1
	})
	local UseResult6 = ReactModule.useCallback(function(Vector)
		-- upvalues: onDrag (upval), p1 (copy), IsDirectionMatch (copy), IsDirectionMatch1 (copy)
		onDrag(p1, Vector, Vector2.new(if IsDirectionMatch then 0 else 1, if IsDirectionMatch1 then 0 else 1))
	end, {
		p1.Rect,
		p1.SetRect,
		p1.MinSize,
		IsDirectionMatch,
		IsDirectionMatch1
	})
	local UseResult7 = ReactModule.useCallback(function(Vector)
		-- upvalues: onDrag (upval), p1 (copy), IsDirectionMatch (copy), IsDirectionMatch1 (copy)
		onDrag(p1, Vector, Vector2.new(if IsDirectionMatch then 1 else 0, if IsDirectionMatch1 then 1 else 0))
	end, {
		p1.Rect,
		p1.SetRect,
		p1.MinSize,
		IsDirectionMatch,
		IsDirectionMatch1
	})
	local UseResult8 = ReactModule.useCallback(function(Vector)
		-- upvalues: onDrag (upval), p1 (copy), IsDirectionMatch (copy), IsDirectionMatch1 (copy)
		onDrag(p1, Vector, Vector2.new(if IsDirectionMatch then 0 else 1, if IsDirectionMatch1 then 1 else 0))
	end, {
		p1.Rect,
		p1.SetRect,
		p1.MinSize,
		IsDirectionMatch,
		IsDirectionMatch1
	})
	
	return ReactModule.createElement(PanelModule, DashModule.join(p1, {
		Rect = p1.Rect,
		children = DashModule.join(p1.children, {
			CenterInput = p1.DragEnabled and ReactModule.createElement(InputDetectorModule, {
				ZIndex = 0,
				AnchorPoint = Vector2.new(0, 0),
				XSnap = p1.XSnap,
				YSnap = p1.YSnap,
				OnDragMoved = UseResult
			}),
			Left = p1.EdgeLeftEnabled and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 1,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(0, 1)
			}, {
				Input = ReactModule.createElement(InputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = UseResult1
				})
			}),
			Right = p1.EdgeRightEnabled and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 1,
				Position = UDim2.fromScale(1, 0),
				Size = UDim2.fromScale(0, 1)
			}, {
				Input = ReactModule.createElement(InputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = UseResult2
				})
			}),
			Top = p1.EdgeTopEnabled and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 1,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 0)
			}, {
				Input = ReactModule.createElement(InputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = UseResult3
				})
			}),
			Bottom = p1.EdgeBottomEnabled and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 1,
				Position = UDim2.fromScale(0, 1),
				Size = UDim2.fromScale(1, 0)
			}, {
				Input = ReactModule.createElement(InputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = UseResult4
				})
			}),
			TopLeft = p1.CornerTopLeftEnabled and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(0, 0)
			}, {
				Input = ReactModule.createElement(InputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = UseResult5
				})
			}),
			TopRight = p1.CornerTopRightEnabled and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = UDim2.fromScale(1, 0),
				Size = UDim2.fromScale(0, 0)
			}, {
				Input = ReactModule.createElement(InputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = UseResult6
				})
			}),
			BottomLeft = p1.CornerBottomLeftEnabled and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = UDim2.fromScale(0, 1),
				Size = UDim2.fromScale(0, 0)
			}, {
				Input = ReactModule.createElement(InputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = UseResult7
				})
			}),
			BottomRight = p1.CornerBottomRightEnabled and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Position = UDim2.fromScale(1, 1),
				Size = UDim2.fromScale(0, 0)
			}, {
				Input = ReactModule.createElement(InputDetectorModule, {
					Inflate = 5,
					XSnap = p1.XSnap,
					YSnap = p1.YSnap,
					OnDragMoved = UseResult8
				})
			})
		})
	}))
end

return ResizablePanel