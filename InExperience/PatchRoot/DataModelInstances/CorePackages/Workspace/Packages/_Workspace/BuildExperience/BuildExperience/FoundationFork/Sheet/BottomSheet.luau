local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
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
local useScreenModule = require(foundation.Providers.Overlay.useScreen)
local sheetContextModule = require(script.Parent.SheetContext)
local typesModule = require(script.Parent.Types)
local sheetTypeModule = require(script.Parent.SheetType)
local childrenHasFullBleedModule = require(script.Parent.childrenHasFullBleed)
local getHardwareSafeAreaInsetsModule = require(script.Parent.getHardwareSafeAreaInsets)
local useHardwareInsetsModule = require(script.Parent.useHardwareInsets)
local useScreenHeightModule = require(script.Parent.useScreenHeight)
local imageModule = require(foundation.Components.Image)
local viewModule = require(foundation.Components.View)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local foundationBottomSheetIOSInsetWorkaroundDelayMs = game:DefineFastInt("FoundationBottomSheetIOSInsetWorkaroundDelayMs", 100)
local foundationBottomSheetIOSInsetWorkaround = game:DefineFastFlag("FoundationBottomSheetIOSInsetWorkaround", false)
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

local function useStableGuiHeight(p1)
	-- upvalues: reactModule (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (ref)
	local var1 = if p1 then p1.AbsoluteSize.Y else 0
	local var2, var3 = reactModule.useState(var1)
	local var4 = reactModule.useRef(var1)
	local var5 = reactModule.useRef(0)
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var3 (ref)
		if var4.current == p2 then
			return
		end
		var4.current = p2
		var3(p2)
	end, {})
	reactModule.useLayoutEffect(function()
		-- upvalues: var5 (ref), p1 (ref), var6 (ref), var4 (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
		var5.current += 1
		
		if p1 then
			local function updateHeight()
				-- upvalues: p1 (copy), var4 (copy), var5 (copy), var6 (copy), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
				local y = p1.AbsoluteSize.Y
				
				if var4.current <= 0 or y <= var4.current then
					var5.current += 1
					var6(y)
					
					return
				end
				var5.current += 1
				local current = var5.current
				task.delay(foundationBottomSheetIOSInsetWorkaroundDelayMs / 1000, function()
					-- upvalues: var5 (copy), current (ref), p1 (copy), y (ref), var6 (copy)
					if var5.current == current and p1.AbsoluteSize.Y == y then
						var6(y)
						
						return
					end
				end)
			end
			
			updateHeight()
			local var7 = p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateHeight)
			
			return function()
				-- upvalues: var5 (copy), var7 (ref)
				var5.current += 1
				var7:Disconnect()
			end
		end
		var6(0)
		
		return function()
			-- upvalues: var5 (copy)
			var5.current += 1
		end
	end, { p1, var6 })
	
	return var2
end

local _ = function()
	-- upvalues: useScreenModule (ref), useStableGuiHeight (ref)
	return useStableGuiHeight(useScreenModule())
end

local function useStableBottomSafeAreaPadding(p1)
	-- upvalues: getHardwareSafeAreaInsetsModule (ref), reactModule (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (ref)
	local bottom = getHardwareSafeAreaInsetsModule().bottom
	local var1, var2 = reactModule.useState(bottom)
	local var3 = reactModule.useRef(bottom)
	local var4 = reactModule.useRef(0)
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var2 (ref)
		if var3.current == p2 then
			return
		end
		var3.current = p2
		var2(p2)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p1 (ref), getHardwareSafeAreaInsetsModule (copy), var3 (ref), var5 (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
		var4.current += 1
		
		if p1 then
			local function updateBottomInset()
				-- upvalues: getHardwareSafeAreaInsetsModule (copy), var3 (copy), var4 (copy), var5 (copy), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
				local bottom = getHardwareSafeAreaInsetsModule().bottom
				
				if var3.current <= bottom then
					var4.current += 1
					var5(bottom)
					
					return
				end
				var4.current += 1
				local current = var4.current
				task.delay(foundationBottomSheetIOSInsetWorkaroundDelayMs / 1000, function()
					-- upvalues: getHardwareSafeAreaInsetsModule (copy), var4 (copy), current (ref), bottom (ref), var5 (copy)
					if var4.current == current and getHardwareSafeAreaInsetsModule().bottom == bottom then
						var5(bottom)
						
						return
					end
				end)
			end
			
			updateBottomInset()
			local var6 = p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateBottomInset)
			
			return function()
				-- upvalues: var4 (copy), var6 (ref)
				var4.current += 1
				var6:Disconnect()
			end
		end
		return function()
			-- upvalues: var4 (copy)
			var4.current += 1
		end
	end, { p1, var5 })
	
	return var1
