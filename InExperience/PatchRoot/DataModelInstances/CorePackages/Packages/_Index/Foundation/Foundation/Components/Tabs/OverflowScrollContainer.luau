local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local controlStateModule = require(foundation.Enums.ControlState)
local flagsModule = require(foundation.Utility.Flags)
local iconButtonModule = require(foundation.Components.IconButton)
local inputSizeModule = require(foundation.Enums.InputSize)
local scrollViewModule = require(foundation.Components.ScrollView)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local visibilityModule = require(foundation.Enums.Visibility)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local numberSequence = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0),
	NumberSequenceKeypoint.new(0.8, 0),
	NumberSequenceKeypoint.new(1, 1)
})
local numberSequence_1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.2, 0),
	NumberSequenceKeypoint.new(1, 0)
})

local function OverflowButton(p0) --[[ line: 35 ]]
	-- upvalues: reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconButtonModule (ref), inputSizeModule (ref)
	return reactModule.createElement(viewModule, withCommonPropsModule(p0, {
		tag = `col align-y-center size-0-full auto-x bg-surface-0 {p0.tag}`
	}), {
		UIGradient = reactModule.createElement("UIGradient", { Transparency = p0.gradient }),
		Button = reactModule.createElement(iconButtonModule, {
			onActivated = p0.onActivated,
			size = if p0.size == inputSizeModule.Large or p0.size == inputSizeModule.Medium then inputSizeModule.Small else inputSizeModule.XSmall,
			icon = { name = p0.icon }
		})
	})
end

return function(p1) --[[ line: 72 | named "OverflowScrollContainer" ]]
	-- upvalues: reactModule (ref), flagsModule (ref), reactOtterModule (ref), dashModule (ref), otterModule (ref), controlStateModule (ref), viewModule (ref), withCommonPropsModule (ref), scrollViewModule (ref), stateLayerAffordanceModule (ref), visibilityModule (ref), OverflowButton (ref), numberSequence (ref), numberSequence_1 (ref)
	local var17, var18 = reactModule.useBinding(false)
	local var19, var20 = reactModule.useBinding(false)
	local var21 = nil
	local var22 = nil
	
	if flagsModule.FoundationTabsNavArrowsOnlyOnHover then
		local var23, var24 = reactModule.useState(false)
		var21 = var23
		var22 = var24
	end
	local var25 = reactModule.useRef(nil)
	local var26 = reactOtterModule.useMotor(0, function(p2) --[[ line: 80 ]]
		-- upvalues: var25 (ref)
		local current = var25.current
		
		if current then
			current.CanvasPosition = Vector2.new(p2, 0)
			
			return
		end
	end)
	local var27 = reactModule.useCallback(dashModule.throttle(function(p3) --[[ line: 89 ]]
		-- upvalues: var18 (ref), var20 (ref)
		if p3.AbsoluteWindowSize.X == 0 then
			return
		end
		var18(p3.AbsoluteWindowSize.X + p3.CanvasPosition.X < p3.AbsoluteCanvasSize.X - 1)
		var20(p3.CanvasPosition.X ~= 0)
	end, 0.2), {})
	local var28 = reactModule.useCallback(function(p4) --[[ line: 102 ]]
		-- upvalues: var25 (ref), var26 (ref), otterModule (copy)
		local current = var25.current
		
		if current then
			var26(otterModule.ease(current.CanvasPosition.X + p4, { duration = 0.2, easingStyle = Enum.EasingStyle.Quad }))
			
			return
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 116 ]]
		-- upvalues: var25 (ref), var27 (ref)
		if var25.current then
			var27(var25.current)
		end
	end, {})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(p1, if flagsModule.FoundationTabsInlineSizeFull then { tag = "auto-y", Size = UDim2.fromScale(1, 0) } else { tag = "size-full-0 auto-y" }), {
		Scroll = reactModule.createElement(scrollViewModule, {
			LayoutOrder = 1,
			tag = if flagsModule.FoundationTabsInlineSizeFull then if flagsModule.FoundationTabsNavArrowsOnlyOnHover then "auto-y" else nil else {
				["size-full-0 auto-y"] = flagsModule.FoundationTabsNavArrowsOnlyOnHover,
				["size-full"] = not flagsModule.FoundationTabsNavArrowsOnlyOnHover
			},
			Size = if flagsModule.FoundationTabsInlineSizeFull then if flagsModule.FoundationTabsNavArrowsOnlyOnHover then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 1) else nil,
			onStateChanged = if flagsModule.FoundationTabsNavArrowsOnlyOnHover then if flagsModule.FoundationTabsNavArrowsOnlyOnHover then reactModule.useCallback(function(p5) --[[ line: 131 ]]
				-- upvalues: var22 (write), controlStateModule (copy)
				var22(p5 == controlStateModule.Hover)
			end, {}) else nil else nil,
			stateLayer = if flagsModule.FoundationTabsNavArrowsOnlyOnHover then { affordance = stateLayerAffordanceModule.None } else nil,
			onCanvasPositionChanged = var27,
			onAbsoluteWindowSizeChanged = var27,
			scrollingFrameRef = var25,
			selection = { Selectable = false },
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = visibilityModule.None
			},
			testId = if flagsModule.FoundationTabsNavArrowsOnlyOnHover then `{p1.testId}--scroll` else nil
		}, p1.children),
		OverflowStart = reactModule.createElement(OverflowButton, {
			LayoutOrder = 3,
			isStart = true,
			ZIndex = 2,
			tag = "padding-right-small",
			icon = "chevron-large-left",
			Position = UDim2.fromScale(0, 0),
			size = p1.size,
			Visible = if flagsModule.FoundationTabsNavArrowsOnlyOnHover then var19:map(function(p6) --[[ line: 185 ]]
				-- upvalues: var21 (write)
				return var21 and p6
			end) else var19,
			onActivated = reactModule.useCallback(function() --[[ line: 122 ]]
				-- upvalues: var28 (ref)
				var28(-90)
			end, { var28 }),
			gradient = numberSequence,
			testId = `{p1.testId}--overflow-start`
		}),
		OverflowEnd = reactModule.createElement(OverflowButton, {
			LayoutOrder = 4,
			ZIndex = 2,
			tag = "anchor-top-right padding-left-small",
			icon = "chevron-large-right",
			Position = UDim2.fromScale(1, 0),
			size = p1.size,
			Visible = if flagsModule.FoundationTabsNavArrowsOnlyOnHover then var17:map(function(p7) --[[ line: 201 ]]
				-- upvalues: var21 (write)
				return var21 and p7
			end) else var17,
			onActivated = reactModule.useCallback(function() --[[ line: 126 ]]
				-- upvalues: var28 (ref)
				var28(90)
			end, { var28 }),
			gradient = numberSequence_1,
			testId = `{p1.testId}--overflow-end`
		})
	})
end