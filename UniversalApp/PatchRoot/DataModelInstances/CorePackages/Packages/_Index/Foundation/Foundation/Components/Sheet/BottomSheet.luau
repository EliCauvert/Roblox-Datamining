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

local function _(p0, p1, p2, p3) --[[ line: 59 | named "advanceCriticalDampedSpring" ]]
	local var25 = p0 - p2
	local var26 = 25.132741228718 * p3
	local expValue = math.exp(-var26)
	local var28 = p1 + 25.132741228718 * var25
	
	return p2 + (var25 + var28 * p3) * expValue, (p1 - var28 * var26) * expValue
end

return reactModule.memo(reactModule.forwardRef(function(p4, p5) --[[ line: 77 | named "BottomSheet" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useScreenHeightModule (ref), reactModule (ref), useHardwareInsetsModule (ref), flagsModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), reactUtilsModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), reactRobloxModule (ref), typesModule (ref), dashModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	local var29 = withDefaultsModule(p4, t)
	local var30 = useOverlayModule()
	local var31 = useTokensModule()
	local var32 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var33 = useScreenHeightModule()
	local var34, var35 = reactModule.useState(if var30 then var30.AbsoluteSize.Y else 0)
	local var36, var37 = reactModule.useState(0)
	local snapPoints = var29.snapPoints or reactModule.useMemo(function() --[[ line: 90 ]]
		-- upvalues: var36 (ref)
		return { var36 }
	end, { var36 })
	local var39 = reactModule.useCallback(function(p6) --[[ line: 97 ]]
		-- upvalues: var33 (ref)
		return if p6 > 1 then p6 else p6 * var33
	end, { var33 })
	local var40 = 0
	
	for i, v in snapPoints do
		local var92 = var39(v)
		
		if var40 < var92 then
			var40 = var92
		end
	end
	var40 = math.min(var40, var33)
	
	if var34 > 0 then
		var40 = math.min(var40, var34)
	end
	local bottom = useHardwareInsetsModule(var30).bottom
	local var41 = reactModule.useRef(0)
	local var42 = reactModule.useRef(false)
	local var43 = if flagsModule.FoundationBottomSheetOnSnapPointChanged then reactModule.useRef(var29.onSnapPointChanged) else nil
	
	if flagsModule.FoundationBottomSheetOnSnapPointChanged then
		var43.current = var29.onSnapPointChanged
	end
	local var44, var45 = useAnimatedBinding(1, function() --[[ line: 132 ]]
		-- upvalues: var42 (ref), var29 (ref)
		if var42.current then
			var29.onClose()
		end
	end)
	local var46, var47 = reactModule.useBinding(-bottom)
	local var48, var49 = reactModule.useBinding(0)
	local var50, var51 = reactModule.useBinding(false)
	local var52, var53 = reactModule.useBinding(false)
	local _ = nil
	local _ = nil
	local _ = nil
	local var54 = childrenHasFullBleedModule(var29.children)
	local var55, var56 = reactModule.useBinding(0)
	local var57 = var55
	local var58 = var56
	local var59 = reactModule.useRef(0)
	local var60 = reactModule.useRef(nil)
	local var61, var62 = reactModule.useBinding(0)
	local var63 = reactModule.useRef(nil)
	local var64, var65 = reactModule.useBinding(false)
	local var66 = reactModule.useRef(false)
	local var67 = reactModule.useRef(0)
	local var68 = reactModule.useRef(nil)
	local var69 = reactModule.useRef(false)
	local var70 = reactModule.useRef(0)
	local _ = nil
	local var71 = nil
	local _ = nil
	local var72 = nil
	
	if flagsModule.FoundationBottomSheetGestureInteractionSink then
		local var73 = reactModule.useRef(false)
		local var74, var75 = reactModule.useState(false)
		var71 = var74
		local var76 = var75
		var72 = reactModule.useCallback(function(p7) --[[ line: 165 ]]
			-- upvalues: var73 (write), var76 (write)
			if var73.current == p7 then
				return
			end
			var73.current = p7
			var76(p7)
		end, {})
	end
	local var77 = reactModule.useCallback(function() --[[ line: 174 ]]
		-- upvalues: var68 (ref), var67 (ref), var69 (ref)
		if var68.current then
			var68.current:Disconnect()
			var68.current = nil
		end
		var67.current = 0
		var69.current = false
	end, {})
	local var78 = reactModule.useCallback(function(p8) --[[ line: 183 ]]
		-- upvalues: var77 (ref), var69 (ref), var60 (ref), var68 (ref), var70 (ref)
		var77()
		var69.current = true
		
		if var60.current then
			var60.current:ResetScrollVelocity()
		end
		var68.current = game:GetService("RunService").Heartbeat:Connect(function(p9) --[[ line: 192 ]]
			-- upvalues: var60 (copy), var69 (copy), var77 (copy), var70 (copy), p8 (ref)
			if not var60.current or not var69.current then
				var77()
				
				return
			end
			local y = var60.current.CanvasPosition.Y
			local _ = nil
			local current = var70.current
			local var93 = y - p8
			local var94 = 25.132741228718 * p9
			local expValue = math.exp(-var94)
			local var96 = current + 25.132741228718 * var93
			local var97 = p8 + (var93 + var96 * p9) * expValue
			var70.current = (current - var96 * var94) * expValue
			var60.current.CanvasPosition = Vector2.new(0, var97)
			
			if math.abs(p8 - var60.current.CanvasPosition.Y) < 0.5 and math.abs(var70.current) < 1 then
				var60.current.CanvasPosition = Vector2.new(0, p8)
				var77()
			end
		end)
	end, { var77 })
	local var79 = reactModule.useCallback(function(p10) --[[ line: 218 ]]
		-- upvalues: var39 (ref), var40 (write), bottom (ref)
		return math.min(var39(p10), var40) + bottom
	end, { bottom, var39, var40 })
	local var80 = reactModule.useCallback(function(p11) --[[ line: 228 ]]
		-- upvalues: var41 (ref), var78 (ref), var79 (ref), snapPoints (ref), flagsModule (copy), var43 (ref)
		var41.current = p11
		var78(var79(snapPoints[p11]))
		
		if flagsModule.FoundationBottomSheetOnSnapPointChanged and var43.current then
			var43.current(snapPoints[p11], p11)
		end
	end, { var79, snapPoints })
	local var81 = reactModule.useCallback(function(p12) --[[ line: 236 ]]
		-- upvalues: var77 (ref), var41 (ref), var60 (ref), var79 (ref), snapPoints (ref), flagsModule (copy), var43 (ref)
		var77()
		var41.current = p12
		
		if var60.current then
			var60.current.CanvasPosition = Vector2.new(0, var79(snapPoints[p12]))
		end
		if flagsModule.FoundationBottomSheetOnSnapPointChanged and var43.current then
			var43.current(snapPoints[p12], p12)
		end
	end, { var77, var79, snapPoints })
	local var82 = reactModule.useCallback(function(p13) --[[ line: 247 ]]
		-- upvalues: var42 (ref), reducedMotion (ref), var77 (ref), var60 (ref), var45 (ref), otterModule (copy), var70 (ref), var67 (ref), var78 (ref), var31 (ref)
		if var42.current then return end
		if not reducedMotion or p13 then
			var70.current = -var67.current
			var78(0)
			var45(otterModule.ease(1, { duration = var31.Time.Time_100 }))
			var42.current = true
			
			return
		end
		var42.current = true
		var77()
		
		if var60.current then
			var60.current.CanvasPosition = Vector2.new(0, 0)
		end
		var45(otterModule.instant(1))
	end, { var78, var77, reducedMotion })
	local var83 = if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then reactModule.useCallback(function() --[[ line: 269 ]]
		-- upvalues: var40 (write), bottom (ref), var59 (ref)
		return math.floor(var40 + bottom) - 0.01 <= var59.current
	end, { var40, bottom }) else nil
	local var84 = reactModule.useCallback(function() --[[ line: 276 ]]
		-- upvalues: var61 (ref), flagsModule (copy), var83 (ref), var59 (ref), var40 (write), bottom (ref), var67 (ref), var66 (ref), var65 (ref)
		local var98 = if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then var83() else math.floor(var40 + bottom) <= var59.current
		
		if not var98 and var67.current < 0 or var67.current > 0 and var61:getValue() <= 0 and var66.current then
			var65(false)
			
			return
		elseif (var67.current < 0 or var67.current == 0) and var98 then
			var65(true)
		end
	end, if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then { var83 } else { var40, bottom })
	local var85 = reactModule.useCallback(function() --[[ line: 294 ]]
		-- upvalues: var67 (ref), var59 (ref), snapPoints (ref), var79 (ref), var66 (ref), var70 (ref), var82 (ref), var80 (ref)
		local current = var67.current
		local var99 = var59.current - current / 2.35
		local list = { { index = 0, position = 0 } }
		
		for i, v in snapPoints do
			table.insert(list, { index = i, position = var79(v) })
		end
		table.sort(list, function(p14, p15) --[[ line: 312 ]]
			-- upvalues: var99 (ref)
			return math.abs(p14.position - var99) < math.abs(p15.position - var99)
		end)
		local var101 = list[1]
		
		if not var66.current then
			var70.current = -current
			
			if var101.index == 0 then
				var82(true)
				
				return
			end
			var80(var101.index)
		end
	end, { snapPoints, var80, var79, var82 })
	reactModule.useEffect(function() --[[ line: 328 ]]
		-- upvalues: var30 (ref), reducedMotion (ref), var81 (ref), var29 (ref), var45 (ref), otterModule (copy), var80 (ref), var31 (ref), var39 (ref), snapPoints (ref), var40 (write), var65 (ref), var77 (ref)
		if var30 then
			if reducedMotion then
				var81(var29.defaultSnapPointIndex)
				var45(otterModule.instant(0))
			else
				var80(var29.defaultSnapPointIndex)
				var45(otterModule.ease(0, { duration = var31.Time.Time_100 }))
			end
			var65(var40 <= var39(snapPoints[var29.defaultSnapPointIndex]))
		end
		return function() --[[ line: 344 ]]
			-- upvalues: var77 (copy)
			var77()
		end
	end, {
		var30, snapPoints, var29.defaultSnapPointIndex, var80, var39, var81,
		reducedMotion
	})
	
	if flagsModule.FoundationBottomSheetFixHeightCap then
		reactModule.useLayoutEffect(function() --[[ line: 360 ]]
			-- upvalues: var30 (ref), var35 (ref)
			if var30 then
				var35(var30.AbsoluteSize.Y)
				local var102 = var30:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 365 ]]
					-- upvalues: var35 (copy), var30 (copy)
					var35(var30.AbsoluteSize.Y)
				end)
				
				return function() --[[ line: 368 ]]
					-- upvalues: var102 (ref)
					var102:Disconnect()
				end
			end
		end, { var30 })
	end
	reactModule.useEffect(function() --[[ line: 378 ]]
		-- upvalues: var67 (ref), flagsModule (copy), var66 (ref), var72 (write), var84 (ref), var77 (ref), var60 (ref), var83 (ref), var59 (ref), var40 (write), bottom (ref), var42 (ref), var65 (ref), var85 (ref)
		local touchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, p16, p17, _) --[[ line: 380 ]]
			-- upvalues: var67 (copy), flagsModule (copy), var66 (copy), var72 (copy), var84 (copy)
			var67.current = p17.Y
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink and var66.current and (p16 and math.abs(p16.X) < math.abs(p16.Y)) then
				var72(true)
			end
			var84()
		end)
		local inputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function() --[[ line: 393 ]]
			-- upvalues: var66 (copy), var67 (copy), flagsModule (copy), var72 (copy), var77 (copy)
			var66.current = true
			var67.current = 0
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var72(false)
			end
			var77()
		end)
		local inputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function() --[[ line: 401 ]]
			-- upvalues: var66 (copy), flagsModule (copy), var72 (copy), var60 (copy), var67 (copy), var83 (copy), var59 (copy), var40 (copy), bottom (copy), var42 (copy), var65 (copy), var85 (copy)
			if var66.current == false then return end
			var66.current = false
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var72(false)
			end
			var67.current = if var60.current then var60.current:GetScrollVelocity().Y else 0
			
			if (if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then var83() else math.floor(var40 + bottom) <= var59.current) or var42.current then
				var65(true)
				
				return
			end
			var85()
		end)
		
		return function() --[[ line: 431 ]]
			-- upvalues: flagsModule (copy), var72 (copy), touchPanConnection (ref), inputBeganConnection (ref), inputEndedConnection (ref)
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var72(false)
			end
			touchPanConnection:Disconnect()
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then {
		var30, var85, var84, var77, var83,
		if flagsModule.FoundationBottomSheetGestureInteractionSink then var72 else nil
	} else {
		var30,
		var85,
		var84,
		var77,
		if flagsModule.FoundationBottomSheetGestureInteractionSink then var72 else nil
	})
	local var86 = reactModule.useRef(nil)
	local var87, var88 = reactModule.useState(nil)
	local var89, var90 = reactModule.useState(nil)
	local var91 = reactUtilsModule.useComposedRef(p5, var90)
	reactModule.useImperativeHandle(var29.sheetRef, function() --[[ line: 464 ]]
		-- upvalues: var82 (ref)
		return { close = var82 }
	end, {})
	
	return var30 and reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
		tag = "size-full",
		ZIndex = var32.zIndex,
		ref = var91,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		testId = `{var29.testId}--surface`,
		onAbsoluteSizeChanged = if not flagsModule.FoundationBottomSheetFixHeightCap then function(p18) --[[ line: 568 ]]
			-- upvalues: var35 (ref)
			var35(p18.AbsoluteSize.Y)
		end else nil
	}, reactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = UDim2.new(1, 0, 1, var40 + bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = var60,
		[reactModule.Change.CanvasPosition] = function(p19) --[[ line: 581 ]]
			-- upvalues: var59 (ref), var47 (ref), bottom (ref), var31 (ref), var84 (ref), var82 (ref)
			var59.current = p19.CanvasPosition.Y
			var47(var59.current - bottom - var31.Margin.Small)
			var84()
			
			if var59.current <= 0 then
				var82()
			end
		end
	}, {
		SheetContainer = reactModule.createElement(viewModule, {
			ZIndex = 3,
			Size = UDim2.new(1, 0, 1, 200 - var40 - bottom),
			Position = UDim2.new(0, 0, 1, -var40)
		}, {
			Sheet = reactModule.createElement(viewModule, {
				Size = if var29.snapPoints == nil then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, var40 + 200),
				AutomaticSize = if var29.snapPoints == nil then Enum.AutomaticSize.Y else nil,
				onAbsoluteSizeChanged = if var29.snapPoints == nil then function(p20) --[[ line: 601 ]]
					-- upvalues: var37 (ref)
					var37(p20.AbsoluteSize.Y - 200)
				end else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				testId = var29.testId,
				tag = {
					["col items-center radius-large clip bg-surface-100"] = true,
					["padding-top-medium"] = not var54
				}
			}, {
				GripperContainer = reactModule.createElement("Folder", nil, {
					Gripper = reactModule.createElement(viewModule, {
						ZIndex = 5,
						tag = "align-y-center size-1000-100 padding-y-small radius-small",
						backgroundStyle = var31.Color.Content.Muted,
						Position = UDim2.new(0.5, 0, 0, if var54 then var31.Padding.Small else -var31.Padding.XSmall),
						AnchorPoint = Vector2.new(0.5, 0),
						testId = `{var29.testId}--gripper`
					}, {
						TouchTarget = reactModule.createElement(viewModule, {
							tag = "size-1000-600",
							stateLayer = { affordance = stateLayerAffordanceModule.None },
							onActivated = function() --[[ line: 532 ]]
								-- upvalues: var66 (ref), var63 (ref), var62 (ref), snapPoints (ref), var41 (ref), reducedMotion (ref), var81 (ref), var80 (ref), var39 (ref), var40 (write), var65 (ref), var82 (ref)
								var66.current = false
								
								if var63.current then
									var62(0)
									var63.current.CanvasPosition = Vector2.new(0, 0)
									var63.current:ResetScrollVelocity()
								end
								if #snapPoints <= 1 then
									var82()
									
									return
								end
								local var106 = var41.current % #snapPoints + 1
								
								if reducedMotion then
									var81(var106)
								else
									var80(var106)
								end
								var65(var40 <= var39(snapPoints[var106]))
							end
						})
					})
				}),
				Content = reactModule.createElement(sheetContextModule.Provider, {
					value = reactModule.useMemo(function() --[[ line: 471 ]]
						-- upvalues: var48 (ref), var49 (ref), var50 (ref), var51 (ref), var46 (ref), var47 (ref), bottom (ref), var64 (ref), var61 (ref), var63 (ref), var62 (ref), var84 (ref), var52 (ref), var53 (ref), var54 (write), var57 (write), var58 (write), var82 (ref), sheetTypeModule (copy), var89 (ref), var29 (ref), var86 (ref), var87 (ref), var88 (ref), flagsModule (copy), var71 (write)
						return {
							bottomPadding = 200,
							hasRadius = true,
							actionsHeight = var48,
							setActionsHeight = var49,
							hasActionsDivider = var50,
							setHasActionsDivider = var51,
							sheetHeightAvailable = var46,
							setSheetHeightAvailable = var47,
							safeAreaPadding = bottom,
							innerScrollingEnabled = var64,
							innerScrollY = var61,
							innerScrollingRef = var63,
							setInnerScrollY = function(value) --[[ line: 484 ]]
								-- upvalues: var62 (copy), var84 (copy)
								var62(value)
								var84()
							end,
							hasHeader = var52,
							setHasHeader = var53,
							hasFullBleed = var54,
							fullBleedHeight = var57,
							setFullBleedHeight = var58,
							closeSheet = var82,
							sheetType = sheetTypeModule.Bottom,
							innerSurface = var89,
							testId = var29.testId,
							closeAffordanceRef = var86,
							contentStartRef = var87,
							setContentStartRef = var88,
							isVerticalSheetGesture = if flagsModule.FoundationBottomSheetGestureInteractionSink then var71 else nil
						}
					end, {
						var29.testId, var82, bottom, var84, var89, var86, var87, var54,
						if flagsModule.FoundationBottomSheetGestureInteractionSink then var71 else nil
					})
				}, reactModule.createElement(elevationOwnerScope, { owner = var32 }, var29.children))
			})
		}),
		Shadow = reactModule.createElement(imageModule, {
			ZIndex = 2,
			Image = SHADOW_IMAGE,
			Size = UDim2.new(1, SHADOW_SIZE * 2, 0, var40 + 200 + SHADOW_SIZE * 2),
			Position = UDim2.new(-SHADOW_SIZE, 0, 1, (-var40) - SHADOW_SIZE),
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
			backgroundStyle = var44:map(function(p21) --[[ line: 642 ]]
				-- upvalues: var31 (ref)
				return {
					Color3 = var31.Color.Common.Backdrop.Color3,
					Transparency = math.lerp(var31.Color.Common.Backdrop.Transparency, 1, p21)
				}
			end),
			onActivated = function() --[[ line: 648 ]]
				-- upvalues: var82 (ref)
				var82()
			end,
			testId = `{var29.testId}--backdrop`
		})
	})), var30)
end))