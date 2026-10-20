local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
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
local UseScreenModule = require(Foundation.Providers.Overlay.useScreen)
local SheetContextModule = require(script.Parent.SheetContext)
local TypesModule = require(script.Parent.Types)
local SheetTypeModule = require(script.Parent.SheetType)
local ChildrenHasFullBleedModule = require(script.Parent.childrenHasFullBleed)
local GetHardwareSafeAreaInsetsModule = require(script.Parent.getHardwareSafeAreaInsets)
local UseHardwareInsetsModule = require(script.Parent.useHardwareInsets)
local UseScreenHeightModule = require(script.Parent.useScreenHeight)
local ImageModule = require(Foundation.Components.Image)
local ViewModule = require(Foundation.Components.View)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local FoundationBottomSheetIOSInsetWorkaroundDelayMs = game:DefineFastInt("FoundationBottomSheetIOSInsetWorkaroundDelayMs", 100)
local FoundationBottomSheetIOSInsetWorkaround = game:DefineFastFlag("FoundationBottomSheetIOSInsetWorkaround", false)
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

local function useStableGuiHeight(Frame: Frame)
	-- upvalues: ReactModule (copy), FoundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
	local Y = if Frame then Frame.AbsoluteSize.Y else 0
	local UseStateResult, UseStateResult2 = ReactModule.useState(Y)
	local UseRefResult = ReactModule.useRef(Y)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if UseRefResult.current ~= Current then
			UseRefResult.current = Current
			UseStateResult2(Current)
			
			return
		end
	end, {})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult1 (copy), Frame (copy), UseResult (copy), UseRefResult (copy), FoundationBottomSheetIOSInsetWorkaroundDelayMs (upval)
		UseRefResult1.current += 1
		
		if Frame then
			local function updateHeight()
				-- upvalues: Frame (upval), UseRefResult (upval), UseRefResult1 (upval), UseResult (upval), FoundationBottomSheetIOSInsetWorkaroundDelayMs (upval)
				local Y = Frame.AbsoluteSize.Y
				
				if UseRefResult.current <= 0 or Y <= UseRefResult.current then
					UseRefResult1.current += 1
					UseResult(Y)
					
					return
				else
					UseRefResult1.current += 1
					local Current = UseRefResult1.current
					task.delay(FoundationBottomSheetIOSInsetWorkaroundDelayMs / 1000, function()
						-- upvalues: UseRefResult1 (upval), Current (copy), Frame (upval), Y (copy), UseResult (upval)
						if UseRefResult1.current == Current and Frame.AbsoluteSize.Y == Y then
							UseResult(Y)
							
							return
						end
					end)
				end
			end
			
			updateHeight()
			local Connection = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateHeight)
			
			return function()
				-- upvalues: UseRefResult1 (upval), Connection (copy)
				UseRefResult1.current += 1
				Connection:Disconnect()
			end
		else
			UseResult(0)
			
			return function()
				-- upvalues: UseRefResult1 (upval)
				UseRefResult1.current += 1
			end
		end
	end, { Frame, UseResult })
	
	return UseStateResult
end

local _ = function()
	-- upvalues: UseScreenModule (copy), useStableGuiHeight (copy)
	return (useStableGuiHeight((UseScreenModule())))
end

