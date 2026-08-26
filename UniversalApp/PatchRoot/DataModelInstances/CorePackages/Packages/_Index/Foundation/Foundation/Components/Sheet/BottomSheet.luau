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

local function _(p1, p2, p3, p4)
	local var1 = p1 - p3
	local var2 = 25.132741228718 * p4
	local expValue = math.exp(-var2)
	local var3 = p2 + 25.132741228718 * var1
	
	return p3 + (var1 + var3 * p4) * expValue, (p2 - var3 * var2) * expValue
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useScreenHeightModule (ref), reactModule (ref), useHardwareInsetsModule (ref), flagsModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), reactUtilsModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), reactRobloxModule (ref), typesModule (ref), dashModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useOverlayModule()
	local var3 = useTokensModule()
	local var4 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local var5 = useScreenHeightModule()
	local var6, var7 = reactModule.useState(if var2 then var2.AbsoluteSize.Y else 0)
	local var8, var9 = reactModule.useState(0)
	local snapPoints = var1.snapPoints or reactModule.useMemo(function()
		-- upvalues: var8 (ref)
		return { var8 }
	end, { var8 })
	local var10 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref)
		return if p3 > 1 then p3 else p3 * var5
	end, { var5 })
	local var11 = 0
	
	for i, v in snapPoints do
		local var12 = var10(v)
		
		if var11 < var12 then
			var11 = var12
		end
	end
	var11 = math.min(var11, var5)
	
	if var6 > 0 then
		var11 = math.min(var11, var6)
	end
	local bottom = useHardwareInsetsModule(var2).bottom
	local var13 = reactModule.useRef(0)
	local var14 = reactModule.useRef(false)
	local var15 = if flagsModule.FoundationBottomSheetOnSnapPointChanged then reactModule.useRef(var1.onSnapPointChanged) else nil
	
	if flagsModule.FoundationBottomSheetOnSnapPointChanged then
		var15.current = var1.onSnapPointChanged
	end
	local var16, var17 = useAnimatedBinding(1, function()
		-- upvalues: var14 (ref), var1 (ref)
		if var14.current then
			var1.onClose()
		end
	end)
	local var18, var19 = reactModule.useBinding(-bottom)
	local var20, var21 = reactModule.useBinding(0)
	local var22, var23 = reactModule.useBinding(false)
	local var24, var25 = reactModule.useBinding(false)
	local _ = nil
	local _ = nil
	local _ = nil
	local var26 = childrenHasFullBleedModule(var1.children)
	local var27, var28 = reactModule.useBinding(0)
	local var29 = var27
	local var30 = var28
	local var31 = reactModule.useRef(0)
	local var32 = reactModule.useRef(nil)
	local var33, var34 = reactModule.useBinding(0)
	local var35 = reactModule.useRef(nil)
	local var36, var37 = reactModule.useBinding(false)
	local var38 = reactModule.useRef(false)
	local var39 = reactModule.useRef(0)
	local var40 = reactModule.useRef(nil)
	local var41 = reactModule.useRef(false)
	local var42 = reactModule.useRef(0)
	local _ = nil
	local var43 = nil
	local _ = nil
	local var44 = nil
	
	if flagsModule.FoundationBottomSheetGestureInteractionSink then
		local var45 = reactModule.useRef(false)
		local var46, var47 = reactModule.useState(false)
		var43 = var46
		local var48 = var47
		var44 = reactModule.useCallback(function(p3)
			-- upvalues: var45 (write), var48 (write)
			if var45.current == p3 then
				return
			end
			var45.current = p3
			var48(p3)
		end, {})
	end
	local var49 = reactModule.useCallback(function()
		-- upvalues: var40 (ref), var39 (ref), var41 (ref)
		if var40.current then
			var40.current:Disconnect()
			var40.current = nil
		end
		var39.current = 0
		var41.current = false
	end, {})
	local var50 = reactModule.useCallback(function(p3)
		-- upvalues: var49 (ref), var41 (ref), var32 (ref), var40 (ref), var42 (ref)
		var49()
		var41.current = true
		
		if var32.current then
			var32.current:ResetScrollVelocity()
		end
		var40.current = game:GetService("RunService").Heartbeat:Connect(function(p4)
			-- upvalues: var32 (copy), var41 (copy), var49 (copy), var42 (copy), p3 (ref)
			if not var32.current or not var41.current then
				var49()
				
				return
			end
			local y = var32.current.CanvasPosition.Y
			local _ = nil
			local current = var42.current
			local var51 = y - p3
			local var52 = 25.132741228718 * p4
			local expValue = math.exp(-var52)
			local var53 = current + 25.132741228718 * var51
			local var54 = p3 + (var51 + var53 * p4) * expValue
			var42.current = (current - var53 * var52) * expValue
			var32.current.CanvasPosition = Vector2.new(0, var54)
			
			if math.abs(p3 - var32.current.CanvasPosition.Y) < 0.5 and math.abs(var42.current) < 1 then
				var32.current.CanvasPosition = Vector2.new(0, p3)
				var49()
			end
		end)
	end, { var49 })
	local var51 = reactModule.useCallback(function(p3)
		-- upvalues: var10 (ref), var11 (write), bottom (ref)
		return math.min(var10(p3), var11) + bottom
	end, { bottom, var10, var11 })
	local var52 = reactModule.useCallback(function(p3)
		-- upvalues: var13 (ref), var50 (ref), var51 (ref), snapPoints (ref), flagsModule (copy), var15 (ref)
		var13.current = p3
		var50(var51(snapPoints[p3]))
		
		if flagsModule.FoundationBottomSheetOnSnapPointChanged and var15.current then
			var15.current(snapPoints[p3], p3)
		end
	end, { var51, snapPoints })
	local var53 = reactModule.useCallback(function(p3)
		-- upvalues: var49 (ref), var13 (ref), var32 (ref), var51 (ref), snapPoints (ref), flagsModule (copy), var15 (ref)
		var49()
		var13.current = p3
		
		if var32.current then
			var32.current.CanvasPosition = Vector2.new(0, var51(snapPoints[p3]))
		end
		if flagsModule.FoundationBottomSheetOnSnapPointChanged and var15.current then
			var15.current(snapPoints[p3], p3)
		end
	end, { var49, var51, snapPoints })
	local var54 = reactModule.useCallback(function(p3)
		-- upvalues: var14 (ref), reducedMotion (ref), var49 (ref), var32 (ref), var17 (ref), otterModule (copy), var42 (ref), var39 (ref), var50 (ref), var3 (ref)
		if var14.current then return end
		if not reducedMotion or p3 then
			var42.current = -var39.current
			var50(0)
			var17(otterModule.ease(1, { duration = var3.Time.Time_100 }))
			var14.current = true
			
			return
		end
		var14.current = true
		var49()
		
		if var32.current then
			var32.current.CanvasPosition = Vector2.new(0, 0)
		end
		var17(otterModule.instant(1))
	end, { var50, var49, reducedMotion })
	local var55 = if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then reactModule.useCallback(function()
		-- upvalues: var11 (write), bottom (ref), var31 (ref)
		return math.floor(var11 + bottom) - 0.01 <= var31.current
	end, { var11, bottom }) else nil
	local var56 = reactModule.useCallback(function()
		-- upvalues: var33 (ref), flagsModule (copy), var55 (ref), var31 (ref), var11 (write), bottom (ref), var39 (ref), var38 (ref), var37 (ref)
		local var57 = if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then var55() else math.floor(var11 + bottom) <= var31.current
		
		if not var57 and var39.current < 0 or var39.current > 0 and var33:getValue() <= 0 and var38.current then
			var37(false)
			
			return
		elseif (var39.current < 0 or var39.current == 0) and var57 then
			var37(true)
		end
	end, if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then { var55 } else { var11, bottom })
	local var57 = reactModule.useCallback(function()
		-- upvalues: var39 (ref), var31 (ref), snapPoints (ref), var51 (ref), var38 (ref), var42 (ref), var54 (ref), var52 (ref)
		local current = var39.current
		local var58 = var31.current - current / 2.35
		local list = { { index = 0, position = 0 } }
		
		for i, v in snapPoints do
			table.insert(list, { index = i, position = var51(v) })
		end
		table.sort(list, function(p3, p4)
			-- upvalues: var58 (ref)
			return math.abs(p3.position - var58) < math.abs(p4.position - var58)
		end)
		local var59 = list[1]
		
		if not var38.current then
			var42.current = -current
			
			if var59.index == 0 then
				var54(true)
				
				return
			end
			var52(var59.index)
		end
	end, { snapPoints, var52, var51, var54 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), reducedMotion (ref), var53 (ref), var1 (ref), var17 (ref), otterModule (copy), var52 (ref), var3 (ref), var10 (ref), snapPoints (ref), var11 (write), var37 (ref), var49 (ref)
		if var2 then
			if reducedMotion then
				var53(var1.defaultSnapPointIndex)
				var17(otterModule.instant(0))
			else
				var52(var1.defaultSnapPointIndex)
				var17(otterModule.ease(0, { duration = var3.Time.Time_100 }))
			end
			var37(var11 <= var10(snapPoints[var1.defaultSnapPointIndex]))
		end
		return function()
			-- upvalues: var49 (copy)
			var49()
		end
	end, {
		var2, snapPoints, var1.defaultSnapPointIndex, var52, var10, var53,
		reducedMotion
	})
	
	if flagsModule.FoundationBottomSheetFixHeightCap then
		reactModule.useLayoutEffect(function()
			-- upvalues: var2 (ref), var7 (ref)
			if var2 then
				var7(var2.AbsoluteSize.Y)
				local var60 = var2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					-- upvalues: var7 (copy), var2 (copy)
					var7(var2.AbsoluteSize.Y)
				end)
				
				return function()
					-- upvalues: var60 (ref)
					var60:Disconnect()
				end
			end
		end, { var2 })
	end
	reactModule.useEffect(function()
		-- upvalues: var39 (ref), flagsModule (copy), var38 (ref), var44 (write), var56 (ref), var49 (ref), var32 (ref), var55 (ref), var31 (ref), var11 (write), bottom (ref), var14 (ref), var37 (ref), var57 (ref)
		local touchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, p3, p4, _)
			-- upvalues: var39 (copy), flagsModule (copy), var38 (copy), var44 (copy), var56 (copy)
			var39.current = p4.Y
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink and var38.current and (p3 and math.abs(p3.X) < math.abs(p3.Y)) then
				var44(true)
			end
			var56()
		end)
		local inputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function()
			-- upvalues: var38 (copy), var39 (copy), flagsModule (copy), var44 (copy), var49 (copy)
			var38.current = true
			var39.current = 0
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var44(false)
			end
			var49()
		end)
		local inputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function()
			-- upvalues: var38 (copy), flagsModule (copy), var44 (copy), var32 (copy), var39 (copy), var55 (copy), var31 (copy), var11 (copy), bottom (copy), var14 (copy), var37 (copy), var57 (copy)
			if var38.current == false then return end
			var38.current = false
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var44(false)
			end
			var39.current = if var32.current then var32.current:GetScrollVelocity().Y else 0
			
			if (if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then var55() else math.floor(var11 + bottom) <= var31.current) or var14.current then
				var37(true)
				
				return
			end
			var57()
		end)
		
		return function()
			-- upvalues: flagsModule (copy), var44 (copy), touchPanConnection (ref), inputBeganConnection (ref), inputEndedConnection (ref)
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var44(false)
			end
			touchPanConnection:Disconnect()
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then {
		var2, var57, var56, var49, var55,
		if flagsModule.FoundationBottomSheetGestureInteractionSink then var44 else nil
	} else {
		var2,
		var57,
		var56,
		var49,
		if flagsModule.FoundationBottomSheetGestureInteractionSink then var44 else nil
	})
	local var60 = reactModule.useRef(nil)
	local var61, var62 = reactModule.useState(nil)
	local var63, var64 = reactModule.useState(nil)
	local var65 = reactUtilsModule.useComposedRef(p2, var64)
	reactModule.useImperativeHandle(var1.sheetRef, function()
		-- upvalues: var54 (ref)
		return { close = var54 }
	end, {})
	
	return var2 and reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
		tag = "size-full",
		ZIndex = var4.zIndex,
		ref = var65,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		testId = `{var1.testId}--surface`,
		onAbsoluteSizeChanged = if not flagsModule.FoundationBottomSheetFixHeightCap then function(p3)
			-- upvalues: var7 (ref)
			var7(p3.AbsoluteSize.Y)
		end else nil
	}, reactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = UDim2.new(1, 0, 1, var11 + bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = var32,
		[reactModule.Change.CanvasPosition] = function(p3)
			-- upvalues: var31 (ref), var19 (ref), bottom (ref), var3 (ref), var56 (ref), var54 (ref)
			var31.current = p3.CanvasPosition.Y
			var19(var31.current - bottom - var3.Margin.Small)
			var56()
			
			if var31.current <= 0 then
				var54()
			end
		end
	}, {
		SheetContainer = reactModule.createElement(viewModule, {
			ZIndex = 3,
			Size = UDim2.new(1, 0, 1, 200 - var11 - bottom),
			Position = UDim2.new(0, 0, 1, -var11)
		}, {
			Sheet = reactModule.createElement(viewModule, {
				Size = if var1.snapPoints == nil then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, var11 + 200),
				AutomaticSize = if var1.snapPoints == nil then Enum.AutomaticSize.Y else nil,
				onAbsoluteSizeChanged = if var1.snapPoints == nil then function(p3)
					-- upvalues: var9 (ref)
					var9(p3.AbsoluteSize.Y - 200)
				end else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				testId = var1.testId,
				tag = {
					["col items-center radius-large clip bg-surface-100"] = true,
					["padding-top-medium"] = not var26
				}
			}, {
				GripperContainer = reactModule.createElement("Folder", nil, {
					Gripper = reactModule.createElement(viewModule, {
						ZIndex = 5,
						tag = "align-y-center size-1000-100 padding-y-small radius-small",
						backgroundStyle = var3.Color.Content.Muted,
						Position = UDim2.new(0.5, 0, 0, if var26 then var3.Padding.Small else -var3.Padding.XSmall),
						AnchorPoint = Vector2.new(0.5, 0),
						testId = `{var1.testId}--gripper`
					}, {
						TouchTarget = reactModule.createElement(viewModule, {
							tag = "size-1000-600",
							stateLayer = { affordance = stateLayerAffordanceModule.None },
							onActivated = function()
								-- upvalues: var38 (ref), var35 (ref), var34 (ref), snapPoints (ref), var13 (ref), reducedMotion (ref), var53 (ref), var52 (ref), var10 (ref), var11 (write), var37 (ref), var54 (ref)
								var38.current = false
								
								if var35.current then
									var34(0)
									var35.current.CanvasPosition = Vector2.new(0, 0)
									var35.current:ResetScrollVelocity()
								end
								if #snapPoints <= 1 then
									var54()
									
									return
								end
								local var66 = var13.current % #snapPoints + 1
								
								if reducedMotion then
									var53(var66)
								else
									var52(var66)
								end
								var37(var11 <= var10(snapPoints[var66]))
							end
						})
					})
				}),
				Content = reactModule.createElement(sheetContextModule.Provider, {
					value = reactModule.useMemo(function()
						-- upvalues: var20 (ref), var21 (ref), var22 (ref), var23 (ref), var18 (ref), var19 (ref), bottom (ref), var36 (ref), var33 (ref), var35 (ref), var34 (ref), var56 (ref), var24 (ref), var25 (ref), var26 (write), var29 (write), var30 (write), var54 (ref), sheetTypeModule (copy), var63 (ref), var1 (ref), var60 (ref), var61 (ref), var62 (ref), flagsModule (copy), var43 (write)
						return {
							bottomPadding = 200,
							hasRadius = true,
							actionsHeight = var20,
							setActionsHeight = var21,
							hasActionsDivider = var22,
							setHasActionsDivider = var23,
							sheetHeightAvailable = var18,
							setSheetHeightAvailable = var19,
							safeAreaPadding = bottom,
							innerScrollingEnabled = var36,
							innerScrollY = var33,
							innerScrollingRef = var35,
							setInnerScrollY = function(value)
								-- upvalues: var34 (copy), var56 (copy)
								var34(value)
								var56()
							end,
							hasHeader = var24,
							setHasHeader = var25,
							hasFullBleed = var26,
							fullBleedHeight = var29,
							setFullBleedHeight = var30,
							closeSheet = var54,
							sheetType = sheetTypeModule.Bottom,
							innerSurface = var63,
							testId = var1.testId,
							closeAffordanceRef = var60,
							contentStartRef = var61,
							setContentStartRef = var62,
							isVerticalSheetGesture = if flagsModule.FoundationBottomSheetGestureInteractionSink then var43 else nil
						}
					end, {
						var1.testId, var54, bottom, var56, var63, var60, var61, var26,
						if flagsModule.FoundationBottomSheetGestureInteractionSink then var43 else nil
					})
				}, reactModule.createElement(elevationOwnerScope, { owner = var4 }, var1.children))
			})
		}),
		Shadow = reactModule.createElement(imageModule, {
			ZIndex = 2,
			Image = SHADOW_IMAGE,
			Size = UDim2.new(1, SHADOW_SIZE * 2, 0, var11 + 200 + SHADOW_SIZE * 2),
			Position = UDim2.new(-SHADOW_SIZE, 0, 1, (-var11) - SHADOW_SIZE),
			slice = {
				scale = 2,
				center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
			},
			imageStyle = var3.Color.Extended.Black.Black_10
		}),
		Backdrop = reactModule.createElement(viewModule, {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 2),
			Position = UDim2.fromScale(0, -0.5),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			backgroundStyle = var16:map(function(p3)
				-- upvalues: var3 (ref)
				return {
					Color3 = var3.Color.Common.Backdrop.Color3,
					Transparency = math.lerp(var3.Color.Common.Backdrop.Transparency, 1, p3)
				}
			end),
			onActivated = function()
				-- upvalues: var54 (ref)
				var54()
			end,
			testId = `{var1.testId}--backdrop`
		})
	})), var2)
end))