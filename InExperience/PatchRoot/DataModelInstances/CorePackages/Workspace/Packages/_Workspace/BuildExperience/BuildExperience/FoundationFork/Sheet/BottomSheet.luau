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
local flagsModule = require(foundation.Utility.Flags)
local imageModule = require(foundation.Components.Image)
local viewModule = require(foundation.Components.View)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local foundationBottomSheetIOSInsetWorkaroundDelayMs = game:DefineFastInt("FoundationBottomSheetIOSInsetWorkaroundDelayMs", 100)
local foundationBottomSheetIOSInsetWorkaround = game:DefineFastFlag("FoundationBottomSheetIOSInsetWorkaround", false)
local t = { defaultSnapPointIndex = 1, testId = "--foundation-sheet" }
local SHADOW_IMAGE = constantsModule.SHADOW_IMAGE
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

local function _(p0, p1, p2, p3) --[[ line: 65 | named "advanceCriticalDampedSpring" ]]
	local var30 = p0 - p2
	local var31 = 25.132741228718 * p3
	local expValue = math.exp(-var31)
	local var33 = p1 + 25.132741228718 * var30
	
	return p2 + (var30 + var33 * p3) * expValue, (p1 - var33 * var31) * expValue
end

local function useStableGuiHeight(p4) --[[ line: 82 ]]
	-- upvalues: reactModule (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (ref)
	local var34 = if p4 then p4.AbsoluteSize.Y else 0
	local var35, var36 = reactModule.useState(var34)
	local var37 = reactModule.useRef(var34)
	local var38 = reactModule.useRef(0)
	local var39 = reactModule.useCallback(function(p5) --[[ line: 88 ]]
		-- upvalues: var37 (ref), var36 (ref)
		if var37.current == p5 then
			return
		end
		var37.current = p5
		var36(p5)
	end, {})
	reactModule.useLayoutEffect(function() --[[ line: 97 ]]
		-- upvalues: var38 (ref), p4 (ref), var39 (ref), var37 (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
		var38.current += 1
		
		if p4 then
			local function updateHeight() --[[ line: 107 ]]
				-- upvalues: p4 (copy), var37 (copy), var38 (copy), var39 (copy), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
				local y = p4.AbsoluteSize.Y
				
				if var37.current <= 0 or y <= var37.current then
					var38.current += 1
					var39(y)
					
					return
				end
				var38.current += 1
				local current = var38.current
				task.delay(foundationBottomSheetIOSInsetWorkaroundDelayMs / 1000, function() --[[ line: 119 ]]
					-- upvalues: var38 (copy), current (ref), p4 (copy), y (ref), var39 (copy)
					if var38.current == current and p4.AbsoluteSize.Y == y then
						var39(y)
						
						return
					end
				end)
			end
			
			updateHeight()
			local var41 = p4:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateHeight)
			
			return function() --[[ line: 131 ]]
				-- upvalues: var38 (copy), var41 (ref)
				var38.current += 1
				var41:Disconnect()
			end
		end
		var39(0)
		
		return function() --[[ line: 102 ]]
			-- upvalues: var38 (copy)
			var38.current += 1
		end
	end, { p4, var39 })
	
	return var35
end

local _ = function() --[[ line: 140 | named "useStableScreenHeight" ]]
	-- upvalues: flagsModule (ref), useScreenModule (ref), useOverlayModule (ref), useStableGuiHeight (ref)
	return useStableGuiHeight(if flagsModule.FoundationOverlayKeyboardAwarenessHardened then useScreenModule() else useOverlayModule())
end

local function useStableBottomSafeAreaPadding(p6) --[[ line: 145 ]]
	-- upvalues: getHardwareSafeAreaInsetsModule (ref), reactModule (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (ref)
	local bottom = getHardwareSafeAreaInsetsModule().bottom
	local var42, var43 = reactModule.useState(bottom)
	local var44 = reactModule.useRef(bottom)
	local var45 = reactModule.useRef(0)
	local var46 = reactModule.useCallback(function(p7) --[[ line: 151 ]]
		-- upvalues: var44 (ref), var43 (ref)
		if var44.current == p7 then
			return
		end
		var44.current = p7
		var43(p7)
	end, {})
	reactModule.useEffect(function() --[[ line: 160 ]]
		-- upvalues: var45 (ref), p6 (ref), getHardwareSafeAreaInsetsModule (copy), var44 (ref), var46 (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
		var45.current += 1
		
		if p6 then
			local function updateBottomInset() --[[ line: 169 ]]
				-- upvalues: getHardwareSafeAreaInsetsModule (copy), var44 (copy), var45 (copy), var46 (copy), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
				local bottom = getHardwareSafeAreaInsetsModule().bottom
				
				if var44.current <= bottom then
					var45.current += 1
					var46(bottom)
					
					return
				end
				var45.current += 1
				local current = var45.current
				task.delay(foundationBottomSheetIOSInsetWorkaroundDelayMs / 1000, function() --[[ line: 181 ]]
					-- upvalues: getHardwareSafeAreaInsetsModule (copy), var45 (copy), current (ref), bottom (ref), var46 (copy)
					if var45.current == current and getHardwareSafeAreaInsetsModule().bottom == bottom then
						var46(bottom)
						
						return
					end
				end)
			end
			
			updateBottomInset()
			local var48 = p6:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateBottomInset)
			
			return function() --[[ line: 194 ]]
				-- upvalues: var45 (copy), var48 (ref)
				var45.current += 1
				var48:Disconnect()
			end
		end
		return function() --[[ line: 164 ]]
			-- upvalues: var45 (copy)
			var45.current += 1
		end
	end, { p6, var46 })
	
	return var42
end

local _ = function(value) --[[ line: 203 | named "getIOSInsetWorkaroundValues" ]]
	-- upvalues: flagsModule (ref), useScreenModule (ref), useOverlayModule (ref), useStableGuiHeight (ref), useStableBottomSafeAreaPadding (ref)
	return useStableGuiHeight(if flagsModule.FoundationOverlayKeyboardAwarenessHardened then useScreenModule() else useOverlayModule()), useStableGuiHeight(value), useStableBottomSafeAreaPadding(value)
end

return reactModule.memo(reactModule.forwardRef(function(p8, p9) --[[ line: 207 | named "BottomSheet" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), foundationBottomSheetIOSInsetWorkaround (ref), flagsModule (ref), useScreenModule (ref), useStableGuiHeight (ref), useStableBottomSafeAreaPadding (ref), useScreenHeightModule (ref), reactModule (ref), useHardwareInsetsModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), reactUtilsModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), reactRobloxModule (ref), typesModule (ref), dashModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	local var57, var58
	local var49 = withDefaultsModule(p8, t)
	local var50 = useOverlayModule()
	local var51 = useTokensModule()
	local var52 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local _ = nil
	local _ = nil
	local var53 = nil
	local bottom = nil
	
	if foundationBottomSheetIOSInsetWorkaround then
		local var54 = useStableGuiHeight(if flagsModule.FoundationOverlayKeyboardAwarenessHardened then useScreenModule() else useOverlayModule())
		local var55 = useStableGuiHeight(var50)
		local var56 = useStableBottomSafeAreaPadding(var50)
		var57 = var54
		var58 = var55
		bottom = var56
	else
		var57 = useScreenHeightModule()
		local var59, var60 = reactModule.useState(if var50 then var50.AbsoluteSize.Y else 0)
		var58 = var59
		var53 = var60
	end
	local var61, var62 = reactModule.useState(0)
	local snapPoints = var49.snapPoints or reactModule.useMemo(function() --[[ line: 228 ]]
		-- upvalues: var61 (ref)
		return { var61 }
	end, { var61 })
	local var64 = reactModule.useCallback(function(p10) --[[ line: 235 ]]
		-- upvalues: var57 (write)
		return if p10 > 1 then p10 else p10 * var57
	end, { var57 })
	local var65 = 0
	
	for i, v in snapPoints do
		local var110 = var64(v)
		
		if var65 < var110 then
			var65 = var110
		end
	end
	var65 = math.min(var65, var57)
	
	if flagsModule.FoundationOverlayKeyboardAwareness and var58 > 0 then
		var65 = math.min(var65, var58)
	end
	if not foundationBottomSheetIOSInsetWorkaround then
		bottom = useHardwareInsetsModule(var50).bottom
		reactModule.useLayoutEffect(function() --[[ line: 257 ]]
			-- upvalues: var50 (ref), var53 (write)
			if var50 then
				local function updateOverlayAvailableHeight() --[[ line: 263 ]]
					-- upvalues: var53 (copy), var50 (copy)
					var53(var50.AbsoluteSize.Y)
				end
				
				var53(var50.AbsoluteSize.Y)
				local var112 = var50:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateOverlayAvailableHeight)
				
				return function() --[[ line: 270 ]]
					-- upvalues: var112 (ref)
					var112:Disconnect()
				end
			end
			var53(0)
		end, { var50 })
	end
	local var66 = reactModule.useRef(0)
	local var67 = reactModule.useRef(false)
	local var68, var69 = useAnimatedBinding(1, function() --[[ line: 279 ]]
		-- upvalues: var67 (ref), var49 (ref)
		if var67.current then
			var49.onClose()
		end
	end)
	local var70, var71 = reactModule.useBinding(-bottom)
	local var72, var73 = reactModule.useBinding(0)
	local var74, var75 = reactModule.useBinding(false)
	local var76, var77 = reactModule.useBinding(false)
	local var78 = nil
	local var79 = nil
	local var80 = nil
	
	if flagsModule.FoundationSheetFullBleed then
		var78 = childrenHasFullBleedModule(var49.children)
		local var81, var82 = reactModule.useBinding(0)
		var79 = var81
		var80 = var82
	end
	local var83 = reactModule.useRef(0)
	local var84 = reactModule.useRef(nil)
	local var85, var86 = reactModule.useBinding(0)
	local var87, var88 = reactModule.useBinding(false)
	local var89 = reactModule.useRef(false)
	local var90 = reactModule.useRef(0)
	local var91 = reactModule.useRef(nil)
	local var92 = reactModule.useRef(false)
	local var93 = reactModule.useRef(0)
	local var94 = reactModule.useCallback(function() --[[ line: 306 ]]
		-- upvalues: var91 (ref), var90 (ref), var92 (ref)
		if var91.current then
			var91.current:Disconnect()
			var91.current = nil
		end
		var90.current = 0
		var92.current = false
	end, {})
	local var95 = reactModule.useCallback(function(p11) --[[ line: 315 ]]
		-- upvalues: var94 (ref), var92 (ref), flagsModule (copy), var84 (ref), var91 (ref), var93 (ref)
		var94()
		var92.current = true
		
		if flagsModule.FoundationBottomSheetImproveSpring and var84.current then
			var84.current:ResetScrollVelocity()
		end
		local var113 = if var84.current then var84.current.CanvasPosition.Y else 0
		var91.current = game:GetService("RunService").Heartbeat:Connect(function(p12) --[[ line: 327 ]]
			-- upvalues: var84 (copy), var92 (copy), var94 (copy), flagsModule (copy), var93 (copy), p11 (ref), var113 (write)
			if not var84.current or not var92.current then
				var94()
				
				return
			end
			local var119
			local y = var84.current.CanvasPosition.Y
			local _ = nil
			
			if flagsModule.FoundationBottomSheetImproveSpring then
				local current = var93.current
				local var114 = y - p11
				local var115 = 25.132741228718 * p12
				local expValue = math.exp(-var115)
				local var117 = current + 25.132741228718 * var114
				local var118 = p11 + (var114 + var117 * p12) * expValue
				var93.current = (current - var117 * var115) * expValue
				var84.current.CanvasPosition = Vector2.new(0, var118)
				var113 = var84.current.CanvasPosition.Y
				var119 = p11 - var84.current.CanvasPosition.Y
			else
				var119 = p11 - y
				local var120 = var119 * 18 * 18
				var93.current -= (y - var113) / p12
				local minValue = math.min(p12, 0.033333333333)
				var93.current += (var120 + -var93.current * 2 * 0.9 * 18) * minValue
				var84.current.CanvasPosition = Vector2.new(0, y + var93.current * minValue)
				var113 = var84.current.CanvasPosition.Y
			end
			if math.abs(var119) < 0.5 and math.abs(var93.current) < 1 then
				var84.current.CanvasPosition = Vector2.new(0, p11)
				var94()
			end
		end)
	end, { var94 })
	local var96 = reactModule.useCallback(function(p13) --[[ line: 374 ]]
		-- upvalues: var64 (ref), var65 (write), bottom (write)
		return math.min(var64(p13), var65) + bottom
	end, { bottom, var64, var65 })
	local var97 = reactModule.useCallback(function(p14) --[[ line: 378 ]]
		-- upvalues: var66 (ref), var95 (ref), var96 (ref), snapPoints (ref)
		var66.current = p14
		var95(var96(snapPoints[p14]))
	end, { var96, snapPoints })
	local var98 = reactModule.useCallback(function(p15) --[[ line: 383 ]]
		-- upvalues: var94 (ref), var66 (ref), var84 (ref), var96 (ref), snapPoints (ref)
		var94()
		var66.current = p15
		
		if var84.current then
			var84.current.CanvasPosition = Vector2.new(0, var96(snapPoints[p15]))
		end
	end, { var94, var96, snapPoints })
	local var99 = reactModule.useRef(0)
	reactModule.useEffect(function() --[[ line: 393 ]]
		-- upvalues: var50 (ref), flagsModule (copy), var99 (ref), var58 (write), var66 (ref), snapPoints (ref), var49 (ref), reducedMotion (ref), var98 (ref), var97 (ref)
		if not var50 or not flagsModule.FoundationOverlayKeyboardAwareness then return end
		local current = var99.current
		var99.current = var58
		
		if current <= 0 or current == var58 then return end
		local current_1 = var66.current
		
		if current_1 <= 0 or #snapPoints < current_1 then
			current_1 = var49.defaultSnapPointIndex
		end
		if reducedMotion then
			var98(current_1)
			
			return
		end
		var97(current_1)
	end, {
		var50, var58, var97, var98, reducedMotion, var49.defaultSnapPointIndex,
		snapPoints
	})
	local var100 = reactModule.useCallback(function(p16) --[[ line: 426 ]]
		-- upvalues: var67 (ref), reducedMotion (ref), var94 (ref), var84 (ref), var69 (ref), otterModule (copy), var93 (ref), var90 (ref), var95 (ref), var51 (ref)
		if var67.current then return end
		if not reducedMotion or p16 then
			var93.current = -var90.current
			var95(0)
			var69(otterModule.ease(1, { duration = var51.Time.Time_100 }))
			var67.current = true
			
			return
		end
		var67.current = true
		var94()
		
		if var84.current then
			var84.current.CanvasPosition = Vector2.new(0, 0)
		end
		var69(otterModule.instant(1))
	end, { var95, var94, reducedMotion })
	local var101 = reactModule.useCallback(function() --[[ line: 447 ]]
		-- upvalues: var85 (ref), var83 (ref), flagsModule (copy), var65 (write), bottom (write), var90 (ref), var89 (ref), var88 (ref)
		local var122 = (if flagsModule.FoundationBottomSheetImproveSpring then math.floor(var65 + bottom) else math.round(var65 + bottom)) <= var83.current
		
		if var90.current > 0 and var85:getValue() <= 0 and var89.current then
			var88(false)
			
			return
		elseif (var90.current < 0 or flagsModule.FoundationBottomSheetImproveSpring and var90.current == 0) and var122 then
			var88(true)
		end
	end, { var65, bottom })
	local var102 = reactModule.useCallback(function() --[[ line: 464 ]]
		-- upvalues: var90 (ref), var83 (ref), snapPoints (ref), var96 (ref), var89 (ref), var93 (ref), var100 (ref), var97 (ref)
		local current = var90.current
		local var123 = var83.current - current / 2.35
		local list = { { index = 0, position = 0 } }
		
		for i, v in snapPoints do
			table.insert(list, { index = i, position = var96(v) })
		end
		table.sort(list, function(p17, p18) --[[ line: 482 ]]
			-- upvalues: var123 (ref)
			return math.abs(p17.position - var123) < math.abs(p18.position - var123)
		end)
		local var125 = list[1]
		
		if not var89.current then
			var93.current = -current
			
			if var125.index == 0 then
				var100(true)
				
				return
			end
			var97(var125.index)
		end
	end, { snapPoints, var97, var96, var100 })
	reactModule.useEffect(function() --[[ line: 498 ]]
		-- upvalues: var50 (ref), reducedMotion (ref), var98 (ref), var49 (ref), var69 (ref), otterModule (copy), var97 (ref), var51 (ref), var64 (ref), snapPoints (ref), var65 (write), var88 (ref), var94 (ref)
		if var50 then
			if reducedMotion then
				var98(var49.defaultSnapPointIndex)
				var69(otterModule.instant(0))
			else
				var97(var49.defaultSnapPointIndex)
				var69(otterModule.ease(0, { duration = var51.Time.Time_100 }))
			end
			if math.min(var64(snapPoints[var49.defaultSnapPointIndex]), var65) == var65 then
				var88(true)
			end
		end
		return function() --[[ line: 519 ]]
			-- upvalues: var94 (copy)
			var94()
		end
	end, {
		var50, snapPoints, var49.defaultSnapPointIndex, var97, var64, var98,
		reducedMotion
	})
	reactModule.useEffect(function() --[[ line: 537 ]]
		-- upvalues: var90 (ref), var101 (ref), var89 (ref), var94 (ref), flagsModule (copy), var84 (ref), var83 (ref), var65 (write), bottom (write), var67 (ref), var88 (ref), var102 (ref)
		local touchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, _, p19, _) --[[ line: 538 ]]
			-- upvalues: var90 (copy), var101 (copy)
			var90.current = p19.Y
			var101()
		end)
		local inputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function() --[[ line: 542 ]]
			-- upvalues: var89 (copy), var90 (copy), var94 (copy)
			var89.current = true
			var90.current = 0
			var94()
		end)
		local inputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function() --[[ line: 547 ]]
			-- upvalues: var89 (copy), flagsModule (copy), var84 (copy), var90 (copy), var83 (copy), var65 (copy), bottom (copy), var67 (copy), var88 (copy), var102 (copy)
			if var89.current == false then return end
			var89.current = false
			
			if flagsModule.FoundationBottomSheetImproveSpring then
				var90.current = if var84.current then var84.current:GetScrollVelocity().Y else 0
				
				if if math.floor(var65 + bottom) > var83.current then var67.current else true then
					var88(true)
					
					return
				end
			else
				local var129 = nil
				
				if var84.current then
					local ok, status = pcall(function() --[[ line: 572 ]]
						-- upvalues: var84 (copy)
						return var84.current:GetScrollVelocity().Y == 0
					end)
					
					if ok then
						var129 = status
					end
				end
				if var129 or var67.current then
					var88(true)
					
					return
				end
			end
			var102()
		end)
		
		return function() --[[ line: 593 ]]
			-- upvalues: touchPanConnection (ref), inputBeganConnection (ref), inputEndedConnection (ref)
			touchPanConnection:Disconnect()
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, { var50, var102, var101, var94 })
	local var103 = reactModule.useRef(nil)
	local var104, var105 = reactModule.useState(nil)
	local var106, var107 = reactModule.useState(nil)
	local var108 = reactUtilsModule.useComposedRef(p9, var107)
	reactModule.useImperativeHandle(var49.sheetRef, function() --[[ line: 606 ]]
		-- upvalues: var100 (ref)
		return { close = var100 }
	end, {})
	local var109 = reactModule.createElement(viewModule, {
		ZIndex = 3,
		tag = "align-y-center size-1000-100 padding-y-small radius-small",
		backgroundStyle = var51.Color.Content.Muted,
		Position = if flagsModule.FoundationSheetFullBleed then UDim2.new(0.5, 0, 0, if var78 then var51.Padding.Small else -var51.Padding.XSmall) else nil,
		AnchorPoint = if flagsModule.FoundationSheetFullBleed then Vector2.new(0.5, 0) else nil,
		testId = `{var49.testId}--gripper`
	}, {
		TouchTarget = reactModule.createElement(viewModule, {
			tag = "size-1000-600",
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			onActivated = function() --[[ line: 671 ]]
				-- upvalues: var89 (ref), snapPoints (ref), var66 (ref), reducedMotion (ref), var98 (ref), var97 (ref), var64 (ref), var65 (write), var88 (ref), var100 (ref)
				var89.current = false
				
				if #snapPoints > 1 then
					local var130 = var66.current % #snapPoints + 1
					
					if reducedMotion then
						var98(var130)
					else
						var97(var130)
					end
					if math.min(var64(snapPoints[var130]), var65) == var65 then
						var88(true)
						
						return
					end
				else
					var100()
				end
			end
		})
	})
	
	return var50 and reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
		ZIndex = var52.zIndex,
		ref = var108,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		Size = if foundationBottomSheetIOSInsetWorkaround then UDim2.new(1, 0, 0, var58) else nil,
		tag = if foundationBottomSheetIOSInsetWorkaround then nil else "size-full",
		testId = `{var49.testId}--surface`
	}, reactModule.createElement("ScrollingFrame", {
		Size = if foundationBottomSheetIOSInsetWorkaround then UDim2.new(1, 0, 0, var58) else UDim2.fromScale(1, 1),
		CanvasSize = if flagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 1, var65 + bottom) else UDim2.new(1, 0, 0, var57 + var65 + bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = var84,
		[reactModule.Change.CanvasPosition] = function(p20) --[[ line: 720 ]]
			-- upvalues: var83 (ref), var71 (ref), bottom (write), var51 (ref), var101 (ref), var100 (ref)
			var83.current = p20.CanvasPosition.Y
			var71(var83.current - bottom - var51.Margin.Small)
			var101()
			
			if var83.current <= 0 then
				var100()
			end
		end
	}, {
		SheetContainer = reactModule.createElement(viewModule, {
			ZIndex = 3,
			Size = if flagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 1, 200 - var65 - bottom) else UDim2.new(1, 0, 0, var57 + 200),
			Position = if flagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(0, 0, 1, -var65) else UDim2.fromOffset(0, var57 + bottom)
		}, {
			Sheet = reactModule.createElement(viewModule, {
				Size = if var49.snapPoints == nil then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, var65 + 200),
				AutomaticSize = if var49.snapPoints == nil then Enum.AutomaticSize.Y else nil,
				onAbsoluteSizeChanged = if var49.snapPoints == nil then function(p21) --[[ line: 744 ]]
					-- upvalues: var62 (ref)
					var62(p21.AbsoluteSize.Y - 200)
				end else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				testId = var49.testId,
				tag = if flagsModule.FoundationSheetFullBleed then {
					["col items-center radius-large clip bg-surface-100"] = true,
					["padding-top-medium"] = not var78
				} else "col items-center padding-top-small radius-large clip bg-surface-100"
			}, {
				GripperContainer = if flagsModule.FoundationSheetFullBleed then reactModule.createElement("Folder", nil, { Gripper = var109 }) else var109,
				Content = reactModule.createElement(sheetContextModule.Provider, {
					value = reactModule.useMemo(function() --[[ line: 613 ]]
						-- upvalues: var72 (ref), var73 (ref), var74 (ref), var75 (ref), var70 (ref), var71 (ref), bottom (write), var87 (ref), var85 (ref), var86 (ref), var101 (ref), var76 (ref), var77 (ref), flagsModule (copy), var78 (write), var79 (write), var80 (write), var100 (ref), sheetTypeModule (copy), var106 (ref), var49 (ref), var103 (ref), var104 (ref), var105 (ref)
						return {
							bottomPadding = 200,
							actionsHeight = var72,
							setActionsHeight = var73,
							hasActionsDivider = var74,
							setHasActionsDivider = var75,
							sheetHeightAvailable = var70,
							setSheetHeightAvailable = var71,
							safeAreaPadding = bottom,
							innerScrollingEnabled = var87,
							innerScrollY = var85,
							setInnerScrollY = function(value) --[[ line: 625 ]]
								-- upvalues: var86 (copy), var101 (copy)
								var86(value)
								var101()
							end,
							hasHeader = var76,
							setHasHeader = var77,
							hasFullBleed = if flagsModule.FoundationSheetFullBleed then var78 else nil,
							fullBleedHeight = if flagsModule.FoundationSheetFullBleed then var79 else nil,
							setFullBleedHeight = if flagsModule.FoundationSheetFullBleed then var80 else nil,
							closeSheet = var100,
							hasRadius = if flagsModule.FoundationSheetFullBleed then true else nil,
							sheetType = sheetTypeModule.Bottom,
							innerSurface = var106,
							testId = var49.testId,
							closeAffordanceRef = var103,
							contentStartRef = var104,
							setContentStartRef = var105
						}
					end, {
						var49.testId, var100, bottom, var101, var106, var103, var104, var78
					})
				}, reactModule.createElement(elevationOwnerScope, { owner = var52 }, var49.children))
			})
		}),
		Shadow = reactModule.createElement(imageModule, {
			ZIndex = 2,
			Image = SHADOW_IMAGE,
			Size = UDim2.new(1, SHADOW_SIZE * 2, 0, var65 + 200 + SHADOW_SIZE * 2),
			Position = if flagsModule.FoundationSheetPreventCloseOnResize then UDim2.new(-SHADOW_SIZE, 0, 1, (-var65) - SHADOW_SIZE) else UDim2.fromOffset(-SHADOW_SIZE, var57 + bottom - SHADOW_SIZE),
			slice = {
				scale = 2,
				center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
			},
			imageStyle = var51.Color.Extended.Black.Black_10
		}),
		Backdrop = reactModule.createElement(viewModule, {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 2),
			Position = UDim2.fromScale(0, -0.5),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			backgroundStyle = var68:map(function(p22) --[[ line: 793 ]]
				-- upvalues: var51 (ref)
				return {
					Color3 = var51.Color.Common.Backdrop.Color3,
					Transparency = math.lerp(var51.Color.Common.Backdrop.Transparency, 1, p22)
				}
			end),
			onActivated = function() --[[ line: 799 ]]
				-- upvalues: var100 (ref)
				var100()
			end,
			testId = `{var49.testId}--backdrop`
		})
	})), var50)
end))