local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameHorizontal = RoactFitComponents.FitFrameHorizontal
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local UtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Utils)
local PillBar = RoactModule.PureComponent:extend("PillBar")
PillBar.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.number),
	[RoactModule.Children] = TModule.optional(TModule.table),
	height = TModule.optional(TModule.number),
	forwardRef = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table)
})

function PillBar.init(p1)
	-- upvalues: RoactModule (copy), UtilsModule (copy)
	p1.gradientFrameRef = RoactModule.createRef()
	p1.scrollingFrameRef = RoactModule.createRef()
	p1.categoryButtonRefs = {}
	p1.showLeftGradientBinding, p1.updateShowLeftGradient = RoactModule.createBinding(false)
	p1.showRightGradientBinding, p1.updateShowRightGradient = RoactModule.createBinding(false)
	
	function p1.checkShowGradient(p2)
		-- upvalues: UtilsModule (upval), p1 (copy)
		local ShouldShowGradientForScrollingFrame, ShouldShowGradientForScrollingFrame2, ShouldShowGradientForScrollingFrame3 = UtilsModule.shouldShowGradientForScrollingFrame(p2)
		local ShouldShowGradientForScrollingFrame3_1 = ShouldShowGradientForScrollingFrame and ShouldShowGradientForScrollingFrame3
		p1.updateShowLeftGradient(ShouldShowGradientForScrollingFrame and ShouldShowGradientForScrollingFrame2)
		p1.updateShowRightGradient(ShouldShowGradientForScrollingFrame3_1)
	end
	
	function p1.onNavFrameSizeChanged(Frame)
		-- upvalues: p1 (copy)
		if p1.scrollingFrameRef.current then
			p1.scrollingFrameRef.current.CanvasSize = UDim2.new(0, Frame.AbsoluteSize.X, 1, 0)
		end
	end
end

local function renderGradient(Theme, Rotation)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("UIGradient", {
		Rotation = Rotation,
		Color = ColorSequence.new(Theme.BackgroundDefault.Color),
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(0.666, 1),
			NumberSequenceKeypoint.new(1, 1)
		})
	})
end

function PillBar.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), Focusable (copy), renderGradient (copy), FitFrameHorizontal (copy), RoactFitComponents (copy)
	local LayoutOrder = p1.props.layoutOrder
	
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), Focusable (upval), LayoutOrder (copy), renderGradient (upval), FitFrameHorizontal (upval), RoactFitComponents (upval)
		local Theme = p2.Theme
		local Height = p1.props.height
		
		return RoactModule.createElement(Focusable.Frame, {
			Size = if Height then UDim2.new(1, 0, 0, Height) else UDim2.fromScale(1, 1),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			LayoutOrder = LayoutOrder,
			[RoactModule.Ref] = p1.props.forwardRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown
		}, {
			Left = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				AnchorPoint = Vector2.new(0, 0),
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(0, 50, 1, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Visible = p1.showLeftGradientBinding
			}, { Gradient = renderGradient(Theme, 0) }),
			Right = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(0, 50, 1, 0),
				BackgroundColor3 = Color3.new(1, 1, 1),
				Visible = p1.showRightGradientBinding
			}, { Gradient = renderGradient(Theme, 180) }),
			ScrollingList = RoactModule.createElement("ScrollingFrame", {
				Size = UDim2.new(1, 0, 1, 0),
				ScrollBarThickness = 0,
				BackgroundTransparency = 1,
				ZIndex = 1,
				ElasticBehavior = Enum.ElasticBehavior.Always,
				ScrollingDirection = Enum.ScrollingDirection.X,
				[RoactModule.Change.AbsoluteSize] = p1.checkShowGradient,
				[RoactModule.Change.CanvasSize] = p1.checkShowGradient,
				[RoactModule.Change.CanvasPosition] = p1.checkShowGradient,
				[RoactModule.Ref] = p1.scrollingFrameRef
			}, {
				SubNavFrame = RoactModule.createElement(FitFrameHorizontal, {
					height = UDim.new(1, 0),
					contentPadding = UDim.new(0, 15),
					margin = RoactFitComponents.Rect.rectangle(15, 0),
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Horizontal,
					BackgroundTransparency = 1,
					[RoactModule.Change.AbsoluteSize] = p1.onNavFrameSizeChanged
				}, p1.props[RoactModule.Children])
			})
		})
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), PillBar (copy), CryoModule (copy)
	return RoactModule.createElement(PillBar, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)