local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local reactModule = require(parent_1.Parent.React)
local introScrollModule = require(parent.HorizontalNav.IntroScroll)
local gradientFrameModule = require(parent.HorizontalNav.GradientFrame)
local arrowFrameModule = require(parent.HorizontalNav.ArrowFrame)
local utilsModule = require(parent.HorizontalNav.Utils)
local useIsMouseAndKeyboardModule = require(parent_1.Utility.useIsMouseAndKeyboard)

return function(p1)
	-- upvalues: useIsMouseAndKeyboardModule (ref), reactModule (ref), utilsModule (ref), gradientFrameModule (ref), arrowFrameModule (ref), introScrollModule (ref)
	local listHeight = p1.listHeight
	local childWidgetIndex = p1.childWidgetIndex
	local useIntroScroll = p1.useIntroScroll
	local canvasWidth = p1.canvasWidth or 0
	local var1 = useIsMouseAndKeyboardModule()
	local var2 = reactModule.useRef(nil)
	local var3, var4 = reactModule.useBinding(false)
	local var5, var6 = reactModule.useBinding(false)
	local var7, var8 = reactModule.useBinding(Vector2.new(0, 0))
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), utilsModule (copy), p1 (ref), var1 (ref), var4 (ref), var6 (ref)
		local value = var2:getValue()
		
		if not value then return end
		local var10, var11, var12 = utilsModule.shouldShowGradientsForScrollingFrame(p2)
		value.Visible = var10 and (not p1.hideGradient or var1)
		local left = value:FindFirstChild("Left")
		local right = value:FindFirstChild("Right")
		
		if left and right then
			left.Visible = var11
			right.Visible = var12
		end
		var4(var11)
		var6(var12)
	end, { var2, var4, var6 })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), var8 (ref)
		var9(p2)
		var8(p2.CanvasPosition)
	end, { var9, var8 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var9 (ref)
		local value = p1.scrollingFrameRef:getValue()
		
		if value then
			var9(value)
		end
	end)
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		ScrollingList = reactModule.createElement("ScrollingFrame", {
			ClipsDescendants = p1.clipsDescendants,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, canvasWidth, 1, 0),
			CanvasPosition = var7,
			ScrollBarThickness = 0,
			BackgroundTransparency = 1,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ZIndex = 2,
			[reactModule.Change.AbsoluteSize] = var9,
			[reactModule.Change.CanvasSize] = var9,
			[reactModule.Change.CanvasPosition] = var10,
			ref = p1.scrollingFrameRef
		}, p1.getScollingListContent()),
		GradientFrame = reactModule.createElement(gradientFrameModule, { ZIndex = 3, height = listHeight, frameRef = var2 }),
		ArrowFrame = var1 and reactModule.createElement(arrowFrameModule, {
			ZIndex = 4,
			isVisibleLeft = var3,
			isVisibleRight = var5,
			defaultUseProps = {
				scrollingFrameRef = p1.scrollingFrameRef,
				buttonRefs = p1.buttonRefs,
				buttonWidth = p1.buttonWidth,
				padOutsideEdges = p1.padOutsideEdges,
				numButtons = p1.numButtons,
				buttonPadding = p1.buttonPadding,
				updateCanvasPosition = var8
			}
		}),
		IntroScroll = useIntroScroll and reactModule.createElement(introScrollModule, {
			childWidgetIndex = childWidgetIndex,
			scrollingFrameRef = p1.scrollingFrameRef,
			updateCanvasPosition = var8
		}) or nil
	})
end