local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local ControlStateModule = require(Foundation.Enums.ControlState)
local FlagsModule = require(Foundation.Utility.Flags)
local IconButtonModule = require(Foundation.Components.IconButton)
local InputSizeModule = require(Foundation.Enums.InputSize)
local ScrollViewModule = require(Foundation.Components.ScrollView)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
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
	-- upvalues: ReactModule (copy), FlagsModule (copy), ReactOtterModule (copy), DashModule (copy), OtterModule (copy), ControlStateModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ScrollViewModule (copy), StateLayerAffordanceModule (copy), VisibilityModule (copy), OverflowButton (copy), NumberSequence1 (copy), NumberSequence2 (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(false)
	local v1 = nil
	local Callback = nil
	
	if FlagsModule.FoundationTabsNavArrowsOnlyOnHover then
		v1, Callback = ReactModule.useState(false)
	end
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
	local UseResult2 = if FlagsModule.FoundationTabsNavArrowsOnlyOnHover then ReactModule.useCallback(function(Hover)
		-- upvalues: Callback (ref), ControlStateModule (upval)
		Callback(Hover == ControlStateModule.Hover)
	end, {}) else nil
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(p1, if FlagsModule.FoundationTabsInlineSizeFull then { tag = "auto-y", Size = UDim2.fromScale(1, 0) } else { tag = "size-full-0 auto-y" }), {
		Scroll = ReactModule.createElement(ScrollViewModule, {
			LayoutOrder = 1,
			tag = if FlagsModule.FoundationTabsInlineSizeFull then if FlagsModule.FoundationTabsNavArrowsOnlyOnHover then "auto-y" else nil else {
				["size-full-0 auto-y"] = FlagsModule.FoundationTabsNavArrowsOnlyOnHover,
				["size-full"] = not FlagsModule.FoundationTabsNavArrowsOnlyOnHover
			},
			Size = if FlagsModule.FoundationTabsInlineSizeFull then if FlagsModule.FoundationTabsNavArrowsOnlyOnHover then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 1) else nil,
			onStateChanged = if FlagsModule.FoundationTabsNavArrowsOnlyOnHover then UseResult2 else nil,
			stateLayer = if FlagsModule.FoundationTabsNavArrowsOnlyOnHover then { affordance = StateLayerAffordanceModule.None } else nil,
			onCanvasPositionChanged = UseResult,
			onAbsoluteWindowSizeChanged = UseResult,
			scrollingFrameRef = UseRefResult,
			selection = { Selectable = false },
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = VisibilityModule.None
			},
			testId = if FlagsModule.FoundationTabsNavArrowsOnlyOnHover then `{p1.testId}--scroll` else nil
		}, p1.children),
		OverflowStart = ReactModule.createElement(OverflowButton, {
			LayoutOrder = 3,
			isStart = true,
			ZIndex = 2,
			tag = "padding-right-small",
			icon = "chevron-large-left",
			Position = UDim2.fromScale(0, 0),
			size = p1.size,
			Visible = if FlagsModule.FoundationTabsNavArrowsOnlyOnHover then UseBindingResult1:map(function(p2)
				-- upvalues: v1 (ref)
				return v1 and p2
			end) else UseBindingResult1,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseResult1 (copy)
				UseResult1(-90)
			end, { UseResult1 }),
			gradient = NumberSequence1,
			testId = `{p1.testId}--overflow-start`
		}),
		OverflowEnd = ReactModule.createElement(OverflowButton, {
			LayoutOrder = 4,
			ZIndex = 2,
			tag = "anchor-top-right padding-left-small",
			icon = "chevron-large-right",
			Position = UDim2.fromScale(1, 0),
			size = p1.size,
			Visible = if FlagsModule.FoundationTabsNavArrowsOnlyOnHover then UseBindingResult:map(function(p2)
				-- upvalues: v1 (ref)
				return v1 and p2
			end) else UseBindingResult,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseResult1 (copy)
				UseResult1(90)
			end, { UseResult1 }),
			gradient = NumberSequence2,
			testId = `{p1.testId}--overflow-end`
		})
	})
end