local function useStableBottomSafeAreaPadding(Frame)
	-- upvalues: GetHardwareSafeAreaInsetsModule (copy), ReactModule (copy), FoundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
	local Bottom = GetHardwareSafeAreaInsetsModule().bottom
	local UseStateResult, UseStateResult2 = ReactModule.useState(Bottom)
	local UseRefResult = ReactModule.useRef(Bottom)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		if UseRefResult.current ~= Current then
			UseRefResult.current = Current
			UseStateResult2(Current)
			
			return
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), Frame (copy), GetHardwareSafeAreaInsetsModule (upval), UseRefResult (copy), UseResult (copy), FoundationBottomSheetIOSInsetWorkaroundDelayMs (upval)
		UseRefResult1.current += 1
		
		if Frame then
			local function updateBottomInset()
				-- upvalues: GetHardwareSafeAreaInsetsModule (upval), UseRefResult (upval), UseRefResult1 (upval), UseResult (upval), FoundationBottomSheetIOSInsetWorkaroundDelayMs (upval)
				local Bottom = GetHardwareSafeAreaInsetsModule().bottom
				
				if UseRefResult.current <= Bottom then
					UseRefResult1.current += 1
					UseResult(Bottom)
					
					return
				else
					UseRefResult1.current += 1
					local Current = UseRefResult1.current
					task.delay(FoundationBottomSheetIOSInsetWorkaroundDelayMs / 1000, function()
						-- upvalues: GetHardwareSafeAreaInsetsModule (upval), UseRefResult1 (upval), Current (copy), Bottom (copy), UseResult (upval)
						local Bottom1 = GetHardwareSafeAreaInsetsModule().bottom
						
						if UseRefResult1.current == Current and Bottom1 == Bottom then
							UseResult(Bottom)
							
							return
						end
					end)
				end
			end
			
			updateBottomInset()
			local Connection = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateBottomInset)
			
			return function()
				-- upvalues: UseRefResult1 (upval), Connection (copy)
				UseRefResult1.current += 1
				Connection:Disconnect()
			end
		else
			return function()
				-- upvalues: UseRefResult1 (upval)
				UseRefResult1.current += 1
			end
		end
	end, { Frame, UseResult })
	
	return UseStateResult
end

