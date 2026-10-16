local AvatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local Parent = AvatarExperienceUIKit.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UseAnimatedBindingFunction = ReactOtterModule.useAnimatedBinding
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local IconButton = FoundationModule.IconButton
local InputSize = FoundationModule.Enums.InputSize
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local MakeOtterSpringValueModule = require(AvatarExperienceUIKit.Utils.makeOtterSpringValue)
local ShouldShowScrollArrowsForInputTypeModule = require(AvatarExperienceUIKit.Utils.shouldShowScrollArrowsForInputType)
local GetFixedTabHeightModule = require(AvatarExperienceUIKit.Utils.getFixedTabHeight)
local GradientTransparencyModule = require(script.Parent.gradientTransparency)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXCategoryMenuVisualFixes = AvatarExperienceFlagsModule.FFlagAXCategoryMenuVisualFixes
local FFlagAXFixScrollingFrameGradientOverlap = AvatarExperienceFlagsModule.FFlagAXFixScrollingFrameGradientOverlap
local config = { dampingRatio = 1, frequency = 5 }
local Icon = {
	name = IconName.ChevronLargeLeft,
	variant = IconVariant.Filled
}
local Icon1 = {
	name = IconName.ChevronLargeRight,
	variant = IconVariant.Filled
}

local function _(ScrollFrame): boolean --[[ Line: 39 | Named "scrollingFrameCanScrollLeft" ]]
	return ScrollFrame.CanvasPosition.X > 0
end

local _ = function(ScrollFrame): boolean --[[ Line: 43 | Named "scrollingFrameCanScrollRight" ]]
	return ScrollFrame.AbsoluteSize.X < ScrollFrame.AbsoluteCanvasSize.X - ScrollFrame.CanvasPosition.X
end

local function getCanvasPosition(X): Vector2 --[[ Line: 47 ]]
	return Vector2.new(X, 0)
end

local function gradientTransparency(Entry, ScaledSize, BackgroundTransparency: number): NumberSequence? --[[ Line: 51 ]]
	local v1 = 1 - BackgroundTransparency
	local ScaledEntry = v1 * Entry[1]
	local ScaledEntry1 = v1 * Entry[2]
	local Entry1: number = Entry[3]
	
	if Entry1 < 1 then
		return nil
	end
	local ScaledSizeRatio = if Entry1 < ScaledSize then 1 else ScaledSize / Entry1
	local List = {}
	
	if ScaledEntry > 0 then
		table.insert(List, NumberSequenceKeypoint.new(0, 1 - ScaledEntry))
		table.insert(List, NumberSequenceKeypoint.new(ScaledSizeRatio, 1 - ScaledEntry))
		table.insert(List, NumberSequenceKeypoint.new(ScaledSizeRatio + ScaledSizeRatio * ScaledEntry, 1))
	else
		table.insert(List, NumberSequenceKeypoint.new(0, 1))
	end
	if ScaledEntry1 > 0 then
		table.insert(List, NumberSequenceKeypoint.new(1 - ScaledSizeRatio * ScaledEntry1 - ScaledSizeRatio, 1))
		table.insert(List, NumberSequenceKeypoint.new(1 - ScaledSizeRatio, 1 - ScaledEntry1))
		table.insert(List, NumberSequenceKeypoint.new(1, 1 - ScaledEntry1))
	else
		table.insert(List, NumberSequenceKeypoint.new(1, 1))
	end
	return NumberSequence.new(List)
end

local _ = function(p1, p2) --[[ Line: 88 | Named "makeGradientTransparency" ]]
	-- upvalues: FFlagAXFixScrollingFrameGradientOverlap (copy), GradientTransparencyModule (copy), gradientTransparency (copy)
	return function(p3) --[[ Line: 89 ]]
		-- upvalues: FFlagAXFixScrollingFrameGradientOverlap (upval), GradientTransparencyModule (upval), p1 (copy), p2 (copy), gradientTransparency (upval)
		return if FFlagAXFixScrollingFrameGradientOverlap then GradientTransparencyModule.fittedGradientTransparency(p3, p1, p2) else gradientTransparency(p3, p1, p2)
	end
end

local function makeButtonTransparency(Entry): number --[[ Line: 97 ]]
	return 1 - Entry[1] * Entry[2]
end

local function isVisibleFromTransparency(p1: number): boolean --[[ Line: 103 ]]
	return p1 < 1
end

