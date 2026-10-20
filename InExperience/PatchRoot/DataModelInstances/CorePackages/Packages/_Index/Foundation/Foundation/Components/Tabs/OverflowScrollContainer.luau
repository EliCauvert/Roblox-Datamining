local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local Icon = require(Parent.BuilderIcons).Icon
local IconButtonModule = require(Foundation.Components.IconButton)
local InputSizeModule = require(Foundation.Enums.InputSize)
local ScrollViewModule = require(Foundation.Components.ScrollView)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local VisibilityModule = require(Foundation.Enums.Visibility)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local NumberSequence1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.8, 0),
	NumberSequenceKeypoint.new(1, 1)
})
local NumberSequence2 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.2, 0),
	NumberSequenceKeypoint.new(1, 0)
})

local function OverflowButton(p1)
	-- upvalues: ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), IconButtonModule (copy), InputSizeModule (copy)
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(p1, {
		tag = `col align-y-center size-0-full auto-x bg-surface-0 {p1.tag}`
	}), {
		UIGradient = ReactModule.createElement("UIGradient", { Transparency = p1.gradient }),
		Button = ReactModule.createElement(IconButtonModule, {
			onActivated = p1.onActivated,
			size = if p1.size == InputSizeModule.Large or p1.size == InputSizeModule.Medium then InputSizeModule.Small else InputSizeModule.XSmall,
			icon = { name = p1.icon }
		})
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), DashModule (copy), OtterModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ScrollViewModule (copy), VisibilityModule (copy), OverflowButton (copy), NumberSequence1 (copy), Icon (copy), NumberSequence2 (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMotorResult = ReactOtterModule.useMotor(0, function(X)
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.CanvasPosition = Vector2.new(X, 0)
			
			return
		end
	end)
	local UseResult = ReactModule.useCallback(DashModule.throttle(function(ScrollFrame)
		-- upvalues: UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		if ScrollFrame.AbsoluteWindowSize.X ~= 0 then
			UseBindingResult2(ScrollFrame.AbsoluteWindowSize.X + ScrollFrame.CanvasPosition.X < ScrollFrame.AbsoluteCanvasSize.X - 1)
			UseBindingResult2_1(ScrollFrame.CanvasPosition.X ~= 0)
			
			return
		end
	end, 0.2), {})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), UseMotorResult (copy), OtterModule (upval)
		local Current = UseRefResult.current
		
		if Current then
			UseMotorResult(OtterModule.ease(Current.CanvasPosition.X + p2, { duration = 0.2, easingStyle = Enum.EasingStyle.Quad }))
			
			return
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseResult (copy)
		if UseRefResult.current then
			UseResult(UseRefResult.current)
		end
	end, {})
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(p1, { tag = "auto-y", Size = UDim2.fromScale(1, 0) }), {
		Scroll = ReactModule.createElement(ScrollViewModule, {
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1),
			onCanvasPositionChanged = UseResult,
			onAbsoluteWindowSizeChanged = UseResult,
			scrollingFrameRef = UseRefResult,
			selection = { Selectable = false },
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = VisibilityModule.None
			}
		}, p1.children),
		OverflowStart = ReactModule.createElement(OverflowButton, {
			LayoutOrder = 3,
			isStart = true,
			ZIndex = 2,
			tag = "padding-right-small",
			Position = UDim2.fromScale(0, 0),
			size = p1.size,
			Visible = UseBindingResult1,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseResult1 (copy)
				UseResult1(-90)
			end, { UseResult1 }),
			gradient = NumberSequence1,
			icon = Icon.ChevronLargeLeft,
			testId = `{p1.testId}--overflow-start`
		}),
		OverflowEnd = ReactModule.createElement(OverflowButton, {
			LayoutOrder = 4,
			ZIndex = 2,
			tag = "anchor-top-right padding-left-small",
			Position = UDim2.fromScale(1, 0),
			size = p1.size,
			Visible = UseBindingResult,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseResult1 (copy)
				UseResult1(90)
			end, { UseResult1 }),
			gradient = NumberSequence2,
			icon = Icon.ChevronLargeRight,
			testId = `{p1.testId}--overflow-end`
		})
	})
end