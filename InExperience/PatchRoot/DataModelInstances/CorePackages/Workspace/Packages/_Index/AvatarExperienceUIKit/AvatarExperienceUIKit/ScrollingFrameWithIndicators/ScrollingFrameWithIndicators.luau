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

local function _(p1)
	return p1.CanvasPosition.X > 0
end

local _ = function(p1)
	return p1.AbsoluteSize.X < p1.AbsoluteCanvasSize.X - p1.CanvasPosition.X
end

local function getCanvasPosition(p1)
	return Vector2.new(p1, 0)
end

local function gradientTransparency(p1, p2, p3)
	local var1 = 1 - p3
	local var2 = var1 * p1[1]
	local var3 = var1 * p1[2]
	local var4 = p1[3]
	
	if var4 < 1 then
		return nil
	end
	local var5 = if var4 < p2 then 1 else p2 / var4
	local t = {}
	
	if var2 > 0 then
		table.insert(t, NumberSequenceKeypoint.new(0, 1 - var2))
		table.insert(t, NumberSequenceKeypoint.new(var5, 1 - var2))
		table.insert(t, NumberSequenceKeypoint.new(var5 + var5 * var2, 1))
	else
		table.insert(t, NumberSequenceKeypoint.new(0, 1))
	end
	if var3 > 0 then
		table.insert(t, NumberSequenceKeypoint.new(1 - var5 * var3 - var5, 1))
		table.insert(t, NumberSequenceKeypoint.new(1 - var5, 1 - var3))
		table.insert(t, NumberSequenceKeypoint.new(1, 1 - var3))
	else
		table.insert(t, NumberSequenceKeypoint.new(1, 1))
	end
	return NumberSequence.new(t)
end

local _ = function(p1, p2)
	-- upvalues: gradientTransparency (ref)
	return function(p3)
		-- upvalues: gradientTransparency (copy), p1 (ref), p2 (ref)
		return gradientTransparency(p3, p1, p2)
	end
end

local function makeButtonTransparency(p1)
	return 1 - p1[1] * p1[2]
end

