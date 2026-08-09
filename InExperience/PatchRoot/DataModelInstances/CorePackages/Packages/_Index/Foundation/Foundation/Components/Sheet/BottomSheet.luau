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

local function _(p0, p1, p2, p3) --[[ line: 60 | named "advanceCriticalDampedSpring" ]]
	local var25 = p0 - p2
	local var26 = 25.132741228718 * p3
	local expValue = math.exp(-var26)
	local var28 = p1 + 25.132741228718 * var25
	
	return p2 + (var25 + var28 * p3) * expValue, (p1 - var28 * var26) * expValue
end

return reactModule.memo(reactModule.forwardRef(function(p4, p5) --[[ line: 78 | named "BottomSheet" ]]
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
	local snapPoints = var29.snapPoints or reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: var38 (ref)
		return { var38 }
	end, { var38 })
	local var41 = reactModule.useCallback(function(p6) --[[ line: 101 ]]
		-- upvalues: var33 (ref)
		return if p6 > 1 then p6 else p6 * var33
	end, { var33 })
	local var42 = 0
	
	for i, v in snapPoints do
		local var87 = var41(v)
		
		if var42 < var87 then
			var42 = var87
		end
	end
	var42 = math.min(var42, var33)
	
	if flagsModule.FoundationBottomSheetCapToOverlayHeight and var34 > 0 then
		var42 = math.min(var42, var34)
	end
	local bottom = useHardwareInsetsModule(var30).bottom
	local var43 = reactModule.useRef(0)
	local var44 = reactModule.useRef(false)
	local var45, var46 = useAnimatedBinding(1, function() --[[ line: 125 ]]
		-- upvalues: var44 (ref), var29 (ref)
		if var44.current then
			var29.onClose()
		end
	end)
	local var47, var48 = reactModule.useBinding(-bottom)
	local var49, var50 = reactModule.useBinding(0)
	local var51, var52 = reactModule.useBinding(false)
	local var53, var54 = reactModule.useBinding(false)
	local var55 = nil
	local var56 = nil
	local var57 = nil
	
	if flagsModule.FoundationSheetFullBleed then
		var55 = childrenHasFullBleedModule(var29.children)
		local var58, var59 = reactModule.useBinding(0)
		var56 = var58
		var57 = var59
	end
	local var60 = reactModule.useRef(0)
	local var61 = reactModule.useRef(nil)
	local var62, var63 = reactModule.useBinding(0)
	local var64 = if flagsModule.FoundationBottomSheetInnerScrollingSync then reactModule.useRef(nil) else nil
	local var65, var66 = reactModule.useBinding(false)
	local var67 = reactModule.useRef(false)
	local var68 = reactModule.useRef(0)
	local var69 = reactModule.useRef(nil)
	local var70 = reactModule.useRef(false)
	local var71 = reactModule.useRef(0)
	local var72 = reactModule.useCallback(function() --[[ line: 155 ]]
		-- upvalues: var69 (ref), var68 (ref), var70 (ref)
		if var69.current then
			var69.current:Disconnect()
			var69.current = nil
		end
		var68.current = 0
		var70.current = false
	end, {})
	local var73 = reactModule.useCallback(function(p7) --[[ line: 164 ]]
		-- upvalues: var72 (ref), var70 (ref), flagsModule (copy), var61 (ref), var69 (ref), var71 (ref)
		var72()
		var70.current = true
		
		if flagsModule.FoundationBottomSheetImproveSpring and var61.current then
			var61.current:ResetScrollVelocity()
		end
		local var88 = if var61.current then var61.current.CanvasPosition.Y else 0
		var69.current = game:GetService("RunService").Heartbeat:Connect(function(p8) --[[ line: 176 ]]
			-- upvalues: var61 (copy), var70 (copy), var72 (copy), flagsModule (copy), var71 (copy), p7 (ref), var88 (write)
			if not var61.current or not var70.current then
				var72()
				
				return
			end
			local var94
			local y = var61.current.CanvasPosition.Y
			local _ = nil
			
			if flagsModule.FoundationBottomSheetImproveSpring then
				local current = var71.current
				local var89 = y - p7
				local var90 = 25.132741228718 * p8
				local expValue = math.exp(-var90)
				local var92 = current + 25.132741228718 * var89
				local var93 = p7 + (var89 + var92 * p8) * expValue
				var71.current = (current - var92 * var90) * expValue
				var61.current.CanvasPosition = Vector2.new(0, var93)
				var88 = var61.current.CanvasPosition.Y
				var94 = p7 - var61.current.CanvasPosition.Y
			else
				var94 = p7 - y
				local var95 = var94 * 18 * 18
				var71.current -= (y - var88) / p8
				local minValue = math.min(p8, 0.033333333333)
				var71.current += (var95 + -var71.current * 2 * 0.9 * 18) * minValue
				var61.current.CanvasPosition = Vector2.new(0, y + var71.current * minValue)
				var88 = var61.current.CanvasPosition.Y
			end
			if math.abs(var94) < 0.5 and math.abs(var71.current) < 1 then
				var61.current.CanvasPosition = Vector2.new(0, p7)
				var72()
			end
		end)
	end, { var72 })
	local var74 = reactModule.useCallback(function(p9) --[[ line: 224 ]]
		-- upvalues: flagsModule (copy), var41 (ref), var42 (write), bottom (ref)
		return if flagsModule.FoundationBottomSheetCapToOverlayHeight then math.min(var41(p9), var42) + bottom else var41(p9) + bottom
	end, {
		bottom,
		var41,
		if flagsModule.FoundationBottomSheetCapToOverlayHeight then var42 else nil
	})
	local var75 = reactModule.useCallback(function(p10) --[[ line: 238 ]]
		-- upvalues: var43 (ref), var73 (ref), var74 (ref), snapPoints (ref)
		var43.current = p10
		var73(var74(snapPoints[p10]))
	end, { var74, snapPoints })
	local var76 = reactModule.useCallback(function(p11) --[[ line: 243 ]]
		-- upvalues: var72 (ref), var43 (ref), var61 (ref), var74 (ref), snapPoints (ref)
		var72()
		var43.current = p11
		
		if var61.current then
			var61.current.CanvasPosition = Vector2.new(0, var74(snapPoints[p11]))
		end
	end, { var72, var74, snapPoints })
	local var77 = reactModule.useCallback(function(p12) --[[ line: 251 ]]
		-- upvalues: var44 (ref), reducedMotion (ref), var72 (ref), var61 (ref), var46 (ref), otterModule (copy), var71 (ref), var68 (ref), var73 (ref), var31 (ref)
		if var44.current then return end
		if not reducedMotion or p12 then
			var71.current = -var68.current
			var73(0)
			var46(otterModule.ease(1, { duration = var31.Time.Time_100 }))
			var44.current = true
			
			return
		end
		var44.current = true
		var72()
		
		if var61.current then
			var61.current.CanvasPosition = Vector2.new(0, 0)
		end
		var46(otterModule.instant(1))
	end, { var73, var72, reducedMotion })
	local var78 = reactModule.useCallback(function() --[[ line: 272 ]]
		-- upvalues: var62 (ref), var60 (ref), flagsModule (copy), var42 (write), bottom (ref), var68 (ref), var67 (ref), var66 (ref)
		local var97 = (if flagsModule.FoundationBottomSheetImproveSpring then math.floor(var42 + bottom) else math.round(var42 + bottom)) <= var60.current
		
		if flagsModule.FoundationBottomSheetInnerScrollingSync and (not var97 and var68.current < 0) or var68.current > 0 and var62:getValue() <= 0 and var67.current then
			var66(false)
			
			return
		elseif (var68.current < 0 or flagsModule.FoundationBottomSheetImproveSpring and var68.current == 0) and var97 then
			var66(true)
		end
	end, { var42, bottom })
	local var79 = reactModule.useCallback(function() --[[ line: 293 ]]
		-- upvalues: var68 (ref), var60 (ref), snapPoints (ref), var74 (ref), var67 (ref), var71 (ref), var77 (ref), var75 (ref)
		local current = var68.current
		local var98 = var60.current - current / 2.35
		local list = { { index = 0, position = 0 } }
		
		for i, v in snapPoints do
			table.insert(list, { index = i, position = var74(v) })
		end
		table.sort(list, function(p13, p14) --[[ line: 311 ]]
			-- upvalues: var98 (ref)
			return math.abs(p13.position - var98) < math.abs(p14.position - var98)
		end)
		local var100 = list[1]
		
		if not var67.current then
			var71.current = -current
			
			if var100.index == 0 then
				var77(true)
				
				return
			end
			var75(var100.index)
		end
	end, { snapPoints, var75, var74, var77 })
	reactModule.useEffect(function() --[[ line: 327 ]]
		-- upvalues: var30 (ref), reducedMotion (ref), var76 (ref), var29 (ref), var46 (ref), otterModule (copy), var75 (ref), var31 (ref), flagsModule (copy), var41 (ref), snapPoints (ref), var42 (write), var66 (ref), var72 (ref)
		if var30 then
			if reducedMotion then
				var76(var29.defaultSnapPointIndex)
				var46(otterModule.instant(0))
			else
				var75(var29.defaultSnapPointIndex)
				var46(otterModule.ease(0, { duration = var31.Time.Time_100 }))
			end
			local var101
			if flagsModule.FoundationBottomSheetCapToOverlayHeight then
				var101 = var42 <= var41(snapPoints[var29.defaultSnapPointIndex])
				var101 = nil
			else
				var101 = var41(snapPoints[var29.defaultSnapPointIndex]) == var42
			end
			if flagsModule.FoundationBottomSheetInnerScrollingSync then
				var66(var101)
			elseif var101 then
				var66(true)
			end
		end
		return function() --[[ line: 349 ]]
			-- upvalues: var72 (copy)
			var72()
		end
	end, {
		var30, snapPoints, var29.defaultSnapPointIndex, var75, var41, var76,
		reducedMotion
	})
	reactModule.useEffect(function() --[[ line: 367 ]]
		-- upvalues: var68 (ref), var78 (ref), var67 (ref), var72 (ref), flagsModule (copy), var61 (ref), var60 (ref), var42 (write), bottom (ref), var44 (ref), var66 (ref), var79 (ref)
		local touchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, _, p15, _) --[[ line: 368 ]]
			-- upvalues: var68 (copy), var78 (copy)
			var68.current = p15.Y
			var78()
		end)
		local inputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function() --[[ line: 372 ]]
			-- upvalues: var67 (copy), var68 (copy), var72 (copy)
			var67.current = true
			var68.current = 0
			var72()
		end)
		local inputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function() --[[ line: 377 ]]
			-- upvalues: var67 (copy), flagsModule (copy), var61 (copy), var68 (copy), var60 (copy), var42 (copy), bottom (copy), var44 (copy), var66 (copy), var79 (copy)
			if var67.current == false then return end
			var67.current = false
			
			if flagsModule.FoundationBottomSheetImproveSpring then
				var68.current = if var61.current then var61.current:GetScrollVelocity().Y else 0
				
				if if math.floor(var42 + bottom) > var60.current then var44.current else true then
					var66(true)
					
					return
				end
			else
				local var105 = nil
				
				if var61.current then
					local ok, status = pcall(function() --[[ line: 402 ]]
						-- upvalues: var61 (copy)
						return var61.current:GetScrollVelocity().Y == 0
					end)
					
					if ok then
						var105 = status
					end
				end
				if var105 or var44.current then
					var66(true)
					
					return
				end
			end
			var79()
		end)
		
		return function() --[[ line: 423 ]]
			-- upvalues: touchPanConnection (ref), inputBeganConnection (ref), inputEndedConnection (ref)
			touchPanConnection:Disconnect()
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, { var30, var79, var78, var72 })
	local var80 = reactModule.useRef(nil)
	local var81, var82 = reactModule.useState(nil)
	local var83, var84 = reactModule.useState(nil)
	local var85 = reactUtilsModule.useComposedRef(p5, var84)
	reactModule.useImperativeHandle(var29.sheetRef, function() --[[ line: 436 ]]
		-- upvalues: var77 (ref)
		return { close = var77 }
	end, {})
	local var86 = reactModule.createElement(viewModule, {
		ZIndex = 3,
		tag = "align-y-center size-1000-100 padding-y-small radius-small",
		backgroundStyle = var31.Color.Content.Muted,
		Position = if flagsModule.FoundationSheetFullBleed then UDim2.new(0.5, 0, 0, if var55 then var31.Padding.Small else -var31.Padding.XSmall) else nil,
		AnchorPoint = if flagsModule.FoundationSheetFullBleed then Vector2.new(0.5, 0) else nil,
		testId = `{var29.testId}--gripper`
	}, {
		TouchTarget = reactModule.createElement(viewModule, {
			tag = "size-1000-600",
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onActivated = function() --[[ line: 502 ]]
				-- upvalues: var67 (ref), flagsModule (copy), var64 (ref), var63 (ref), snapPoints (ref), var43 (ref), reducedMotion (ref), var76 (ref), var75 (ref), var41 (ref), var42 (write), var66 (ref), var77 (ref)
				var67.current = false
				
				if flagsModule.FoundationBottomSheetInnerScrollingSync and var64.current then
					var63(0)
					var64.current.CanvasPosition = Vector2.new(0, 0)
					var64.current:ResetScrollVelocity()
				end
				if #snapPoints > 1 then
					local var106 = var43.current % #snapPoints + 1
					
					if reducedMotion then
						var76(var106)
					else
						var75(var106)
					end
					local var107
					if flagsModule.FoundationBottomSheetCapToOverlayHeight then
						var107 = var42 <= var41(snapPoints[var106])
						var107 = nil
					else
						var107 = var41(snapPoints[var106]) == var42
					end
					if flagsModule.FoundationBottomSheetInnerScrollingSync then
						var66(var107)
						
						return
					elseif var107 then
						var66(true)
						
						return
					end
				else
					var77()
				end
			end
		})
	})
	
	return var30 and reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
		tag = "size-full",
		ZIndex = var32.zIndex,
		ref = var85,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		testId = `{var29.testId}--surface`,
		onAbsoluteSizeChanged = if flagsModule.FoundationBottomSheetCapToOverlayHeight then function(p16) --[[ line: 544 ]]
			-- upvalues: var35 (write)
			var35(p16.AbsoluteSize.Y)
		end else nil
	}, reactModule.createElement("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = if flagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 1, var42 + bottom) else UDim2.new(1, 0, 0, var33 + var42 + bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = var61,
		[reactModule.Change.CanvasPosition] = function(p17) --[[ line: 559 ]]
			-- upvalues: var60 (ref), var48 (ref), bottom (ref), var31 (ref), var78 (ref), var77 (ref)
			var60.current = p17.CanvasPosition.Y
			var48(var60.current - bottom - var31.Margin.Small)
			var78()
			
			if var60.current <= 0 then
				var77()
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
				onAbsoluteSizeChanged = if var29.snapPoints == nil then function(p18) --[[ line: 583 ]]
					-- upvalues: var39 (ref)
					var39(p18.AbsoluteSize.Y - 200)
				end else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				testId = var29.testId,
				tag = if flagsModule.FoundationSheetFullBleed then {
					["col items-center radius-large clip bg-surface-100"] = true,
					["padding-top-medium"] = not var55
				} else "col items-center padding-top-small radius-large clip bg-surface-100"
			}, {
				GripperContainer = if flagsModule.FoundationSheetFullBleed then reactModule.createElement("Folder", nil, { Gripper = var86 }) else var86,
				Content = reactModule.createElement(sheetContextModule.Provider, {
					value = reactModule.useMemo(function() --[[ line: 443 ]]
						-- upvalues: var49 (ref), var50 (ref), var51 (ref), var52 (ref), var47 (ref), var48 (ref), bottom (ref), var65 (ref), var62 (ref), flagsModule (copy), var64 (ref), var63 (ref), var78 (ref), var53 (ref), var54 (ref), var55 (write), var56 (write), var57 (write), var77 (ref), sheetTypeModule (copy), var83 (ref), var29 (ref), var80 (ref), var81 (ref), var82 (ref)
						return {
							bottomPadding = 200,
							actionsHeight = var49,
							setActionsHeight = var50,
							hasActionsDivider = var51,
							setHasActionsDivider = var52,
							sheetHeightAvailable = var47,
							setSheetHeightAvailable = var48,
							safeAreaPadding = bottom,
							innerScrollingEnabled = var65,
							innerScrollY = var62,
							innerScrollingRef = if flagsModule.FoundationBottomSheetInnerScrollingSync then var64 else nil,
							setInnerScrollY = function(value) --[[ line: 456 ]]
								-- upvalues: var63 (copy), var78 (copy)
								var63(value)
								var78()
							end,
							hasHeader = var53,
							setHasHeader = var54,
							hasFullBleed = if flagsModule.FoundationSheetFullBleed then var55 else nil,
							fullBleedHeight = if flagsModule.FoundationSheetFullBleed then var56 else nil,
							setFullBleedHeight = if flagsModule.FoundationSheetFullBleed then var57 else nil,
							closeSheet = var77,
							hasRadius = if flagsModule.FoundationSheetFullBleed then true else nil,
							sheetType = sheetTypeModule.Bottom,
							innerSurface = var83,
							testId = var29.testId,
							closeAffordanceRef = var80,
							contentStartRef = var81,
							setContentStartRef = var82
						}
					end, {
						var29.testId, var77, bottom, var78, var83, var80, var81, var55
					})
				}, reactModule.createElement(elevationOwnerScope, { owner = var32 }, var29.children))
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
			backgroundStyle = var45:map(function(p19) --[[ line: 632 ]]
				-- upvalues: var31 (ref)
				return {
					Color3 = var31.Color.Common.Backdrop.Color3,
					Transparency = math.lerp(var31.Color.Common.Backdrop.Transparency, 1, p19)
				}
			end),
			onActivated = function() --[[ line: 638 ]]
				-- upvalues: var77 (ref)
				var77()
			end,
			testId = `{var29.testId}--backdrop`
		})
	})), var30)
end))