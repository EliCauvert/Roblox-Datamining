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

local function _(p0, p1, p2, p3) --[[ line: 62 | named "advanceCriticalDampedSpring" ]]
	local var29 = p0 - p2
	local var30 = 25.132741228718 * p3
	local expValue = math.exp(-var30)
	local var32 = p1 + 25.132741228718 * var29
	
	return p2 + (var29 + var32 * p3) * expValue, (p1 - var32 * var30) * expValue
end

local function useStableGuiHeight(p4) --[[ line: 79 ]]
	-- upvalues: reactModule (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (ref)
	local var33 = if p4 then p4.AbsoluteSize.Y else 0
	local var34, var35 = reactModule.useState(var33)
	local var36 = reactModule.useRef(var33)
	local var37 = reactModule.useRef(0)
	local var38 = reactModule.useCallback(function(p5) --[[ line: 85 ]]
		-- upvalues: var36 (ref), var35 (ref)
		if var36.current == p5 then
			return
		end
		var36.current = p5
		var35(p5)
	end, {})
	reactModule.useLayoutEffect(function() --[[ line: 94 ]]
		-- upvalues: var37 (ref), p4 (ref), var38 (ref), var36 (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
		var37.current += 1
		
		if p4 then
			local function updateHeight() --[[ line: 104 ]]
				-- upvalues: p4 (copy), var36 (copy), var37 (copy), var38 (copy), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
				local y = p4.AbsoluteSize.Y
				
				if var36.current <= 0 or y <= var36.current then
					var37.current += 1
					var38(y)
					
					return
				end
				var37.current += 1
				local current = var37.current
				task.delay(foundationBottomSheetIOSInsetWorkaroundDelayMs / 1000, function() --[[ line: 116 ]]
					-- upvalues: var37 (copy), current (ref), p4 (copy), y (ref), var38 (copy)
					if var37.current == current and p4.AbsoluteSize.Y == y then
						var38(y)
						
						return
					end
				end)
			end
			
			updateHeight()
			local var40 = p4:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateHeight)
			
			return function() --[[ line: 128 ]]
				-- upvalues: var37 (copy), var40 (ref)
				var37.current += 1
				var40:Disconnect()
			end
		end
		var38(0)
		
		return function() --[[ line: 99 ]]
			-- upvalues: var37 (copy)
			var37.current += 1
		end
	end, { p4, var38 })
	
	return var34
end

local _ = function() --[[ line: 137 | named "useStableScreenHeight" ]]
	-- upvalues: useScreenModule (ref), useStableGuiHeight (ref)
	return useStableGuiHeight(useScreenModule())
end

local function useStableBottomSafeAreaPadding(p6) --[[ line: 142 ]]
	-- upvalues: getHardwareSafeAreaInsetsModule (ref), reactModule (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (ref)
	local bottom = getHardwareSafeAreaInsetsModule().bottom
	local var41, var42 = reactModule.useState(bottom)
	local var43 = reactModule.useRef(bottom)
	local var44 = reactModule.useRef(0)
	local var45 = reactModule.useCallback(function(p7) --[[ line: 148 ]]
		-- upvalues: var43 (ref), var42 (ref)
		if var43.current == p7 then
			return
		end
		var43.current = p7
		var42(p7)
	end, {})
	reactModule.useEffect(function() --[[ line: 157 ]]
		-- upvalues: var44 (ref), p6 (ref), getHardwareSafeAreaInsetsModule (copy), var43 (ref), var45 (ref), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
		var44.current += 1
		
		if p6 then
			local function updateBottomInset() --[[ line: 166 ]]
				-- upvalues: getHardwareSafeAreaInsetsModule (copy), var43 (copy), var44 (copy), var45 (copy), foundationBottomSheetIOSInsetWorkaroundDelayMs (copy)
				local bottom = getHardwareSafeAreaInsetsModule().bottom
				
				if var43.current <= bottom then
					var44.current += 1
					var45(bottom)
					
					return
				end
				var44.current += 1
				local current = var44.current
				task.delay(foundationBottomSheetIOSInsetWorkaroundDelayMs / 1000, function() --[[ line: 178 ]]
					-- upvalues: getHardwareSafeAreaInsetsModule (copy), var44 (copy), current (ref), bottom (ref), var45 (copy)
					if var44.current == current and getHardwareSafeAreaInsetsModule().bottom == bottom then
						var45(bottom)
						
						return
					end
				end)
			end
			
			updateBottomInset()
			local var47 = p6:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateBottomInset)
			
			return function() --[[ line: 191 ]]
				-- upvalues: var44 (copy), var47 (ref)
				var44.current += 1
				var47:Disconnect()
			end
		end
		return function() --[[ line: 161 ]]
			-- upvalues: var44 (copy)
			var44.current += 1
		end
	end, { p6, var45 })
	
	return var41
end

local _ = function(value) --[[ line: 200 | named "getIOSInsetWorkaroundValues" ]]
	-- upvalues: useScreenModule (ref), useStableGuiHeight (ref), useStableBottomSafeAreaPadding (ref)
	return useStableGuiHeight(useScreenModule()), useStableGuiHeight(value), useStableBottomSafeAreaPadding(value)
end

return reactModule.memo(reactModule.forwardRef(function(p8, p9) --[[ line: 204 | named "BottomSheet" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePreferencesModule (ref), foundationBottomSheetIOSInsetWorkaround (ref), useScreenModule (ref), useStableGuiHeight (ref), useStableBottomSafeAreaPadding (ref), useScreenHeightModule (ref), reactModule (ref), useHardwareInsetsModule (ref), useAnimatedBinding (ref), childrenHasFullBleedModule (ref), otterModule (ref), reactUtilsModule (ref), sheetTypeModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), reactRobloxModule (ref), typesModule (ref), dashModule (ref), sheetContextModule (ref), elevationOwnerScope (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref)
	local var56, var57
	local var48 = withDefaultsModule(p8, t)
	local var49 = useOverlayModule()
	local var50 = useTokensModule()
	local var51 = useElevationModule(elevationLayerModule.Sheet, { stackAboveOwner = false })
	local reducedMotion = usePreferencesModule().reducedMotion
	local _ = nil
	local _ = nil
	local var52 = nil
	local bottom = nil
	
	if foundationBottomSheetIOSInsetWorkaround then
		local var53 = useStableGuiHeight(useScreenModule())
		local var54 = useStableGuiHeight(var49)
		local var55 = useStableBottomSafeAreaPadding(var49)
		var56 = var53
		var57 = var54
		bottom = var55
	else
		var56 = useScreenHeightModule()
		local var58, var59 = reactModule.useState(if var49 then var49.AbsoluteSize.Y else 0)
		var57 = var58
		var52 = var59
	end
	local var60, var61 = reactModule.useState(0)
	local snapPoints = var48.snapPoints or reactModule.useMemo(function() --[[ line: 225 ]]
		-- upvalues: var60 (ref)
		return { var60 }
	end, { var60 })
	local var63 = reactModule.useCallback(function(p10) --[[ line: 232 ]]
		-- upvalues: var56 (write)
		return if p10 > 1 then p10 else p10 * var56
	end, { var56 })
	local var64 = 0
	
	for i, v in snapPoints do
		local var106 = var63(v)
		
		if var64 < var106 then
			var64 = var106
		end
	end
	var64 = math.min(var64, var56)
	
	if var57 > 0 then
		var64 = math.min(var64, var57)
	end
	if not foundationBottomSheetIOSInsetWorkaround then
		bottom = useHardwareInsetsModule(var49).bottom
		reactModule.useLayoutEffect(function() --[[ line: 254 ]]
			-- upvalues: var49 (ref), var52 (write)
			if var49 then
				local function updateOverlayAvailableHeight() --[[ line: 260 ]]
					-- upvalues: var52 (copy), var49 (copy)
					var52(var49.AbsoluteSize.Y)
				end
				
				var52(var49.AbsoluteSize.Y)
				local var108 = var49:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateOverlayAvailableHeight)
				
				return function() --[[ line: 267 ]]
					-- upvalues: var108 (ref)
					var108:Disconnect()
				end
			end
			var52(0)
		end, { var49 })
	end
	local var65 = reactModule.useRef(0)
	local var66 = reactModule.useRef(false)
	local var67, var68 = useAnimatedBinding(1, function() --[[ line: 276 ]]
		-- upvalues: var66 (ref), var48 (ref)
		if var66.current then
			var48.onClose()
		end
	end)
	local var69, var70 = reactModule.useBinding(-bottom)
	local var71, var72 = reactModule.useBinding(0)
	local var73, var74 = reactModule.useBinding(false)
	local var75, var76 = reactModule.useBinding(false)
	local var77 = childrenHasFullBleedModule(var48.children)
	local var78, var79 = reactModule.useBinding(0)
	local var80 = reactModule.useRef(0)
	local var81 = reactModule.useRef(nil)
	local var82, var83 = reactModule.useBinding(0)
	local var84, var85 = reactModule.useBinding(false)
	local var86 = reactModule.useRef(false)
	local var87 = reactModule.useRef(0)
	local var88 = reactModule.useRef(nil)
	local var89 = reactModule.useRef(false)
	local var90 = reactModule.useRef(0)
	local var91 = reactModule.useCallback(function() --[[ line: 299 ]]
		-- upvalues: var88 (ref), var87 (ref), var89 (ref)
		if var88.current then
			var88.current:Disconnect()
			var88.current = nil
		end
		var87.current = 0
		var89.current = false
	end, {})
	local var92 = reactModule.useCallback(function(p11) --[[ line: 308 ]]
		-- upvalues: var91 (ref), var89 (ref), var81 (ref), var88 (ref), var90 (ref)
		var91()
		var89.current = true
		
		if var81.current then
			var81.current:ResetScrollVelocity()
		end
		var88.current = game:GetService("RunService").Heartbeat:Connect(function(p12) --[[ line: 317 ]]
			-- upvalues: var81 (copy), var89 (copy), var91 (copy), var90 (copy), p11 (ref)
			if not var81.current or not var89.current then
				var91()
				
				return
			end
			local current = var90.current
			local var109 = var81.current.CanvasPosition.Y - p11
			local var110 = 25.132741228718 * p12
			local expValue = math.exp(-var110)
			local var112 = current + 25.132741228718 * var109
			local var113 = p11 + (var109 + var112 * p12) * expValue
			var90.current = (current - var112 * var110) * expValue
			var81.current.CanvasPosition = Vector2.new(0, var113)
			
			if math.abs(p11 - var81.current.CanvasPosition.Y) < 0.5 and math.abs(var90.current) < 1 then
				var81.current.CanvasPosition = Vector2.new(0, p11)
				var91()
			end
		end)
	end, { var91 })
	local var93 = reactModule.useCallback(function(p13) --[[ line: 341 ]]
		-- upvalues: var63 (ref), var64 (write), bottom (write)
		return math.min(var63(p13), var64) + bottom
	end, { bottom, var63, var64 })
	local var94 = reactModule.useCallback(function(p14) --[[ line: 345 ]]
		-- upvalues: var65 (ref), var92 (ref), var93 (ref), snapPoints (ref)
		var65.current = p14
		var92(var93(snapPoints[p14]))
	end, { var93, snapPoints })
	local var95 = reactModule.useCallback(function(p15) --[[ line: 350 ]]
		-- upvalues: var91 (ref), var65 (ref), var81 (ref), var93 (ref), snapPoints (ref)
		var91()
		var65.current = p15
		
		if var81.current then
			var81.current.CanvasPosition = Vector2.new(0, var93(snapPoints[p15]))
		end
	end, { var91, var93, snapPoints })
	local var96 = reactModule.useRef(0)
	reactModule.useEffect(function() --[[ line: 360 ]]
		-- upvalues: var49 (ref), var96 (ref), var57 (write), var65 (ref), snapPoints (ref), var48 (ref), reducedMotion (ref), var95 (ref), var94 (ref)
		if not var49 then return end
		local current = var96.current
		var96.current = var57
		
		if current <= 0 or current == var57 then return end
		local current_1 = var65.current
		
		if current_1 <= 0 or #snapPoints < current_1 then
			current_1 = var48.defaultSnapPointIndex
		end
		if reducedMotion then
			var95(current_1)
			
			return
		end
		var94(current_1)
	end, {
		var49, var57, var94, var95, reducedMotion, var48.defaultSnapPointIndex,
		snapPoints
	})
	local var97 = reactModule.useCallback(function(p16) --[[ line: 393 ]]
		-- upvalues: var66 (ref), reducedMotion (ref), var91 (ref), var81 (ref), var68 (ref), otterModule (copy), var90 (ref), var87 (ref), var92 (ref), var50 (ref)
		if var66.current then return end
		if not reducedMotion or p16 then
			var90.current = -var87.current
			var92(0)
			var68(otterModule.ease(1, { duration = var50.Time.Time_100 }))
			var66.current = true
			
			return
		end
		var66.current = true
		var91()
		
		if var81.current then
			var81.current.CanvasPosition = Vector2.new(0, 0)
		end
		var68(otterModule.instant(1))
	end, { var92, var91, reducedMotion })
	local var98 = reactModule.useCallback(function() --[[ line: 414 ]]
		-- upvalues: var82 (ref), var80 (ref), var64 (write), bottom (write), var87 (ref), var86 (ref), var85 (ref)
		local var114 = math.floor(var64 + bottom) <= var80.current
		
		if var87.current > 0 and var82:getValue() <= 0 and var86.current then
			var85(false)
			
			return
		elseif var87.current <= 0 and var114 then
			var85(true)
		end
	end, { var64, bottom })
	local var99 = reactModule.useCallback(function() --[[ line: 425 ]]
		-- upvalues: var87 (ref), var80 (ref), snapPoints (ref), var93 (ref), var86 (ref), var90 (ref), var97 (ref), var94 (ref)
		local current = var87.current
		local var115 = var80.current - current / 2.35
		local list = { { index = 0, position = 0 } }
		
		for i, v in snapPoints do
			table.insert(list, { index = i, position = var93(v) })
		end
		table.sort(list, function(p17, p18) --[[ line: 443 ]]
			-- upvalues: var115 (ref)
			return math.abs(p17.position - var115) < math.abs(p18.position - var115)
		end)
		local var117 = list[1]
		
		if not var86.current then
			var90.current = -current
			
			if var117.index == 0 then
				var97(true)
				
				return
			end
			var94(var117.index)
		end
	end, { snapPoints, var94, var93, var97 })
	reactModule.useEffect(function() --[[ line: 459 ]]
		-- upvalues: var49 (ref), reducedMotion (ref), var95 (ref), var48 (ref), var68 (ref), otterModule (copy), var94 (ref), var50 (ref), var63 (ref), snapPoints (ref), var64 (write), var85 (ref), var91 (ref)
		if var49 then
			if reducedMotion then
				var95(var48.defaultSnapPointIndex)
				var68(otterModule.instant(0))
			else
				var94(var48.defaultSnapPointIndex)
				var68(otterModule.ease(0, { duration = var50.Time.Time_100 }))
			end
			if math.min(var63(snapPoints[var48.defaultSnapPointIndex]), var64) == var64 then
				var85(true)
			end
		end
		return function() --[[ line: 480 ]]
			-- upvalues: var91 (copy)
			var91()
		end
	end, {
		var49, snapPoints, var48.defaultSnapPointIndex, var94, var63, var95,
		reducedMotion
	})
	reactModule.useEffect(function() --[[ line: 498 ]]
		-- upvalues: var87 (ref), var98 (ref), var86 (ref), var91 (ref), var81 (ref), var80 (ref), var64 (write), bottom (write), var66 (ref), var85 (ref), var99 (ref)
		local touchPanConnection = game:GetService("UserInputService").TouchPan:Connect(function(_, _, p19, _) --[[ line: 499 ]]
			-- upvalues: var87 (copy), var98 (copy)
			var87.current = p19.Y
			var98()
		end)
		local inputBeganConnection = game:GetService("UserInputService").InputBegan:Connect(function() --[[ line: 503 ]]
			-- upvalues: var86 (copy), var87 (copy), var91 (copy)
			var86.current = true
			var87.current = 0
			var91()
		end)
		local inputEndedConnection = game:GetService("UserInputService").InputEnded:Connect(function() --[[ line: 508 ]]
			-- upvalues: var86 (copy), var87 (copy), var81 (copy), var80 (copy), var64 (copy), bottom (copy), var66 (copy), var85 (copy), var99 (copy)
			if var86.current == false then return end
			var86.current = false
			var87.current = if var81.current then var81.current:GetScrollVelocity().Y else 0
			
			if if math.floor(var64 + bottom) > var80.current then var66.current else true then
				var85(true)
				
				return
			end
			var99()
		end)
		
		return function() --[[ line: 531 ]]
			-- upvalues: touchPanConnection (ref), inputBeganConnection (ref), inputEndedConnection (ref)
			touchPanConnection:Disconnect()
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, { var49, var99, var98, var91 })
	local var100 = reactModule.useRef(nil)
	local var101, var102 = reactModule.useState(nil)
	local var103, var104 = reactModule.useState(nil)
	local var105 = reactUtilsModule.useComposedRef(p9, var104)
	reactModule.useImperativeHandle(var48.sheetRef, function() --[[ line: 544 ]]
		-- upvalues: var97 (ref)
		return { close = var97 }
	end, {})
	
	return var49 and reactRobloxModule.createPortal(reactModule.createElement(viewModule, {
		ZIndex = var51.zIndex,
		ref = var105,
		selection = typesModule.nonSelectable,
		selectionGroup = typesModule.isolatedSelectionGroup,
		Size = if foundationBottomSheetIOSInsetWorkaround then UDim2.new(1, 0, 0, var57) else nil,
		tag = if foundationBottomSheetIOSInsetWorkaround then nil else "size-full",
		testId = `{var48.testId}--surface`
	}, reactModule.createElement("ScrollingFrame", {
		Size = if foundationBottomSheetIOSInsetWorkaround then UDim2.new(1, 0, 0, var57) else UDim2.fromScale(1, 1),
		CanvasSize = UDim2.new(1, 0, 1, var64 + bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = var81,
		[reactModule.Change.CanvasPosition] = function(p20) --[[ line: 654 ]]
			-- upvalues: var80 (ref), var70 (ref), bottom (write), var50 (ref), var98 (ref), var97 (ref)
			var80.current = p20.CanvasPosition.Y
			var70(var80.current - bottom - var50.Margin.Small)
			var98()
			
			if var80.current <= 0 then
				var97()
			end
		end
	}, {
		SheetContainer = reactModule.createElement(viewModule, {
			ZIndex = 3,
			Size = UDim2.new(1, 0, 1, 200 - var64 - bottom),
			Position = UDim2.new(0, 0, 1, -var64)
		}, {
			Sheet = reactModule.createElement(viewModule, {
				Size = if var48.snapPoints == nil then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, var64 + 200),
				AutomaticSize = if var48.snapPoints == nil then Enum.AutomaticSize.Y else nil,
				onAbsoluteSizeChanged = if var48.snapPoints == nil then function(p21) --[[ line: 674 ]]
					-- upvalues: var61 (ref)
					var61(p21.AbsoluteSize.Y - 200)
				end else nil,
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = dashModule.noop,
				testId = var48.testId,
				tag = {
					["col items-center radius-large clip bg-surface-100"] = true,
					["padding-top-medium"] = not var77
				}
			}, {
				GripperContainer = reactModule.createElement("Folder", nil, {
					Gripper = reactModule.createElement(viewModule, {
						ZIndex = 3,
						tag = "align-y-center size-1000-100 padding-y-small radius-small",
						backgroundStyle = var50.Color.Content.Muted,
						Position = UDim2.new(0.5, 0, 0, if var77 then var50.Padding.Small else -var50.Padding.XSmall),
						AnchorPoint = Vector2.new(0.5, 0),
						testId = `{var48.testId}--gripper`
					}, {
						TouchTarget = reactModule.createElement(viewModule, {
							tag = "size-1000-600",
							stateLayer = { affordance = stateLayerAffordanceModule.None },
							onActivated = function() --[[ line: 607 ]]
								-- upvalues: var86 (ref), snapPoints (ref), var65 (ref), reducedMotion (ref), var95 (ref), var94 (ref), var63 (ref), var64 (write), var85 (ref), var97 (ref)
								var86.current = false
								
								if #snapPoints > 1 then
									local var121 = var65.current % #snapPoints + 1
									
									if reducedMotion then
										var95(var121)
									else
										var94(var121)
									end
									if math.min(var63(snapPoints[var121]), var64) == var64 then
										var85(true)
										
										return
									end
								else
									var97()
								end
							end
						})
					})
				}),
				Content = reactModule.createElement(sheetContextModule.Provider, {
					value = reactModule.useMemo(function() --[[ line: 551 ]]
						-- upvalues: var71 (ref), var72 (ref), var73 (ref), var74 (ref), var69 (ref), var70 (ref), bottom (write), var84 (ref), var82 (ref), var83 (ref), var98 (ref), var75 (ref), var76 (ref), var77 (ref), var78 (ref), var79 (ref), var97 (ref), sheetTypeModule (copy), var103 (ref), var48 (ref), var100 (ref), var101 (ref), var102 (ref)
						return {
							bottomPadding = 200,
							hasRadius = true,
							actionsHeight = var71,
							setActionsHeight = var72,
							hasActionsDivider = var73,
							setHasActionsDivider = var74,
							sheetHeightAvailable = var69,
							setSheetHeightAvailable = var70,
							safeAreaPadding = bottom,
							innerScrollingEnabled = var84,
							innerScrollY = var82,
							setInnerScrollY = function(value) --[[ line: 563 ]]
								-- upvalues: var83 (copy), var98 (copy)
								var83(value)
								var98()
							end,
							hasHeader = var75,
							setHasHeader = var76,
							hasFullBleed = var77,
							fullBleedHeight = var78,
							setFullBleedHeight = var79,
							closeSheet = var97,
							sheetType = sheetTypeModule.Bottom,
							innerSurface = var103,
							testId = var48.testId,
							closeAffordanceRef = var100,
							contentStartRef = var101,
							setContentStartRef = var102
						}
					end, {
						var48.testId, var97, bottom, var98, var103, var100, var101, var77
					})
				}, reactModule.createElement(elevationOwnerScope, { owner = var51 }, var48.children))
			})
		}),
		Shadow = reactModule.createElement(imageModule, {
			ZIndex = 2,
			Image = SHADOW_IMAGE,
			Size = UDim2.new(1, SHADOW_SIZE * 2, 0, var64 + 200 + SHADOW_SIZE * 2),
			Position = UDim2.new(-SHADOW_SIZE, 0, 1, (-var64) - SHADOW_SIZE),
			slice = {
				scale = 2,
				center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
			},
			imageStyle = var50.Color.Extended.Black.Black_10
		}),
		Backdrop = reactModule.createElement(viewModule, {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 2),
			Position = UDim2.fromScale(0, -0.5),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			backgroundStyle = var67:map(function(p22) --[[ line: 717 ]]
				-- upvalues: var50 (ref)
				return {
					Color3 = var50.Color.Common.Backdrop.Color3,
					Transparency = math.lerp(var50.Color.Common.Backdrop.Transparency, 1, p22)
				}
			end),
			onActivated = function() --[[ line: 723 ]]
				-- upvalues: var97 (ref)
				var97()
			end,
			testId = `{var48.testId}--backdrop`
		})
	})), var49)
end))