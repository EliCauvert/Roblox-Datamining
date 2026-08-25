local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local inputSize = foundationModule.Enums.InputSize
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local makeOtterSpringValueModule = require(avatarExperienceUIKit.Utils.makeOtterSpringValue)
local shouldShowScrollArrowsForInputTypeModule = require(avatarExperienceUIKit.Utils.shouldShowScrollArrowsForInputType)
local getFixedTabHeightModule = require(avatarExperienceUIKit.Utils.getFixedTabHeight)
local fFlagAXCategoryMenuVisualFixes = require(parent.AvatarExperienceFlags).FFlagAXCategoryMenuVisualFixes
local t = { dampingRatio = 1, frequency = 5 }
local t_1 = {
	name = iconName.ChevronLargeLeft,
	variant = iconVariant.Filled
}
local t_2 = {
	name = iconName.ChevronLargeRight,
	variant = iconVariant.Filled
}

local function _(p0)
	return p0.CanvasPosition.X > 0
end

local _ = function(p1)
	return p1.AbsoluteSize.X < p1.AbsoluteCanvasSize.X - p1.CanvasPosition.X
end

local function getCanvasPosition(p2)
	return Vector2.new(p2, 0)
end

local function gradientTransparency(p3, p4, p5)
	local var15 = 1 - p5
	local var16 = var15 * p3[1]
	local var17 = var15 * p3[2]
	local var18 = p3[3]
	
	if var18 < 1 then
		return nil
	end
	local var19 = if var18 < p4 then 1 else p4 / var18
	local t = {}
	
	if var16 > 0 then
		table.insert(t, NumberSequenceKeypoint.new(0, 1 - var16))
		table.insert(t, NumberSequenceKeypoint.new(var19, 1 - var16))
		table.insert(t, NumberSequenceKeypoint.new(var19 + var19 * var16, 1))
	else
		table.insert(t, NumberSequenceKeypoint.new(0, 1))
	end
	if var17 > 0 then
		table.insert(t, NumberSequenceKeypoint.new(1 - var19 * var17 - var19, 1))
		table.insert(t, NumberSequenceKeypoint.new(1 - var19, 1 - var17))
		table.insert(t, NumberSequenceKeypoint.new(1, 1 - var17))
	else
		table.insert(t, NumberSequenceKeypoint.new(1, 1))
	end
	return NumberSequence.new(t)
end

local _ = function(p6, p7)
	-- upvalues: gradientTransparency (ref)
	return function(p8)
		-- upvalues: gradientTransparency (copy), p6 (ref), p7 (ref)
		return gradientTransparency(p8, p6, p7)
	end
end

local function makeButtonTransparency(p9)
	return 1 - p9[1] * p9[2]
end

local function isVisibleFromTransparency(p10)
	return p10 < 1
end

