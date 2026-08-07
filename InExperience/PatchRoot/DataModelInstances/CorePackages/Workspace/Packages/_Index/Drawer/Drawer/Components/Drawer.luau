local drawer = script:FindFirstAncestor("Drawer")
local userInputService = game:GetService("UserInputService")
local parent = drawer.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local foundationModule = require(parent.Foundation)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local getDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)
local useSetDrawerVisibleModule = require(script.Parent.Parent.Hooks.useSetDrawerVisible)
local useSetDrawerShouldMountModule = require(script.Parent.Parent.Hooks.useSetDrawerShouldMount)
local useSetDrawerAnimatingModule = require(script.Parent.Parent.Hooks.useSetDrawerAnimating)
local scrimModule = require(script.Parent.Scrim)
local constantsModule = require(script.Parent.Parent.Constants)
local _ = require(script.Parent.Parent.Types)
local drawerPanelStatus = require(script.Parent.Parent.Enum).DrawerPanelStatus
local _ = nil
local focusNavigableSurfaceWrapper = nil
local focusNavigableSurfaceIdentifierEnum = nil
local focusNavigationEventNameEnum = nil
local inputHandlersModule = nil
local fFlagEnableDrawerFocusNav = require(parent.SharedFlags).FFlagEnableDrawerFocusNav
local fFlagEnableDrawerAnimatingHook = require(drawer.Flags).FFlagEnableDrawerAnimatingHook

if fFlagEnableDrawerFocusNav then
	local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
	focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
	focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
	focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
	inputHandlersModule = require(parent.InputHandlers)
