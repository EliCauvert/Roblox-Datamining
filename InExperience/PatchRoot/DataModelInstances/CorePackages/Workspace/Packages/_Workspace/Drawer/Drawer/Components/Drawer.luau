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
return reactModule.memo(function(p1)
	-- upvalues: useSetDrawerVisibleModule (ref), useSetDrawerShouldMountModule (ref), fFlagEnableDrawerAnimatingHook (ref), useSetDrawerAnimatingModule (ref), reactModule (ref), drawerPanelStatus (ref), fFlagEnableDrawerFocusNav (ref), reactIsModule (ref), reactOtterModule (ref), constantsModule (ref), getDrawerVisibleStoreModule (ref), signalsModule (ref), userInputService (ref), focusNavigationEventNameEnum (write), inputHandlersModule (write), fFlagFixDrawerNavigateBackWhileClosing (ref), foundationModule (ref), scrimModule (ref), focusNavigableSurfaceWrapper (write), focusNavigableSurfaceIdentifierEnum (write)
	local var1 = useSetDrawerVisibleModule()
	local var2 = useSetDrawerShouldMountModule()
	local var3 = if fFlagEnableDrawerAnimatingHook then useSetDrawerAnimatingModule() else function(_) end
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6, var7 = reactModule.useBinding(drawerPanelStatus.Scrollable)
	local var8 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), drawerPanelStatus (copy)
		return var6:map(function(p2)
			-- upvalues: drawerPanelStatus (copy)
			return p2 == drawerPanelStatus.Scrollable
		end)
	end, {})
	local var9 = reactModule.useMemo(function()
		-- upvalues: var6 (ref), drawerPanelStatus (copy)
		return var6:map(function(p2)
			-- upvalues: drawerPanelStatus (copy)
			return if p2 == drawerPanelStatus.Movable then 3 else 1
		end)
	end, {})
	local var10 = if fFlagEnableDrawerFocusNav then reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactIsModule (copy)
		local backgroundStyle = p1.backgroundStyle
		
		return if backgroundStyle == nil then nil elseif reactIsModule.isBinding(backgroundStyle) then backgroundStyle:map(function(p2)
			return p2.Color3
		end) else backgroundStyle.Color3
	end, { p1.backgroundStyle }) else nil
	local var11 = if fFlagEnableDrawerFocusNav then reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactIsModule (copy)
		local backgroundStyle = p1.backgroundStyle
		
		return if backgroundStyle == nil then nil elseif reactIsModule.isBinding(backgroundStyle) then backgroundStyle:map(function(p2)
			return p2.Transparency
		end) else backgroundStyle.Transparency
	end, { p1.backgroundStyle }) else nil
	local topOffset = p1.topOffset or 0
	local bottomOffset = p1.bottomOffset or 0
	local leftOffset = p1.leftOffset or 0
	local var12 = p1.menuWidth + leftOffset
	local var13, var14 = reactOtterModule.useAnimatedBinding(-var12, reactModule.useCallback(function(p2)
		-- upvalues: fFlagEnableDrawerAnimatingHook (copy), var3 (ref), var6 (ref), drawerPanelStatus (copy), var7 (ref), var12 (ref), var2 (ref)
		if fFlagEnableDrawerAnimatingHook then
			var3(false)
		end
		if var6:getValue() == drawerPanelStatus.Closing then
			var7(drawerPanelStatus.Scrollable)
		end
		if p2 == -var12 then
			var2(false)
		end
	end, if fFlagEnableDrawerAnimatingHook then { var12, var3, var2 } else {}))
	local var15 = reactModule.useRef(var12)
	var15.current = var12
	local var16 = reactModule.useRef(false)
	local var17, var18 = reactOtterModule.useAnimatedBinding(1)
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var7 (ref), drawerPanelStatus (copy), p1 (ref)
		var1(false)
		var7(drawerPanelStatus.Closing)
		
		if p1.onDrawerClosedAnalytics then
			p1.onDrawerClosedAnalytics({ source = p2 })
		end
	end, { p1.onDrawerClosedAnalytics })
	local var20 = reactModule.useCallback(function(p2)
		-- upvalues: var16 (ref), var6 (ref), drawerPanelStatus (copy), var4 (ref), var5 (ref), var7 (ref)
		if not var16.current then return end
		if var6:getValue() == drawerPanelStatus.Closing then
			return
		end
		var4.current = p2.Position
		var5.current = DateTime.now().UnixTimestampMillis
		var7(drawerPanelStatus.Static)
	end, {})
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: var16 (ref), var4 (ref), var5 (ref), var6 (ref), drawerPanelStatus (copy), var15 (ref), constantsModule (copy), var19 (ref), fFlagEnableDrawerAnimatingHook (copy), var3 (ref), var14 (ref), reactOtterModule (copy), var7 (ref)
		if not var16.current then
			var4.current = nil
			var5.current = nil
			
			return
		elseif var4.current == nil or var5.current == nil or var6:getValue() ~= drawerPanelStatus.Movable then
			var4.current = nil
			var5.current = nil
			
			return
		end
		local var22 = var4.current.X - p2.Position.X
		
		if var15.current * constantsModule.DRAWER_SWIPE_THRESHOLD_PERCENT <= var22 then
			var19("swipe")
		elseif var22 > 0 then
			local var23 = (DateTime.now().UnixTimestampMillis - var5.current) / 1000
			
			if var23 > 0.01 and constantsModule.DRAWER_VELOCITY_THRESHOLD <= var22 / var23 then
				var19("swipe")
			end
		end
		if var6:getValue() ~= drawerPanelStatus.Closing then
			if fFlagEnableDrawerAnimatingHook then
				var3(true)
			end
			var14(reactOtterModule.ease(0, constantsModule.DRAWER_ANIM_SETTINGS))
			var7(drawerPanelStatus.Scrollable)
		end
		var4.current = nil
		var5.current = nil
	end, if fFlagEnableDrawerAnimatingHook then { var19, var3 } else {})
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: var16 (ref), var4 (ref), var6 (ref), drawerPanelStatus (copy), var7 (ref), var14 (ref), reactOtterModule (copy)
		if not var16.current then return end
		if var4.current == nil or var6:getValue() == drawerPanelStatus.Closing then return end
		local var23 = p2.Position.X - var4.current.X
		
		if var6:getValue() == drawerPanelStatus.Static then
			if math.abs(p2.Position.Y - var4.current.Y) < math.abs(var23) then
				var7(drawerPanelStatus.Movable)
			else
				var7(drawerPanelStatus.Scrollable)
			end
		end
		if var6:getValue() == drawerPanelStatus.Movable and var23 < 0 then
			var14(reactOtterModule.instant(var23))
		end
		if var4.current.X < p2.Position.X then
			var4.current = p2.Position
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: getDrawerVisibleStoreModule (copy), signalsModule (copy), var16 (ref), var15 (ref), fFlagEnableDrawerAnimatingHook (copy), var3 (ref), var14 (ref), reactOtterModule (copy), constantsModule (copy), var18 (ref)
		local getDrawerVisible = getDrawerVisibleStoreModule(false).getDrawerVisible
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: getDrawerVisible (ref), var16 (copy), var15 (copy), fFlagEnableDrawerAnimatingHook (copy), var3 (copy), var14 (copy), reactOtterModule (copy), constantsModule (copy), var18 (copy)
			local var23 = getDrawerVisible(p2)
			var16.current = var23
			local var24 = if var23 then 0 else -var15.current
			
			if fFlagEnableDrawerAnimatingHook then
				var3(true)
			end
			var14(reactOtterModule.ease(var24, constantsModule.DRAWER_ANIM_SETTINGS))
			var18(reactOtterModule.ease(if var23 then constantsModule.SCRIM_TRANSPARENCY else 1, constantsModule.DRAWER_ANIM_SETTINGS))
		end)
	end, if fFlagEnableDrawerAnimatingHook then { var3 } else {})
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var20 (ref), var21 (ref), var22 (ref)
		local touchStartedConnection = userInputService.TouchStarted:Connect(var20)
		local touchEndedConnection = userInputService.TouchEnded:Connect(var21)
		local touchMovedConnection = userInputService.TouchMoved:Connect(var22)
		
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
			Size = UDim2.new(0, p1.menuWidth, 1, (-topOffset) - bottomOffset),
			Position = UDim2.new(0, leftOffset, 0, topOffset),
			CanvasSize = UDim2.new(0, p1.menuWidth, 0, 0),
			Active = var8,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = var8
		}, p1.children),
		SinkInput = reactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			AutoButtonColor = false,
			Size = UDim2.fromScale(1, 1),
			ZIndex = var9
		})
	}
	
	return reactModule.createElement(foundationModule.View, {
		Size = UDim2.fromScale(1, 1),
		backgroundStyle = { Transparency = 1 },
		Visible = var17:map(function(p2)
			return p2 < 1
		end)
	}, {
		Scrim = reactModule.createElement(scrimModule, {
			zIndex = 1,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var6 (ref), drawerPanelStatus (copy), var19 (ref)
				if var6:getValue() == drawerPanelStatus.Closing then return end
				if var6:getValue() ~= drawerPanelStatus.Movable then
					var19("shield")
				end
			end, { var6, var19 }),
			transparencyBinding = var17,
			isModal = p1.scrimIsModal
		}),
		DrawerAnimatedFrame = if fFlagEnableDrawerFocusNav then reactModule.createElement(focusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.Drawer,
			frameProps = {
				ZIndex = 2,
				BorderSizePixel = 0,
				Selectable = false,
				Position = var13:map(function(p2)
					return UDim2.fromOffset(p2, 0)
				end),
				Size = UDim2.new(0, var12, 1, 0),
				BackgroundColor3 = var10,
				BackgroundTransparency = var11
			},
			customEventHandlers = reactModule.useMemo(function()
				-- upvalues: fFlagEnableDrawerFocusNav (copy), focusNavigationEventNameEnum (copy), inputHandlersModule (copy), fFlagFixDrawerNavigateBackWhileClosing (copy), var6 (ref), drawerPanelStatus (copy), var19 (ref)
				return if fFlagEnableDrawerFocusNav then {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p2)
							-- upvalues: fFlagFixDrawerNavigateBackWhileClosing (copy), var6 (copy), drawerPanelStatus (copy), var19 (copy)
							if not fFlagFixDrawerNavigateBackWhileClosing then
								var19("focus-navigation-back")
							elseif var6:getValue() ~= drawerPanelStatus.Closing then
								var19("focus-navigation-back")
							end
							p2:cancel()
						end)
					}
				} else {}
			end, { var19 })
		}, t) else reactModule.createElement(foundationModule.View, {
			ZIndex = 2,
			BorderSizePixel = 0,
			Selectable = false,
			Position = var13:map(function(p2)
				return UDim2.fromOffset(p2, 0)
			end),
			Size = UDim2.new(0, var12, 1, 0),
			backgroundStyle = p1.backgroundStyle
		}, t)
	})
end)