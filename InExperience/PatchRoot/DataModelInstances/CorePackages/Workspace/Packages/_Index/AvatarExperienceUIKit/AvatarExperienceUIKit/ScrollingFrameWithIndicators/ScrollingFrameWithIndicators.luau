local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local inputSize = foundationModule.Enums.InputSize
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local makeOtterSpringValueModule = require(avatarExperienceUIKit.Utils.makeOtterSpringValue)
local t = { dampingRatio = 1, frequency = 5 }
local t_1 = {
	name = iconName.ChevronLargeLeft,
	variant = iconVariant.Filled
}
local t_2 = {
	name = iconName.ChevronLargeRight,
	variant = iconVariant.Filled
}

local function _(p0) --[[ line: 31 | named "scrollingFrameCanScrollLeft" ]]
	return p0.CanvasPosition.X > 0
end

local _ = function(p1) --[[ line: 35 | named "scrollingFrameCanScrollRight" ]]
	return p1.AbsoluteSize.X < p1.AbsoluteCanvasSize.X - p1.CanvasPosition.X
end

local function getCanvasPosition(p2) --[[ line: 39 ]]
	return Vector2.new(p2, 0)
end

local function gradientTransparency(p3, p4, p5) --[[ line: 43 ]]
	local var12 = 1 - p5
	local var13 = var12 * p3[1]
	local var14 = var12 * p3[2]
	local var15 = p3[3]
	
	if var15 < 1 then
		return nil
	end
	local var16 = if var15 < p4 then 1 else p4 / var15
	local t = {}
	
	if var13 > 0 then
		table.insert(t, NumberSequenceKeypoint.new(0, 1 - var13))
		table.insert(t, NumberSequenceKeypoint.new(var16, 1 - var13))
		table.insert(t, NumberSequenceKeypoint.new(var16 + var16 * var13, 1))
	else
		table.insert(t, NumberSequenceKeypoint.new(0, 1))
	end
	if var14 > 0 then
		table.insert(t, NumberSequenceKeypoint.new(1 - var16 * var14 - var16, 1))
		table.insert(t, NumberSequenceKeypoint.new(1 - var16, 1 - var14))
		table.insert(t, NumberSequenceKeypoint.new(1, 1 - var14))
	else
		table.insert(t, NumberSequenceKeypoint.new(1, 1))
	end
	return NumberSequence.new(t)
end

local _ = function(p6, p7) --[[ line: 80 | named "makeGradientTransparency" ]]
	-- upvalues: gradientTransparency (ref)
	return function(p8) --[[ line: 81 ]]
		-- upvalues: gradientTransparency (copy), p6 (ref), p7 (ref)
		return gradientTransparency(p8, p6, p7)
	end
end

local function makeButtonTransparency(p9) --[[ line: 86 ]]
	return 1 - p9[1] * p9[2]
end

local function isVisibleFromTransparency(p10) --[[ line: 92 ]]
	return p10 < 1
end

