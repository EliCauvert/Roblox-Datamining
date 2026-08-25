local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local reactModule = require(parent_1.Parent.React)
local introScrollModule = require(parent.HorizontalNav.IntroScroll)
local gradientFrameModule = require(parent.HorizontalNav.GradientFrame)
local arrowFrameModule = require(parent.HorizontalNav.ArrowFrame)
local utilsModule = require(parent.HorizontalNav.Utils)
local useIsMouseAndKeyboardModule = require(parent_1.Utility.useIsMouseAndKeyboard)

return function(p0)
	-- upvalues: useIsMouseAndKeyboardModule (ref), reactModule (ref), utilsModule (ref), gradientFrameModule (ref), arrowFrameModule (ref), introScrollModule (ref)
	local listHeight = p0.listHeight
	local childWidgetIndex = p0.childWidgetIndex
	local useIntroScroll = p0.useIntroScroll
	local canvasWidth = p0.canvasWidth or 0
	local var7 = useIsMouseAndKeyboardModule()
	local var8 = reactModule.useRef(nil)
	local var9, var10 = reactModule.useBinding(false)
	local var11, var12 = reactModule.useBinding(false)
	local var13, var14 = reactModule.useBinding(Vector2.new(0, 0))
	local var15 = reactModule.useCallback(function(p1)
		-- upvalues: var8 (ref), utilsModule (copy), p0 (ref), var7 (ref), var10 (ref), var12 (ref)
		local value = var8:getValue()
		
		if not value then return end
		local var18, var19, var20 = utilsModule.shouldShowGradientsForScrollingFrame(p1)
		value.Visible = var18 and (not p0.hideGradient or var7)
		local left = value:FindFirstChild("Left")
		local right = value:FindFirstChild("Right")
		
		if left and right then
			left.Visible = var19
			right.Visible = var20
		end
		var10(var19)
		var12(var20)
	end, { var8, var10, var12 })
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), var14 (ref)
		var15(p2)
		var14(p2.CanvasPosition)
	end, { var15, var14 })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var15 (ref)
		local value = p0.scrollingFrameRef:getValue()
		
		if value then
			var15(value)
		end
	end)
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		ScrollingList = reactModule.createElement("ScrollingFrame", {
			ClipsDescendants = p0.clipsDescendants,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, canvasWidth, 1, 0),
			CanvasPosition = var13,
			ScrollBarThickness = 0,
			BackgroundTransparency = 1,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ZIndex = 2,
			[reactModule.Change.AbsoluteSize] = var15,
			[reactModule.Change.CanvasSize] = var15,
			[reactModule.Change.CanvasPosition] = var16,
			ref = p0.scrollingFrameRef
		}, p0.getScollingListContent()),
		GradientFrame = reactModule.createElement(gradientFrameModule, { ZIndex = 3, height = listHeight, frameRef = var8 }),
		ArrowFrame = var7 and reactModule.createElement(arrowFrameModule, {
			ZIndex = 4,
			isVisibleLeft = var9,
			isVisibleRight = var11,
			defaultUseProps = {
				scrollingFrameRef = p0.scrollingFrameRef,
				buttonRefs = p0.buttonRefs,
				buttonWidth = p0.buttonWidth,
				padOutsideEdges = p0.padOutsideEdges,
				numButtons = p0.numButtons,
				buttonPadding = p0.buttonPadding,
				updateCanvasPosition = var14
			}
		}),
		IntroScroll = useIntroScroll and reactModule.createElement(introScrollModule, {
			childWidgetIndex = childWidgetIndex,
			scrollingFrameRef = p0.scrollingFrameRef,
			updateCanvasPosition = var14
		}) or nil
	})
end