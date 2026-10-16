local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local BarOnTopScrollingFrame = Roact.PureComponent:extend("BarOnTopScrollingFrame")
BarOnTopScrollingFrame.validateProps = T.strictInterface({
	Size = T.UDim2,
	Position = T.optional(T.UDim2),
	CanvasSize = T.UDim2,
	ScrollingEnabled = T.optional(T.boolean),
	[Roact.Children] = T.table,
	onCanvasPositionChanged = T.optional(T.callback),
	scrollingFrameRef = T.optional(T.table)
})
BarOnTopScrollingFrame.defaultProps = { ScrollingEnabled = true }

function BarOnTopScrollingFrame.init(p1) --[[ Line: 26 ]]
	p1.state = { CanvasPosition = Vector2.new(0, 0) }
end

function BarOnTopScrollingFrame.render(p1) --[[ Line: 32 ]]
	-- upvalues: Roact (copy)
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = p1.props.Size,
		Position = p1.props.Position
	}, {
		DisplayScrollingFrame = Roact.createElement("ScrollingFrame", {
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
			[Roact.Ref] = p1.props.scrollingFrameRef,
			[Roact.Change.CanvasPosition] = function(ScrollFrame) --[[ Line: 52 ]]
				-- upvalues: p1 (copy)
				p1:setState({ CanvasPosition = ScrollFrame.CanvasPosition })
				
				if p1.props.onCanvasPositionChanged then
					p1.props.onCanvasPositionChanged(ScrollFrame)
				end
			end
		}),
		ContentsScrollingFrame = Roact.createElement("ScrollingFrame", {
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
			[Roact.Change.CanvasPosition] = function(ScrollFrame) --[[ Line: 73 ]]
				-- upvalues: p1 (copy)
				p1:setState({ CanvasPosition = ScrollFrame.CanvasPosition })
			end
		}, {
			Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 8, 1, 0) }, p1.props[Roact.Children])
		})
	})
end

return BarOnTopScrollingFrame