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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableDrawerFocusNav = sharedFlagsModule.FFlagEnableDrawerFocusNav
local fFlagEnableDrawerAnimatingHook = sharedFlagsModule.FFlagEnableDrawerAnimatingHook
local fFlagFixDrawerNavigateBackWhileClosing = require(drawer.Flags).FFlagFixDrawerNavigateBackWhileClosing

if fFlagEnableDrawerFocusNav then
	local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
	focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
	focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
	focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
	inputHandlersModule = require(parent.InputHandlers)
end
return reactModule.memo(function(p0)
	-- upvalues: useSetDrawerVisibleModule (ref), useSetDrawerShouldMountModule (ref), fFlagEnableDrawerAnimatingHook (ref), useSetDrawerAnimatingModule (ref), reactModule (ref), drawerPanelStatus (ref), fFlagEnableDrawerFocusNav (ref), reactIsModule (ref), reactOtterModule (ref), constantsModule (ref), getDrawerVisibleStoreModule (ref), signalsModule (ref), userInputService (ref), focusNavigationEventNameEnum (write), inputHandlersModule (write), fFlagFixDrawerNavigateBackWhileClosing (ref), foundationModule (ref), scrimModule (ref), focusNavigableSurfaceWrapper (write), focusNavigableSurfaceIdentifierEnum (write)
	local var16 = useSetDrawerVisibleModule()
	local var17 = useSetDrawerShouldMountModule()
	local var18 = if fFlagEnableDrawerAnimatingHook then useSetDrawerAnimatingModule() else function(_) end
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useRef(nil)
	local var21, var22 = reactModule.useBinding(drawerPanelStatus.Scrollable)
	local var23 = reactModule.useMemo(function()
		-- upvalues: var21 (ref), drawerPanelStatus (copy)
		return var21:map(function(p1)
			-- upvalues: drawerPanelStatus (copy)
			return p1 == drawerPanelStatus.Scrollable
		end)
	end, {})
	local var24 = reactModule.useMemo(function()
		-- upvalues: var21 (ref), drawerPanelStatus (copy)
		return var21:map(function(p2)
			-- upvalues: drawerPanelStatus (copy)
			return if p2 == drawerPanelStatus.Movable then 3 else 1
		end)
	end, {})
	local var25 = if fFlagEnableDrawerFocusNav then reactModule.useMemo(function()
		-- upvalues: p0 (ref), reactIsModule (copy)
		local backgroundStyle = p0.backgroundStyle
		
		return if backgroundStyle == nil then nil elseif reactIsModule.isBinding(backgroundStyle) then backgroundStyle:map(function(p3)
			return p3.Color3
		end) else backgroundStyle.Color3
	end, { p0.backgroundStyle }) else nil
	local var26 = if fFlagEnableDrawerFocusNav then reactModule.useMemo(function()
		-- upvalues: p0 (ref), reactIsModule (copy)
		local backgroundStyle = p0.backgroundStyle
		
		return if backgroundStyle == nil then nil elseif reactIsModule.isBinding(backgroundStyle) then backgroundStyle:map(function(p4)
			return p4.Transparency
		end) else backgroundStyle.Transparency
	end, { p0.backgroundStyle }) else nil
	local topOffset = p0.topOffset or 0
	local bottomOffset = p0.bottomOffset or 0
	local leftOffset = p0.leftOffset or 0
	local var30 = p0.menuWidth + leftOffset
	local var31, var32 = reactOtterModule.useAnimatedBinding(-var30, reactModule.useCallback(function(p5)
		-- upvalues: fFlagEnableDrawerAnimatingHook (copy), var18 (ref), var21 (ref), drawerPanelStatus (copy), var22 (ref), var30 (ref), var17 (ref)
		if fFlagEnableDrawerAnimatingHook then
			var18(false)
		end
		if var21:getValue() == drawerPanelStatus.Closing then
			var22(drawerPanelStatus.Scrollable)
		end
		if p5 == -var30 then
			var17(false)
		end
	end, if fFlagEnableDrawerAnimatingHook then { var30, var18, var17 } else {}))
	local var33 = reactModule.useRef(var30)
	var33.current = var30
	local var34 = reactModule.useRef(false)
	local var35, var36 = reactOtterModule.useAnimatedBinding(1)
	local var37 = reactModule.useCallback(function(p6)
		-- upvalues: var16 (ref), var22 (ref), drawerPanelStatus (copy), p0 (ref)
		var16(false)
		var22(drawerPanelStatus.Closing)
		
		if p0.onDrawerClosedAnalytics then
			p0.onDrawerClosedAnalytics({ source = p6 })
		end
	end, { p0.onDrawerClosedAnalytics })
	local var38 = reactModule.useCallback(function(p7)
		-- upvalues: var34 (ref), var21 (ref), drawerPanelStatus (copy), var19 (ref), var20 (ref), var22 (ref)
		if not var34.current then return end
		if var21:getValue() == drawerPanelStatus.Closing then
			return
		end
		var19.current = p7.Position
		var20.current = DateTime.now().UnixTimestampMillis
		var22(drawerPanelStatus.Static)
	end, {})
	local var39 = reactModule.useCallback(function(p8)
		-- upvalues: var34 (ref), var19 (ref), var20 (ref), var21 (ref), drawerPanelStatus (copy), var33 (ref), constantsModule (copy), var37 (ref), fFlagEnableDrawerAnimatingHook (copy), var18 (ref), var32 (ref), reactOtterModule (copy), var22 (ref)
		if not var34.current then
			var19.current = nil
			var20.current = nil
			
			return
		elseif var19.current == nil or var20.current == nil or var21:getValue() ~= drawerPanelStatus.Movable then
			var19.current = nil
			var20.current = nil
			
			return
		end
		local var42 = var19.current.X - p8.Position.X
		
		if var33.current * constantsModule.DRAWER_SWIPE_THRESHOLD_PERCENT <= var42 then
			var37("swipe")
		elseif var42 > 0 then
			local var43 = (DateTime.now().UnixTimestampMillis - var20.current) / 1000
			
			if var43 > 0.01 and constantsModule.DRAWER_VELOCITY_THRESHOLD <= var42 / var43 then
				var37("swipe")
			end
		end
		if var21:getValue() ~= drawerPanelStatus.Closing then
			if fFlagEnableDrawerAnimatingHook then
				var18(true)
			end
			var32(reactOtterModule.ease(0, constantsModule.DRAWER_ANIM_SETTINGS))
			var22(drawerPanelStatus.Scrollable)
		end
		var19.current = nil
		var20.current = nil
	end, if fFlagEnableDrawerAnimatingHook then { var37, var18 } else {})
	local var40 = reactModule.useCallback(function(p9)
		-- upvalues: var34 (ref), var19 (ref), var21 (ref), drawerPanelStatus (copy), var22 (ref), var32 (ref), reactOtterModule (copy)
		if not var34.current then return end
		if var19.current == nil or var21:getValue() == drawerPanelStatus.Closing then return end
		local var44 = p9.Position.X - var19.current.X
		
		if var21:getValue() == drawerPanelStatus.Static then
			if math.abs(p9.Position.Y - var19.current.Y) < math.abs(var44) then
				var22(drawerPanelStatus.Movable)
			else
				var22(drawerPanelStatus.Scrollable)
			end
		end
		if var21:getValue() == drawerPanelStatus.Movable and var44 < 0 then
			var32(reactOtterModule.instant(var44))
		end
		if var19.current.X < p9.Position.X then
			var19.current = p9.Position
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: getDrawerVisibleStoreModule (copy), signalsModule (copy), var34 (ref), var33 (ref), fFlagEnableDrawerAnimatingHook (copy), var18 (ref), var32 (ref), reactOtterModule (copy), constantsModule (copy), var36 (ref)
		local getDrawerVisible = getDrawerVisibleStoreModule(false).getDrawerVisible
		
		return signalsModule.createEffect(function(p10)
			-- upvalues: getDrawerVisible (ref), var34 (copy), var33 (copy), fFlagEnableDrawerAnimatingHook (copy), var18 (copy), var32 (copy), reactOtterModule (copy), constantsModule (copy), var36 (copy)
			local var45 = getDrawerVisible(p10)
			var34.current = var45
			local var46 = if var45 then 0 else -var33.current
			
			if fFlagEnableDrawerAnimatingHook then
				var18(true)
			end
			var32(reactOtterModule.ease(var46, constantsModule.DRAWER_ANIM_SETTINGS))
			var36(reactOtterModule.ease(if var45 then constantsModule.SCRIM_TRANSPARENCY else 1, constantsModule.DRAWER_ANIM_SETTINGS))
		end)
	end, if fFlagEnableDrawerAnimatingHook then { var18 } else {})
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var38 (ref), var39 (ref), var40 (ref)
		local touchStartedConnection = userInputService.TouchStarted:Connect(var38)
		local touchEndedConnection = userInputService.TouchEnded:Connect(var39)
		local touchMovedConnection = userInputService.TouchMoved:Connect(var40)
		
		return function()
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
			Active = var23,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = var23
		}, p0.children),
		SinkInput = reactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			AutoButtonColor = false,
			Size = UDim2.fromScale(1, 1),
			ZIndex = var24
		})
	}
	
	return reactModule.createElement(foundationModule.View, {
		Size = UDim2.fromScale(1, 1),
		backgroundStyle = { Transparency = 1 },
		Visible = var35:map(function(p11)
			return p11 < 1
		end)
	}, {
		Scrim = reactModule.createElement(scrimModule, {
			zIndex = 1,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var21 (ref), drawerPanelStatus (copy), var37 (ref)
				if var21:getValue() == drawerPanelStatus.Closing then return end
				if var21:getValue() ~= drawerPanelStatus.Movable then
					var37("shield")
				end
			end, { var21, var37 }),
			transparencyBinding = var35,
			isModal = p0.scrimIsModal
		}),
		DrawerAnimatedFrame = if fFlagEnableDrawerFocusNav then reactModule.createElement(focusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.Drawer,
			frameProps = {
				ZIndex = 2,
				BorderSizePixel = 0,
				Selectable = false,
				Position = var31:map(function(p13)
					return UDim2.fromOffset(p13, 0)
				end),
				Size = UDim2.new(0, var30, 1, 0),
				BackgroundColor3 = var25,
				BackgroundTransparency = var26
			},
			customEventHandlers = reactModule.useMemo(function()
				-- upvalues: fFlagEnableDrawerFocusNav (copy), focusNavigationEventNameEnum (copy), inputHandlersModule (copy), fFlagFixDrawerNavigateBackWhileClosing (copy), var21 (ref), drawerPanelStatus (copy), var37 (ref)
				return if fFlagEnableDrawerFocusNav then {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p14)
							-- upvalues: fFlagFixDrawerNavigateBackWhileClosing (copy), var21 (copy), drawerPanelStatus (copy), var37 (copy)
							if not fFlagFixDrawerNavigateBackWhileClosing then
								var37("focus-navigation-back")
							elseif var21:getValue() ~= drawerPanelStatus.Closing then
								var37("focus-navigation-back")
							end
							p14:cancel()
						end)
					}
				} else {}
			end, { var37 })
		}, t) else reactModule.createElement(foundationModule.View, {
			ZIndex = 2,
			BorderSizePixel = 0,
			Selectable = false,
			Position = var31:map(function(p12)
				return UDim2.fromOffset(p12, 0)
			end),
			Size = UDim2.new(0, var30, 1, 0),
			backgroundStyle = p0.backgroundStyle
		}, t)
	})
end)