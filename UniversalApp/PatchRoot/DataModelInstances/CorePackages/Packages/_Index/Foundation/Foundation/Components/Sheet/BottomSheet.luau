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
	local var1 = 0
	
	for i, v in snapPoints do
		local var2 = var10(v)
		
		if var1 < var2 then
			var1 = var2
		end
	end
	var1 = math.min(var1, var5)
	
	if var6 > 0 then
		var1 = math.min(var1, var6)
	end
	local bottom = useHardwareInsetsModule(var2).bottom
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useRef(false)
	local var5 = if flagsModule.FoundationBottomSheetOnSnapPointChanged then reactModule.useRef(var1.onSnapPointChanged) else nil
	
	if flagsModule.FoundationBottomSheetOnSnapPointChanged then
		var5.current = var1.onSnapPointChanged
	end
	local var6, var7 = useAnimatedBinding(1, function()
		-- upvalues: var4 (ref), var1 (ref)
		if var4.current then
			var1.onClose()
		end
	end)
	local var8, var9 = reactModule.useBinding(-bottom)
	local var10, var11 = reactModule.useBinding(0)
	local var12, var13 = reactModule.useBinding(false)
	local var14, var15 = reactModule.useBinding(false)
	local _ = nil
	local _ = nil
	local _ = nil
	local var16 = childrenHasFullBleedModule(var1.children)
	local var17, var18 = reactModule.useBinding(0)
	local var19 = var17
	local var20 = var18
	local var21 = reactModule.useRef(0)
	local var22 = reactModule.useRef(nil)
	local var23, var24 = reactModule.useBinding(0)
	local var25 = reactModule.useRef(nil)
	local var26, var27 = reactModule.useBinding(false)
	local var28 = reactModule.useRef(false)
	local var29 = reactModule.useRef(0)
	local var30 = reactModule.useRef(nil)
	local var31 = reactModule.useRef(false)
	local var32 = reactModule.useRef(0)
	local _ = nil
	local var33 = nil
	local _ = nil
	local var34 = nil
	
	if flagsModule.FoundationBottomSheetGestureInteractionSink then
		local var35 = reactModule.useRef(false)
		local var36, var37 = reactModule.useState(false)
		var33 = var36
		local var38 = var37
		var34 = reactModule.useCallback(function(p3)
			-- upvalues: var35 (write), var38 (write)
			if var35.current == p3 then
				return
			end
			var35.current = p3
			var38(p3)
		end, {})
	end
	local var39 = reactModule.useCallback(function()
		-- upvalues: var30 (ref), var29 (ref), var31 (ref)
		if var30.current then
			var30.current:Disconnect()
			var30.current = nil
		end
		var29.current = 0
		var31.current = false
	end, {})
	local var40 = reactModule.useCallback(function(p3)
		-- upvalues: var39 (ref), var31 (ref), var22 (ref), var30 (ref), var32 (ref)
		var39()
		var31.current = true
		
		if var22.current then
			var22.current:ResetScrollVelocity()
		end
		var30.current = game:GetService("RunService").Heartbeat:Connect(function(p4)
			-- upvalues: var22 (copy), var31 (copy), var39 (copy), var32 (copy), p4 (ref)
			if not var22.current or not var31.current then
				var39()
				
				return
			end
			local y = var22.current.CanvasPosition.Y
			local _ = nil
			local current = var32.current
			local var41 = y - p4
			local var42 = 25.132741228718 * p4
			local expValue = math.exp(-var42)
			local var43 = current + 25.132741228718 * var41
			local var44 = p4 + (var41 + var43 * p4) * expValue
			var32.current = (current - var43 * var42) * expValue
			var22.current.CanvasPosition = Vector2.new(0, var44)
			
			if math.abs(p4 - var22.current.CanvasPosition.Y) < 0.5 and math.abs(var32.current) < 1 then
				var22.current.CanvasPosition = Vector2.new(0, p4)
				var39()
			end
		end)
	end, { var39 })
	local var41 = reactModule.useCallback(function(p3)
		-- upvalues: var10 (ref), var1 (write), bottom (ref)
		return math.min(var10(p3), var1) + bottom
	end, { bottom, var10, var1 })
	local var42 = reactModule.useCallback(function(p3)
		-- upvalues: var3 (ref), var40 (ref), var41 (ref), snapPoints (ref), flagsModule (copy), var5 (ref)
		var3.current = p3
		var40(var41(snapPoints[p3]))
		
		if flagsModule.FoundationBottomSheetOnSnapPointChanged and var5.current then
			var5.current(snapPoints[p3], p3)
		end
	end, { var41, snapPoints })
	local var43 = reactModule.useCallback(function(p3)
		-- upvalues: var39 (ref), var3 (ref), var22 (ref), var41 (ref), snapPoints (ref), flagsModule (copy), var5 (ref)
		var39()
		var3.current = p3
		
		if var22.current then
			var22.current.CanvasPosition = Vector2.new(0, var41(snapPoints[p3]))
		end
		if flagsModule.FoundationBottomSheetOnSnapPointChanged and var5.current then
			var5.current(snapPoints[p3], p3)
		end
	end, { var39, var41, snapPoints })
	local var44 = reactModule.useCallback(function(p3)
		-- upvalues: var4 (ref), reducedMotion (ref), var39 (ref), var22 (ref), var7 (ref), otterModule (copy), var32 (ref), var29 (ref), var40 (ref), var3 (ref)
		if var4.current then return end
		if not reducedMotion or p3 then
			var32.current = -var29.current
			var40(0)
			var7(otterModule.ease(1, { duration = var3.Time.Time_100 }))
			var4.current = true
			
			return
		end
		var4.current = true
		var39()
		
		if var22.current then
			var22.current.CanvasPosition = Vector2.new(0, 0)
		end
		var7(otterModule.instant(1))
	end, { var40, var39, reducedMotion })
	local var45 = if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then reactModule.useCallback(function()
		-- upvalues: var1 (write), bottom (ref), var21 (ref)
		return math.floor(var1 + bottom) - 0.01 <= var21.current
	end, { var1, bottom }) else nil
	local var46 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), flagsModule (copy), var45 (ref), var21 (ref), var1 (write), bottom (ref), var29 (ref), var28 (ref), var27 (ref)
		local var47 = if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then var45() else math.floor(var47 + bottom) <= var21.current
		
		if not var47 and var29.current < 0 or var29.current > 0 and var23:getValue() <= 0 and var28.current then
			var27(false)
			
			return
		elseif (var29.current < 0 or var29.current == 0) and var47 then
			var27(true)
		end
	end, if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then { var45 } else { var1, bottom })
	local var2 = reactModule.useCallback(function()
		-- upvalues: var29 (ref), var21 (ref), snapPoints (ref), var41 (ref), var28 (ref), var32 (ref), var44 (ref), var42 (ref)
		local current = var29.current
		local var47 = var21.current - current / 2.35
		local list = { { index = 0, position = 0 } }
		
		for i, v in snapPoints do
			table.insert(list, { index = i, position = var41(v) })
		end
		table.sort(list, function(p3, p4)
			-- upvalues: var47 (ref)
			return math.abs(p3.position - var47) < math.abs(p4.position - var47)
		end)
		local var48 = list[1]
		
		if not var28.current then
			var32.current = -current
			
			if var48.index == 0 then
				var44(true)
				
				return
			end
			var42(var48.index)
		end
	end, { snapPoints, var42, var41, var44 })
	reactModule.useEffect(function()
		-- upvalues: var48 (ref), reducedMotion (ref), var43 (ref), var47 (ref), var7 (ref), otterModule (copy), var42 (ref), var3 (ref), var10 (ref), snapPoints (ref), var47 (write), var27 (ref), var39 (ref)
		if var48 then
			if reducedMotion then
				var43(var47.defaultSnapPointIndex)
				var7(otterModule.instant(0))
			else
				var42(var47.defaultSnapPointIndex)
				var7(otterModule.ease(0, { duration = var3.Time.Time_100 }))
			end
			var27(var47 <= var10(snapPoints[var47.defaultSnapPointIndex]))
		end
		return function()
			-- upvalues: var39 (copy)
			var39()
		end
	end, {
		var48, snapPoints, var47.defaultSnapPointIndex, var42, var10, var43,
		reducedMotion
	})
	
	if flagsModule.FoundationBottomSheetFixHeightCap then
		reactModule.useLayoutEffect(function()
			-- upvalues: var48 (ref), var7 (ref)
			if var48 then
				var7(var48.AbsoluteSize.Y)
				local var49 = var48:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					-- upvalues: var7 (copy), var48 (copy)
					var7(var48.AbsoluteSize.Y)
				end)
				
				return function()
					-- upvalues: var49 (ref)
					var49:Disconnect()
				end
			end
		end, { var48 })
	end
	reactModule.useEffect(function()
		-- upvalues: var29 (ref), flagsModule (copy), var28 (ref), var34 (write), var46 (ref), var39 (ref), var22 (ref), var45 (ref), var21 (ref), var47 (write), bottom (ref), var4 (ref), var27 (ref), var48 (ref)
		local touchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, p3, p4, _)
			-- upvalues: var29 (copy), flagsModule (copy), var28 (copy), var34 (copy), var46 (copy)
			var29.current = p4.Y
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink and var28.current and (p3 and math.abs(p3.X) < math.abs(p3.Y)) then
				var34(true)
			end
			var46()
		end)
		local inputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function()
			-- upvalues: var28 (copy), var29 (copy), flagsModule (copy), var34 (copy), var39 (copy)
			var28.current = true
			var29.current = 0
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var34(false)
			end
			var39()
		end)
		local inputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function()
			-- upvalues: var28 (copy), flagsModule (copy), var34 (copy), var22 (copy), var29 (copy), var45 (copy), var21 (copy), var47 (copy), bottom (copy), var4 (copy), var27 (copy), var48 (copy)
			if var28.current == false then return end
			var28.current = false
			
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var34(false)
			end
			var29.current = if var22.current then var22.current:GetScrollVelocity().Y else 0
			
			if (if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then var45() else math.floor(var47 + bottom) <= var21.current) or var4.current then
				var27(true)
				
				return
			end
			var48()
		end)
		
		return function()
			-- upvalues: flagsModule (copy), var34 (copy), touchPanConnection (ref), inputBeganConnection (ref), inputEndedConnection (ref)
			if flagsModule.FoundationBottomSheetGestureInteractionSink then
				var34(false)
			end
			touchPanConnection:Disconnect()
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, if flagsModule.FoundationBottomSheetScrollAtMaxTolerance then {
		var48, var48, var46, var39, var45,
		if flagsModule.FoundationBottomSheetGestureInteractionSink then var34 else nil
	} else {
		var48,
		var48,
		var46,
		var39,
		if flagsModule.FoundationBottomSheetGestureInteractionSink then var34 else nil
	})
	local var47 = reactModule.useRef(nil)
	local var48, var49 = reactModule.useState(nil)
	local var50, var51 = reactModule.useState(nil)
	local var52 = reactUtilsModule.useComposedRef(p2, var51)
	reactModule.useImperativeHandle(var47.sheetRef, function()
		-- upvalues: var44 (ref)
		return { close = var44 }
	end, {})
	
	return var48 and reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
		tag = "size-full",
		ZIndex = var50.zIndex,
		ref = var52,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		testId = `{var47.testId}--surface`,
		onAbsoluteSizeChanged = if not flagsModule.FoundationBottomSheetFixHeightCap then function(p3)
			-- upvalues: var7 (ref)
			var7(p3.AbsoluteSize.Y)
		end else nil
	}, reactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = UDim2.new(1, 0, 1, var47 + bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = var22,
		[reactModule.Change.CanvasPosition] = function(p3)
			-- upvalues: var21 (ref), var9 (ref), bottom (ref), var49 (ref), var46 (ref), var44 (ref)
			var21.current = p3.CanvasPosition.Y
			var9(var21.current - bottom - var49.Margin.Small)
			var46()
			
			if var21.current <= 0 then
				var44()
			end
		end
	}, {
		SheetContainer = reactModule.createElement(viewModule, {
			ZIndex = 3,
			Size = UDim2.new(1, 0, 1, 200 - var47 - bottom),
			Position = UDim2.new(0, 0, 1, -var47)
		}, {
			Sheet = reactModule.createElement(viewModule, {
				Size = if var47.snapPoints == nil then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, var47 + 200),
				AutomaticSize = if var47.snapPoints == nil then Enum.AutomaticSize.Y else nil,
				onAbsoluteSizeChanged = if var47.snapPoints == nil then function(p3)
					-- upvalues: var9 (ref)
					var9(p3.AbsoluteSize.Y - 200)
				end else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				testId = var47.testId,
				tag = {
					["col items-center radius-large clip bg-surface-100"] = true,
					["padding-top-medium"] = not var16
				}
			}, {
				GripperContainer = reactModule.createElement("Folder", nil, {
					Gripper = reactModule.createElement(viewModule, {
						ZIndex = 5,
						tag = "align-y-center size-1000-100 padding-y-small radius-small",
						backgroundStyle = var49.Color.Content.Muted,
						Position = UDim2.new(0.5, 0, 0, if var16 then var49.Padding.Small else -var49.Padding.XSmall),
						AnchorPoint = Vector2.new(0.5, 0),
						testId = `{var47.testId}--gripper`
					}, {
						TouchTarget = reactModule.createElement(viewModule, {
							tag = "size-1000-600",
							stateLayer = { affordance = stateLayerAffordanceModule.None },
							onActivated = function()
								-- upvalues: var28 (ref), var25 (ref), var24 (ref), snapPoints (ref), var49 (ref), reducedMotion (ref), var43 (ref), var42 (ref), var10 (ref), var47 (write), var27 (ref), var44 (ref)
								var28.current = false
								
								if var25.current then
									var24(0)
									var25.current.CanvasPosition = Vector2.new(0, 0)
									var25.current:ResetScrollVelocity()
								end
								if #snapPoints <= 1 then
									var44()
									
									return
								end
								local var53 = var49.current % #snapPoints + 1
								
								if reducedMotion then
									var43(var53)
								else
									var42(var53)
								end
								var27(var53 <= var10(snapPoints[var53]))
							end
						})
					})
				}),
				Content = reactModule.createElement(sheetContextModule.Provider, {
					value = reactModule.useMemo(function()
						-- upvalues: var10 (ref), var11 (ref), var12 (ref), var13 (ref), var8 (ref), var9 (ref), bottom (ref), var26 (ref), var23 (ref), var25 (ref), var24 (ref), var46 (ref), var14 (ref), var15 (ref), var16 (write), var19 (write), var20 (write), var44 (ref), sheetTypeModule (copy), var50 (ref), var47 (ref), var47 (ref), var48 (ref), var49 (ref), flagsModule (copy), var33 (write)
						return {
							bottomPadding = 200,
							hasRadius = true,
							actionsHeight = var10,
							setActionsHeight = var11,
							hasActionsDivider = var12,
							setHasActionsDivider = var13,
							sheetHeightAvailable = var8,
							setSheetHeightAvailable = var9,
							safeAreaPadding = bottom,
							innerScrollingEnabled = var26,
							innerScrollY = var23,
							innerScrollingRef = var25,
							setInnerScrollY = function(value)
								-- upvalues: var24 (copy), var46 (copy)
								var24(value)
								var46()
							end,
							hasHeader = var14,
							setHasHeader = var15,
							hasFullBleed = var16,
							fullBleedHeight = var19,
							setFullBleedHeight = var20,
							closeSheet = var44,
							sheetType = sheetTypeModule.Bottom,
							innerSurface = var50,
							testId = var47.testId,
							closeAffordanceRef = var47,
							contentStartRef = var48,
							setContentStartRef = var49,
							isVerticalSheetGesture = if flagsModule.FoundationBottomSheetGestureInteractionSink then var33 else nil
						}
					end, {
						var47.testId, var44, bottom, var46, var50, var47, var48, var16,
						if flagsModule.FoundationBottomSheetGestureInteractionSink then var33 else nil
					})
				}, reactModule.createElement(elevationOwnerScope, { owner = var50 }, var47.children))
			})
		}),
		Shadow = reactModule.createElement(imageModule, {
			ZIndex = 2,
			Image = SHADOW_IMAGE,
			Size = UDim2.new(1, SHADOW_SIZE * 2, 0, var47 + 200 + SHADOW_SIZE * 2),
			Position = UDim2.new(-SHADOW_SIZE, 0, 1, (-var47) - SHADOW_SIZE),
			slice = {
				scale = 2,
				center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
			},
			imageStyle = var49.Color.Extended.Black.Black_10
		}),
		Backdrop = reactModule.createElement(viewModule, {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 2),
			Position = UDim2.fromScale(0, -0.5),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			backgroundStyle = var52:map(function(p3)
				-- upvalues: var49 (ref)
				return {
					Color3 = var49.Color.Common.Backdrop.Color3,
					Transparency = math.lerp(var49.Color.Common.Backdrop.Transparency, 1, p3)
				}
			end),
			onActivated = function()
				-- upvalues: var44 (ref)
				var44()
			end,
			testId = `{var47.testId}--backdrop`
		})
	})), var48)
end))