local function isVisibleFromTransparency(p1)
	return p1 < 1
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), fFlagAXCategoryMenuVisualFixes (ref), useAnimatedBinding (ref), reactModule (ref), responsiveModule (ref), shouldShowScrollArrowsForInputTypeModule (ref), getCanvasPosition (ref), gradientTransparency (ref), makeButtonTransparency (ref), isVisibleFromTransparency (ref), reactOtterModule (ref), makeOtterSpringValueModule (ref), t (ref), getFixedTabHeightModule (ref), view (ref), iconButton (ref), inputSize (ref), t_1 (ref), t_2 (ref)
	local var1 = useTokens()
	local backgroundTransparency = p1.BackgroundTransparency or var1.Color.Common.NavigationBar.Transparency
	local backgroundColor3 = p1.BackgroundColor3 or var1.Color.Common.NavigationBar.Color3
	local var2 = if fFlagAXCategoryMenuVisualFixes then var1.Size.Size_150 else var1.Size.Size_100
	local var3 = if fFlagAXCategoryMenuVisualFixes then var2 * 2 else var2
	local var4, var5 = useAnimatedBinding(0)
	local var6, var7 = useAnimatedBinding(0)
	local var8, var9 = reactModule.useBinding(0)
	local var10, var11 = useAnimatedBinding(0)
	local var12, var13 = reactModule.useState(false)
	local var14 = if fFlagAXCategoryMenuVisualFixes then shouldShowScrollArrowsForInputTypeModule(responsiveModule.useLastInput()) else nil
	local var15, var16 = useAnimatedBinding(0)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useMemo(function()
		-- upvalues: var15 (ref), getCanvasPosition (copy)
		return var15:map(getCanvasPosition)
	end, {})
	local var19 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var4 (ref), var6 (ref), var8 (ref), var1 (ref), backgroundTransparency (ref), gradientTransparency (copy)
		local var20 = var1.Size.Size_300 * 2
		
		return reactModule.joinBindings({ var4, var6, var8 }):map(function(p3)
			-- upvalues: gradientTransparency (copy), var20 (ref), backgroundTransparency (ref)
			return gradientTransparency(p3, var20, backgroundTransparency)
		end)
	end, { var1, backgroundTransparency })
	local var20 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var6 (ref), var10 (ref), makeButtonTransparency (copy)
		return reactModule.joinBindings({ var6, var10 }):map(makeButtonTransparency)
	end, {})
	local var21 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var4 (ref), var10 (ref), makeButtonTransparency (copy)
		return reactModule.joinBindings({ var4, var10 }):map(makeButtonTransparency)
	end, {})
	local var22 = reactModule.useMemo(function()
		-- upvalues: var21 (ref), isVisibleFromTransparency (copy)
		return var21:map(isVisibleFromTransparency)
	end, {})
	local var23 = reactModule.useMemo(function()
		-- upvalues: var20 (ref), isVisibleFromTransparency (copy)
		return var20:map(isVisibleFromTransparency)
	end, {})
	local var24 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), var16 (ref), reactOtterModule (copy), makeOtterSpringValueModule (copy), t (copy)
		local current = var17.current
		
		if current then
			var16(reactOtterModule.instant(current.CanvasPosition.X))
			var16(makeOtterSpringValueModule(current.AbsoluteCanvasSize.X - current.AbsoluteSize.X, t))
		end
	end, {})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), var16 (ref), reactOtterModule (copy), makeOtterSpringValueModule (copy), t (copy)
		local current = var17.current
		
		if current then
			var16(reactOtterModule.instant(current.CanvasPosition.X))
			var16(makeOtterSpringValueModule(0, t))
		end
	end, {})
	
	local function onMouseEnter()
		-- upvalues: fFlagAXCategoryMenuVisualFixes (copy), var14 (write), var11 (ref), makeOtterSpringValueModule (copy), t (copy), var13 (ref)
		if fFlagAXCategoryMenuVisualFixes and not var14 then
			return
		end
		var11(makeOtterSpringValueModule(1, t))
		var13(true)
	end
	
	local function onMouseLeave()
		-- upvalues: fFlagAXCategoryMenuVisualFixes (copy), var14 (write), var11 (ref), makeOtterSpringValueModule (copy), t (copy), var13 (ref)
		if fFlagAXCategoryMenuVisualFixes and not var14 then
			return
		end
		var11(makeOtterSpringValueModule(0, t))
		var13(false)
	end
	
	if fFlagAXCategoryMenuVisualFixes then
		reactModule.useEffect(function()
			-- upvalues: var14 (write), var11 (ref), reactOtterModule (copy), var13 (ref)
			if not var14 then
				var11(reactOtterModule.instant(0))
				var13(false)
			end
		end, { var14 })
	end
	local function onCanvasChanged(p3)
		-- upvalues: var5 (ref), makeOtterSpringValueModule (copy), t (copy), var7 (ref)
		var5(makeOtterSpringValueModule(if p3.CanvasPosition.X > 0 then 1 else 0, t))
		var7(makeOtterSpringValueModule(if p3.AbsoluteSize.X < p3.AbsoluteCanvasSize.X - p3.CanvasPosition.X then 1 else 0, t))
	end
	
	local function onSizeChanged(p3)
		-- upvalues: var9 (ref)
		var9(p3.AbsoluteSize.X)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var5 (ref), reactOtterModule (copy), var7 (ref)
		local current = var17.current
		
		if current then
			var5(reactOtterModule.instant(if current.CanvasPosition.X > 0 then 1 else 0))
			var7(reactOtterModule.instant(if current.AbsoluteSize.X < current.AbsoluteCanvasSize.X - current.CanvasPosition.X then 1 else 0))
		end
	end, {})
	
	if fFlagAXCategoryMenuVisualFixes then
		local var26 = reactModule.useCallback(function(p3)
			-- upvalues: var17 (ref), var16 (ref), reactOtterModule (copy), makeOtterSpringValueModule (copy), t (copy)
			local current = var17.current
			
			if current then
				var16(reactOtterModule.instant(current.CanvasPosition.X))
				var16(makeOtterSpringValueModule(p3, t))
			end
		end, {})
		local var27 = reactModule.useCallback(function(p3)
			-- upvalues: var17 (ref), var16 (ref), reactOtterModule (copy)
			if var17.current then
				var16(reactOtterModule.instant(p3))
			end
		end, {})
		reactModule.useImperativeHandle(p1.controllerRef, function()
			-- upvalues: var26 (ref), var27 (ref), var17 (ref)
			return {
				scrollToOffset = var26,
				setOffset = var27,
				getScrollingFrame = function()
					-- upvalues: var17 (copy)
					return var17.current
				end
			}
		end, { var26, var27 })
	end
	local var28 = getFixedTabHeightModule(var1)
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = if fFlagAXCategoryMenuVisualFixes then UDim2.new(1, 0, 0, var1.Size.Size_1000) else UDim2.fromScale(1, 0),
		AutomaticSize = if fFlagAXCategoryMenuVisualFixes then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
		ClipsDescendants = if fFlagAXCategoryMenuVisualFixes then false else nil,
		BackgroundTransparency = backgroundTransparency,
		BackgroundColor3 = backgroundColor3,
		LayoutOrder = p1.LayoutOrder,
		ZIndex = p1.ZIndex,
		Position = p1.Position,
		ref = p2
	}, {
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			ClipsDescendants = true,
			Size = if fFlagAXCategoryMenuVisualFixes then UDim2.new(1, 0, 0, var2 + var28 + var3) else UDim2.fromScale(1, 0),
			Position = if fFlagAXCategoryMenuVisualFixes then UDim2.fromOffset(0, -var2) else nil,
			AutomaticSize = if fFlagAXCategoryMenuVisualFixes then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
			Selectable = false,
			CanvasSize = UDim2.fromScale(1, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollBarThickness = 0,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ElasticBehavior = if fFlagAXCategoryMenuVisualFixes then Enum.ElasticBehavior.Never else Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.X,
			CanvasPosition = var18,
			[reactModule.Change.AbsoluteSize] = onSizeChanged,
			[reactModule.Change.CanvasSize] = onCanvasChanged,
			[reactModule.Change.AbsoluteCanvasSize] = onCanvasChanged,
			[reactModule.Change.CanvasPosition] = onCanvasChanged,
			[reactModule.Event.MouseEnter] = onMouseEnter,
			[reactModule.Event.MouseLeave] = onMouseLeave,
			ref = var17
		}, if fFlagAXCategoryMenuVisualFixes then {
			FocusCursorInset = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var2),
				PaddingBottom = UDim.new(0, var3),
				PaddingLeft = UDim.new(0, var2),
				PaddingRight = UDim.new(0, var2)
			}),
			Content = reactModule.createElement(reactModule.Fragment, nil, p1.children)
		} else reactModule.createElement(reactModule.Fragment, nil, p1.children)),
		OverlayFrame = reactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = backgroundColor3
		}, {
			Gradient = reactModule.createElement("UIGradient", { Transparency = var19 }),
			LeftButton = reactModule.createElement(view, {
				BackgroundTransparency = 1,
				Position = if fFlagAXCategoryMenuVisualFixes then UDim2.new(0, 0, 0, var28 / 2) else UDim2.fromScale(0, 0.5),
				AnchorPoint = Vector2.new(0, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = var21,
				Visible = var22
			}, reactModule.createElement(iconButton, {
				isDisabled = not var12,
				size = inputSize.Small,
				icon = t_1,
				onActivated = var25
			})),
			RightButton = reactModule.createElement(view, {
				BackgroundTransparency = 1,
				Position = if fFlagAXCategoryMenuVisualFixes then UDim2.new(1, 0, 0, var28 / 2) else UDim2.fromScale(1, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = var20,
				Visible = var23
			}, reactModule.createElement(iconButton, {
				isDisabled = not var12,
				size = inputSize.Small,
				icon = t_2,
				onActivated = var24
			}))
		})
	})
end)