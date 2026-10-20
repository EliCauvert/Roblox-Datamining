local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ReactUtilsModule = require(Parent.ReactUtils)
local UseAnimatedBindingFunction = require(Parent.ReactOtter).useAnimatedBinding
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local UseElevationModule = require(Foundation.Providers.Elevation.useElevation)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local ElevationLayerModule = require(Foundation.Enums.ElevationLayer)
local ConstantsModule = require(Foundation.Constants)
local FlagsModule = require(Foundation.Utility.Flags)
local SheetContextModule = require(script.Parent.SheetContext)
local TypesModule = require(script.Parent.Types)
local SheetTypeModule = require(script.Parent.SheetType)
local ChildrenHasFullBleedModule = require(script.Parent.childrenHasFullBleed)
local UseHardwareInsetsModule = require(script.Parent.useHardwareInsets)
local UseScreenHeightModule = require(script.Parent.useScreenHeight)
local ImageModule = require(Foundation.Components.Image)
local ViewModule = require(Foundation.Components.View)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local config = { defaultSnapPointIndex = 1, testId = "--foundation-sheet" }
local SHADOWIMAGE = ConstantsModule.SHADOW_IMAGE
local SHADOWSIZE = ConstantsModule.SHADOW_SIZE

local function _(p1, p2, p3, p4: number)
	local v1 = p1 - p3
	local v2 = 25.132741228718345 * p4
	local Exponential = math.exp(-v2)
	local v3 = p2 + 25.132741228718345 * v1
	
	return p3 + (v1 + v3 * p4) * Exponential, (p2 - v3 * v2) * Exponential
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseOverlayModule (copy), UseTokensModule (copy), UseElevationModule (copy), ElevationLayerModule (copy), UsePreferencesModule (copy), UseScreenHeightModule (copy), ReactModule (copy), FlagsModule (copy), UseHardwareInsetsModule (copy), UseAnimatedBindingFunction (copy), ChildrenHasFullBleedModule (copy), OtterModule (copy), ReactUtilsModule (copy), SheetTypeModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), ReactRobloxModule (copy), TypesModule (copy), DashModule (copy), SheetContextModule (copy), ElevationOwnerScope (copy), ImageModule (copy), SHADOWIMAGE (copy), SHADOWSIZE (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseOverlayModuleResult = UseOverlayModule()
	local UseTokensModuleResult = UseTokensModule()
	local UseElevationModuleResult = UseElevationModule(ElevationLayerModule.Sheet, { stackAboveOwner = false })
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local UseScreenHeightModuleResult: number = UseScreenHeightModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(if UseOverlayModuleResult then UseOverlayModuleResult.AbsoluteSize.Y else 0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult1 (copy)
		return { UseStateResult1 }
	end, { UseStateResult1 })
	local SnapPoints = WithDefaultsModuleResult.snapPoints or UseMemoResult
	local UseResult = ReactModule.useCallback(function(p3: number)
		-- upvalues: UseScreenHeightModuleResult (copy)
		return if p3 > 1 then p3 else p3 * UseScreenHeightModuleResult
	end, { UseScreenHeightModuleResult })
	local Smallest1 = 0
	local MinValue = 1e999
	
	for _, snapPoint in SnapPoints do
		local UseResultResult: number = UseResult(snapPoint)
		
		if Smallest1 < UseResultResult then
			Smallest1 = UseResultResult
		end
		if FlagsModule.FoundationSheetReversedContent then
			MinValue = math.min(MinValue, UseResultResult)
		end
	end
	Smallest1 = math.min(Smallest1, UseScreenHeightModuleResult)
	
	if UseStateResult > 0 then
		Smallest1 = math.min(Smallest1, UseStateResult)
	end
	if FlagsModule.FoundationSheetReversedContent then
		MinValue = math.min(MinValue, Smallest1)
	end
	local Bottom: number = UseHardwareInsetsModule(UseOverlayModuleResult).bottom
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(WithDefaultsModuleResult.onSnapPointChanged)
	UseRefResult2.current = WithDefaultsModuleResult.onSnapPointChanged
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(1, function()
		-- upvalues: UseRefResult1 (copy), WithDefaultsModuleResult (copy)
		if UseRefResult1.current then
			WithDefaultsModuleResult.onClose()
		end
	end)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(-Bottom)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(false)
	local UseBindingResult4, UseBindingResult2_3 = ReactModule.useBinding(false)
	local ChildrenHasFullBleedModuleResult = nil
	local UseBindingResult5 = nil
	local UseBindingResult2_4 = nil
	ChildrenHasFullBleedModuleResult = ChildrenHasFullBleedModule(WithDefaultsModuleResult.children)
	UseBindingResult5, UseBindingResult2_4 = ReactModule.useBinding(0)
	local UseRefResult3 = ReactModule.useRef(0)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseBindingResult6, UseBindingResult2_5 = ReactModule.useBinding(0)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseBindingResult7, UseBindingResult2_6 = ReactModule.useBinding(false)
	local UseRefResult6 = if FlagsModule.FoundationSheetReversedContent then ReactModule.useRef(false) else nil
	local UseResult1 = if FlagsModule.FoundationSheetReversedContent then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult6 (copy)
		UseRefResult6.current = Current
	end, {}) else nil
	local UseMemoResult1 = if FlagsModule.FoundationSheetReversedContent then ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseBindingResult (copy), UseTokensModuleResult (copy), Smallest1 (ref), MinValue (ref)
		return if WithDefaultsModuleResult.snapPoints == nil then nil else UseBindingResult:map(function(p3): number
			-- upvalues: UseTokensModuleResult (upval), Smallest1 (upval), MinValue (upval)
			return Smallest1 - math.clamp(p3 + UseTokensModuleResult.Margin.Small, MinValue, Smallest1)
		end)
	end, {
		WithDefaultsModuleResult.snapPoints == nil,
		UseBindingResult,
		MinValue,
		Smallest1,
		UseTokensModuleResult.Margin.Small
	}) else nil
	local UseRefResult7 = ReactModule.useRef(false)
	local UseRefResult8 = ReactModule.useRef(0)
	local UseRefResult9 = ReactModule.useRef(nil)
	local UseRefResult10 = ReactModule.useRef(false)
	local UseRefResult11 = ReactModule.useRef(0)
	local UseRefResult12 = nil
	local UseStateResult3 = nil
	local UseStateResult2_2 = nil
	local UseResult2 = nil
	UseRefResult12 = ReactModule.useRef(false)
	UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	UseResult2 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult12 (ref), UseStateResult2_2 (ref)
		if UseRefResult12.current ~= Current then
			UseRefResult12.current = Current
			UseStateResult2_2(Current)
			
			return
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult9 (copy), UseRefResult8 (copy), UseRefResult10 (copy)
		if UseRefResult9.current then
			UseRefResult9.current:Disconnect()
			UseRefResult9.current = nil
		end
		UseRefResult8.current = 0
		UseRefResult10.current = false
	end, {})
	local UseResult4 = ReactModule.useCallback(function(Y)
		-- upvalues: UseResult3 (copy), UseRefResult10 (copy), UseRefResult4 (copy), UseRefResult9 (copy), UseRefResult11 (copy)
		UseResult3()
		UseRefResult10.current = true
		
		if UseRefResult4.current then
			UseRefResult4.current:ResetScrollVelocity()
		end
		UseRefResult9.current = game:GetService("RunService").Heartbeat:Connect(function(DeltaTime: number)
			-- upvalues: UseRefResult4 (upval), UseRefResult10 (upval), UseResult3 (upval), UseRefResult11 (upval), Y (copy)
			if not UseRefResult4.current or not UseRefResult10.current then
				UseResult3()
				
				return
			end
			local Current = UseRefResult11.current
			local YDelta = UseRefResult4.current.CanvasPosition.Y - Y
			local ScaledDeltaTime = 25.132741228718345 * DeltaTime
			local Exponential = math.exp(-ScaledDeltaTime)
			local NewCurrent = Current + 25.132741228718345 * YDelta
			local NewY = Y + (YDelta + NewCurrent * DeltaTime) * Exponential
			UseRefResult11.current = (Current - NewCurrent * ScaledDeltaTime) * Exponential
			UseRefResult4.current.CanvasPosition = Vector2.new(0, NewY)
			
			if math.abs(Y - UseRefResult4.current.CanvasPosition.Y) < 0.5 and math.abs(UseRefResult11.current) < 1 then
				UseRefResult4.current.CanvasPosition = Vector2.new(0, Y)
				UseResult3()
			end
		end)
	end, { UseResult3 })
	local UseResult5 = ReactModule.useCallback(function(p3): number
		-- upvalues: UseResult (copy), Smallest1 (ref), Bottom (copy)
		return math.min(UseResult(p3), Smallest1) + Bottom
	end, { Bottom, UseResult, Smallest1 })
	local UseResult6 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseResult4 (copy), UseResult5 (copy), SnapPoints (copy), UseRefResult2 (copy)
		UseRefResult.current = Current
		UseResult4(UseResult5(SnapPoints[Current]))
		
		if UseRefResult2.current then
			UseRefResult2.current(SnapPoints[Current], Current)
		end
	end, { UseResult5, SnapPoints })
	local UseResult7 = ReactModule.useCallback(function(Current)
		-- upvalues: UseResult3 (copy), UseRefResult (copy), UseRefResult4 (copy), UseResult5 (copy), SnapPoints (copy), UseRefResult2 (copy)
		UseResult3()
		UseRefResult.current = Current
		
		if UseRefResult4.current then
			UseRefResult4.current.CanvasPosition = Vector2.new(0, UseResult5(SnapPoints[Current]))
		end
		if UseRefResult2.current then
			UseRefResult2.current(SnapPoints[Current], Current)
		end
	end, { UseResult3, UseResult5, SnapPoints })
	local UseResult8 = ReactModule.useCallback(function(p3)
		-- upvalues: UseRefResult1 (copy), ReducedMotion (copy), UseResult3 (copy), UseRefResult4 (copy), UseAnimatedBindingResult2 (copy), OtterModule (upval), UseRefResult11 (copy), UseRefResult8 (copy), UseResult4 (copy), UseTokensModuleResult (copy)
		if UseRefResult1.current then return end
		if not ReducedMotion or p3 then
			UseRefResult11.current = -UseRefResult8.current
			UseResult4(0)
			UseAnimatedBindingResult2(OtterModule.ease(1, { duration = UseTokensModuleResult.Time.Time_100 }))
			UseRefResult1.current = true
			
			return
		end
		UseRefResult1.current = true
		UseResult3()
		
		if UseRefResult4.current then
			UseRefResult4.current.CanvasPosition = Vector2.new(0, 0)
		end
		UseAnimatedBindingResult2((OtterModule.instant(1)))
	end, { UseResult4, UseResult3, ReducedMotion })
	local UseResult9 = ReactModule.useCallback(function(): boolean
		-- upvalues: Smallest1 (ref), Bottom (copy), UseRefResult3 (copy)
		return math.floor(Smallest1 + Bottom) - 0.01 <= UseRefResult3.current
	end, { Smallest1, Bottom })
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: UseBindingResult6 (copy), UseResult9 (copy), FlagsModule (upval), UseRefResult6 (copy), UseRefResult7 (copy), UseBindingResult7 (copy), UseRefResult5 (copy), UseRefResult8 (copy), UseBindingResult2_6 (copy)
		local IsValueBelow = UseBindingResult6:getValue() <= 0
		local UseResultResult = UseResult9()
		
		if FlagsModule.FoundationSheetReversedContent and UseRefResult6.current then
			if not UseRefResult7.current or UseBindingResult7:getValue() or UseResultResult then
				local Current = UseRefResult5.current
				local NoCurrent: boolean = Current == nil or Current.AbsoluteCanvasSize.Y - Current.AbsoluteWindowSize.Y - 1 <= UseBindingResult6:getValue()
				local Current1: number = UseRefResult8.current
				UseBindingResult2_6(not (UseRefResult7.current and (Current1 > 0 and IsValueBelow or Current1 < 0 and (NoCurrent and not UseResultResult))))
				
				return
			end
			return
		elseif not UseResultResult and UseRefResult8.current < 0 or UseRefResult8.current > 0 and IsValueBelow and UseRefResult7.current then
			UseBindingResult2_6(false)
			
			return
		else
			if (UseRefResult8.current < 0 or UseRefResult8.current == 0) and UseResultResult then
				UseBindingResult2_6(true)
			end
		end
	end, { UseResult9 })
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult8 (copy), UseRefResult3 (copy), SnapPoints (copy), UseResult5 (copy), UseRefResult7 (copy), UseRefResult11 (copy), UseResult8 (copy), UseResult6 (copy)
		local Current: number = UseRefResult8.current
		local CurrentDelta = UseRefResult3.current - Current / 2.35
		local List = { { index = 0, position = 0 } }
		
		for Index, snapPoint in SnapPoints do
			table.insert(List, { index = Index, position = UseResult5(snapPoint) })
		end
		table.sort(List, function(A, B): boolean
			-- upvalues: CurrentDelta (copy)
			return math.abs(A.position - CurrentDelta) < math.abs(B.position - CurrentDelta)
		end)
		local Entry = List[1]
		
		if not UseRefResult7.current then
			UseRefResult11.current = -Current
			
			if Entry.index == 0 then
				UseResult8(true)
				
				return
			end
			UseResult6(Entry.index)
		end
	end, { SnapPoints, UseResult6, UseResult5, UseResult8 })
	ReactModule.useEffect(function()
		-- upvalues: UseOverlayModuleResult (copy), ReducedMotion (copy), UseResult7 (copy), WithDefaultsModuleResult (copy), UseAnimatedBindingResult2 (copy), OtterModule (upval), UseResult6 (copy), UseTokensModuleResult (copy), UseResult (copy), SnapPoints (copy), Smallest1 (ref), UseBindingResult2_6 (copy), FlagsModule (upval), UseRefResult6 (copy), UseResult3 (copy)
		if UseOverlayModuleResult then
			if ReducedMotion then
				UseResult7(WithDefaultsModuleResult.defaultSnapPointIndex)
				UseAnimatedBindingResult2(OtterModule.instant(0))
			else
				UseResult6(WithDefaultsModuleResult.defaultSnapPointIndex)
				UseAnimatedBindingResult2(OtterModule.ease(0, { duration = UseTokensModuleResult.Time.Time_100 }))
			end
			local IsUseResultResultAbove = UseResult(SnapPoints[WithDefaultsModuleResult.defaultSnapPointIndex]) >= Smallest1
			UseBindingResult2_6(if FlagsModule.FoundationSheetReversedContent then IsUseResultResultAbove or UseRefResult6.current else IsUseResultResultAbove)
		end
		return function()
			-- upvalues: UseResult3 (upval)
			UseResult3()
		end
	end, {
		UseOverlayModuleResult, SnapPoints,
		WithDefaultsModuleResult.defaultSnapPointIndex, UseResult6, UseResult,
		UseResult7, ReducedMotion
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseOverlayModuleResult (copy), UseStateResult2 (copy)
		if not UseOverlayModuleResult then return end
		UseStateResult2(UseOverlayModuleResult.AbsoluteSize.Y)
		local Connection = UseOverlayModuleResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UseOverlayModuleResult (upval)
			UseStateResult2(UseOverlayModuleResult.AbsoluteSize.Y)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseOverlayModuleResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult8 (copy), UseRefResult7 (copy), UseResult2 (ref), UseResult10 (copy), UseResult3 (copy), UseRefResult4 (copy), FlagsModule (upval), UseRefResult6 (copy), UseBindingResult2_6 (copy), UseResult9 (copy), UseRefResult1 (copy), UseResult11 (copy)
		local TouchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, TotalTranslation, Velocity, _)
			-- upvalues: UseRefResult8 (upval), UseRefResult7 (upval), UseResult2 (upval), UseResult10 (upval)
			UseRefResult8.current = Velocity.Y
			
			if UseRefResult7.current and TotalTranslation and math.abs(TotalTranslation.X) < math.abs(TotalTranslation.Y) then
				UseResult2(true)
			end
			UseResult10()
		end)
		local InputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function()
			-- upvalues: UseRefResult7 (upval), UseRefResult8 (upval), UseResult2 (upval), UseResult3 (upval)
			UseRefResult7.current = true
			UseRefResult8.current = 0
			UseResult2(false)
			UseResult3()
		end)
		local InputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function()
			-- upvalues: UseRefResult7 (upval), UseResult2 (upval), UseRefResult4 (upval), UseRefResult8 (upval), FlagsModule (upval), UseRefResult6 (upval), UseBindingResult2_6 (upval), UseResult9 (upval), UseRefResult1 (upval), UseResult11 (upval)
			if UseRefResult7.current == false then return end
			UseRefResult7.current = false
			UseResult2(false)
			UseRefResult8.current = if UseRefResult4.current then UseRefResult4.current:GetScrollVelocity().Y else 0
			
			if FlagsModule.FoundationSheetReversedContent and UseRefResult6.current then
				UseBindingResult2_6(true)
			end
			if UseResult9() or UseRefResult1.current then
				UseBindingResult2_6(true)
				
				return
			else
				UseResult11()
			end
		end)
		
		return function()
			-- upvalues: UseResult2 (upval), TouchPanConnection (copy), InputBeganConnection (copy), InputEndedConnection (copy)
			UseResult2(false)
			TouchPanConnection:Disconnect()
			InputBeganConnection:Disconnect()
			InputEndedConnection:Disconnect()
		end
	end, {
		UseOverlayModuleResult, UseResult11, UseResult10, UseResult3, UseResult9,
		UseResult2
	})
	local UseRefResult13 = ReactModule.useRef(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(p2, UseStateResult2_4)
	ReactModule.useImperativeHandle(WithDefaultsModuleResult.sheetRef, function()
		-- upvalues: UseResult8 (copy)
		return { close = UseResult8 }
	end, {})
	local UseMemoResult11 = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult1 (copy), UseBindingResult2_1 (copy), UseBindingResult3 (copy), UseBindingResult2_2 (copy), UseBindingResult (copy), UseBindingResult2 (copy), Bottom (copy), UseBindingResult7 (copy), UseBindingResult6 (copy), UseRefResult5 (copy), UseBindingResult2_5 (copy), UseResult10 (copy), UseBindingResult4 (copy), UseBindingResult2_3 (copy), ChildrenHasFullBleedModuleResult (ref), UseBindingResult5 (ref), UseBindingResult2_4 (ref), UseResult8 (copy), SheetTypeModule (upval), UseStateResult5 (copy), WithDefaultsModuleResult (copy), UseRefResult13 (copy), UseStateResult4 (copy), UseStateResult2_3 (copy), UseStateResult3 (ref), UseMemoResult1 (copy), UseResult1 (copy)
		return {
			bottomPadding = 200,
			hasRadius = true,
			actionsHeight = UseBindingResult1,
			setActionsHeight = UseBindingResult2_1,
			hasActionsDivider = UseBindingResult3,
			setHasActionsDivider = UseBindingResult2_2,
			sheetHeightAvailable = UseBindingResult,
			setSheetHeightAvailable = UseBindingResult2,
			safeAreaPadding = Bottom,
			innerScrollingEnabled = UseBindingResult7,
			innerScrollY = UseBindingResult6,
			innerScrollingRef = UseRefResult5,
			setInnerScrollY = function(p3)
				-- upvalues: UseBindingResult2_5 (upval), UseResult10 (upval)
				UseBindingResult2_5(p3)
				UseResult10()
			end,
			hasHeader = UseBindingResult4,
			setHasHeader = UseBindingResult2_3,
			hasFullBleed = ChildrenHasFullBleedModuleResult,
			fullBleedHeight = UseBindingResult5,
			setFullBleedHeight = UseBindingResult2_4,
			closeSheet = UseResult8,
			sheetType = SheetTypeModule.Bottom,
			innerSurface = UseStateResult5,
			testId = WithDefaultsModuleResult.testId,
			closeAffordanceRef = UseRefResult13,
			contentStartRef = UseStateResult4,
			setContentStartRef = UseStateResult2_3,
			isVerticalSheetGesture = UseStateResult3,
			contentRevealOffset = UseMemoResult1,
			setIsContentReversed = UseResult1
		}
	end, {
		WithDefaultsModuleResult.testId, UseResult8, Bottom, UseResult10,
		UseStateResult5, UseRefResult13, UseStateResult4,
		ChildrenHasFullBleedModuleResult, UseStateResult3, UseMemoResult1, UseResult1
	})
	local Element = ReactModule.createElement(ViewModule, {
		ZIndex = 5,
		tag = "align-y-center size-1000-100 padding-y-small radius-small",
		backgroundStyle = UseTokensModuleResult.Color.Content.Muted,
		Position = UDim2.new(0.5, 0, 0, if ChildrenHasFullBleedModuleResult then UseTokensModuleResult.Padding.Small else -UseTokensModuleResult.Padding.XSmall),
		AnchorPoint = Vector2.new(0.5, 0),
		testId = `{WithDefaultsModuleResult.testId}--gripper`
	}, {
		TouchTarget = ReactModule.createElement(ViewModule, {
			tag = "size-1000-600",
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			onActivated = function()
				-- upvalues: UseRefResult7 (copy), FlagsModule (upval), UseRefResult6 (copy), UseRefResult5 (copy), UseBindingResult2_5 (copy), SnapPoints (copy), UseRefResult (copy), ReducedMotion (copy), UseResult7 (copy), UseResult6 (copy), UseResult (copy), Smallest1 (ref), UseBindingResult2_6 (copy), UseResult8 (copy)
				UseRefResult7.current = false
				
				if FlagsModule.FoundationSheetReversedContent and UseRefResult6.current and UseRefResult5.current then
					local Current = UseRefResult5.current
					local Largest = math.max(0, Current.AbsoluteCanvasSize.Y - Current.AbsoluteWindowSize.Y)
					UseBindingResult2_5(Largest)
					Current.CanvasPosition = Vector2.new(0, Largest)
					Current:ResetScrollVelocity()
				elseif UseRefResult5.current then
					UseBindingResult2_5(0)
					UseRefResult5.current.CanvasPosition = Vector2.new(0, 0)
					UseRefResult5.current:ResetScrollVelocity()
				end
				if #SnapPoints <= 1 then
					UseResult8()
					
					return
				end
				local NewCurrent = UseRefResult.current % #SnapPoints + 1
				
				if ReducedMotion then
					UseResult7(NewCurrent)
				else
					UseResult6(NewCurrent)
				end
				local IsUseResultResultAbove = UseResult(SnapPoints[NewCurrent]) >= Smallest1
				UseBindingResult2_6(if FlagsModule.FoundationSheetReversedContent then IsUseResultResultAbove or UseRefResult6.current else IsUseResultResultAbove)
			end
		})
	})
	
	return UseOverlayModuleResult and ReactRobloxModule.createPortal(ReactModule.createElement(ViewModule, {
		tag = "size-full",
		ZIndex = UseElevationModuleResult.zIndex,
		ref = UseComposedRefResult,
		selection = TypesModule.nonSelectable,
		selectionGroup = TypesModule.isolatedSelectionGroup,
		testId = `{WithDefaultsModuleResult.testId}--surface`
	}, ReactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = UDim2.new(1, 0, 1, Smallest1 + Bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = UseRefResult4,
		[ReactModule.Change.CanvasPosition] = function(ScrollFrame)
			-- upvalues: UseRefResult3 (copy), FlagsModule (upval), UseMemoResult1 (copy), UseBindingResult2 (copy), Bottom (copy), UseTokensModuleResult (copy), UseRefResult5 (copy), UseRefResult6 (copy), UseResult10 (copy), UseResult8 (copy)
			UseRefResult3.current = ScrollFrame.CanvasPosition.Y
			local Value = if FlagsModule.FoundationSheetReversedContent and UseMemoResult1 then UseMemoResult1:getValue() else nil
			UseBindingResult2(UseRefResult3.current - Bottom - UseTokensModuleResult.Margin.Small)
			
			if FlagsModule.FoundationSheetReversedContent and UseMemoResult1 and Value then
				local Current = UseRefResult5.current
				local ValueDelta = UseMemoResult1:getValue() - Value
				
				if UseRefResult6.current and Current and ValueDelta ~= 0 then
					Current.CanvasPosition = Vector2.new(0, Current.CanvasPosition.Y + ValueDelta)
				end
			end
			UseResult10()
			
			if UseRefResult3.current <= 0 then
				UseResult8()
			end
		end
	}, {
		SheetContainer = ReactModule.createElement(ViewModule, {
			ZIndex = 3,
			Size = UDim2.new(1, 0, 1, 200 - Smallest1 - Bottom),
			Position = UDim2.new(0, 0, 1, -Smallest1)
		}, {
			Sheet = ReactModule.createElement(ViewModule, {
				Size = if WithDefaultsModuleResult.snapPoints == nil then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, Smallest1 + 200),
				AutomaticSize = if WithDefaultsModuleResult.snapPoints == nil then Enum.AutomaticSize.Y else nil,
				onAbsoluteSizeChanged = if WithDefaultsModuleResult.snapPoints == nil then function(Frame)
					-- upvalues: UseStateResult2_1 (copy)
					UseStateResult2_1(Frame.AbsoluteSize.Y - 200)
				end else nil,
				stateLayer = { affordance = StateLayerAffordanceModule.None },
				onActivated = DashModule.noop,
				testId = WithDefaultsModuleResult.testId,
				tag = {
					["col items-center radius-large clip bg-surface-100"] = true,
					["padding-top-medium"] = not ChildrenHasFullBleedModuleResult
				}
			}, {
				GripperContainer = ReactModule.createElement("Folder", nil, { Gripper = Element }),
				Content = ReactModule.createElement(SheetContextModule.Provider, { value = UseMemoResult11 }, ReactModule.createElement(ElevationOwnerScope, { owner = UseElevationModuleResult }, WithDefaultsModuleResult.children))
			})
		}),
		Shadow = if FlagsModule.FoundationBottomSheetOverlayShadow then ReactModule.createElement(ViewModule, {
			tag = "shadow-overlay-300 radius-large",
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, Smallest1 + 200),
			Position = UDim2.new(0, 0, 1, -Smallest1),
			testId = `{WithDefaultsModuleResult.testId}--shadow`
		}) else ReactModule.createElement(ImageModule, {
			ZIndex = 2,
			Image = SHADOWIMAGE,
			Size = UDim2.new(1, SHADOWSIZE * 2, 0, Smallest1 + 200 + SHADOWSIZE * 2),
			Position = UDim2.new(-SHADOWSIZE, 0, 1, -Smallest1 - SHADOWSIZE),
			slice = {
				scale = 2,
				center = Rect.new(SHADOWSIZE, SHADOWSIZE, SHADOWSIZE + 1, SHADOWSIZE + 1)
			},
			imageStyle = UseTokensModuleResult.Color.Extended.Black.Black_10
		}),
		Backdrop = ReactModule.createElement(ViewModule, {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 2),
			Position = UDim2.fromScale(0, -0.5),
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			backgroundStyle = UseAnimatedBindingResult:map(function(Alpha: number)
				-- upvalues: UseTokensModuleResult (copy)
				return {
					Color3 = UseTokensModuleResult.Color.Common.Backdrop.Color3,
					Transparency = math.lerp(UseTokensModuleResult.Color.Common.Backdrop.Transparency, 1, Alpha)
				}
			end),
			onActivated = function()
				-- upvalues: UseResult8 (copy)
				UseResult8()
			end,
			testId = `{WithDefaultsModuleResult.testId}--backdrop`
		})
	})), UseOverlayModuleResult)
end))