end

local _ = function(value)
	-- upvalues: useScreenModule (ref), useStableGuiHeight (ref), useStableBottomSafeAreaPadding (ref)
	return useStableGuiHeight(useScreenModule()), useStableGuiHeight(value), useStableBottomSafeAreaPadding(value)
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), foundationBottomSheetIOSInsetWorkaround (ref), useScreenModule (ref), useStableGuiHeight (ref), useStableBottomSafeAreaPadding (ref), useScreenHeightModule (ref), reactModule (ref), useHardwareInsetsModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), reactUtilsModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), reactRobloxModule (ref), typesModule (ref), dashModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	local var1, var2
	local var3 = withDefaultsModule(p1, t)
	local var4 = useOverlayModule()
	local var5 = useTokensModule()
	local var6 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local _ = nil
	local _ = nil
	local var7 = nil
	local bottom = nil
	
	if foundationBottomSheetIOSInsetWorkaround then
		local var8 = useStableGuiHeight(useScreenModule())
		local var9 = useStableGuiHeight(var4)
		local var10 = useStableBottomSafeAreaPadding(var4)
		var1 = var8
		var2 = var9
		bottom = var10
	else
		var1 = useScreenHeightModule()
		local var11, var12 = reactModule.useState(if var4 then var4.AbsoluteSize.Y else 0)
		var2 = var11
		var7 = var12
	end
	local var13, var14 = reactModule.useState(0)
	local snapPoints = var3.snapPoints or reactModule.useMemo(function()
		-- upvalues: var13 (ref)
		return { var13 }
	end, { var13 })
	local var15 = reactModule.useCallback(function(p3)
		-- upvalues: var1 (write)
		return if p3 > 1 then p3 else p3 * var1
	end, { var1 })
	local var16 = 0
	
	for i, v in snapPoints do
		local var17 = var15(v)
		
		if var16 < var17 then
			var16 = var17
		end
	end
	var16 = math.min(var16, var1)
	
	if var2 > 0 then
		var16 = math.min(var16, var2)
	end
	if not foundationBottomSheetIOSInsetWorkaround then
		bottom = useHardwareInsetsModule(var4).bottom
		reactModule.useLayoutEffect(function()
			-- upvalues: var4 (ref), var7 (write)
			if var4 then
				local function updateOverlayAvailableHeight()
					-- upvalues: var7 (copy), var4 (copy)
					var7(var4.AbsoluteSize.Y)
				end
				
				var7(var4.AbsoluteSize.Y)
				local var18 = var4:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateOverlayAvailableHeight)
				
				return function()
					-- upvalues: var18 (ref)
					var18:Disconnect()
				end
			end
			var7(0)
		end, { var4 })
	end
	local var18 = reactModule.useRef(0)
	local var19 = reactModule.useRef(false)
	local var20, var21 = useAnimatedBinding(1, function()
		-- upvalues: var19 (ref), var3 (ref)
		if var19.current then
			var3.onClose()
		end
	end)
	local var22, var23 = reactModule.useBinding(-bottom)
	local var24, var25 = reactModule.useBinding(0)
	local var26, var27 = reactModule.useBinding(false)
	local var28, var29 = reactModule.useBinding(false)
	local var30 = childrenHasFullBleedModule(var3.children)
	local var31, var32 = reactModule.useBinding(0)
	local var33 = reactModule.useRef(0)
	local var34 = reactModule.useRef(nil)
	local var35, var36 = reactModule.useBinding(0)
	local var37, var38 = reactModule.useBinding(false)
	local var39 = reactModule.useRef(false)
	local var40 = reactModule.useRef(0)
	local var41 = reactModule.useRef(nil)
	local var42 = reactModule.useRef(false)
	local var43 = reactModule.useRef(0)
	local var44 = reactModule.useCallback(function()
		-- upvalues: var41 (ref), var40 (ref), var42 (ref)
		if var41.current then
			var41.current:Disconnect()
			var41.current = nil
		end
		var40.current = 0
		var42.current = false
	end, {})
	local var45 = reactModule.useCallback(function(p3)
		-- upvalues: var44 (ref), var42 (ref), var34 (ref), var41 (ref), var43 (ref)
		var44()
		var42.current = true
		
		if var34.current then
			var34.current:ResetScrollVelocity()
		end
		var41.current = game:GetService("RunService").Heartbeat:Connect(function(p4)
			-- upvalues: var34 (copy), var42 (copy), var44 (copy), var43 (copy), p3 (ref)
			if not var34.current or not var42.current then
				var44()
				
				return
			end
			local current = var43.current
			local var46 = var34.current.CanvasPosition.Y - p3
			local var47 = 25.132741228718 * p4
			local expValue = math.exp(-var47)
			local var48 = current + 25.132741228718 * var46
			local var49 = p3 + (var46 + var48 * p4) * expValue
			var43.current = (current - var48 * var47) * expValue
			var34.current.CanvasPosition = Vector2.new(0, var49)
			
			if math.abs(p3 - var34.current.CanvasPosition.Y) < 0.5 and math.abs(var43.current) < 1 then
				var34.current.CanvasPosition = Vector2.new(0, p3)
				var44()
			end
		end)
	end, { var44 })
	local var46 = reactModule.useCallback(function(p3)
		-- upvalues: var15 (ref), var16 (write), bottom (write)
		return math.min(var15(p3), var16) + bottom
	end, { bottom, var15, var16 })
	local var47 = reactModule.useCallback(function(p3)
		-- upvalues: var18 (ref), var45 (ref), var46 (ref), snapPoints (ref)
		var18.current = p3
		var45(var46(snapPoints[p3]))
	end, { var46, snapPoints })
	local var48 = reactModule.useCallback(function(p3)
		-- upvalues: var44 (ref), var18 (ref), var34 (ref), var46 (ref), snapPoints (ref)
		var44()
		var18.current = p3
		
		if var34.current then
			var34.current.CanvasPosition = Vector2.new(0, var46(snapPoints[p3]))
		end
	end, { var44, var46, snapPoints })
	local var49 = reactModule.useRef(0)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var49 (ref), var2 (write), var18 (ref), snapPoints (ref), var3 (ref), reducedMotion (ref), var48 (ref), var47 (ref)
		if not var4 then return end
		local current = var49.current
		var49.current = var2
		
		if current <= 0 or current == var2 then return end
		local current_1 = var18.current
		
		if current_1 <= 0 or #snapPoints < current_1 then
			current_1 = var3.defaultSnapPointIndex
		end
		if reducedMotion then
			var48(current_1)
			
			return
		end
		var47(current_1)
	end, {
		var4, var2, var47, var48, reducedMotion, var3.defaultSnapPointIndex,
		snapPoints
	})
	local var50 = reactModule.useCallback(function(p3)
		-- upvalues: var19 (ref), reducedMotion (ref), var44 (ref), var34 (ref), var21 (ref), otterModule (copy), var43 (ref), var40 (ref), var45 (ref), var5 (ref)
		if var19.current then return end
		if not reducedMotion or p3 then
			var43.current = -var40.current
			var45(0)
			var21(otterModule.ease(1, { duration = var5.Time.Time_100 }))
			var19.current = true
			
			return
		end
		var19.current = true
		var44()
		
		if var34.current then
			var34.current.CanvasPosition = Vector2.new(0, 0)
		end
		var21(otterModule.instant(1))
	end, { var45, var44, reducedMotion })
	local var51 = reactModule.useCallback(function()
		-- upvalues: var35 (ref), var33 (ref), var16 (write), bottom (write), var40 (ref), var39 (ref), var38 (ref)
		local var52 = math.floor(var16 + bottom) <= var33.current
		
		if var40.current > 0 and var35:getValue() <= 0 and var39.current then
			var38(false)
			
			return
		elseif var40.current <= 0 and var52 then
			var38(true)
		end
	end, { var16, bottom })
	local var52 = reactModule.useCallback(function()
		-- upvalues: var40 (ref), var33 (ref), snapPoints (ref), var46 (ref), var39 (ref), var43 (ref), var50 (ref), var47 (ref)
		local current = var40.current
		local var53 = var33.current - current / 2.35
		local list = { { index = 0, position = 0 } }
		
		for i, v in snapPoints do
			table.insert(list, { index = i, position = var46(v) })
		end
		table.sort(list, function(p3, p4)
			-- upvalues: var53 (ref)
			return math.abs(p3.position - var53) < math.abs(p4.position - var53)
		end)
		local var54 = list[1]
		
		if not var39.current then
			var43.current = -current
			
			if var54.index == 0 then
				var50(true)
				
				return
			end
			var47(var54.index)
		end
	end, { snapPoints, var47, var46, var50 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), reducedMotion (ref), var48 (ref), var3 (ref), var21 (ref), otterModule (copy), var47 (ref), var5 (ref), var15 (ref), snapPoints (ref), var16 (write), var38 (ref), var44 (ref)
		if var4 then
			if reducedMotion then
				var48(var3.defaultSnapPointIndex)
				var21(otterModule.instant(0))
			else
				var47(var3.defaultSnapPointIndex)
				var21(otterModule.ease(0, { duration = var5.Time.Time_100 }))
			end
			if math.min(var15(snapPoints[var3.defaultSnapPointIndex]), var16) == var16 then
				var38(true)
			end
		end
		return function()
			-- upvalues: var44 (copy)
			var44()
		end
	end, {
		var4, snapPoints, var3.defaultSnapPointIndex, var47, var15, var48,
		reducedMotion
	})
	reactModule.useEffect(function()
		-- upvalues: var40 (ref), var51 (ref), var39 (ref), var44 (ref), var34 (ref), var33 (ref), var16 (write), bottom (write), var19 (ref), var38 (ref), var52 (ref)
		local touchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, _, p3, _)
			-- upvalues: var40 (copy), var51 (copy)
			var40.current = p3.Y
			var51()
		end)
		local inputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function()
			-- upvalues: var39 (copy), var40 (copy), var44 (copy)
			var39.current = true
			var40.current = 0
			var44()
		end)
		local inputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function()
			-- upvalues: var39 (copy), var40 (copy), var34 (copy), var33 (copy), var16 (copy), bottom (copy), var19 (copy), var38 (copy), var52 (copy)
			if var39.current == false then return end
			var39.current = false
			var40.current = if var34.current then var34.current:GetScrollVelocity().Y else 0
			
			if if math.floor(var16 + bottom) > var33.current then var19.current else true then
				var38(true)
				
				return
			end
			var52()
		end)
		
		return function()
			-- upvalues: touchPanConnection (ref), inputBeganConnection (ref), inputEndedConnection (ref)
			touchPanConnection:Disconnect()
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, { var4, var52, var51, var44 })
	local var55 = reactModule.useRef(nil)
	local var56, var57 = reactModule.useState(nil)
	local var58, var59 = reactModule.useState(nil)
	local var60 = reactUtilsModule.useComposedRef(p2, var59)
	reactModule.useImperativeHandle(var3.sheetRef, function()
		-- upvalues: var50 (ref)
		return { close = var50 }
	end, {})
	
	return var4 and reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
		ZIndex = var6.zIndex,
		ref = var60,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		Size = if foundationBottomSheetIOSInsetWorkaround then UDim2.new(1, 0, 0, var2) else nil,
		tag = if foundationBottomSheetIOSInsetWorkaround then nil else "size-full",
		testId = `{var3.testId}--surface`
	}, reactModule.createElement("ScrollingFrame", {
		Size = if foundationBottomSheetIOSInsetWorkaround then UDim2.new(1, 0, 0, var2) else UDim2.fromScale(1, 1),
		CanvasSize = UDim2.new(1, 0, 1, var16 + bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = var34,
		[reactModule.Change.CanvasPosition] = function(p3)
			-- upvalues: var33 (ref), var23 (ref), bottom (write), var5 (ref), var51 (ref), var50 (ref)
			var33.current = p3.CanvasPosition.Y
			var23(var33.current - bottom - var5.Margin.Small)
			var51()
			
			if var33.current <= 0 then
				var50()
			end
		end
	}, {
		SheetContainer = reactModule.createElement(viewModule, {
			ZIndex = 3,
			Size = UDim2.new(1, 0, 1, 200 - var16 - bottom),
			Position = UDim2.new(0, 0, 1, -var16)
		}, {
			Sheet = reactModule.createElement(viewModule, {
				Size = if var3.snapPoints == nil then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, var16 + 200),
				AutomaticSize = if var3.snapPoints == nil then Enum.AutomaticSize.Y else nil,
				onAbsoluteSizeChanged = if var3.snapPoints == nil then function(p3)
					-- upvalues: var14 (ref)
					var14(p3.AbsoluteSize.Y - 200)
				end else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				testId = var3.testId,
				tag = {
					["col items-center radius-large clip bg-surface-100"] = true,
					["padding-top-medium"] = not var30
				}
			}, {
				GripperContainer = reactModule.createElement("Folder", nil, {
					Gripper = reactModule.createElement(viewModule, {
						ZIndex = 3,
						tag = "align-y-center size-1000-100 padding-y-small radius-small",
						backgroundStyle = var5.Color.Content.Muted,
						Position = UDim2.new(0.5, 0, 0, if var30 then var5.Padding.Small else -var5.Padding.XSmall),
						AnchorPoint = Vector2.new(0.5, 0),
						testId = `{var3.testId}--gripper`
					}, {
						TouchTarget = reactModule.createElement(viewModule, {
							tag = "size-1000-600",
							stateLayer = { affordance = stateLayerAffordanceModule.None },
							onActivated = function()
								-- upvalues: var39 (ref), snapPoints (ref), var18 (ref), reducedMotion (ref), var48 (ref), var47 (ref), var15 (ref), var16 (write), var38 (ref), var50 (ref)
								var39.current = false
								
								if #snapPoints > 1 then
									local var61 = var18.current % #snapPoints + 1
									
									if reducedMotion then
										var48(var61)
									else
										var47(var61)
									end
									if math.min(var15(snapPoints[var61]), var16) == var16 then
										var38(true)
										
										return
									end
								else
									var50()
								end
							end
						})
					})
				}),
				Content = reactModule.createElement(sheetContextModule.Provider, {
					value = reactModule.useMemo(function()
						-- upvalues: var24 (ref), var25 (ref), var26 (ref), var27 (ref), var22 (ref), var23 (ref), bottom (write), var37 (ref), var35 (ref), var36 (ref), var51 (ref), var28 (ref), var29 (ref), var30 (ref), var31 (ref), var32 (ref), var50 (ref), sheetTypeModule (copy), var58 (ref), var3 (ref), var55 (ref), var56 (ref), var57 (ref)
						return {
							bottomPadding = 200,
							hasRadius = true,
							actionsHeight = var24,
							setActionsHeight = var25,
							hasActionsDivider = var26,
							setHasActionsDivider = var27,
							sheetHeightAvailable = var22,
							setSheetHeightAvailable = var23,
							safeAreaPadding = bottom,
							innerScrollingEnabled = var37,
							innerScrollY = var35,
							setInnerScrollY = function(value)
								-- upvalues: var36 (copy), var51 (copy)
								var36(value)
								var51()
							end,
							hasHeader = var28,
							setHasHeader = var29,
							hasFullBleed = var30,
							fullBleedHeight = var31,
							setFullBleedHeight = var32,
							closeSheet = var50,
							sheetType = sheetTypeModule.Bottom,
							innerSurface = var58,
							testId = var3.testId,
							closeAffordanceRef = var55,
							contentStartRef = var56,
							setContentStartRef = var57
						}
					end, {
						var3.testId, var50, bottom, var51, var58, var55, var56, var30
					})
				}, reactModule.createElement(elevationOwnerScope, { owner = var6 }, var3.children))
			})
		}),
		Shadow = reactModule.createElement(imageModule, {
			ZIndex = 2,
			Image = SHADOW_IMAGE,
			Size = UDim2.new(1, SHADOW_SIZE * 2, 0, var16 + 200 + SHADOW_SIZE * 2),
			Position = UDim2.new(-SHADOW_SIZE, 0, 1, (-var16) - SHADOW_SIZE),
			slice = {
				scale = 2,
				center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
			},
			imageStyle = var5.Color.Extended.Black.Black_10
		}),
		Backdrop = reactModule.createElement(viewModule, {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 2),
			Position = UDim2.fromScale(0, -0.5),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			backgroundStyle = var20:map(function(p3)
				-- upvalues: var5 (ref)
				return {
					Color3 = var5.Color.Common.Backdrop.Color3,
					Transparency = math.lerp(var5.Color.Common.Backdrop.Transparency, 1, p3)
				}
			end),
			onActivated = function()
				-- upvalues: var50 (ref)
				var50()
			end,
			testId = `{var3.testId}--backdrop`
		})
	})), var4)
end))