end
return reactModule.memo(function(p0) --[[ line: 39 ]]
	-- upvalues: useSetDrawerVisibleModule (ref), useSetDrawerShouldMountModule (ref), fFlagEnableDrawerAnimatingHook (ref), useSetDrawerAnimatingModule (ref), reactModule (ref), drawerPanelStatus (ref), fFlagEnableDrawerFocusNav (ref), reactIsModule (ref), reactOtterModule (ref), constantsModule (ref), getDrawerVisibleStoreModule (ref), signalsModule (ref), userInputService (ref), focusNavigationEventNameEnum (write), inputHandlersModule (write), foundationModule (ref), scrimModule (ref), focusNavigableSurfaceWrapper (write), focusNavigableSurfaceIdentifierEnum (write)
	local var15 = useSetDrawerVisibleModule()
	local var16 = useSetDrawerShouldMountModule()
	local var17 = if fFlagEnableDrawerAnimatingHook then useSetDrawerAnimatingModule() else function(_) --[[ line: 44 ]] end
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(nil)
	local var20, var21 = reactModule.useBinding(drawerPanelStatus.Scrollable)
	local var22 = reactModule.useMemo(function() --[[ line: 48 ]]
		-- upvalues: var20 (ref), drawerPanelStatus (copy)
		return var20:map(function(p1) --[[ line: 49 ]]
			-- upvalues: drawerPanelStatus (copy)
			return p1 == drawerPanelStatus.Scrollable
		end)
	end, {})
	local var23 = reactModule.useMemo(function() --[[ line: 54 ]]
		-- upvalues: var20 (ref), drawerPanelStatus (copy)
		return var20:map(function(p2) --[[ line: 55 ]]
			-- upvalues: drawerPanelStatus (copy)
			return if p2 == drawerPanelStatus.Movable then 3 else 1
		end)
	end, {})
	local var24 = if fFlagEnableDrawerFocusNav then reactModule.useMemo(function() --[[ line: 67 ]]
		-- upvalues: p0 (ref), reactIsModule (copy)
		local backgroundStyle = p0.backgroundStyle
		
		return if backgroundStyle == nil then nil elseif reactIsModule.isBinding(backgroundStyle) then backgroundStyle:map(function(p3) --[[ line: 73 ]]
			return p3.Color3
		end) else backgroundStyle.Color3
	end, { p0.backgroundStyle }) else nil
	local var25 = if fFlagEnableDrawerFocusNav then reactModule.useMemo(function() --[[ line: 82 ]]
		-- upvalues: p0 (ref), reactIsModule (copy)
		local backgroundStyle = p0.backgroundStyle
		
		return if backgroundStyle == nil then nil elseif reactIsModule.isBinding(backgroundStyle) then backgroundStyle:map(function(p4) --[[ line: 88 ]]
			return p4.Transparency
		end) else backgroundStyle.Transparency
	end, { p0.backgroundStyle }) else nil
	local topOffset = p0.topOffset or 0
	local bottomOffset = p0.bottomOffset or 0
	local leftOffset = p0.leftOffset or 0
	local var29 = p0.menuWidth + leftOffset
	local var30, var31 = reactOtterModule.useAnimatedBinding(-var29, reactModule.useCallback(function(p5) --[[ line: 101 ]]
		-- upvalues: fFlagEnableDrawerAnimatingHook (copy), var17 (ref), var20 (ref), drawerPanelStatus (copy), var21 (ref), var29 (ref), var16 (ref)
		if fFlagEnableDrawerAnimatingHook then
			var17(false)
		end
		if var20:getValue() == drawerPanelStatus.Closing then
			var21(drawerPanelStatus.Scrollable)
		end
		if p5 == -var29 then
			var16(false)
		end
	end, if fFlagEnableDrawerAnimatingHook then { var29, var17, var16 } else {}))
	local var32 = reactModule.useRef(var29)
	var32.current = var29
	local var33 = reactModule.useRef(false)
	local var34, var35 = reactOtterModule.useAnimatedBinding(1)
	local var36 = reactModule.useCallback(function(p6) --[[ line: 124 ]]
		-- upvalues: var15 (ref), var21 (ref), drawerPanelStatus (copy), p0 (ref)
		var15(false)
		var21(drawerPanelStatus.Closing)
		
		if p0.onDrawerClosedAnalytics then
			p0.onDrawerClosedAnalytics({ source = p6 })
		end
	end, { p0.onDrawerClosedAnalytics })
	local var37 = reactModule.useCallback(function(p7) --[[ line: 132 ]]
		-- upvalues: var33 (ref), var20 (ref), drawerPanelStatus (copy), var18 (ref), var19 (ref), var21 (ref)
		if not var33.current then return end
		if var20:getValue() == drawerPanelStatus.Closing then
			return
		end
		var18.current = p7.Position
		var19.current = DateTime.now().UnixTimestampMillis
		var21(drawerPanelStatus.Static)
	end, {})
	local var38 = reactModule.useCallback(function(p8) --[[ line: 144 ]]
		-- upvalues: var33 (ref), var18 (ref), var19 (ref), var20 (ref), drawerPanelStatus (copy), var32 (ref), constantsModule (copy), var36 (ref), fFlagEnableDrawerAnimatingHook (copy), var17 (ref), var31 (ref), reactOtterModule (copy), var21 (ref)
		if not var33.current then
			var18.current = nil
			var19.current = nil
			
			return
		elseif var18.current == nil or var19.current == nil or var20:getValue() ~= drawerPanelStatus.Movable then
			var18.current = nil
			var19.current = nil
			
			return
		end
		local var41 = var18.current.X - p8.Position.X
		
		if var32.current * constantsModule.DRAWER_SWIPE_THRESHOLD_PERCENT <= var41 then
			var36("swipe")
		elseif var41 > 0 then
			local var42 = (DateTime.now().UnixTimestampMillis - var19.current) / 1000
			
			if var42 > 0.01 and constantsModule.DRAWER_VELOCITY_THRESHOLD <= var41 / var42 then
				var36("swipe")
			end
		end
		if var20:getValue() ~= drawerPanelStatus.Closing then
			if fFlagEnableDrawerAnimatingHook then
				var17(true)
			end
			var31(reactOtterModule.ease(0, constantsModule.DRAWER_ANIM_SETTINGS))
			var21(drawerPanelStatus.Scrollable)
		end
		var18.current = nil
		var19.current = nil
	end, if fFlagEnableDrawerAnimatingHook then { var36, var17 } else {})
	local var39 = reactModule.useCallback(function(p9) --[[ line: 185 ]]
		-- upvalues: var33 (ref), var18 (ref), var20 (ref), drawerPanelStatus (copy), var21 (ref), var31 (ref), reactOtterModule (copy)
		if not var33.current then return end
		if var18.current == nil or var20:getValue() == drawerPanelStatus.Closing then return end
		local var43 = p9.Position.X - var18.current.X
		
		if var20:getValue() == drawerPanelStatus.Static then
			if math.abs(p9.Position.Y - var18.current.Y) < math.abs(var43) then
				var21(drawerPanelStatus.Movable)
			else
				var21(drawerPanelStatus.Scrollable)
			end
		end
		if var20:getValue() == drawerPanelStatus.Movable and var43 < 0 then
			var31(reactOtterModule.instant(var43))
		end
		if var18.current.X < p9.Position.X then
			var18.current = p9.Position
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 212 ]]
		-- upvalues: getDrawerVisibleStoreModule (copy), signalsModule (copy), var33 (ref), var32 (ref), fFlagEnableDrawerAnimatingHook (copy), var17 (ref), var31 (ref), reactOtterModule (copy), constantsModule (copy), var35 (ref)
		local getDrawerVisible = getDrawerVisibleStoreModule(false).getDrawerVisible
		
		return signalsModule.createEffect(function(p10) --[[ line: 214 ]]
			-- upvalues: getDrawerVisible (ref), var33 (copy), var32 (copy), fFlagEnableDrawerAnimatingHook (copy), var17 (copy), var31 (copy), reactOtterModule (copy), constantsModule (copy), var35 (copy)
			local var44 = getDrawerVisible(p10)
			var33.current = var44
			local var45 = if var44 then 0 else -var32.current
			
			if fFlagEnableDrawerAnimatingHook then
				var17(true)
			end
			var31(reactOtterModule.ease(var45, constantsModule.DRAWER_ANIM_SETTINGS))
			var35(reactOtterModule.ease(if var44 then constantsModule.SCRIM_TRANSPARENCY else 1, constantsModule.DRAWER_ANIM_SETTINGS))
		end)
	end, if fFlagEnableDrawerAnimatingHook then { var17 } else {})
	reactModule.useEffect(function() --[[ line: 229 ]]
		-- upvalues: userInputService (copy), var37 (ref), var38 (ref), var39 (ref)
		local touchStartedConnection = userInputService.TouchStarted:Connect(var37)
		local touchEndedConnection = userInputService.TouchEnded:Connect(var38)
		local touchMovedConnection = userInputService.TouchMoved:Connect(var39)
		
		return function() --[[ line: 233 ]]
			-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref), touchMovedConnection (ref)
			touchStartedConnection:Disconnect()
			touchEndedConnection:Disconnect()
			touchMovedConnection:Disconnect()
		end
	end, {})
	local t = {
		DrawerContent = reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			Selectable = false,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			ClipsDescendants = true,
			ZIndex = 2,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(0, p0.menuWidth, 1, (-topOffset) - bottomOffset),
			Position = UDim2.new(0, leftOffset, 0, topOffset),
			CanvasSize = UDim2.new(0, p0.menuWidth, 0, 0),
			Active = var22,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = var22
		}, p0.children),
		SinkInput = reactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			AutoButtonColor = false,
			Size = UDim2.fromScale(1, 1),
			ZIndex = var23
		})
	}
	
	return reactModule.createElement(foundationModule.View, {
		Size = UDim2.fromScale(1, 1),
		backgroundStyle = { Transparency = 1 },
		Visible = var34:map(function(p11) --[[ line: 251 ]]
			return p11 < 1
		end)
	}, {
		Scrim = reactModule.createElement(scrimModule, {
			zIndex = 1,
			onActivated = reactModule.useCallback(function() --[[ line: 240 ]]
				-- upvalues: var20 (ref), drawerPanelStatus (copy), var36 (ref)
				if var20:getValue() == drawerPanelStatus.Closing then return end
				if var20:getValue() ~= drawerPanelStatus.Movable then
					var36("shield")
				end
			end, { var20, var36 }),
			transparencyBinding = var34,
			isModal = p0.scrimIsModal
		}),
		DrawerAnimatedFrame = if fFlagEnableDrawerFocusNav then reactModule.createElement(focusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.Drawer,
			frameProps = {
				ZIndex = 2,
				BorderSizePixel = 0,
				Selectable = false,
				Position = var30:map(function(p13) --[[ line: 312 ]]
					return UDim2.fromOffset(p13, 0)
				end),
				Size = UDim2.new(0, var29, 1, 0),
				BackgroundColor3 = var24,
				BackgroundTransparency = var25
			},
			customEventHandlers = reactModule.useMemo(function() --[[ line: 281 ]]
				-- upvalues: fFlagEnableDrawerFocusNav (copy), focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var36 (ref)
				return if fFlagEnableDrawerFocusNav then {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p14) --[[ line: 287 ]]
							-- upvalues: var36 (copy)
							var36("focus-navigation-back")
							p14:cancel()
						end)
					}
				} else {}
			end, { var36 })
		}, t) else reactModule.createElement(foundationModule.View, {
			ZIndex = 2,
			BorderSizePixel = 0,
			Selectable = false,
			Position = var30:map(function(p12) --[[ line: 326 ]]
				return UDim2.fromOffset(p12, 0)
			end),
			Size = UDim2.new(0, var29, 1, 0),
			backgroundStyle = p0.backgroundStyle
		}, t)
	})
end)