return reactModule.forwardRef(function(p11, p12) --[[ line: 105 | named "ScrollingFrameWithIndicators" ]]
	-- upvalues: useTokens (ref), useAnimatedBinding (ref), reactModule (ref), getCanvasPosition (ref), gradientTransparency (ref), makeButtonTransparency (ref), isVisibleFromTransparency (ref), reactOtterModule (ref), makeOtterSpringValueModule (ref), t (ref), view (ref), iconButton (ref), inputSize (ref), t_1 (ref), t_2 (ref)
	local var18 = useTokens()
	local backgroundTransparency = p11.BackgroundTransparency or var18.Color.Common.NavigationBar.Transparency
	local backgroundColor3 = p11.BackgroundColor3 or var18.Color.Common.NavigationBar.Color3
	local var21, var22 = useAnimatedBinding(0)
	local var23, var24 = useAnimatedBinding(0)
	local var25, var26 = reactModule.useBinding(0)
	local var27, var28 = useAnimatedBinding(0)
	local var29, var30 = reactModule.useState(false)
	local var31, var32 = useAnimatedBinding(0)
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useMemo(function() --[[ line: 120 ]]
		-- upvalues: var31 (ref), getCanvasPosition (copy)
		return var31:map(getCanvasPosition)
	end, {})
	local var35 = reactModule.useMemo(function() --[[ line: 124 ]]
		-- upvalues: reactModule (copy), var21 (ref), var23 (ref), var25 (ref), var18 (ref), backgroundTransparency (ref), gradientTransparency (copy)
		local var46 = var18.Size.Size_300 * 2
		
		return reactModule.joinBindings({ var21, var23, var25 }):map(function(p13) --[[ line: 81 ]]
			-- upvalues: gradientTransparency (copy), var46 (ref), backgroundTransparency (ref)
			return gradientTransparency(p13, var46, backgroundTransparency)
		end)
	end, { var18, backgroundTransparency })
	local var36 = reactModule.useMemo(function() --[[ line: 132 ]]
		-- upvalues: reactModule (copy), var23 (ref), var27 (ref), makeButtonTransparency (copy)
		return reactModule.joinBindings({ var23, var27 }):map(makeButtonTransparency)
	end, {})
	local var37 = reactModule.useMemo(function() --[[ line: 136 ]]
		-- upvalues: reactModule (copy), var21 (ref), var27 (ref), makeButtonTransparency (copy)
		return reactModule.joinBindings({ var21, var27 }):map(makeButtonTransparency)
	end, {})
	local var38 = reactModule.useMemo(function() --[[ line: 143 ]]
		-- upvalues: var37 (ref), isVisibleFromTransparency (copy)
		return var37:map(isVisibleFromTransparency)
	end, {})
	local var39 = reactModule.useMemo(function() --[[ line: 147 ]]
		-- upvalues: var36 (ref), isVisibleFromTransparency (copy)
		return var36:map(isVisibleFromTransparency)
	end, {})
	local var40 = reactModule.useCallback(function() --[[ line: 151 ]]
		-- upvalues: var33 (ref), var32 (ref), reactOtterModule (copy), makeOtterSpringValueModule (copy), t (copy)
		local current = var33.current
		
		if current then
			var32(reactOtterModule.instant(current.CanvasPosition.X))
			var32(makeOtterSpringValueModule(current.AbsoluteCanvasSize.X - current.AbsoluteSize.X, t))
		end
	end, {})
	local var41 = reactModule.useCallback(function() --[[ line: 164 ]]
		-- upvalues: var33 (ref), var32 (ref), reactOtterModule (copy), makeOtterSpringValueModule (copy), t (copy)
		local current = var33.current
		
		if current then
			var32(reactOtterModule.instant(current.CanvasPosition.X))
			var32(makeOtterSpringValueModule(0, t))
		end
	end, {})
	
	local function onMouseEnter() --[[ line: 174 ]]
		-- upvalues: var28 (ref), makeOtterSpringValueModule (copy), t (copy), var30 (ref)
		var28(makeOtterSpringValueModule(1, t))
		var30(true)
	end
	
	local function onMouseLeave() --[[ line: 179 ]]
		-- upvalues: var28 (ref), makeOtterSpringValueModule (copy), t (copy), var30 (ref)
		var28(makeOtterSpringValueModule(0, t))
		var30(false)
	end
	
	local function onCanvasChanged(p14) --[[ line: 184 ]]
		-- upvalues: var22 (ref), makeOtterSpringValueModule (copy), t (copy), var24 (ref)
		var22(makeOtterSpringValueModule(if p14.CanvasPosition.X > 0 then 1 else 0, t))
		var24(makeOtterSpringValueModule(if p14.AbsoluteSize.X < p14.AbsoluteCanvasSize.X - p14.CanvasPosition.X then 1 else 0, t))
	end
	
	local function onSizeChanged(p15) --[[ line: 191 ]]
		-- upvalues: var26 (ref)
		var26(p15.AbsoluteSize.X)
	end
	
	reactModule.useEffect(function() --[[ line: 195 ]]
		-- upvalues: var33 (ref), var22 (ref), reactOtterModule (copy), var24 (ref)
		local current = var33.current
		
		if current then
			var22(reactOtterModule.instant(if current.CanvasPosition.X > 0 then 1 else 0))
			var24(reactOtterModule.instant(if current.AbsoluteSize.X < current.AbsoluteCanvasSize.X - current.CanvasPosition.X then 1 else 0))
		end
	end, {})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = backgroundTransparency,
		BackgroundColor3 = backgroundColor3,
		LayoutOrder = p11.LayoutOrder,
		ZIndex = p11.ZIndex,
		Position = p11.Position,
		ref = p12
	}, {
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Selectable = false,
			CanvasSize = UDim2.fromScale(1, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollBarThickness = 0,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.X,
			CanvasPosition = var34,
			[reactModule.Change.AbsoluteSize] = onSizeChanged,
			[reactModule.Change.CanvasSize] = onCanvasChanged,
			[reactModule.Change.AbsoluteCanvasSize] = onCanvasChanged,
			[reactModule.Change.CanvasPosition] = onCanvasChanged,
			[reactModule.Event.MouseEnter] = onMouseEnter,
			[reactModule.Event.MouseLeave] = onMouseLeave,
			ref = var33
		}, reactModule.createElement(reactModule.Fragment, nil, p11.children)),
		OverlayFrame = reactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = backgroundColor3
		}, {
			Gradient = reactModule.createElement("UIGradient", { Transparency = var35 }),
			LeftButton = reactModule.createElement(view, {
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0, 0.5),
				AnchorPoint = Vector2.new(0, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = var37,
				Visible = var38
			}, reactModule.createElement(iconButton, {
				isDisabled = not var29,
				size = inputSize.Small,
				icon = t_1,
				onActivated = var41
			})),
			RightButton = reactModule.createElement(view, {
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(1, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = var36,
				Visible = var39
			}, reactModule.createElement(iconButton, {
				isDisabled = not var29,
				size = inputSize.Small,
				icon = t_2,
				onActivated = var40
			}))
		})
	})
end)