return ReactModule.forwardRef(function(Frame: Frame, Ref) --[[ Line: 126 | Named "ScrollingFrameWithIndicators" ]]
	-- upvalues: UseTokensFunction (copy), FFlagAXCategoryMenuVisualFixes (copy), UseAnimatedBindingFunction (copy), ReactModule (copy), ResponsiveModule (copy), ShouldShowScrollArrowsForInputTypeModule (copy), getCanvasPosition (copy), FFlagAXFixScrollingFrameGradientOverlap (copy), GradientTransparencyModule (copy), gradientTransparency (copy), makeButtonTransparency (copy), isVisibleFromTransparency (copy), ReactOtterModule (copy), MakeOtterSpringValueModule (copy), config (copy), GetFixedTabHeightModule (copy), View (copy), IconButton (copy), InputSize (copy), Icon (copy), Icon1 (copy)
	local UseTokensResult = UseTokensFunction()
	local BackgroundTransparency = Frame.BackgroundTransparency or UseTokensResult.Color.Common.NavigationBar.Transparency
	local BackgroundColor3 = Frame.BackgroundColor3 or UseTokensResult.Color.Common.NavigationBar.Color3
	local Size150 = if FFlagAXCategoryMenuVisualFixes then UseTokensResult.Size.Size_150 else UseTokensResult.Size.Size_100
	local Offset = if FFlagAXCategoryMenuVisualFixes then Size150 * 2 else Size150
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(0)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = UseAnimatedBindingFunction(0)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseAnimatedBindingResult3, UseAnimatedBindingResult2_2 = UseAnimatedBindingFunction(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local ShouldShowScrollArrowsForInputTypeModule1 = if FFlagAXCategoryMenuVisualFixes then ShouldShowScrollArrowsForInputTypeModule((ResponsiveModule.useLastInput())) else nil
	local UseAnimatedBindingResult4, UseAnimatedBindingResult2_3 = UseAnimatedBindingFunction(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 155 ]]
		-- upvalues: UseAnimatedBindingResult4 (copy), getCanvasPosition (upval)
		return UseAnimatedBindingResult4:map(getCanvasPosition)
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 159 ]]
		-- upvalues: ReactModule (upval), UseAnimatedBindingResult (copy), UseAnimatedBindingResult1 (copy), UseBindingResult (copy), UseTokensResult (copy), BackgroundTransparency (copy), FFlagAXFixScrollingFrameGradientOverlap (upval), GradientTransparencyModule (upval), gradientTransparency (upval)
		local ScaledSize = UseTokensResult.Size.Size_300 * 2
		
		return ReactModule.joinBindings({
			UseAnimatedBindingResult,
			UseAnimatedBindingResult1,
			UseBindingResult
		}):map(function(p1) --[[ Line: 89 ]]
			-- upvalues: FFlagAXFixScrollingFrameGradientOverlap (upval), GradientTransparencyModule (upval), ScaledSize (copy), BackgroundTransparency (copy), gradientTransparency (upval)
			return if FFlagAXFixScrollingFrameGradientOverlap then GradientTransparencyModule.fittedGradientTransparency(p1, ScaledSize, BackgroundTransparency) else gradientTransparency(p1, ScaledSize, BackgroundTransparency)
		end)
	end, { UseTokensResult, BackgroundTransparency })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 167 ]]
		-- upvalues: ReactModule (upval), UseAnimatedBindingResult1 (copy), UseAnimatedBindingResult3 (copy), makeButtonTransparency (upval)
		return ReactModule.joinBindings({ UseAnimatedBindingResult1, UseAnimatedBindingResult3 }):map(makeButtonTransparency)
	end, {})
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 171 ]]
		-- upvalues: ReactModule (upval), UseAnimatedBindingResult (copy), UseAnimatedBindingResult3 (copy), makeButtonTransparency (upval)
		return ReactModule.joinBindings({ UseAnimatedBindingResult, UseAnimatedBindingResult3 }):map(makeButtonTransparency)
	end, {})
	local UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 178 ]]
		-- upvalues: UseMemoResult3 (copy), isVisibleFromTransparency (upval)
		return UseMemoResult3:map(isVisibleFromTransparency)
	end, {})
	local UseMemoResult5 = ReactModule.useMemo(function() --[[ Line: 182 ]]
		-- upvalues: UseMemoResult2 (copy), isVisibleFromTransparency (upval)
		return UseMemoResult2:map(isVisibleFromTransparency)
	end, {})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 186 ]]
		-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2_3 (copy), ReactOtterModule (upval), MakeOtterSpringValueModule (upval), config (upval)
		local Current = UseRefResult.current
		
		if Current then
			UseAnimatedBindingResult2_3(ReactOtterModule.instant(Current.CanvasPosition.X))
			UseAnimatedBindingResult2_3(MakeOtterSpringValueModule(Current.AbsoluteCanvasSize.X - Current.AbsoluteSize.X, config))
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 199 ]]
		-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2_3 (copy), ReactOtterModule (upval), MakeOtterSpringValueModule (upval), config (upval)
		local Current = UseRefResult.current
		
		if Current then
			UseAnimatedBindingResult2_3(ReactOtterModule.instant(Current.CanvasPosition.X))
			UseAnimatedBindingResult2_3(MakeOtterSpringValueModule(0, config))
		end
	end, {})
	
	local function onMouseEnter() --[[ Line: 209 ]]
		-- upvalues: FFlagAXCategoryMenuVisualFixes (upval), ShouldShowScrollArrowsForInputTypeModule1 (ref), UseAnimatedBindingResult2_2 (copy), MakeOtterSpringValueModule (upval), config (upval), UseStateResult2 (copy)
		if not FFlagAXCategoryMenuVisualFixes or ShouldShowScrollArrowsForInputTypeModule1 then
			UseAnimatedBindingResult2_2(MakeOtterSpringValueModule(1, config))
			UseStateResult2(true)
			
			return
		end
	end
	
	local function onMouseLeave() --[[ Line: 217 ]]
		-- upvalues: FFlagAXCategoryMenuVisualFixes (upval), ShouldShowScrollArrowsForInputTypeModule1 (ref), UseAnimatedBindingResult2_2 (copy), MakeOtterSpringValueModule (upval), config (upval), UseStateResult2 (copy)
		if not FFlagAXCategoryMenuVisualFixes or ShouldShowScrollArrowsForInputTypeModule1 then
			UseAnimatedBindingResult2_2(MakeOtterSpringValueModule(0, config))
			UseStateResult2(false)
			
			return
		end
	end
	
	if FFlagAXCategoryMenuVisualFixes then
		ReactModule.useEffect(function() --[[ Line: 228 ]]
			-- upvalues: ShouldShowScrollArrowsForInputTypeModule1 (ref), UseAnimatedBindingResult2_2 (copy), ReactOtterModule (upval), UseStateResult2 (copy)
			if not ShouldShowScrollArrowsForInputTypeModule1 then
				UseAnimatedBindingResult2_2(ReactOtterModule.instant(0))
				UseStateResult2(false)
			end
		end, { ShouldShowScrollArrowsForInputTypeModule1 })
	end
	local function onCanvasChanged(ScrollFrame) --[[ Line: 236 ]]
		-- upvalues: UseAnimatedBindingResult2 (copy), MakeOtterSpringValueModule (upval), config (upval), UseAnimatedBindingResult2_1 (copy)
		local IsXAbove = ScrollFrame.CanvasPosition.X > 0
		UseAnimatedBindingResult2(MakeOtterSpringValueModule(if IsXAbove then 1 else 0, config))
		local IsXBelow = ScrollFrame.AbsoluteSize.X < ScrollFrame.AbsoluteCanvasSize.X - ScrollFrame.CanvasPosition.X
		UseAnimatedBindingResult2_1(MakeOtterSpringValueModule(if IsXBelow then 1 else 0, config))
	end
	
	local function onSizeChanged(Frame) --[[ Line: 243 ]]
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.X)
	end
	
	ReactModule.useEffect(function() --[[ Line: 247 ]]
		-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseAnimatedBindingResult2_1 (copy)
		local Current = UseRefResult.current
		
		if Current then
			local IsXAbove = Current.CanvasPosition.X > 0
			UseAnimatedBindingResult2(ReactOtterModule.instant(if IsXAbove then 1 else 0))
			local IsXBelow = Current.AbsoluteSize.X < Current.AbsoluteCanvasSize.X - Current.CanvasPosition.X
			UseAnimatedBindingResult2_1(ReactOtterModule.instant(if IsXBelow then 1 else 0))
		end
	end, {})
	
	if FFlagAXCategoryMenuVisualFixes then
		local UseResult2 = ReactModule.useCallback(function(p1) --[[ Line: 262 ]]
			-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2_3 (copy), ReactOtterModule (upval), MakeOtterSpringValueModule (upval), config (upval)
			local Current = UseRefResult.current
			
			if Current then
				UseAnimatedBindingResult2_3(ReactOtterModule.instant(Current.CanvasPosition.X))
				UseAnimatedBindingResult2_3(MakeOtterSpringValueModule(p1, config))
			end
		end, {})
		local UseResult3 = ReactModule.useCallback(function(p1) --[[ Line: 271 ]]
			-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2_3 (copy), ReactOtterModule (upval)
			if UseRefResult.current then
				UseAnimatedBindingResult2_3(ReactOtterModule.instant(p1))
			end
		end, {})
		ReactModule.useImperativeHandle(Frame.controllerRef, function() --[[ Line: 278 ]]
			-- upvalues: UseResult2 (copy), UseResult3 (copy), UseRefResult (copy)
			return {
				scrollToOffset = UseResult2,
				setOffset = UseResult3,
				getScrollingFrame = function() --[[ Line: 282 ]]
					-- upvalues: UseRefResult (upval)
					return UseRefResult.current
				end
			}
		end, { UseResult2, UseResult3 })
	end
	local Size1000 = UseTokensResult.Size.Size_1000
	local FixedTabHeightModule: number = GetFixedTabHeightModule(UseTokensResult)
	local NewSize = Size150 + FixedTabHeightModule + Offset
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = if FFlagAXCategoryMenuVisualFixes then UDim2.new(1, 0, 0, Size1000) else UDim2.fromScale(1, 0),
		AutomaticSize = if FFlagAXCategoryMenuVisualFixes then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
		ClipsDescendants = not FFlagAXCategoryMenuVisualFixes and nil,
		BackgroundTransparency = BackgroundTransparency,
		BackgroundColor3 = BackgroundColor3,
		LayoutOrder = Frame.LayoutOrder,
		ZIndex = Frame.ZIndex,
		Position = Frame.Position,
		ref = Ref
	}, {
		ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			ClipsDescendants = true,
			Size = if FFlagAXCategoryMenuVisualFixes then UDim2.new(1, 0, 0, NewSize) else UDim2.fromScale(1, 0),
			Position = if FFlagAXCategoryMenuVisualFixes then UDim2.fromOffset(0, -Size150) else nil,
			AutomaticSize = if FFlagAXCategoryMenuVisualFixes then Enum.AutomaticSize.None else Enum.AutomaticSize.Y,
			Selectable = false,
			CanvasSize = UDim2.fromScale(1, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollBarThickness = 0,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ElasticBehavior = if FFlagAXCategoryMenuVisualFixes then Enum.ElasticBehavior.Never else Enum.ElasticBehavior.Always,
			ScrollingDirection = Enum.ScrollingDirection.X,
			CanvasPosition = UseMemoResult,
			[ReactModule.Change.AbsoluteSize] = onSizeChanged,
			[ReactModule.Change.CanvasSize] = onCanvasChanged,
			[ReactModule.Change.AbsoluteCanvasSize] = onCanvasChanged,
			[ReactModule.Change.CanvasPosition] = onCanvasChanged,
			[ReactModule.Event.MouseEnter] = onMouseEnter,
			[ReactModule.Event.MouseLeave] = onMouseLeave,
			ref = UseRefResult
		}, if FFlagAXCategoryMenuVisualFixes then {
			FocusCursorInset = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, Size150),
				PaddingBottom = UDim.new(0, Offset),
				PaddingLeft = UDim.new(0, Size150),
				PaddingRight = UDim.new(0, Size150)
			}),
			Content = ReactModule.createElement(ReactModule.Fragment, nil, Frame.children)
		} else ReactModule.createElement(ReactModule.Fragment, nil, Frame.children)),
		OverlayFrame = ReactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = BackgroundColor3
		}, {
			Gradient = ReactModule.createElement("UIGradient", { Transparency = UseMemoResult1 }),
			LeftButton = ReactModule.createElement(View, {
				BackgroundTransparency = 1,
				Position = if FFlagAXCategoryMenuVisualFixes then UDim2.new(0, 0, 0, FixedTabHeightModule / 2) else UDim2.fromScale(0, 0.5),
				AnchorPoint = Vector2.new(0, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = UseMemoResult3,
				Visible = UseMemoResult4
			}, ReactModule.createElement(IconButton, {
				isDisabled = not UseStateResult,
				size = InputSize.Small,
				icon = Icon,
				onActivated = UseResult1
			})),
			RightButton = ReactModule.createElement(View, {
				BackgroundTransparency = 1,
				Position = if FFlagAXCategoryMenuVisualFixes then UDim2.new(1, 0, 0, FixedTabHeightModule / 2) else UDim2.fromScale(1, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				AutomaticSize = Enum.AutomaticSize.XY,
				GroupTransparency = UseMemoResult2,
				Visible = UseMemoResult5
			}, ReactModule.createElement(IconButton, {
				isDisabled = not UseStateResult,
				size = InputSize.Small,
				icon = Icon1,
				onActivated = UseResult
			}))
		})
	})
end)