return reactModule.forwardRef(function(p11, p12)
	-- upvalues: useTokens (ref), fFlagAXCategoryMenuVisualFixes (ref), useAnimatedBinding (ref), reactModule (ref), responsiveModule (ref), shouldShowScrollArrowsForInputTypeModule (ref), getCanvasPosition (ref), gradientTransparency (ref), makeButtonTransparency (ref), isVisibleFromTransparency (ref), reactOtterModule (ref), makeOtterSpringValueModule (ref), t (ref), getFixedTabHeightModule (ref), view (ref), iconButton (ref), inputSize (ref), t_1 (ref), t_2 (ref)
	local var21 = useTokens()
	local backgroundTransparency = p11.BackgroundTransparency or var21.Color.Common.NavigationBar.Transparency
	local backgroundColor3 = p11.BackgroundColor3 or var21.Color.Common.NavigationBar.Color3
	local var24 = if fFlagAXCategoryMenuVisualFixes then var21.Size.Size_150 else var21.Size.Size_100
	local var25 = if fFlagAXCategoryMenuVisualFixes then var24 * 2 else var24
	local var26, var27 = useAnimatedBinding(0)
	local var28, var29 = useAnimatedBinding(0)
	local var30, var31 = reactModule.useBinding(0)
	local var32, var33 = useAnimatedBinding(0)
	local var34, var35 = reactModule.useState(false)
	local var36 = if fFlagAXCategoryMenuVisualFixes then shouldShowScrollArrowsForInputTypeModule(responsiveModule.useLastInput()) else nil
	local var37, var38 = useAnimatedBinding(0)
	local var39 = reactModule.useRef(nil)
	local var40 = reactModule.useMemo(function()
		-- upvalues: var37 (ref), getCanvasPosition (copy)
		return var37:map(getCanvasPosition)
	end, {})
	local var41 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var26 (ref), var28 (ref), var30 (ref), var21 (ref), backgroundTransparency (ref), gradientTransparency (copy)
		local var55 = var21.Size.Size_300 * 2
		
		return reactModule.joinBindings({ var26, var28, var30 }):map(function(p13)
			-- upvalues: gradientTransparency (copy), var55 (ref), backgroundTransparency (ref)
			return gradientTransparency(p13, var55, backgroundTransparency)
		end)
	end, { var21, backgroundTransparency })
	local var42 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var28 (ref), var32 (ref), makeButtonTransparency (copy)
		return reactModule.joinBindings({ var28, var32 }):map(makeButtonTransparency)
	end, {})
	local var43 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var26 (ref), var32 (ref), makeButtonTransparency (copy)
		return reactModule.joinBindings({ var26, var32 }):map(makeButtonTransparency)
	end, {})
	local var44 = reactModule.useMemo(function()
		-- upvalues: var43 (ref), isVisibleFromTransparency (copy)
		return var43:map(isVisibleFromTransparency)
	end, {})
	local var45 = reactModule.useMemo(function()
		-- upvalues: var42 (ref), isVisibleFromTransparency (copy)
		return var42:map(isVisibleFromTransparency)
	end, {})
	local var46 = reactModule.useCallback(function()
		-- upvalues: var39 (ref), var38 (ref), reactOtterModule (copy), makeOtterSpringValueModule (copy), t (copy)
		local current = var39.current
		
		if current then
			var38(reactOtterModule.instant(current.CanvasPosition.X))
			var38(makeOtterSpringValueModule(current.AbsoluteCanvasSize.X - current.AbsoluteSize.X, t))
		end
	end, {})
	local var47 = reactModule.useCallback(function()
		-- upvalues: var39 (ref), var38 (ref), reactOtterModule (copy), makeOtterSpringValueModule (copy), t (copy)
		local current = var39.current
		
		if current then
			var38(reactOtterModule.instant(current.CanvasPosition.X))
			var38(makeOtterSpringValueModule(0, t))
		end
	end, {})
	
	local function onMouseEnter()
		-- upvalues: fFlagAXCategoryMenuVisualFixes (copy), var36 (write), var33 (ref), makeOtterSpringValueModule (copy), t (copy), var35 (ref)
		if fFlagAXCategoryMenuVisualFixes and not var36 then
			return
		end
		var33(makeOtterSpringValueModule(1, t))
		var35(true)
	end
	
	local function onMouseLeave()
		-- upvalues: fFlagAXCategoryMenuVisualFixes (copy), var36 (write), var33 (ref), makeOtterSpringValueModule (copy), t (copy), var35 (ref)
		if fFlagAXCategoryMenuVisualFixes and not var36 then
			return
		end
		var33(makeOtterSpringValueModule(0, t))
		var35(false)
	end
	
	if fFlagAXCategoryMenuVisualFixes then
		reactModule.useEffect(function()
			-- upvalues: var36 (write), var33 (ref), reactOtterModule (copy), var35 (ref)
			if not var36 then
				var33(reactOtterModule.instant(0))
				var35(false)
			end
		end, { var36 })
	end
	local function onCanvasChanged(p14)
		-- upvalues: var27 (ref), makeOtterSpringValueModule (copy), t (copy), var29 (ref)
		var27(makeOtterSpringValueModule(if p14.CanvasPosition.X > 0 then 1 else 0, t))
		var29(makeOtterSpringValueModule(if p14.AbsoluteSize.X < p14.AbsoluteCanvasSize.X - p14.CanvasPosition.X then 1 else 0, t))
	end
	
	local function onSizeChanged(p15)
		-- upvalues: var31 (ref)
		var31(p15.AbsoluteSize.X)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var39 (ref), var27 (ref), reactOtterModule (copy), var29 (ref)
		local current = var39.current
		
		if current then
			var27(reactOtterModule.instant(if current.CanvasPosition.X > 0 then 1 else 0))
			var29(reactOtterModule.instant(if current.AbsoluteSize.X < current.AbsoluteCanvasSize.X - current.CanvasPosition.X then 1 else 0))
		end
	end, {})
	
	if fFlagAXCategoryMenuVisualFixes then
		local var52 = reactModule.useCallback(function(p16)
			-- upvalues: var39 (ref), var38 (ref), reactOtterModule (copy), makeOtterSpringValueModule (copy), t (copy)
			local current = var39.current
			
			if current then
				var38(reactOtterModule.instant(current.CanvasPosition.X))
				var38(makeOtterSpringValueModule(p16, t))
			end
		end, {})
		local var53 = reactModule.useCallback(function(p17)
			-- upvalues: var39 (ref), var38 (ref), reactOtterModule (copy)
			if var39.current then
				var38(reactOtterModule.instant(p17))
			end
		end, {})
		reactModule.useImperativeHandle(p11.controllerRef, function()
			-- upvalues: var52 (ref), var53 (ref), var39 (ref)
			return {
				scrollToOffset = var52,
				setOffset = var53,
				getScrollingFrame = function()
					-- upvalues: var39 (copy)
					return var39.current
				end
			}
		end, { var52, var53 })
	end
	local var54 = getFixedTabHeightModule(var21)
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = if fFlagAXCategoryMenuVisualFixes then UDim2.new(1, 0, 0, var21.Size.Size_1000) else UDim2.fromScale(1, 0),
		AutomaticSize = if fFlagAXCategoryMenuVisualFixes then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
		ClipsDescendants = if fFlagAXCategoryMenuVisualFixes then false else nil,
		BackgroundTransparency = backgroundTransparency,
		BackgroundColor3 = backgroundColor3,
		LayoutOrder = p11.LayoutOrder,
		ZIndex = p11.ZIndex,
		Position = p11.Position,
		ref = p12
	}, {
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			ClipsDescendants = true,
			Size = if fFlagAXCategoryMenuVisualFixes then UDim2.new(1, 0, 0, var24 + var54 + var25) else UDim2.fromScale(1, 0),
			Position = if fFlagAXCategoryMenuVisualFixes then UDim2.fromOffset(0, -var24) else nil,
			AutomaticSize = if fFlagAXCategoryMenuVisualFixes then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
			Selectable = false,
			CanvasSize = UDim2.fromScale(1, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollBarThickness = 0,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ElasticBehavior = if fFlagAXCategoryMenuVisualFixes then Enum.ElasticBehavior.Never else Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.X,
			CanvasPosition = var40,
			[reactModule.Change.AbsoluteSize] = onSizeChanged,
			[reactModule.Change.CanvasSize] = onCanvasChanged,
			[reactModule.Change.AbsoluteCanvasSize] = onCanvasChanged,
			[reactModule.Change.CanvasPosition] = onCanvasChanged,
			[reactModule.Event.MouseEnter] = onMouseEnter,
			[reactModule.Event.MouseLeave] = onMouseLeave,
			ref = var39
		}, if fFlagAXCategoryMenuVisualFixes then {
			FocusCursorInset = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var24),
				PaddingBottom = UDim.new(0, var25),
				PaddingLeft = UDim.new(0, var24),
				PaddingRight = UDim.new(0, var24)
			}),
			Content = reactModule.createElement(reactModule.Fragment, nil, p11.children)
		} else reactModule.createElement(reactModule.Fragment, nil, p11.children)),
		OverlayFrame = reactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = backgroundColor3
		}, {
			Gradient = reactModule.createElement("UIGradient", { Transparency = var41 }),
			LeftButton = reactModule.createElement(view, {
				BackgroundTransparency = 1,
				Position = if fFlagAXCategoryMenuVisualFixes then UDim2.new(0, 0, 0, var54 / 2) else UDim2.fromScale(0, 0.5),
				AnchorPoint = Vector2.new(0, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = var43,
				Visible = var44
			}, reactModule.createElement(iconButton, {
				isDisabled = not var34,
				size = inputSize.Small,
				icon = t_1,
				onActivated = var47
			})),
			RightButton = reactModule.createElement(view, {
				BackgroundTransparency = 1,
				Position = if fFlagAXCategoryMenuVisualFixes then UDim2.new(1, 0, 0, var54 / 2) else UDim2.fromScale(1, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = var42,
				Visible = var45
			}, reactModule.createElement(iconButton, {
				isDisabled = not var34,
				size = inputSize.Small,
				icon = t_2,
				onActivated = var46
			}))
		})
	})
end)