local _ = function(Frame)
	-- upvalues: UseScreenModule (copy), useStableGuiHeight (copy), useStableBottomSafeAreaPadding (copy)
	return useStableGuiHeight((UseScreenModule())), useStableGuiHeight(Frame), (useStableBottomSafeAreaPadding(Frame))
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseOverlayModule (copy), UseTokensModule (copy), UseElevationModule (copy), ElevationLayerModule (copy), UsePreferencesModule (copy), FoundationBottomSheetIOSInsetWorkaround (copy), UseScreenModule (copy), useStableGuiHeight (copy), useStableBottomSafeAreaPadding (copy), UseScreenHeightModule (copy), ReactModule (copy), UseHardwareInsetsModule (copy), UseAnimatedBindingFunction (copy), ChildrenHasFullBleedModule (copy), OtterModule (copy), ReactUtilsModule (copy), SheetTypeModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), ReactRobloxModule (copy), TypesModule (copy), DashModule (copy), SheetContextModule (copy), ElevationOwnerScope (copy), ImageModule (copy), SHADOWIMAGE (copy), SHADOWSIZE (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseOverlayModuleResult = UseOverlayModule()
	local UseTokensModuleResult = UseTokensModule()
	local UseElevationModuleResult = UseElevationModule(ElevationLayerModule.Sheet, { stackAboveOwner = false })
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local UseStableGuiHeightResult2 = nil
	local YOffset = nil
	local Callback = nil
	local Bottom = nil
	
	if FoundationBottomSheetIOSInsetWorkaround then
		local UseStableGuiHeightResult = useStableGuiHeight((UseScreenModule()))
		local UseStableGuiHeightResult1 = useStableGuiHeight(UseOverlayModuleResult)
		local UseStableBottomSafeAreaPaddingResult = useStableBottomSafeAreaPadding(UseOverlayModuleResult)
		UseStableGuiHeightResult2 = UseStableGuiHeightResult
		YOffset = UseStableGuiHeightResult1
		Bottom = UseStableBottomSafeAreaPaddingResult
	else
		UseStableGuiHeightResult2 = UseScreenHeightModule()
		YOffset, Callback = ReactModule.useState(if UseOverlayModuleResult then UseOverlayModuleResult.AbsoluteSize.Y else 0)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy)
		return { UseStateResult }
	end, { UseStateResult })
	local SnapPoints = WithDefaultsModuleResult.snapPoints or UseMemoResult
	local UseResult = ReactModule.useCallback(function(p3: number)
		-- upvalues: UseStableGuiHeightResult2 (ref)
		return if p3 > 1 then p3 else p3 * UseStableGuiHeightResult2
	end, { UseStableGuiHeightResult2 })
	local Smallest1 = 0
	
	for _, snapPoint in SnapPoints do
		local UseResultResult = UseResult(snapPoint)
		
		if Smallest1 < UseResultResult then
			Smallest1 = UseResultResult
		end
	end
	Smallest1 = math.min(Smallest1, UseStableGuiHeightResult2)
	
	if YOffset > 0 then
		Smallest1 = math.min(Smallest1, YOffset)
	end
	if not FoundationBottomSheetIOSInsetWorkaround then
		Bottom = UseHardwareInsetsModule(UseOverlayModuleResult).bottom
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseOverlayModuleResult (copy), Callback (ref)
			if not UseOverlayModuleResult then
				Callback(0)
				
				return
			end
			local function updateOverlayAvailableHeight()
				-- upvalues: Callback (upval), UseOverlayModuleResult (upval)
				Callback(UseOverlayModuleResult.AbsoluteSize.Y)
			end
			
			Callback(UseOverlayModuleResult.AbsoluteSize.Y)
			local Connection = UseOverlayModuleResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateOverlayAvailableHeight)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end, { UseOverlayModuleResult })
	end
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(false)
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
	local ChildrenHasFullBleedModuleResult = ChildrenHasFullBleedModule(WithDefaultsModuleResult.children)
	local UseBindingResult5, UseBindingResult2_4 = ReactModule.useBinding(0)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseBindingResult6, UseBindingResult2_5 = ReactModule.useBinding(0)
	local UseBindingResult7, UseBindingResult2_6 = ReactModule.useBinding(false)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseRefResult5 = ReactModule.useRef(0)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = ReactModule.useRef(false)
	local UseRefResult8 = ReactModule.useRef(0)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult6 (copy), UseRefResult5 (copy), UseRefResult7 (copy)
		if UseRefResult6.current then
			UseRefResult6.current:Disconnect()
			UseRefResult6.current = nil
		end
		UseRefResult5.current = 0
		UseRefResult7.current = false
	end, {})
	local UseResult2 = ReactModule.useCallback(function(Y)
		-- upvalues: UseResult1 (copy), UseRefResult7 (copy), UseRefResult3 (copy), UseRefResult6 (copy), UseRefResult8 (copy)
		UseResult1()
		UseRefResult7.current = true
		
		if UseRefResult3.current then
			UseRefResult3.current:ResetScrollVelocity()
		end
		UseRefResult6.current = game:GetService("RunService").Heartbeat:Connect(function(DeltaTime: number)
			-- upvalues: UseRefResult3 (upval), UseRefResult7 (upval), UseResult1 (upval), UseRefResult8 (upval), Y (copy)
			if not UseRefResult3.current or not UseRefResult7.current then
				UseResult1()
				
				return
			end
			local Current = UseRefResult8.current
			local YDelta = UseRefResult3.current.CanvasPosition.Y - Y
			local ScaledDeltaTime = 25.132741228718345 * DeltaTime
			local Exponential = math.exp(-ScaledDeltaTime)
			local NewCurrent = Current + 25.132741228718345 * YDelta
			local NewY = Y + (YDelta + NewCurrent * DeltaTime) * Exponential
			UseRefResult8.current = (Current - NewCurrent * ScaledDeltaTime) * Exponential
			UseRefResult3.current.CanvasPosition = Vector2.new(0, NewY)
			
			if math.abs(Y - UseRefResult3.current.CanvasPosition.Y) < 0.5 and math.abs(UseRefResult8.current) < 1 then
				UseRefResult3.current.CanvasPosition = Vector2.new(0, Y)
				UseResult1()
			end
		end)
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function(p3): number
		-- upvalues: UseResult (copy), Smallest1 (ref), Bottom (ref)
		return math.min(UseResult(p3), Smallest1) + Bottom
	end, { Bottom, UseResult, Smallest1 })
	local UseResult4 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseResult2 (copy), UseResult3 (copy), SnapPoints (copy)
		UseRefResult.current = Current
		UseResult2(UseResult3(SnapPoints[Current]))
	end, { UseResult3, SnapPoints })
	local UseResult5 = ReactModule.useCallback(function(Current)
		-- upvalues: UseResult1 (copy), UseRefResult (copy), UseRefResult3 (copy), UseResult3 (copy), SnapPoints (copy)
		UseResult1()
		UseRefResult.current = Current
		
		if UseRefResult3.current then
			UseRefResult3.current.CanvasPosition = Vector2.new(0, UseResult3(SnapPoints[Current]))
		end
	end, { UseResult1, UseResult3, SnapPoints })
	local UseRefResult9 = ReactModule.useRef(0)
	ReactModule.useEffect(function()
		-- upvalues: UseOverlayModuleResult (copy), UseRefResult9 (copy), YOffset (ref), UseRefResult (copy), SnapPoints (copy), WithDefaultsModuleResult (copy), ReducedMotion (copy), UseResult5 (copy), UseResult4 (copy)
		if not UseOverlayModuleResult then return end
		local Current: number = UseRefResult9.current
		UseRefResult9.current = YOffset
		
		if Current <= 0 or Current == YOffset then return end
		local Current1 = UseRefResult.current
		
		if Current1 <= 0 or #SnapPoints < Current1 then
			Current1 = WithDefaultsModuleResult.defaultSnapPointIndex
		end
		if ReducedMotion then
			UseResult5(Current1)
			
			return
		else
			UseResult4(Current1)
		end
	end, {
		UseOverlayModuleResult, YOffset, UseResult4, UseResult5, ReducedMotion,
		WithDefaultsModuleResult.defaultSnapPointIndex, SnapPoints
	})
	local UseResult6 = ReactModule.useCallback(function(p3)
		-- upvalues: UseRefResult1 (copy), ReducedMotion (copy), UseResult1 (copy), UseRefResult3 (copy), UseAnimatedBindingResult2 (copy), OtterModule (upval), UseRefResult8 (copy), UseRefResult5 (copy), UseResult2 (copy), UseTokensModuleResult (copy)
		if UseRefResult1.current then return end
		if not ReducedMotion or p3 then
			UseRefResult8.current = -UseRefResult5.current
			UseResult2(0)
			UseAnimatedBindingResult2(OtterModule.ease(1, { duration = UseTokensModuleResult.Time.Time_100 }))
			UseRefResult1.current = true
			
			return
		end
		UseRefResult1.current = true
		UseResult1()
		
		if UseRefResult3.current then
			UseRefResult3.current.CanvasPosition = Vector2.new(0, 0)
		end
		UseAnimatedBindingResult2((OtterModule.instant(1)))
	end, { UseResult2, UseResult1, ReducedMotion })
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseBindingResult6 (copy), UseRefResult2 (copy), Smallest1 (ref), Bottom (ref), UseRefResult5 (copy), UseRefResult4 (copy), UseBindingResult2_6 (copy)
		local IsValueBelow = UseBindingResult6:getValue() <= 0
		local IsCurrentAbove = UseRefResult2.current >= math.floor(Smallest1 + Bottom)
		
		if UseRefResult5.current > 0 and IsValueBelow and UseRefResult4.current then
			UseBindingResult2_6(false)
			
			return
		end
		if UseRefResult5.current <= 0 and IsCurrentAbove then
			UseBindingResult2_6(true)
		end
	end, { Smallest1, Bottom })
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult5 (copy), UseRefResult2 (copy), SnapPoints (copy), UseResult3 (copy), UseRefResult4 (copy), UseRefResult8 (copy), UseResult6 (copy), UseResult4 (copy)
		local Current: number = UseRefResult5.current
		local CurrentDelta = UseRefResult2.current - Current / 2.35
		local List = { { index = 0, position = 0 } }
		
		for Index, snapPoint in SnapPoints do
			table.insert(List, { index = Index, position = UseResult3(snapPoint) })
		end
		table.sort(List, function(A, B): boolean
			-- upvalues: CurrentDelta (copy)
			return math.abs(A.position - CurrentDelta) < math.abs(B.position - CurrentDelta)
		end)
		local Entry = List[1]
		
		if not UseRefResult4.current then
			UseRefResult8.current = -Current
			
			if Entry.index == 0 then
				UseResult6(true)
				
				return
			end
			UseResult4(Entry.index)
		end
	end, { SnapPoints, UseResult4, UseResult3, UseResult6 })
	ReactModule.useEffect(function()
		-- upvalues: UseOverlayModuleResult (copy), ReducedMotion (copy), UseResult5 (copy), WithDefaultsModuleResult (copy), UseAnimatedBindingResult2 (copy), OtterModule (upval), UseResult4 (copy), UseTokensModuleResult (copy), UseResult (copy), SnapPoints (copy), Smallest1 (ref), UseBindingResult2_6 (copy), UseResult1 (copy)
		if UseOverlayModuleResult then
			if ReducedMotion then
				UseResult5(WithDefaultsModuleResult.defaultSnapPointIndex)
				UseAnimatedBindingResult2(OtterModule.instant(0))
			else
				UseResult4(WithDefaultsModuleResult.defaultSnapPointIndex)
				UseAnimatedBindingResult2(OtterModule.ease(0, { duration = UseTokensModuleResult.Time.Time_100 }))
			end
			if math.min(UseResult(SnapPoints[WithDefaultsModuleResult.defaultSnapPointIndex]), Smallest1) == Smallest1 then
				UseBindingResult2_6(true)
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
		-- upvalues: UseRefResult5 (copy), UseResult7 (copy), UseRefResult4 (copy), UseResult1 (copy), UseRefResult3 (copy), UseRefResult2 (copy), Smallest1 (ref), Bottom (ref), UseRefResult1 (copy), UseBindingResult2_6 (copy), UseResult8 (copy)
		local TouchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, _, Velocity, _)
			-- upvalues: UseRefResult5 (upval), UseResult7 (upval)
			UseRefResult5.current = Velocity.Y
			UseResult7()
		end)
		local InputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function()
			-- upvalues: UseRefResult4 (upval), UseRefResult5 (upval), UseResult1 (upval)
			UseRefResult4.current = true
			UseRefResult5.current = 0
			UseResult1()
		end)
		local InputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function()
			-- upvalues: UseRefResult4 (upval), UseRefResult5 (upval), UseRefResult3 (upval), UseRefResult2 (upval), Smallest1 (upval), Bottom (upval), UseRefResult1 (upval), UseBindingResult2_6 (upval), UseResult8 (upval)
			if UseRefResult4.current == false then return end
			UseRefResult4.current = false
			UseRefResult5.current = if UseRefResult3.current then UseRefResult3.current:GetScrollVelocity().Y else 0
			
			if math.floor(Smallest1 + Bottom) <= UseRefResult2.current or UseRefResult1.current then
				UseBindingResult2_6(true)
				
				return
			else
				UseResult8()
			end
		end)
		
		return function()
			-- upvalues: TouchPanConnection (copy), InputBeganConnection (copy), InputEndedConnection (copy)
			TouchPanConnection:Disconnect()
			InputBeganConnection:Disconnect()
			InputEndedConnection:Disconnect()
		end
	end, {
		UseOverlayModuleResult,
		UseResult8,
		UseResult7,
		UseResult1
	})
	local UseRefResult10 = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(p2, UseStateResult2_2)
	ReactModule.useImperativeHandle(WithDefaultsModuleResult.sheetRef, function()
		-- upvalues: UseResult6 (copy)
		return { close = UseResult6 }
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult1 (copy), UseBindingResult2_1 (copy), UseBindingResult3 (copy), UseBindingResult2_2 (copy), UseBindingResult (copy), UseBindingResult2 (copy), Bottom (ref), UseBindingResult7 (copy), UseBindingResult6 (copy), UseBindingResult2_5 (copy), UseResult7 (copy), UseBindingResult4 (copy), UseBindingResult2_3 (copy), ChildrenHasFullBleedModuleResult (copy), UseBindingResult5 (copy), UseBindingResult2_4 (copy), UseResult6 (copy), SheetTypeModule (upval), UseStateResult3 (copy), WithDefaultsModuleResult (copy), UseRefResult10 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy)
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
			setInnerScrollY = function(p3)
				-- upvalues: UseBindingResult2_5 (upval), UseResult7 (upval)
				UseBindingResult2_5(p3)
				UseResult7()
			end,
			hasHeader = UseBindingResult4,
			setHasHeader = UseBindingResult2_3,
			hasFullBleed = ChildrenHasFullBleedModuleResult,
			fullBleedHeight = UseBindingResult5,
			setFullBleedHeight = UseBindingResult2_4,
			closeSheet = UseResult6,
			sheetType = SheetTypeModule.Bottom,
			innerSurface = UseStateResult3,
			testId = WithDefaultsModuleResult.testId,
			closeAffordanceRef = UseRefResult10,
			contentStartRef = UseStateResult1,
			setContentStartRef = UseStateResult2_1
		}
	end, {
		WithDefaultsModuleResult.testId, UseResult6, Bottom, UseResult7,
		UseStateResult3, UseRefResult10, UseStateResult1,
		ChildrenHasFullBleedModuleResult
	})
	local Element = ReactModule.createElement(ViewModule, {
		ZIndex = 3,
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
				-- upvalues: UseRefResult4 (copy), SnapPoints (copy), UseRefResult (copy), ReducedMotion (copy), UseResult5 (copy), UseResult4 (copy), UseResult (copy), Smallest1 (ref), UseBindingResult2_6 (copy), UseResult6 (copy)
				UseRefResult4.current = false
				
				if #SnapPoints > 1 then
					local NewCurrent = UseRefResult.current % #SnapPoints + 1
					
					if ReducedMotion then
						UseResult5(NewCurrent)
					else
						UseResult4(NewCurrent)
					end
					if math.min(UseResult(SnapPoints[NewCurrent]), Smallest1) == Smallest1 then
						UseBindingResult2_6(true)
						
						return
					end
				else
					UseResult6()
				end
			end
		})
	})
	
	return UseOverlayModuleResult and ReactRobloxModule.createPortal(ReactModule.createElement(ViewModule, {
		ZIndex = UseElevationModuleResult.zIndex,
		ref = UseComposedRefResult,
		selection = TypesModule.nonSelectable,
		selectionGroup = TypesModule.isolatedSelectionGroup,
		Size = if FoundationBottomSheetIOSInsetWorkaround then UDim2.new(1, 0, 0, YOffset) else nil,
		tag = if FoundationBottomSheetIOSInsetWorkaround then nil else "size-full",
		testId = `{WithDefaultsModuleResult.testId}--surface`
	}, ReactModule.createElement("ScrollingFrame", {
		Size = if FoundationBottomSheetIOSInsetWorkaround then UDim2.new(1, 0, 0, YOffset) else UDim2.fromScale(1, 1),
		CanvasSize = UDim2.new(1, 0, 1, Smallest1 + Bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = UseRefResult3,
		[ReactModule.Change.CanvasPosition] = function(ScrollFrame)
			-- upvalues: UseRefResult2 (copy), UseBindingResult2 (copy), Bottom (ref), UseTokensModuleResult (copy), UseResult7 (copy), UseResult6 (copy)
			UseRefResult2.current = ScrollFrame.CanvasPosition.Y
			UseBindingResult2(UseRefResult2.current - Bottom - UseTokensModuleResult.Margin.Small)
			UseResult7()
			
			if UseRefResult2.current <= 0 then
				UseResult6()
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
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(Frame.AbsoluteSize.Y - 200)
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
				Content = ReactModule.createElement(SheetContextModule.Provider, { value = UseMemoResult1 }, ReactModule.createElement(ElevationOwnerScope, { owner = UseElevationModuleResult }, WithDefaultsModuleResult.children))
			})
		}),
		Shadow = ReactModule.createElement(ImageModule, {
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
				-- upvalues: UseResult6 (copy)
				UseResult6()
			end,
			testId = `{WithDefaultsModuleResult.testId}--backdrop`
		})
	})), UseOverlayModuleResult)
end))