local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local reactRobloxModule = require(parent.ReactRoblox)
local reactUtilsModule = require(parent.ReactUtils)
local useAnimatedBinding = reactOtterModule.useAnimatedBinding
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local useElevationModule = require(foundation.Providers.Elevation.useElevation)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local elevationOwnerScope = require(foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local elevationLayerModule = require(foundation.Enums.ElevationLayer)
local constantsModule = require(foundation.Constants)
local sheetContextModule = require(script.Parent.SheetContext)
local typesModule = require(script.Parent.Types)
local sheetTypeModule = require(script.Parent.SheetType)
local childrenHasFullBleedModule = require(script.Parent.childrenHasFullBleed)
local useHardwareInsetsModule = require(script.Parent.useHardwareInsets)
local useScreenHeightModule = require(script.Parent.useScreenHeight)
local flagsModule = require(foundation.Utility.Flags)
local imageModule = require(foundation.Components.Image)
local viewModule = require(foundation.Components.View)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local t = { defaultSnapPointIndex = 1, testId = "--foundation-sheet" }
local SHADOW_IMAGE = constantsModule.SHADOW_IMAGE
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

local function _(p0, p1, p2, p3) --[[ line: 61 | named "advanceCriticalDampedSpring" ]]
	local var25 = p0 - p2
	local var26 = 25.132741228718 * p3
	local expValue = math.exp(-var26)
	local var28 = p1 + 25.132741228718 * var25
	
	return p2 + (var25 + var28 * p3) * expValue, (p1 - var28 * var26) * expValue
end

return reactModule.memo(reactModule.forwardRef(function(p4, p5) --[[ line: 79 | named "BottomSheet" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useScreenHeightModule (ref), flagsModule (ref), reactModule (ref), useHardwareInsetsModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), reactUtilsModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), reactRobloxModule (ref), typesModule (ref), dashModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	local var29 = withDefaultsModule(p4, t)
	local var30 = useOverlayModule()
	local var31 = useTokensModule()
	local var32 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var33 = useScreenHeightModule()
	local var34 = nil
	local var35 = nil
	
	if flagsModule.FoundationBottomSheetCapToOverlayHeight then
		local var36, var37 = reactModule.useState(if var30 then var30.AbsoluteSize.Y else 0)
		var34 = var36
		var35 = var37
	end
	local var38, var39 = reactModule.useState(0)
	local snapPoints = var29.snapPoints or reactModule.useMemo(function() --[[ line: 95 ]]
		-- upvalues: var38 (ref)
		return { var38 }
	end, { var38 })
	local var41 = reactModule.useCallback(function(p6) --[[ line: 102 ]]
		-- upvalues: var33 (ref)
		return if p6 > 1 then p6 else p6 * var33
	end, { var33 })
	local var42 = 0
	
	for i, v in snapPoints do
		local var97 = var41(v)
		
		if var42 < var97 then
			var42 = var97
		end
	end
	var42 = math.min(var42, var33)
	
	if flagsModule.FoundationBottomSheetCapToOverlayHeight and var34 > 0 then
		var42 = math.min(var42, var34)
	end
	local bottom = useHardwareInsetsModule(var30).bottom
	local var43 = reactModule.useRef(0)
	local var44 = reactModule.useRef(false)
	local var45 = if flagsModule.FoundationBottomSheetOnSnapPointChanged then reactModule.useRef(var29.onSnapPointChanged) else nil
	
	if flagsModule.FoundationBottomSheetOnSnapPointChanged then
		var45.current = var29.onSnapPointChanged
	end
	local var46, var47 = useAnimatedBinding(1, function() --[[ line: 137 ]]
		-- upvalues: var44 (ref), var29 (ref)
		if var44.current then
			var29.onClose()
		end
	end)
	local var48, var49 = reactModule.useBinding(-bottom)
	local var50, var51 = reactModule.useBinding(0)
	local var52, var53 = reactModule.useBinding(false)
	local var54, var55 = reactModule.useBinding(false)
	local var56 = nil
	local var57 = nil
	local var58 = nil
	
	if flagsModule.FoundationSheetFullBleed then
		var56 = childrenHasFullBleedModule(var29.children)
		local var59, var60 = reactModule.useBinding(0)
		var57 = var59
		var58 = var60
	end
	local var61 = reactModule.useRef(0)
	local var62 = reactModule.useRef(nil)
	local var63, var64 = reactModule.useBinding(0)
	local var65 = reactModule.useRef(nil)
	local var66, var67 = reactModule.useBinding(false)
	local var68 = reactModule.useRef(false)
	local var69 = reactModule.useRef(0)
	local var70 = reactModule.useRef(nil)
	local var71 = reactModule.useRef(false)
	local var72 = reactModule.useRef(0)
	local _ = nil
	local var73 = nil
	local _ = nil
	local var74 = nil
	
	if flagsModule.FoundationBottomSheetGestureInteractionSink then
		local var75 = reactModule.useRef(false)
		local var76, var77 = reactModule.useState(false)
		var73 = var76
		local var78 = var77
		var74 = reactModule.useCallback(function(p7) --[[ line: 172 ]]
			-- upvalues: var75 (write), var78 (write)
			if var75.current == p7 then
				return
			end
			var75.current = p7
			var78(p7)
		end, {})
	end
	local var79 = reactModule.useCallback(function() --[[ line: 181 ]]
		-- upvalues: var70 (ref), var69 (ref), var71 (ref)
		if var70.current then
			var70.current:Disconnect()
			var70.current = nil
		end
		var69.current = 0
		var71.current = false
	end, {})
	local var80 = reactModule.useCallback(function(p8) --[[ line: 190 ]]
		-- upvalues: var79 (ref), var71 (ref), flagsModule (copy), var62 (ref), var70 (ref), var72 (ref)
		var79()
		var71.current = true
		
		if flagsModule.FoundationBottomSheetImproveSpring and var62.current then
			var62.current:ResetScrollVelocity()
		end
		local var98 = if var62.current then var62.current.CanvasPosition.Y else 0
		var70.current = game:GetService("RunService").Heartbeat:Connect(function(p9) --[[ line: 202 ]]
			-- upvalues: var62 (copy), var71 (copy), var79 (copy), flagsModule (copy), var72 (copy), p8 (ref), var98 (write)
			if not var62.current or not var71.current then
				var79()
				
				return
			end
			local var104
			local y = var62.current.CanvasPosition.Y
			local _ = nil
			
			if flagsModule.FoundationBottomSheetImproveSpring then
				local current = var72.current
				local var99 = y - p8
				local var100 = 25.132741228718 * p9
				local expValue = math.exp(-var100)
				local var102 = current + 25.132741228718 * var99
				local var103 = p8 + (var99 + var102 * p9) * expValue
				var72.current = (current - var102 * var100) * expValue
				var62.current.CanvasPosition = Vector2.new(0, var103)
				var98 = var62.current.CanvasPosition.Y
				var104 = p8 - var62.current.CanvasPosition.Y
			else
				var104 = p8 - y
				local var105 = var104 * 18 * 18
				var72.current -= (y - var98) / p9
				local minValue = math.min(p9, 0.033333333333)
				var72.current += (var105 + -var72.current * 2 * 0.9 * 18) * minValue
				var62.current.CanvasPosition = Vector2.new(0, y + var72.current * minValue)
				var98 = var62.current.CanvasPosition.Y
			end
			if math.abs(var104) < 0.5 and math.abs(var72.current) < 1 then
				var62.current.CanvasPosition = Vector2.new(0, p8)
				var79()
			end
		end)
	end, { var79 })
	local var81 = reactModule.useCallback(function(p10) --[[ line: 250 ]]
		-- upvalues: flagsModule (copy), var41 (ref), var42 (write), bottom (ref)
		return if flagsModule.FoundationBottomSheetCapToOverlayHeight then math.min(var41(p10), var42) + bottom else var41(p10) + bottom
	end, {
		bottom,
		var41,
		if flagsModule.FoundationBottomSheetCapToOverlayHeight then var42 else nil
	})
	local var82 = reactModule.useCallback(function(p11) --[[ line: 264 ]]
		-- upvalues: var43 (ref), var80 (ref), var81 (ref), snapPoints (ref), flagsModule (copy), var45 (ref)
		var43.current = p11
		var80(var81(snapPoints[p11]))
		
		if flagsModule.FoundationBottomSheetOnSnapPointChanged and var45.current then
			var45.current(snapPoints[p11], p11)
		end
	end, { var81, snapPoints })
	local var83 = reactModule.useCallback(function(p12) --[[ line: 272 ]]
		-- upvalues: var79 (ref), var43 (ref), var62 (ref), var81 (ref), snapPoints (ref), flagsModule (copy), var45 (ref)
		var79()
		var43.current = p12
		
		if var62.current then
			var62.current.CanvasPosition = Vector2.new(0, var81(snapPoints[p12]))
		end
		if flagsModule.FoundationBottomSheetOnSnapPointChanged and var45.current then
			var45.current(snapPoints[p12], p12)
		end
	end, { var79, var81, snapPoints })
	local var84 = reactModule.useCallback(function(p13) --[[ line: 283 ]]
		-- upvalues: var44 (ref), reducedMotion (ref), var79 (ref), var62 (ref), var47 (ref), otterModule (copy), var72 (ref), var69 (ref), var80 (ref), var31 (ref)
		if var44.current then return end
		if not reducedMotion or p13 then
			var72.current = -var69.current
			var80(0)
			var47(otterModule.ease(1, { duration = var31.Time.Time_100 }))
			var44.current = true
			
			return
		end
		var44.current = true
		var79()
		
		if var62.current then
			var62.current.CanvasPosition = Vector2.new(0, 0)
		end
		var47(otterModule.instant(1))
	end, { var80, var79, reducedMotion })
	local var85 = if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then reactModule.useCallback(function() --[[ line: 305 ]]
		-- upvalues: var42 (write), bottom (ref), var61 (ref)
		return math.floor(var42 + bottom) - 0.01 <= var61.current
	end, { var42, bottom }) else nil
	local var86 = reactModule.useCallback(function() --[[ line: 312 ]]
		-- upvalues: var63 (ref), flagsModule (copy), var85 (ref), var61 (ref), var42 (write), bottom (ref), var69 (ref), var68 (ref), var67 (ref)
		local var107 = if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then var85() else (if flagsModule.FoundationBottomSheetImproveSpring then math.floor(var42 + bottom) else math.round(var42 + bottom)) <= var61.current
		
		if not var107 and var69.current < 0 or var69.current > 0 and var63:getValue() <= 0 and var68.current then
			var67(false)
			
			return
		elseif (var69.current < 0 or flagsModule.FoundationBottomSheetImproveSpring and var69.current == 0) and var107 then
			var67(true)
		end
	end, if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then { var85 } else { var42, bottom })
	local var87 = reactModule.useCallback(function() --[[ line: 337 ]]
		-- upvalues: var69 (ref), var61 (ref), snapPoints (ref), var81 (ref), var68 (ref), var72 (ref), var84 (ref), var82 (ref)
		local current = var69.current
		local var108 = var61.current - current / 2.35
		local list = { { index = 0, position = 0 } }
		
		for i, v in snapPoints do
			table.insert(list, { index = i, position = var81(v) })
		end
		table.sort(list, function(p14, p15) --[[ line: 355 ]]
			-- upvalues: var108 (ref)
			return math.abs(p14.position - var108) < math.abs(p15.position - var108)
		end)
		local var110 = list[1]
		
		if not var68.current then
			var72.current = -current
			
			if var110.index == 0 then
				var84(true)
				
				return
			end
			var82(var110.index)
		end
	end, { snapPoints, var82, var81, var84 })
	reactModule.useEffect(function() --[[ line: 371 ]]
		-- upvalues: var30 (ref), reducedMotion (ref), var83 (ref), var29 (ref), var47 (ref), otterModule (copy), var82 (ref), var31 (ref), flagsModule (copy), var41 (ref), snapPoints (ref), var42 (write), var67 (ref), var79 (ref)
		if var30 then
			if reducedMotion then
				var83(var29.defaultSnapPointIndex)
				var47(otterModule.instant(0))
			else
				var82(var29.defaultSnapPointIndex)
				var47(otterModule.ease(0, { duration = var31.Time.Time_100 }))
			end
			local var111
			if flagsModule.FoundationBottomSheetCapToOverlayHeight then
				var111 = var42 <= var41(snapPoints[var29.defaultSnapPointIndex])
				var111 = nil
			else
				var111 = var41(snapPoints[var29.defaultSnapPointIndex]) == var42
			end
			var67(var111)
		end
		return function() --[[ line: 389 ]]
			-- upvalues: var79 (copy)
			var79()
		end
	end, {
		var30, snapPoints, var29.defaultSnapPointIndex, var82, var41, var83,
		reducedMotion
	})
	
	if flagsModule.FoundationBottomSheetFixHeightCap then
		reactModule.useLayoutEffect(function() --[[ line: 405 ]]
			-- upvalues: var30 (ref), var35 (write)
			if var30 then
				var35(var30.AbsoluteSize.Y)
				local var112 = var30:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 410 ]]
					-- upvalues: var35 (copy), var30 (copy)
					var35(var30.AbsoluteSize.Y)
				end)
				
				return function() --[[ line: 413 ]]
					-- upvalues: var112 (ref)
					var112:Disconnect()
				end
			end
		end, { var30 })
	end
	reactModule.useEffect(function() --[[ line: 423 ]]
		-- upvalues: var69 (ref), flagsModule (copy), var68 (ref), var74 (write), var86 (ref), var79 (ref), var62 (ref), var85 (ref), var61 (ref), var42 (write), bottom (ref), var44 (ref), var67 (ref), var87 (ref)
		local touchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, p16, p17, _) --[[ line: 425 ]]
			-- upvalues: var69 (copy), flagsModule (copy), var68 (copy), var74 (copy), var86 (copy)
			var69.current = p17.Y
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink and var68.current and (p16 and math.abs(p16.X) < math.abs(p16.Y)) then
				var74(true)
			end
			var86()
		end)
		local inputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function() --[[ line: 438 ]]
			-- upvalues: var68 (copy), var69 (copy), flagsModule (copy), var74 (copy), var79 (copy)
			var68.current = true
			var69.current = 0
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var74(false)
			end
			var79()
		end)
		local inputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function() --[[ line: 446 ]]
			-- upvalues: var68 (copy), flagsModule (copy), var74 (copy), var62 (copy), var69 (copy), var85 (copy), var61 (copy), var42 (copy), bottom (copy), var44 (copy), var67 (copy), var87 (copy)
			if var68.current == false then return end
			var68.current = false
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var74(false)
			end
			if flagsModule.FoundationBottomSheetImproveSpring then
				var69.current = if var62.current then var62.current:GetScrollVelocity().Y else 0
				
				if (if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then var85() else math.floor(var42 + bottom) <= var61.current) or var44.current then
					var67(true)
					
					return
				end
			else
				local var116 = nil
				
				if var62.current then
					local ok, status = pcall(function() --[[ line: 477 ]]
						-- upvalues: var62 (copy)
						return var62.current:GetScrollVelocity().Y == 0
					end)
					
					if ok then
						var116 = status
					end
				end
				if var116 or var44.current then
					var67(true)
					
					return
				end
			end
			var87()
		end)
		
		return function() --[[ line: 498 ]]
			-- upvalues: flagsModule (copy), var74 (copy), touchPanConnection (ref), inputBeganConnection (ref), inputEndedConnection (ref)
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var74(false)
			end
			touchPanConnection:Disconnect()
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then {
		var30, var87, var86, var79, var85,
		if flagsModule.FoundationBottomSheetGestureInteractionSink then var74 else nil
	} else {
		var30,
		var87,
		var86,
		var79,
		if flagsModule.FoundationBottomSheetGestureInteractionSink then var74 else nil
	})
	local var88 = reactModule.useRef(nil)
	local var89, var90 = reactModule.useState(nil)
	local var91, var92 = reactModule.useState(nil)
	local var93 = reactUtilsModule.useComposedRef(p5, var92)
	reactModule.useImperativeHandle(var29.sheetRef, function() --[[ line: 531 ]]
		-- upvalues: var84 (ref)
		return { close = var84 }
	end, {})
	local var94 = reactModule.useMemo(function() --[[ line: 538 ]]
		-- upvalues: var50 (ref), var51 (ref), var52 (ref), var53 (ref), var48 (ref), var49 (ref), bottom (ref), var66 (ref), var63 (ref), var65 (ref), var64 (ref), var86 (ref), var54 (ref), var55 (ref), flagsModule (copy), var56 (write), var57 (write), var58 (write), var84 (ref), sheetTypeModule (copy), var91 (ref), var29 (ref), var88 (ref), var89 (ref), var90 (ref), var73 (write)
		return {
			bottomPadding = 200,
			actionsHeight = var50,
			setActionsHeight = var51,
			hasActionsDivider = var52,
			setHasActionsDivider = var53,
			sheetHeightAvailable = var48,
			setSheetHeightAvailable = var49,
			safeAreaPadding = bottom,
			innerScrollingEnabled = var66,
			innerScrollY = var63,
			innerScrollingRef = var65,
			setInnerScrollY = function(value) --[[ line: 551 ]]
				-- upvalues: var64 (copy), var86 (copy)
				var64(value)
				var86()
			end,
			hasHeader = var54,
			setHasHeader = var55,
			hasFullBleed = if flagsModule.FoundationSheetFullBleed then var56 else nil,
			fullBleedHeight = if flagsModule.FoundationSheetFullBleed then var57 else nil,
			setFullBleedHeight = if flagsModule.FoundationSheetFullBleed then var58 else nil,
			closeSheet = var84,
			hasRadius = if flagsModule.FoundationSheetFullBleed then true else nil,
			sheetType = sheetTypeModule.Bottom,
			innerSurface = var91,
			testId = var29.testId,
			closeAffordanceRef = var88,
			contentStartRef = var89,
			setContentStartRef = var90,
			isVerticalSheetGesture = if flagsModule.FoundationBottomSheetGestureInteractionSink then var73 else nil
		}
	end, {
		var29.testId, var84, bottom, var86, var91, var88, var89, var56,
		if flagsModule.FoundationBottomSheetGestureInteractionSink then var73 else nil
	})
	local var95 = reactModule.createElement(viewModule, {
		ZIndex = 5,
		tag = "align-y-center size-1000-100 padding-y-small radius-small",
		backgroundStyle = var31.Color.Content.Muted,
		Position = if flagsModule.FoundationSheetFullBleed then UDim2.new(0.5, 0, 0, if var56 then var31.Padding.Small else -var31.Padding.XSmall) else nil,
		AnchorPoint = if flagsModule.FoundationSheetFullBleed then Vector2.new(0.5, 0) else nil,
		testId = `{var29.testId}--gripper`
	}, {
		TouchTarget = reactModule.createElement(viewModule, {
			tag = "size-1000-600",
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onActivated = function() --[[ line: 601 ]]
				-- upvalues: var68 (ref), var65 (ref), var64 (ref), snapPoints (ref), var43 (ref), reducedMotion (ref), var83 (ref), var82 (ref), flagsModule (copy), var41 (ref), var42 (write), var67 (ref), var84 (ref)
				var68.current = false
				
				if var65.current then
					var64(0)
					var65.current.CanvasPosition = Vector2.new(0, 0)
					var65.current:ResetScrollVelocity()
				end
				if #snapPoints <= 1 then
					var84()
					
					return
				end
				local var117 = var43.current % #snapPoints + 1
				
				if reducedMotion then
					var83(var117)
				else
					var82(var117)
				end
				local var118
				if flagsModule.FoundationBottomSheetCapToOverlayHeight then
					var118 = var42 <= var41(snapPoints[var117])
					var118 = nil
				else
					var118 = var41(snapPoints[var117]) == var42
				end
				var67(var118)
			end
		})
	})
	local var96 = var30
	
	if var96 then
		var96 = reactRobloxModule.createPortal
		var96 = var96(reactModule.createElement(viewModule, {
			tag = "size-full",
			ZIndex = var32.zIndex,
			ref = var93,
			selection = typesModule.nonSelectable,
			selectionGroup = typesModule.isolatedSelectionGroup,
			testId = `{var29.testId}--surface`,
			onAbsoluteSizeChanged = if flagsModule.FoundationBottomSheetFixHeightCap or not flagsModule.FoundationBottomSheetCapToOverlayHeight then nil else function(p18) --[[ line: 640 ]]
				-- upvalues: var35 (write)
				var35(p18.AbsoluteSize.Y)
			end
		}, reactModule.createElement("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1),
			CanvasSize = if flagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 1, var42 + bottom) else UDim2.new(1, 0, 0, var33 + var42 + bottom),
			ClipsDescendants = false,
			BackgroundTransparency = 1,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarThickness = 0,
			ref = var62,
			[reactModule.Change.CanvasPosition] = function(p19) --[[ line: 655 ]]
				-- upvalues: var61 (ref), var49 (ref), bottom (ref), var31 (ref), var86 (ref), var84 (ref)
				var61.current = p19.CanvasPosition.Y
				var49(var61.current - bottom - var31.Margin.Small)
				var86()
				
				if var61.current <= 0 then
					var84()
				end
			end
		}, {
			SheetContainer = reactModule.createElement(viewModule, {
				ZIndex = 3,
				Size = if flagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 1, 200 - var42 - bottom) else UDim2.new(1, 0, 0, var33 + 200),
				Position = if flagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(0, 0, 1, -var42) else UDim2.fromOffset(0, var33 + bottom)
			}, {
				Sheet = reactModule.createElement(viewModule, {
					Size = if var29.snapPoints == nil then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, var42 + 200),
					AutomaticSize = if var29.snapPoints == nil then Enum.AutomaticSize.Y else nil,
					onAbsoluteSizeChanged = if var29.snapPoints == nil then function(p20) --[[ line: 679 ]]
						-- upvalues: var39 (ref)
						var39(p20.AbsoluteSize.Y - 200)
					end else nil,
					stateLayer = { affordance = stateLayerAffordanceModule.None },
					onActivated = dashModule.noop,
					testId = var29.testId,
					tag = if flagsModule.FoundationSheetFullBleed then {
						["col items-center radius-large clip bg-surface-100"] = true,
						["padding-top-medium"] = not var56
					} else "col items-center padding-top-small radius-large clip bg-surface-100"
				}, {
					GripperContainer = if flagsModule.FoundationSheetFullBleed then reactModule.createElement("Folder", nil, { Gripper = var95 }) else var95,
					Content = reactModule.createElement(sheetContextModule.Provider, { value = var94 }, reactModule.createElement(elevationOwnerScope, { owner = var32 }, var29.children))
				})
			}),
			Shadow = reactModule.createElement(imageModule, {
				ZIndex = 2,
				Image = SHADOW_IMAGE,
				Size = UDim2.new(1, SHADOW_SIZE * 2, 0, var42 + 200 + SHADOW_SIZE * 2),
				Position = if flagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(-SHADOW_SIZE, 0, 1, (-var42) - SHADOW_SIZE) else UDim2.fromOffset(-SHADOW_SIZE, var33 + bottom - SHADOW_SIZE),
				slice = {
					scale = 2,
					center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
				},
				imageStyle = var31.Color.Extended.Black.Black_10
			}),
			Backdrop = reactModule.createElement(viewModule, {
				ZIndex = 1,
				Size = UDim2.fromScale(1, 2),
				Position = UDim2.fromScale(0, -0.5),
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				backgroundStyle = var46:map(function(p21) --[[ line: 728 ]]
					-- upvalues: var31 (ref)
					return {
						Color3 = var31.Color.Common.Backdrop.Color3,
						Transparency = math.lerp(var31.Color.Common.Backdrop.Transparency, 1, p21)
					}
				end),
				onActivated = function() --[[ line: 734 ]]
					-- upvalues: var84 (ref)
					var84()
				end,
				testId = `{var29.testId}--backdrop`
			})
		})), var30)
	end
	return var96
end))