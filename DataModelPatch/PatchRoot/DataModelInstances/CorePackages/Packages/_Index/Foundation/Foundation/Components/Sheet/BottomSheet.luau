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
local SheetContextModule = require(script.Parent.SheetContext)
local TypesModule = require(script.Parent.Types)
local SheetTypeModule = require(script.Parent.SheetType)
local ChildrenHasFullBleedModule = require(script.Parent.childrenHasFullBleed)
local UseHardwareInsetsModule = require(script.Parent.useHardwareInsets)
local UseScreenHeightModule = require(script.Parent.useScreenHeight)
local FlagsModule = require(Foundation.Utility.Flags)
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
	-- upvalues: WithDefaultsModule (copy), config (copy), UseOverlayModule (copy), UseTokensModule (copy), UseElevationModule (copy), ElevationLayerModule (copy), UsePreferencesModule (copy), UseScreenHeightModule (copy), FlagsModule (copy), ReactModule (copy), UseHardwareInsetsModule (copy), UseAnimatedBindingFunction (copy), ChildrenHasFullBleedModule (copy), OtterModule (copy), ReactUtilsModule (copy), SheetTypeModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), ReactRobloxModule (copy), TypesModule (copy), DashModule (copy), SheetContextModule (copy), ElevationOwnerScope (copy), ImageModule (copy), SHADOWIMAGE (copy), SHADOWSIZE (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseOverlayModuleResult = UseOverlayModule()
	local UseTokensModuleResult = UseTokensModule()
	local UseElevationModuleResult = UseElevationModule(ElevationLayerModule.Sheet, { stackAboveOwner = false })
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local UseScreenHeightModuleResult: number = UseScreenHeightModule()
	local v1: number? = nil
	local Callback = nil
	
	if FlagsModule.FoundationBottomSheetCapToOverlayHeight then
		v1, Callback = ReactModule.useState(if UseOverlayModuleResult then UseOverlayModuleResult.AbsoluteSize.Y else 0)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy)
		return { UseStateResult }
	end, { UseStateResult })
	local SnapPoints = WithDefaultsModuleResult.snapPoints or UseMemoResult
	local UseResult = ReactModule.useCallback(function(p3: number)
		-- upvalues: UseScreenHeightModuleResult (copy)
		return if p3 > 1 then p3 else p3 * UseScreenHeightModuleResult
	end, { UseScreenHeightModuleResult })
	local Smallest1 = 0
	
	for _, snapPoint in SnapPoints do
		local UseResultResult = UseResult(snapPoint)
		
		if Smallest1 < UseResultResult then
			Smallest1 = UseResultResult
		end
	end
	Smallest1 = math.min(Smallest1, UseScreenHeightModuleResult)
	
	if FlagsModule.FoundationBottomSheetCapToOverlayHeight and v1 > 0 then
		Smallest1 = math.min(Smallest1, v1)
	end
	local Bottom: number = UseHardwareInsetsModule(UseOverlayModuleResult).bottom
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = if FlagsModule.FoundationBottomSheetOnSnapPointChanged then ReactModule.useRef(WithDefaultsModuleResult.onSnapPointChanged) else nil
	
	if FlagsModule.FoundationBottomSheetOnSnapPointChanged then
		UseRefResult2.current = WithDefaultsModuleResult.onSnapPointChanged
	end
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
	local v2 = nil
	local v3 = nil
	local v4 = nil
	
	if FlagsModule.FoundationSheetFullBleed then
		v2 = ChildrenHasFullBleedModule(WithDefaultsModuleResult.children)
		v3, v64 = ReactModule.useBinding(0)
	end
	local UseRefResult3 = ReactModule.useRef(0)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseBindingResult5, UseBindingResult2_4 = ReactModule.useBinding(0)
	local UseRefResult5 = if FlagsModule.FoundationBottomSheetInnerScrollingSync then ReactModule.useRef(nil) else nil
	local UseBindingResult6, UseBindingResult2_5 = ReactModule.useBinding(false)
	local UseRefResult6 = ReactModule.useRef(false)
	local UseRefResult7 = ReactModule.useRef(0)
	local UseRefResult8 = ReactModule.useRef(nil)
	local UseRefResult9 = ReactModule.useRef(false)
	local UseRefResult10 = ReactModule.useRef(0)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult8 (copy), UseRefResult7 (copy), UseRefResult9 (copy)
		if UseRefResult8.current then
			UseRefResult8.current:Disconnect()
			UseRefResult8.current = nil
		end
		UseRefResult7.current = 0
		UseRefResult9.current = false
	end, {})
	local UseResult2 = ReactModule.useCallback(function(Y)
		-- upvalues: UseResult1 (copy), UseRefResult9 (copy), FlagsModule (upval), UseRefResult4 (copy), UseRefResult8 (copy), UseRefResult10 (copy)
		UseResult1()
		UseRefResult9.current = true
		
		if FlagsModule.FoundationBottomSheetImproveSpring and UseRefResult4.current then
			UseRefResult4.current:ResetScrollVelocity()
		end
		local Y1 = if UseRefResult4.current then UseRefResult4.current.CanvasPosition.Y else 0
		UseRefResult8.current = game:GetService("RunService").Heartbeat:Connect(function(DeltaTime: number)
			-- upvalues: UseRefResult4 (upval), UseRefResult9 (upval), UseResult1 (upval), FlagsModule (upval), UseRefResult10 (upval), Y (copy), Y1 (ref)
			if not UseRefResult4.current or not UseRefResult9.current then
				UseResult1()
				
				return
			end
			local Y2 = UseRefResult4.current.CanvasPosition.Y
			local YDelta = nil
			
			if FlagsModule.FoundationBottomSheetImproveSpring then
				local Current = UseRefResult10.current
				local YDelta1 = Y2 - Y
				local ScaledDeltaTime = 25.132741228718345 * DeltaTime
				local Exponential = math.exp(-ScaledDeltaTime)
				local NewCurrent = Current + 25.132741228718345 * YDelta1
				local NewY = Y + (YDelta1 + NewCurrent * DeltaTime) * Exponential
				UseRefResult10.current = (Current - NewCurrent * ScaledDeltaTime) * Exponential
				UseRefResult4.current.CanvasPosition = Vector2.new(0, NewY)
				Y1 = UseRefResult4.current.CanvasPosition.Y
				YDelta = Y - UseRefResult4.current.CanvasPosition.Y
			else
				YDelta = Y - Y2
				local ScaledYDelta = YDelta * 18 * 18
				UseRefResult10.current -= (Y2 - Y1) / DeltaTime
				local Smallest = math.min(DeltaTime, 0.03333333333333333)
				UseRefResult10.current += (ScaledYDelta + -UseRefResult10.current * 2 * 0.9 * 18) * Smallest
				UseRefResult4.current.CanvasPosition = Vector2.new(0, Y2 + UseRefResult10.current * Smallest)
				Y1 = UseRefResult4.current.CanvasPosition.Y
			end
			if math.abs(YDelta) < 0.5 and math.abs(UseRefResult10.current) < 1 then
				UseRefResult4.current.CanvasPosition = Vector2.new(0, Y)
				UseResult1()
			end
		end)
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function(p3)
		-- upvalues: FlagsModule (upval), UseResult (copy), Smallest1 (ref), Bottom (copy)
		return if FlagsModule.FoundationBottomSheetCapToOverlayHeight then math.min(UseResult(p3), Smallest1) + Bottom else UseResult(p3) + Bottom
	end, {
		Bottom,
		UseResult,
		if FlagsModule.FoundationBottomSheetCapToOverlayHeight then Smallest1 else nil
	})
	local UseResult4 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseResult2 (copy), UseResult3 (copy), SnapPoints (copy), FlagsModule (upval), UseRefResult2 (copy)
		UseRefResult.current = Current
		UseResult2(UseResult3(SnapPoints[Current]))
		
		if FlagsModule.FoundationBottomSheetOnSnapPointChanged and UseRefResult2.current then
			UseRefResult2.current(SnapPoints[Current], Current)
		end
	end, { UseResult3, SnapPoints })
	local UseResult5 = ReactModule.useCallback(function(Current)
		-- upvalues: UseResult1 (copy), UseRefResult (copy), UseRefResult4 (copy), UseResult3 (copy), SnapPoints (copy), FlagsModule (upval), UseRefResult2 (copy)
		UseResult1()
		UseRefResult.current = Current
		
		if UseRefResult4.current then
			UseRefResult4.current.CanvasPosition = Vector2.new(0, UseResult3(SnapPoints[Current]))
		end
		if FlagsModule.FoundationBottomSheetOnSnapPointChanged and UseRefResult2.current then
			UseRefResult2.current(SnapPoints[Current], Current)
		end
	end, { UseResult1, UseResult3, SnapPoints })
	local UseResult6 = ReactModule.useCallback(function(p3)
		-- upvalues: UseRefResult1 (copy), ReducedMotion (copy), UseResult1 (copy), UseRefResult4 (copy), UseAnimatedBindingResult2 (copy), OtterModule (upval), UseRefResult10 (copy), UseRefResult7 (copy), UseResult2 (copy), UseTokensModuleResult (copy)
		if UseRefResult1.current then return end
		if not ReducedMotion or p3 then
			UseRefResult10.current = -UseRefResult7.current
			UseResult2(0)
			UseAnimatedBindingResult2(OtterModule.ease(1, { duration = UseTokensModuleResult.Time.Time_100 }))
			UseRefResult1.current = true
			
			return
		end
		UseRefResult1.current = true
		UseResult1()
		
		if UseRefResult4.current then
			UseRefResult4.current.CanvasPosition = Vector2.new(0, 0)
		end
		UseAnimatedBindingResult2((OtterModule.instant(1)))
	end, { UseResult2, UseResult1, ReducedMotion })
	local UseResult7 = if FlagsModule.FoundationBottomSheetScrollAtMaxTolerance then ReactModule.useCallback(function(): boolean
		-- upvalues: Smallest1 (ref), Bottom (copy), UseRefResult3 (copy)
		return math.floor(Smallest1 + Bottom) - 0.01 <= UseRefResult3.current
	end, { Smallest1, Bottom }) else nil
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseBindingResult5 (copy), FlagsModule (upval), UseResult7 (copy), UseRefResult3 (copy), Smallest1 (ref), Bottom (copy), UseRefResult7 (copy), UseRefResult6 (copy), UseBindingResult2_5 (copy)
		local IsValueBelow = UseBindingResult5:getValue() <= 0
		local UseResultResult = if FlagsModule.FoundationBottomSheetScrollAtMaxTolerance then UseResult7() else (if FlagsModule.FoundationBottomSheetImproveSpring then math.floor(Smallest1 + Bottom) else math.round(Smallest1 + Bottom)) <= UseRefResult3.current
		local IsCurrentBelow: boolean = not UseResultResult and UseRefResult7.current < 0
		
		if FlagsModule.FoundationBottomSheetInnerScrollingSync and IsCurrentBelow or UseRefResult7.current > 0 and IsValueBelow and UseRefResult6.current then
			UseBindingResult2_5(false)
			
			return
		end
		if (UseRefResult7.current < 0 or FlagsModule.FoundationBottomSheetImproveSpring and UseRefResult7.current == 0) and UseResultResult then
			UseBindingResult2_5(true)
		end
	end, if FlagsModule.FoundationBottomSheetScrollAtMaxTolerance then { UseResult7 } else { Smallest1, Bottom })
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult7 (copy), UseRefResult3 (copy), SnapPoints (copy), UseResult3 (copy), UseRefResult6 (copy), UseRefResult10 (copy), UseResult6 (copy), UseResult4 (copy)
		local Current: number = UseRefResult7.current
		local CurrentDelta = UseRefResult3.current - Current / 2.35
		local List = { { index = 0, position = 0 } }
		
		for Index, snapPoint in SnapPoints do
			table.insert(List, { index = Index, position = UseResult3(snapPoint) })
		end
		table.sort(List, function(A, B): boolean
			-- upvalues: CurrentDelta (copy)
			return math.abs(A.position - CurrentDelta) < math.abs(B.position - CurrentDelta)
		end)
		local Entry = List[1]
		
		if not UseRefResult6.current then
			UseRefResult10.current = -Current
			
			if Entry.index == 0 then
				UseResult6(true)
				
				return
			end
			UseResult4(Entry.index)
		end
	end, { SnapPoints, UseResult4, UseResult3, UseResult6 })
	ReactModule.useEffect(function()
		-- upvalues: UseOverlayModuleResult (copy), ReducedMotion (copy), UseResult5 (copy), WithDefaultsModuleResult (copy), UseAnimatedBindingResult2 (copy), OtterModule (upval), UseResult4 (copy), UseTokensModuleResult (copy), FlagsModule (upval), UseResult (copy), SnapPoints (copy), Smallest1 (ref), UseBindingResult2_5 (copy), UseResult1 (copy)
		if UseOverlayModuleResult then
			if ReducedMotion then
				UseResult5(WithDefaultsModuleResult.defaultSnapPointIndex)
				UseAnimatedBindingResult2(OtterModule.instant(0))
			else
				UseResult4(WithDefaultsModuleResult.defaultSnapPointIndex)
				UseAnimatedBindingResult2(OtterModule.ease(0, { duration = UseTokensModuleResult.Time.Time_100 }))
			end
			local IsSmallestBelow: boolean = if FlagsModule.FoundationBottomSheetCapToOverlayHeight then Smallest1 <= UseResult(SnapPoints[WithDefaultsModuleResult.defaultSnapPointIndex]) else UseResult(SnapPoints[WithDefaultsModuleResult.defaultSnapPointIndex]) == Smallest1
			
			if FlagsModule.FoundationBottomSheetInnerScrollingSync then
				UseBindingResult2_5(IsSmallestBelow)
			elseif IsSmallestBelow then
				UseBindingResult2_5(true)
			end
		end
		return function()
			-- upvalues: UseResult1 (upval)
			UseResult1()
		end
	end, {
		UseOverlayModuleResult, SnapPoints,
		WithDefaultsModuleResult.defaultSnapPointIndex, UseResult4, UseResult,
		UseResult5, ReducedMotion
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult7 (copy), UseResult8 (copy), UseRefResult6 (copy), UseResult1 (copy), FlagsModule (upval), UseRefResult4 (copy), UseResult7 (copy), UseRefResult3 (copy), Smallest1 (ref), Bottom (copy), UseRefResult1 (copy), UseBindingResult2_5 (copy), UseResult9 (copy)
		local TouchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, _, Velocity, _)
			-- upvalues: UseRefResult7 (upval), UseResult8 (upval)
			UseRefResult7.current = Velocity.Y
			UseResult8()
		end)
		local InputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function()
			-- upvalues: UseRefResult6 (upval), UseRefResult7 (upval), UseResult1 (upval)
			UseRefResult6.current = true
			UseRefResult7.current = 0
			UseResult1()
		end)
		local InputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function()
			-- upvalues: UseRefResult6 (upval), FlagsModule (upval), UseRefResult4 (upval), UseRefResult7 (upval), UseResult7 (upval), UseRefResult3 (upval), Smallest1 (upval), Bottom (upval), UseRefResult1 (upval), UseBindingResult2_5 (upval), UseResult9 (upval)
			if UseRefResult6.current == false then return end
			UseRefResult6.current = false
			
			if FlagsModule.FoundationBottomSheetImproveSpring then
				UseRefResult7.current = if UseRefResult4.current then UseRefResult4.current:GetScrollVelocity().Y else 0
				
				if (if FlagsModule.FoundationBottomSheetScrollAtMaxTolerance then UseResult7() else UseRefResult3.current >= math.floor(Smallest1 + Bottom)) or UseRefResult1.current then
					UseBindingResult2_5(true)
					
					return
				end
			else
				local v5 = nil
				
				if UseRefResult4.current then
					local Success, Result = pcall(function(): boolean
						-- upvalues: UseRefResult4 (upval)
						return UseRefResult4.current:GetScrollVelocity().Y == 0
					end)
					
					if Success then
						v5 = Result
					end
				end
				if v5 or UseRefResult1.current then
					UseBindingResult2_5(true)
					
					return
				end
			end
			UseResult9()
		end)
		
		return function()
			-- upvalues: TouchPanConnection (copy), InputBeganConnection (copy), InputEndedConnection (copy)
			TouchPanConnection:Disconnect()
			InputBeganConnection:Disconnect()
			InputEndedConnection:Disconnect()
		end
	end, if FlagsModule.FoundationBottomSheetScrollAtMaxTolerance then {
		UseOverlayModuleResult,
		UseResult9,
		UseResult8,
		UseResult1,
		UseResult7
	} else {
		UseOverlayModuleResult,
		UseResult9,
		UseResult8,
		UseResult1
	})
	local UseRefResult11 = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(p2, UseStateResult2_2)
	ReactModule.useImperativeHandle(WithDefaultsModuleResult.sheetRef, function()
		-- upvalues: UseResult6 (copy)
		return { close = UseResult6 }
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult1 (copy), UseBindingResult2_1 (copy), UseBindingResult3 (copy), UseBindingResult2_2 (copy), UseBindingResult (copy), UseBindingResult2 (copy), Bottom (copy), UseBindingResult6 (copy), UseBindingResult5 (copy), FlagsModule (upval), UseRefResult5 (copy), UseBindingResult2_4 (copy), UseResult8 (copy), UseBindingResult4 (copy), UseBindingResult2_3 (copy), v2 (ref), v3 (ref), v4 (ref), UseResult6 (copy), SheetTypeModule (upval), UseStateResult3 (copy), WithDefaultsModuleResult (copy), UseRefResult11 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy)
		return {
			bottomPadding = 200,
			actionsHeight = UseBindingResult1,
			setActionsHeight = UseBindingResult2_1,
			hasActionsDivider = UseBindingResult3,
			setHasActionsDivider = UseBindingResult2_2,
			sheetHeightAvailable = UseBindingResult,
			setSheetHeightAvailable = UseBindingResult2,
			safeAreaPadding = Bottom,
			innerScrollingEnabled = UseBindingResult6,
			innerScrollY = UseBindingResult5,
			innerScrollingRef = if FlagsModule.FoundationBottomSheetInnerScrollingSync then UseRefResult5 else nil,
			setInnerScrollY = function(p3)
				-- upvalues: UseBindingResult2_4 (upval), UseResult8 (upval)
				UseBindingResult2_4(p3)
				UseResult8()
			end,
			hasHeader = UseBindingResult4,
			setHasHeader = UseBindingResult2_3,
			hasFullBleed = if FlagsModule.FoundationSheetFullBleed then v2 else nil,
			fullBleedHeight = if FlagsModule.FoundationSheetFullBleed then v3 else nil,
			setFullBleedHeight = if FlagsModule.FoundationSheetFullBleed then v4 else nil,
			closeSheet = UseResult6,
			hasRadius = if FlagsModule.FoundationSheetFullBleed then true else nil,
			sheetType = SheetTypeModule.Bottom,
			innerSurface = UseStateResult3,
			testId = WithDefaultsModuleResult.testId,
			closeAffordanceRef = UseRefResult11,
			contentStartRef = UseStateResult1,
			setContentStartRef = UseStateResult2_1
		}
	end, {
		WithDefaultsModuleResult.testId, UseResult6, Bottom, UseResult8,
		UseStateResult3, UseRefResult11, UseStateResult1, v2
	})
	local Element = ReactModule.createElement(ViewModule, {
		ZIndex = 3,
		tag = "align-y-center size-1000-100 padding-y-small radius-small",
		backgroundStyle = UseTokensModuleResult.Color.Content.Muted,
		Position = if FlagsModule.FoundationSheetFullBleed then UDim2.new(0.5, 0, 0, if v2 then UseTokensModuleResult.Padding.Small else -UseTokensModuleResult.Padding.XSmall) else nil,
		AnchorPoint = if FlagsModule.FoundationSheetFullBleed then Vector2.new(0.5, 0) else nil,
		testId = `{WithDefaultsModuleResult.testId}--gripper`
	}, {
		TouchTarget = ReactModule.createElement(ViewModule, {
			tag = "size-1000-600",
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			onActivated = function()
				-- upvalues: UseRefResult6 (copy), FlagsModule (upval), UseRefResult5 (copy), UseBindingResult2_4 (copy), SnapPoints (copy), UseRefResult (copy), ReducedMotion (copy), UseResult5 (copy), UseResult4 (copy), UseResult (copy), Smallest1 (ref), UseBindingResult2_5 (copy), UseResult6 (copy)
				UseRefResult6.current = false
				
				if FlagsModule.FoundationBottomSheetInnerScrollingSync and UseRefResult5.current then
					UseBindingResult2_4(0)
					UseRefResult5.current.CanvasPosition = Vector2.new(0, 0)
					UseRefResult5.current:ResetScrollVelocity()
				end
				if #SnapPoints > 1 then
					local NewCurrent = UseRefResult.current % #SnapPoints + 1
					
					if ReducedMotion then
						UseResult5(NewCurrent)
					else
						UseResult4(NewCurrent)
					end
					local IsSmallestBelow: boolean = if FlagsModule.FoundationBottomSheetCapToOverlayHeight then Smallest1 <= UseResult(SnapPoints[NewCurrent]) else UseResult(SnapPoints[NewCurrent]) == Smallest1
					
					if FlagsModule.FoundationBottomSheetInnerScrollingSync then
						UseBindingResult2_5(IsSmallestBelow)
						
						return
					end
					if IsSmallestBelow then
						UseBindingResult2_5(true)
						
						return
					end
				else
					UseResult6()
				end
			end
		})
	})
	
	return UseOverlayModuleResult and ReactRobloxModule.createPortal(ReactModule.createElement(ViewModule, {
		tag = "size-full",
		ZIndex = UseElevationModuleResult.zIndex,
		ref = UseComposedRefResult,
		selection = TypesModule.nonSelectable,
		selectionGroup = TypesModule.isolatedSelectionGroup,
		testId = `{WithDefaultsModuleResult.testId}--surface`,
		onAbsoluteSizeChanged = if FlagsModule.FoundationBottomSheetCapToOverlayHeight then function(Frame)
			-- upvalues: Callback (ref)
			Callback(Frame.AbsoluteSize.Y)
		end else nil
	}, ReactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = if FlagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 1, Smallest1 + Bottom) else UDim2.new(1, 0, 0, UseScreenHeightModuleResult + Smallest1 + Bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = UseRefResult4,
		[ReactModule.Change.CanvasPosition] = function(ScrollFrame)
			-- upvalues: UseRefResult3 (copy), UseBindingResult2 (copy), Bottom (copy), UseTokensModuleResult (copy), UseResult8 (copy), UseResult6 (copy)
			UseRefResult3.current = ScrollFrame.CanvasPosition.Y
			UseBindingResult2(UseRefResult3.current - Bottom - UseTokensModuleResult.Margin.Small)
			UseResult8()
			
			if UseRefResult3.current <= 0 then
				UseResult6()
			end
		end
	}, {
		SheetContainer = ReactModule.createElement(ViewModule, {
			ZIndex = 3,
			Size = if FlagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 1, 200 - Smallest1 - Bottom) else UDim2.new(1, 0, 0, UseScreenHeightModuleResult + 200),
			Position = if FlagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(0, 0, 1, -Smallest1) else UDim2.fromOffset(0, UseScreenHeightModuleResult + Bottom)
		}, {
			Sheet = ReactModule.createElement(ViewModule, {
				Size = if WithDefaultsModuleResult.snapPoints == nil then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, Smallest1 + 200),
				AutomaticSize = if WithDefaultsModuleResult.snapPoints == nil then Enum.AutomaticSize.Y else nil,
				onAbsoluteSizeChanged = if WithDefaultsModuleResult.snapPoints == nil then function(Frame)
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(Frame.AbsoluteSize.Y - 200)
				end else nil,
				stateLayer = { affordance = StateLayerAffordanceModule.None },
				onActivated = DashModule.noop,
				testId = WithDefaultsModuleResult.testId,
				tag = if FlagsModule.FoundationSheetFullBleed then {
					["col items-center radius-large clip bg-surface-100"] = true,
					["padding-top-medium"] = not v2
				} else "col items-center padding-top-small radius-large clip bg-surface-100"
			}, {
				GripperContainer = if FlagsModule.FoundationSheetFullBleed then ReactModule.createElement("Folder", nil, { Gripper = Element }) else Element,
				Content = ReactModule.createElement(SheetContextModule.Provider, { value = UseMemoResult1 }, ReactModule.createElement(ElevationOwnerScope, { owner = UseElevationModuleResult }, WithDefaultsModuleResult.children))
			})
		}),
		Shadow = ReactModule.createElement(ImageModule, {
			ZIndex = 2,
			Image = SHADOWIMAGE,
			Size = UDim2.new(1, SHADOWSIZE * 2, 0, Smallest1 + 200 + SHADOWSIZE * 2),
			Position = if FlagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(-SHADOWSIZE, 0, 1, -Smallest1 - SHADOWSIZE) else UDim2.fromOffset(-SHADOWSIZE, UseScreenHeightModuleResult + Bottom - SHADOWSIZE),
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
				-- upvalues: UseResult6 (copy)
				UseResult6()
			end,
			testId = `{WithDefaultsModuleResult.testId}--backdrop`
		})
	})), UseOverlayModuleResult)
end))