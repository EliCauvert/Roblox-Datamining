local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local barOnTopScrollingFrame = roact.PureComponent:extend("BarOnTopScrollingFrame")
barOnTopScrollingFrame.validateProps = t.strictInterface({
	Size = t.UDim2,
	Position = t.optional(t.UDim2),
	CanvasSize = t.UDim2,
	ScrollingEnabled = t.optional(t.boolean),
	[roact.Children] = t.table,
	onCanvasPositionChanged = t.optional(t.callback),
	scrollingFrameRef = t.optional(t.table)
})
barOnTopScrollingFrame.defaultProps = { ScrollingEnabled = true }

function barOnTopScrollingFrame.init(p0) --[[ line: 26 ]]
	p0.state = { CanvasPosition = Vector2.new(0, 0) }
end

function barOnTopScrollingFrame.render(p1) --[[ line: 32 ]]
	-- upvalues: roact (ref)
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = p1.props.Size,
		Position = p1.props.Position
	}, {
		DisplayScrollingFrame = roact.createElement("ScrollingFrame", {
			CanvasPosition = p1.state.CanvasPosition,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 8, 1, 0),
			CanvasSize = p1.props.CanvasSize - UDim2.new(0, 8, 0, 0),
			ScrollBarThickness = 8,
			BorderSizePixel = 0,
			ZIndex = 2,
			Position = UDim2.new(1, -8, 0, 0),
			ScrollingEnabled = p1.props.ScrollingEnabled,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Selectable = false,
			[roact.Ref] = p1.props.scrollingFrameRef,
			[roact.Change.CanvasPosition] = function(p2) --[[ line: 52 ]]
				-- upvalues: p1 (ref)
				p1:setState({ CanvasPosition = p2.CanvasPosition })
				
				if p1.props.onCanvasPositionChanged then
					p1.props.onCanvasPositionChanged(p2)
				end
			end
		}),
		ContentsScrollingFrame = roact.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -8, 1, 0),
			CanvasSize = p1.props.CanvasSize - UDim2.new(0, 8, 0, 0),
			CanvasPosition = p1.state.CanvasPosition,
			ScrollBarThickness = 0,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			ScrollingEnabled = p1.props.ScrollingEnabled,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Selectable = false,
			[roact.Change.CanvasPosition] = function(p3) --[[ line: 73 ]]
				-- upvalues: p1 (ref)
				p1:setState({ CanvasPosition = p3.CanvasPosition })
			end
		}, {
			roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 8, 1, 0) }, p1.props[roact.Children])
		})
	})
end

return barOnTopScrollingFrame