local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local ReactModule = require(Parent1.Parent.React)
local IntroScrollModule = require(Parent.HorizontalNav.IntroScroll)
local GradientFrameModule = require(Parent.HorizontalNav.GradientFrame)
local ArrowFrameModule = require(Parent.HorizontalNav.ArrowFrame)
local UtilsModule = require(Parent.HorizontalNav.Utils)
local UseIsMouseAndKeyboardModule = require(Parent1.Utility.useIsMouseAndKeyboard)

return function(p1) --[[ Line: 56 | Named "ScrollingListWithArrowsAndGradient" ]]
	-- upvalues: UseIsMouseAndKeyboardModule (copy), ReactModule (copy), UtilsModule (copy), GradientFrameModule (copy), ArrowFrameModule (copy), IntroScrollModule (copy)
	local ListHeight = p1.listHeight
	local ChildWidgetIndex = p1.childWidgetIndex
	local UseIntroScroll = p1.useIntroScroll
	local CanvasWidth = p1.canvasWidth or 0
	local UseIsMouseAndKeyboardModuleResult = UseIsMouseAndKeyboardModule()
	local UseRefResult = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(false)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 70 ]]
		-- upvalues: UseRefResult (copy), UtilsModule (upval), p1 (copy), UseIsMouseAndKeyboardModuleResult (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		local Value = UseRefResult:getValue()
		
		if not Value then return end
		local ShouldShowGradientsForScrollingFrame, ShouldShowGradientsForScrollingFrame2, ShouldShowGradientsForScrollingFrame3 = UtilsModule.shouldShowGradientsForScrollingFrame(p2)
		
		if ShouldShowGradientsForScrollingFrame then
			ShouldShowGradientsForScrollingFrame = not p1.hideGradient or UseIsMouseAndKeyboardModuleResult
		end
		Value.Visible = ShouldShowGradientsForScrollingFrame
		local Left = Value:FindFirstChild("Left")
		local Right = Value:FindFirstChild("Right")
		
		if Left and Right then
			Left.Visible = ShouldShowGradientsForScrollingFrame2
			Right.Visible = ShouldShowGradientsForScrollingFrame3
		end
		UseBindingResult2(ShouldShowGradientsForScrollingFrame2)
		UseBindingResult2_1(ShouldShowGradientsForScrollingFrame3)
	end, { UseRefResult, UseBindingResult2, UseBindingResult2_1 })
	local UseResult1 = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 92 ]]
		-- upvalues: UseResult (copy), UseBindingResult2_2 (copy)
		UseResult(ScrollFrame)
		UseBindingResult2_2(ScrollFrame.CanvasPosition)
	end, { UseResult, UseBindingResult2_2 })
	ReactModule.useEffect(function() --[[ Line: 99 ]]
		-- upvalues: p1 (copy), UseResult (copy)
		local Value = p1.scrollingFrameRef:getValue()
		
		if Value then
			UseResult(Value)
		end
	end)
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		ScrollingList = ReactModule.createElement("ScrollingFrame", {
			ClipsDescendants = p1.clipsDescendants,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, CanvasWidth, 1, 0),
			CanvasPosition = UseBindingResult3,
			ScrollBarThickness = 0,
			BackgroundTransparency = 1,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.X,
			ZIndex = 2,
			[ReactModule.Change.AbsoluteSize] = UseResult,
			[ReactModule.Change.CanvasSize] = UseResult,
			[ReactModule.Change.CanvasPosition] = UseResult1,
			ref = p1.scrollingFrameRef
		}, p1.getScollingListContent()),
		GradientFrame = ReactModule.createElement(GradientFrameModule, { ZIndex = 3, height = ListHeight, frameRef = UseRefResult }),
		ArrowFrame = UseIsMouseAndKeyboardModuleResult and ReactModule.createElement(ArrowFrameModule, {
			ZIndex = 4,
			isVisibleLeft = UseBindingResult,
			isVisibleRight = UseBindingResult1,
			defaultUseProps = {
				scrollingFrameRef = p1.scrollingFrameRef,
				buttonRefs = p1.buttonRefs,
				buttonWidth = p1.buttonWidth,
				padOutsideEdges = p1.padOutsideEdges,
				numButtons = p1.numButtons,
				buttonPadding = p1.buttonPadding,
				updateCanvasPosition = UseBindingResult2_2
			}
		}),
		IntroScroll = UseIntroScroll and ReactModule.createElement(IntroScrollModule, {
			childWidgetIndex = ChildWidgetIndex,
			scrollingFrameRef = p1.scrollingFrameRef,
			updateCanvasPosition = UseBindingResult2_2
		}) or nil
	})
end