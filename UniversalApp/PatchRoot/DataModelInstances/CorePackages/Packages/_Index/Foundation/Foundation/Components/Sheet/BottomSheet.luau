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
local flagsModule = require(foundation.Utility.Flags)
local sheetContextModule = require(script.Parent.SheetContext)
local typesModule = require(script.Parent.Types)
local sheetTypeModule = require(script.Parent.SheetType)
local childrenHasFullBleedModule = require(script.Parent.childrenHasFullBleed)
local useHardwareInsetsModule = require(script.Parent.useHardwareInsets)
local useScreenHeightModule = require(script.Parent.useScreenHeight)
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
	-- upvalues: withDefaultsModule (ref), t (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), useScreenHeightModule (ref), reactModule (ref), flagsModule (ref), useHardwareInsetsModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), reactUtilsModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), reactRobloxModule (ref), typesModule (ref), dashModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
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
	local var12 = 1e999
	
	for i, v in snapPoints do
		local var13 = var10(v)
		
		if var11 < var13 then
			var11 = var13
		end
		if flagsModule.FoundationSheetReversedContent then
			var12 = math.min(var12, var13)
		end
	end
	var11 = math.min(var11, var5)
	
	if var6 > 0 then
		var11 = math.min(var11, var6)
	end
	if flagsModule.FoundationSheetReversedContent then
		var12 = math.min(var12, var11)
	end
	local bottom = useHardwareInsetsModule(var2).bottom
	local var14 = reactModule.useRef(0)
	local var15 = reactModule.useRef(false)
	local var16 = reactModule.useRef(var1.onSnapPointChanged)
	var16.current = var1.onSnapPointChanged
	local var17, var18 = useAnimatedBinding(1, function()
		-- upvalues: var15 (ref), var1 (ref)
		if var15.current then
			var1.onClose()
		end
	end)
	local var19, var20 = reactModule.useBinding(-bottom)
	local var21, var22 = reactModule.useBinding(0)
	local var23, var24 = reactModule.useBinding(false)
	local var25, var26 = reactModule.useBinding(false)
	local _ = nil
	local _ = nil
	local _ = nil
	local var27 = childrenHasFullBleedModule(var1.children)
	local var28, var29 = reactModule.useBinding(0)
	local var30 = var28
	local var31 = var29
	local var32 = reactModule.useRef(0)
	local var33 = reactModule.useRef(nil)
	local var34, var35 = reactModule.useBinding(0)
	local var36 = reactModule.useRef(nil)
	local var37, var38 = reactModule.useBinding(false)
	local var39 = if flagsModule.FoundationSheetReversedContent then reactModule.useRef(false) else nil
	local var40 = if flagsModule.FoundationSheetReversedContent then reactModule.useCallback(function(p3)
		-- upvalues: var39 (ref)
		var39.current = p3
	end, {}) else nil
	local var41 = if flagsModule.FoundationSheetReversedContent then reactModule.useMemo(function()
		-- upvalues: var1 (ref), var19 (ref), var3 (ref), var11 (write), var12 (write)
		return if var1.snapPoints == nil then nil else var19:map(function(p3)
			-- upvalues: var3 (copy), var11 (copy), var12 (copy)
			return var11 - math.clamp(p3 + var3.Margin.Small, var12, var11)
		end)
	end, {
		var1.snapPoints == nil,
		var19,
		var12,
		var11,
		var3.Margin.Small
	}) else nil
	local var42 = reactModule.useRef(false)
	local var43 = reactModule.useRef(0)
	local var44 = reactModule.useRef(nil)
	local var45 = reactModule.useRef(false)
	local var46 = reactModule.useRef(0)
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var47 = reactModule.useRef(false)
	local var48, var49 = reactModule.useState(false)
	local var50 = var48
	local var51 = var49
	local var52 = reactModule.useCallback(function(p3)
		-- upvalues: var47 (write), var51 (write)
		if var47.current == p3 then
			return
		end
		var47.current = p3
		var51(p3)
	end, {})
	local var53 = reactModule.useCallback(function()
		-- upvalues: var44 (ref), var43 (ref), var45 (ref)
		if var44.current then
			var44.current:Disconnect()
			var44.current = nil
		end
		var43.current = 0
		var45.current = false
	end, {})
	local var54 = reactModule.useCallback(function(p3)
		-- upvalues: var53 (ref), var45 (ref), var33 (ref), var44 (ref), var46 (ref)
		var53()
		var45.current = true
		
		if var33.current then
			var33.current:ResetScrollVelocity()
		end
		var44.current = game:GetService("RunService").Heartbeat:Connect(function(p4)
			-- upvalues: var33 (copy), var45 (copy), var53 (copy), var46 (copy), p3 (ref)
			if not var33.current or not var45.current then
				var53()
				
				return
			end
			local y = var33.current.CanvasPosition.Y
			local _ = nil
			local current = var46.current
			local var55 = y - p3
			local var56 = 25.132741228718 * p4
			local expValue = math.exp(-var56)
			local var57 = current + 25.132741228718 * var55
			local var58 = p3 + (var55 + var57 * p4) * expValue
			var46.current = (current - var57 * var56) * expValue
			var33.current.CanvasPosition = Vector2.new(0, var58)
			
			if math.abs(p3 - var33.current.CanvasPosition.Y) < 0.5 and math.abs(var46.current) < 1 then
				var33.current.CanvasPosition = Vector2.new(0, p3)
				var53()
			end
		end)
	end, { var53 })
	local var55 = reactModule.useCallback(function(p3)
		-- upvalues: var10 (ref), var11 (write), bottom (ref)
		return math.min(var10(p3), var11) + bottom
	end, { bottom, var10, var11 })
	local var56 = reactModule.useCallback(function(p3)
		-- upvalues: var14 (ref), var54 (ref), var55 (ref), snapPoints (ref), var16 (ref)
		var14.current = p3
		var54(var55(snapPoints[p3]))
		
		if var16.current then
			var16.current(snapPoints[p3], p3)
		end
	end, { var55, snapPoints })
	local var57 = reactModule.useCallback(function(p3)
		-- upvalues: var53 (ref), var14 (ref), var33 (ref), var55 (ref), snapPoints (ref), var16 (ref)
		var53()
		var14.current = p3
		
		if var33.current then
			var33.current.CanvasPosition = Vector2.new(0, var55(snapPoints[p3]))
		end
		if var16.current then
			var16.current(snapPoints[p3], p3)
		end
	end, { var53, var55, snapPoints })
	local var58 = reactModule.useCallback(function(p3)
		-- upvalues: var15 (ref), reducedMotion (ref), var53 (ref), var33 (ref), var18 (ref), otterModule (copy), var46 (ref), var43 (ref), var54 (ref), var3 (ref)
		if var15.current then return end
		if not reducedMotion or p3 then
			var46.current = -var43.current
			var54(0)
			var18(otterModule.ease(1, { duration = var3.Time.Time_100 }))
			var15.current = true
			
			return
		end
		var15.current = true
		var53()
		
		if var33.current then
			var33.current.CanvasPosition = Vector2.new(0, 0)
		end
		var18(otterModule.instant(1))
	end, { var54, var53, reducedMotion })
	local var59 = reactModule.useCallback(function()
		-- upvalues: var11 (write), bottom (ref), var32 (ref)
		return math.floor(var11 + bottom) - 0.01 <= var32.current
	end, { var11, bottom })
	local var60 = reactModule.useCallback(function()
		-- upvalues: var34 (ref), var59 (ref), flagsModule (copy), var39 (ref), var42 (ref), var37 (ref), var36 (ref), var43 (ref), var38 (ref)
		local var61 = var34:getValue() <= 0
		local var62 = var59()
		
		if flagsModule.FoundationSheetReversedContent and var39.current then
			if var42.current and not var37:getValue() and not var62 then return end
			local current = var36.current
			local current_1 = var43.current
			var38(not (var42.current and (if current_1 > 0 then var61 else current_1 < 0 and ((if current ~= nil then current.AbsoluteCanvasSize.Y - current.AbsoluteWindowSize.Y - 1 <= var34:getValue() else true) and not var62))))
			
			return
		elseif not var62 and var43.current < 0 or var43.current > 0 and var61 and var42.current then
			var38(false)
			
			return
		elseif (var43.current < 0 or var43.current == 0) and var62 then
			var38(true)
		end
	end, { var59 })
	local var61 = reactModule.useCallback(function()
		-- upvalues: var43 (ref), var32 (ref), snapPoints (ref), var55 (ref), var42 (ref), var46 (ref), var58 (ref), var56 (ref)
		local current = var43.current
		local var62 = var32.current - current / 2.35
		local list = { { index = 0, position = 0 } }
		
		for i, v in snapPoints do
			table.insert(list, { index = i, position = var55(v) })
		end
		table.sort(list, function(p3, p4)
			-- upvalues: var62 (ref)
			return math.abs(p3.position - var62) < math.abs(p4.position - var62)
		end)
		local var63 = list[1]
		
		if not var42.current then
			var46.current = -current
			
			if var63.index == 0 then
				var58(true)
				
				return
			end
			var56(var63.index)
		end
	end, { snapPoints, var56, var55, var58 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), reducedMotion (ref), var57 (ref), var1 (ref), var18 (ref), otterModule (copy), var56 (ref), var3 (ref), var10 (ref), snapPoints (ref), var11 (write), var38 (ref), flagsModule (copy), var39 (ref), var53 (ref)
		if var2 then
			if reducedMotion then
				var57(var1.defaultSnapPointIndex)
				var18(otterModule.instant(0))
			else
				var56(var1.defaultSnapPointIndex)
				var18(otterModule.ease(0, { duration = var3.Time.Time_100 }))
			end
			local var64 = var11 <= var10(snapPoints[var1.defaultSnapPointIndex])
			var38(if flagsModule.FoundationSheetReversedContent then var64 or var39.current else var64)
		end
		return function()
			-- upvalues: var53 (copy)
			var53()
		end
	end, {
		var2, snapPoints, var1.defaultSnapPointIndex, var56, var10, var57,
		reducedMotion
	})
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), var7 (ref)
		if var2 then
			var7(var2.AbsoluteSize.Y)
			local var64 = var2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var7 (copy), var2 (copy)
				var7(var2.AbsoluteSize.Y)
			end)
			
			return function()
				-- upvalues: var64 (ref)
				var64:Disconnect()
			end
		end
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: var43 (ref), var42 (ref), var52 (write), var60 (ref), var53 (ref), var33 (ref), flagsModule (copy), var39 (ref), var38 (ref), var59 (ref), var15 (ref), var61 (ref)
		local touchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, p3, p4, _)
			-- upvalues: var43 (copy), var42 (copy), var52 (copy), var60 (copy)
			var43.current = p4.Y
			
			if var42.current and p3 and math.abs(p3.X) < math.abs(p3.Y) then
				var52(true)
			end
			var60()
		end)
		local inputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function()
			-- upvalues: var42 (copy), var43 (copy), var52 (copy), var53 (copy)
			var42.current = true
			var43.current = 0
			var52(false)
			var53()
		end)
		local inputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function()
			-- upvalues: var42 (copy), var52 (copy), var33 (copy), var43 (copy), flagsModule (copy), var39 (copy), var38 (copy), var59 (copy), var15 (copy), var61 (copy)
			if var42.current == false then return end
			var42.current = false
			var52(false)
			var43.current = if var33.current then var33.current:GetScrollVelocity().Y else 0
			
			if flagsModule.FoundationSheetReversedContent and var39.current then
				var38(true)
			end
			if var59() or var15.current then
				var38(true)
				
				return
			end
			var61()
		end)
		
		return function()
			-- upvalues: var52 (copy), touchPanConnection (ref), inputBeganConnection (ref), inputEndedConnection (ref)
			var52(false)
			touchPanConnection:Disconnect()
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, {
		var2, var61, var60, var53, var59, var52
	})
	local var64 = reactModule.useRef(nil)
	local var65, var66 = reactModule.useState(nil)
	local var67, var68 = reactModule.useState(nil)
	local var69 = reactUtilsModule.useComposedRef(p2, var68)
	reactModule.useImperativeHandle(var1.sheetRef, function()
		-- upvalues: var58 (ref)
		return { close = var58 }
	end, {})
	
	return var2 and reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
		tag = "size-full",
		ZIndex = var4.zIndex,
		ref = var69,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		testId = `{var1.testId}--surface`
	}, reactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = UDim2.new(1, 0, 1, var11 + bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = var33,
		[reactModule.Change.CanvasPosition] = function(p3)
			-- upvalues: var32 (ref), flagsModule (copy), var41 (ref), var20 (ref), bottom (ref), var3 (ref), var36 (ref), var39 (ref), var60 (ref), var58 (ref)
			var32.current = p3.CanvasPosition.Y
			local var70 = if flagsModule.FoundationSheetReversedContent and var41 then var41:getValue() else nil
			var20(var32.current - bottom - var3.Margin.Small)
			
			if flagsModule.FoundationSheetReversedContent and var41 and var70 then
				local current = var36.current
				local var71 = var41:getValue() - var70
				
				if var39.current and current and var71 ~= 0 then
					current.CanvasPosition = Vector2.new(0, current.CanvasPosition.Y + var71)
				end
			end
			var60()
			
			if var32.current <= 0 then
				var58()
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
					["padding-top-medium"] = not var27
				}
			}, {
				GripperContainer = reactModule.createElement("Folder", nil, {
					Gripper = reactModule.createElement(viewModule, {
						ZIndex = 5,
						tag = "align-y-center size-1000-100 padding-y-small radius-small",
						backgroundStyle = var3.Color.Content.Muted,
						Position = UDim2.new(0.5, 0, 0, if var27 then var3.Padding.Small else -var3.Padding.XSmall),
						AnchorPoint = Vector2.new(0.5, 0),
						testId = `{var1.testId}--gripper`
					}, {
						TouchTarget = reactModule.createElement(viewModule, {
							tag = "size-1000-600",
							stateLayer = { affordance = stateLayerAffordanceModule.None },
							onActivated = function()
								-- upvalues: var42 (ref), flagsModule (copy), var39 (ref), var36 (ref), var35 (ref), snapPoints (ref), var14 (ref), reducedMotion (ref), var57 (ref), var56 (ref), var10 (ref), var11 (write), var38 (ref), var58 (ref)
								var42.current = false
								
								if flagsModule.FoundationSheetReversedContent and var39.current and var36.current then
									local current = var36.current
									local maxValue = math.max(0, current.AbsoluteCanvasSize.Y - current.AbsoluteWindowSize.Y)
									var35(maxValue)
									current.CanvasPosition = Vector2.new(0, maxValue)
									current:ResetScrollVelocity()
								elseif var36.current then
									var35(0)
									var36.current.CanvasPosition = Vector2.new(0, 0)
									var36.current:ResetScrollVelocity()
								end
								if #snapPoints <= 1 then
									var58()
									
									return
								end
								local var70 = var14.current % #snapPoints + 1
								
								if reducedMotion then
									var57(var70)
								else
									var56(var70)
								end
								local var71 = var11 <= var10(snapPoints[var70])
								var38(if flagsModule.FoundationSheetReversedContent then var71 or var39.current else var71)
							end
						})
					})
				}),
				Content = reactModule.createElement(sheetContextModule.Provider, {
					value = reactModule.useMemo(function()
						-- upvalues: var21 (ref), var22 (ref), var23 (ref), var24 (ref), var19 (ref), var20 (ref), bottom (ref), var37 (ref), var34 (ref), var36 (ref), var35 (ref), var60 (ref), var25 (ref), var26 (ref), var27 (write), var30 (write), var31 (write), var58 (ref), sheetTypeModule (copy), var67 (ref), var1 (ref), var64 (ref), var65 (ref), var66 (ref), var50 (write), var41 (ref), var40 (ref)
						return {
							bottomPadding = 200,
							hasRadius = true,
							actionsHeight = var21,
							setActionsHeight = var22,
							hasActionsDivider = var23,
							setHasActionsDivider = var24,
							sheetHeightAvailable = var19,
							setSheetHeightAvailable = var20,
							safeAreaPadding = bottom,
							innerScrollingEnabled = var37,
							innerScrollY = var34,
							innerScrollingRef = var36,
							setInnerScrollY = function(value)
								-- upvalues: var35 (copy), var60 (copy)
								var35(value)
								var60()
							end,
							hasHeader = var25,
							setHasHeader = var26,
							hasFullBleed = var27,
							fullBleedHeight = var30,
							setFullBleedHeight = var31,
							closeSheet = var58,
							sheetType = sheetTypeModule.Bottom,
							innerSurface = var67,
							testId = var1.testId,
							closeAffordanceRef = var64,
							contentStartRef = var65,
							setContentStartRef = var66,
							isVerticalSheetGesture = var50,
							contentRevealOffset = var41,
							setIsContentReversed = var40
						}
					end, {
						var1.testId, var58, bottom, var60, var67, var64, var65, var27, var50, var41,
						var40
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
			backgroundStyle = var17:map(function(p3)
				-- upvalues: var3 (ref)
				return {
					Color3 = var3.Color.Common.Backdrop.Color3,
					Transparency = math.lerp(var3.Color.Common.Backdrop.Transparency, 1, p3)
				}
			end),
			onActivated = function()
				-- upvalues: var58 (ref)
				var58()
			end,
			testId = `{var1.testId}--backdrop`
		})
	})), var2)
end))