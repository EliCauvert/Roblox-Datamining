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
local fFlagSideSheetOpenPeoplePage = sharedFlagsModule.FFlagSideSheetOpenPeoplePage
local fFlagFixDrawerNavigateBackWhileClosing = require(drawer.Flags).FFlagFixDrawerNavigateBackWhileClosing

if fFlagEnableDrawerFocusNav then
	local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
	focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
	focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
	focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
	inputHandlersModule = require(parent.InputHandlers)
end
return reactModule.memo(function(p1)
	-- upvalues: useSetDrawerVisibleModule (ref), useSetDrawerShouldMountModule (ref), fFlagEnableDrawerAnimatingHook (ref), useSetDrawerAnimatingModule (ref), reactModule (ref), drawerPanelStatus (ref), fFlagEnableDrawerFocusNav (ref), reactIsModule (ref), fFlagSideSheetOpenPeoplePage (ref), reactOtterModule (ref), constantsModule (ref), getDrawerVisibleStoreModule (ref), signalsModule (ref), userInputService (ref), focusNavigationEventNameEnum (write), inputHandlersModule (write), fFlagFixDrawerNavigateBackWhileClosing (ref), foundationModule (ref), scrimModule (ref), focusNavigableSurfaceWrapper (write), focusNavigableSurfaceIdentifierEnum (write)
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
	local var12 = fFlagSideSheetOpenPeoplePage and p1.allowOutsideInteraction == true
	local var13 = p1.menuWidth + leftOffset
	local var14 = reactModule.useRef(false)
	local useCallback = reactModule.useCallback
	
	local var15 = function(p2)
		-- upvalues: fFlagEnableDrawerAnimatingHook (copy), var3 (ref), var6 (ref), drawerPanelStatus (copy), var7 (ref), var13 (ref), var2 (ref)
		if fFlagEnableDrawerAnimatingHook then
			var3(false)
		end
		if var6:getValue() == drawerPanelStatus.Closing then
			var7(drawerPanelStatus.Scrollable)
		end
		if p2 == -var13 then
			var2(false)
		end
	end
	
	local var16 = if fFlagSideSheetOpenPeoplePage or fFlagEnableDrawerAnimatingHook then { var13, var3, var2 } else {}
	var15, var34 = reactOtterModule.useAnimatedBinding(-var13, useCallback(var15, var16))
	local var17 = reactModule.useRef(var13)
	var17.current = var13
	local var18 = reactModule.useRef(nil)
	local var19, var20 = reactOtterModule.useAnimatedBinding(1)
	local var21 = if fFlagSideSheetOpenPeoplePage then reactModule.useCallback(function(p2)
		-- upvalues: var18 (ref)
		local current = var18.current
		
		if current == nil then
			return false
		end
		local position = p2.Position
		local absolutePosition = current.AbsolutePosition
		local absoluteSize = current.AbsoluteSize
		
		return absolutePosition.X <= position.X and (position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= position.Y and position.Y <= absolutePosition.Y + absoluteSize.Y))
	end, {}) else nil
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var7 (ref), drawerPanelStatus (copy), p1 (ref)
		var1(false)
		var7(drawerPanelStatus.Closing)
		
		if p1.onDrawerClosedAnalytics then
			p1.onDrawerClosedAnalytics({ source = p2 })
		end
	end, if fFlagSideSheetOpenPeoplePage then { p1.onDrawerClosedAnalytics, var1 } else { p1.onDrawerClosedAnalytics })
	local var23 = reactModule.useCallback(function(p2)
		-- upvalues: var14 (ref), var6 (ref), drawerPanelStatus (copy), var12 (ref), var21 (ref), var4 (ref), var5 (ref), var7 (ref)
		if not var14.current then return end
		if var6:getValue() == drawerPanelStatus.Closing then return end
		if var12 and not var21(p2) then
			return
		end
		var4.current = p2.Position
		var5.current = DateTime.now().UnixTimestampMillis
		var7(drawerPanelStatus.Static)
	end, if fFlagSideSheetOpenPeoplePage then { var12, var21 } else {})
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: var14 (ref), var4 (ref), var5 (ref), var6 (ref), drawerPanelStatus (copy), var17 (ref), constantsModule (copy), var22 (ref), fFlagEnableDrawerAnimatingHook (copy), var3 (ref), var16 (ref), reactOtterModule (copy), var7 (ref)
		if not var14.current then
			var4.current = nil
			var5.current = nil
			
			return
		elseif var4.current == nil or var5.current == nil or var6:getValue() ~= drawerPanelStatus.Movable then
			var4.current = nil
			var5.current = nil
			
			return
		end
		local var25 = var4.current.X - p2.Position.X
		
		if var17.current * constantsModule.DRAWER_SWIPE_THRESHOLD_PERCENT <= var25 then
			var22("swipe")
		elseif var25 > 0 then
			local var26 = (DateTime.now().UnixTimestampMillis - var5.current) / 1000
			
			if var26 > 0.01 and constantsModule.DRAWER_VELOCITY_THRESHOLD <= var25 / var26 then
				var22("swipe")
			end
		end
		if var6:getValue() ~= drawerPanelStatus.Closing then
			if fFlagEnableDrawerAnimatingHook then
				var3(true)
			end
			var16(reactOtterModule.ease(0, constantsModule.DRAWER_ANIM_SETTINGS))
			var7(drawerPanelStatus.Scrollable)
		end
		var4.current = nil
		var5.current = nil
	end, if fFlagEnableDrawerAnimatingHook then { var22, var3 } else {})
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var14 (ref), var4 (ref), var6 (ref), drawerPanelStatus (copy), var7 (ref), var16 (ref), reactOtterModule (copy)
		if not var14.current then return end
		if var4.current == nil or var6:getValue() == drawerPanelStatus.Closing then return end
		local var26 = p2.Position.X - var4.current.X
		
		if var6:getValue() == drawerPanelStatus.Static then
			if math.abs(p2.Position.Y - var4.current.Y) < math.abs(var26) then
				var7(drawerPanelStatus.Movable)
			else
				var7(drawerPanelStatus.Scrollable)
			end
		end
		if var6:getValue() == drawerPanelStatus.Movable and var26 < 0 then
			var16(reactOtterModule.instant(var26))
		end
		if var4.current.X < p2.Position.X then
			var4.current = p2.Position
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: getDrawerVisibleStoreModule (copy), signalsModule (copy), var14 (ref), var17 (ref), fFlagEnableDrawerAnimatingHook (copy), var3 (ref), var16 (ref), reactOtterModule (copy), constantsModule (copy), fFlagSideSheetOpenPeoplePage (copy), var20 (ref)
		local getDrawerVisible = getDrawerVisibleStoreModule(false).getDrawerVisible
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: getDrawerVisible (ref), var14 (copy), var17 (copy), fFlagEnableDrawerAnimatingHook (copy), var3 (copy), var16 (copy), reactOtterModule (copy), constantsModule (copy), fFlagSideSheetOpenPeoplePage (copy), var20 (copy)
			local var26 = getDrawerVisible(p2)
			var14.current = var26
			local var27 = if var26 then 0 else -var17.current
			
			if fFlagEnableDrawerAnimatingHook then
				var3(true)
			end
			var16(reactOtterModule.ease(var27, constantsModule.DRAWER_ANIM_SETTINGS))
			
			if not fFlagSideSheetOpenPeoplePage then
				var20(reactOtterModule.ease(if var26 then constantsModule.SCRIM_TRANSPARENCY else 1, constantsModule.DRAWER_ANIM_SETTINGS))
			end
		end)
	end, if fFlagEnableDrawerAnimatingHook then { var3 } else {})
	
	if fFlagSideSheetOpenPeoplePage then
		reactModule.useEffect(function()
			-- upvalues: getDrawerVisibleStoreModule (copy), signalsModule (copy), var12 (ref), constantsModule (copy), var20 (ref), reactOtterModule (copy)
			local getDrawerVisible = getDrawerVisibleStoreModule(false).getDrawerVisible
			
			return signalsModule.createEffect(function(p2)
				-- upvalues: getDrawerVisible (ref), var12 (copy), constantsModule (copy), var20 (copy), reactOtterModule (copy)
				var20(reactOtterModule.ease(if getDrawerVisible(p2) and not var12 then constantsModule.SCRIM_TRANSPARENCY else 1, constantsModule.DRAWER_ANIM_SETTINGS))
			end)
		end, { var12 })
	end
	reactModule.useEffect(function()
		-- upvalues: fFlagSideSheetOpenPeoplePage (copy), var14 (ref), var15 (ref), var13 (ref), var16 (ref), reactOtterModule (copy)
		if fFlagSideSheetOpenPeoplePage and not var14.current and var15:getValue() ~= -var13 then
			var16(reactOtterModule.instant(-var13))
		end
	end, { var13 })
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var23 (ref), var24 (ref), var25 (ref)
		local touchStartedConnection = userInputService.TouchStarted:Connect(var23)
		local touchEndedConnection = userInputService.TouchEnded:Connect(var24)
		local touchMovedConnection = userInputService.TouchMoved:Connect(var25)
		
		return function()
			-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref), touchMovedConnection (ref)
			touchStartedConnection:Disconnect()
			touchEndedConnection:Disconnect()
			touchMovedConnection:Disconnect()
		end
	end, if fFlagSideSheetOpenPeoplePage then { var24, var25, var23 } else {})
	local t = {
		DrawerContent = reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			Selectable = false,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			ClipsDescendants = true,
			ZIndex = 2,
			ref = var18,
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
		testId = if fFlagSideSheetOpenPeoplePage then "drawer-root" else nil,
		Size = if var12 then UDim2.new(0, var13, 1, 0) else UDim2.fromScale(1, 1),
		ClipsDescendants = var12,
		backgroundStyle = { Transparency = 1 },
		Visible = if fFlagSideSheetOpenPeoplePage then reactModule.useMemo(function()
			-- upvalues: reactModule (copy), var15 (ref), var19 (ref), var13 (ref)
			return reactModule.joinBindings({ menuPosX = var15, scrimTransparency = var19 }):map(function(p2)
				-- upvalues: var13 (copy)
				return if -var13 >= p2.menuPosX then p2.scrimTransparency < 1 else true
			end)
		end, { var13 }) else var19:map(function(p2)
			return p2 < 1
		end)
	}, {
		Scrim = if var12 then nil else reactModule.createElement(scrimModule, {
			zIndex = 1,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var6 (ref), drawerPanelStatus (copy), var22 (ref)
				if var6:getValue() == drawerPanelStatus.Closing then return end
				if var6:getValue() ~= drawerPanelStatus.Movable then
					var22("shield")
				end
			end, { var6, var22 }),
			transparencyBinding = var19,
			isModal = p1.scrimIsModal
		}),
		DrawerAnimatedFrame = if fFlagEnableDrawerFocusNav then reactModule.createElement(focusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.Drawer,
			frameProps = {
				ZIndex = 2,
				BorderSizePixel = 0,
				Selectable = false,
				Position = var15:map(function(p2)
					return UDim2.fromOffset(p2, 0)
				end),
				Size = UDim2.new(0, var13, 1, 0),
				BackgroundColor3 = var10,
				BackgroundTransparency = var11,
				SelectionBehaviorRight = if var12 then Enum.SelectionBehavior.Escape else nil
			},
			customEventHandlers = reactModule.useMemo(function()
				-- upvalues: fFlagEnableDrawerFocusNav (copy), focusNavigationEventNameEnum (copy), inputHandlersModule (copy), fFlagFixDrawerNavigateBackWhileClosing (copy), var6 (ref), drawerPanelStatus (copy), var22 (ref)
				return if fFlagEnableDrawerFocusNav then {
					[focusNavigationEventNameEnum.NavigateBack] = {
						handler = inputHandlersModule.onRelease(function(p2)
							-- upvalues: fFlagFixDrawerNavigateBackWhileClosing (copy), var6 (copy), drawerPanelStatus (copy), var22 (copy)
							if not fFlagFixDrawerNavigateBackWhileClosing then
								var22("focus-navigation-back")
							elseif var6:getValue() ~= drawerPanelStatus.Closing then
								var22("focus-navigation-back")
							end
							p2:cancel()
						end)
					}
				} else {}
			end, { var22 })
		}, t) else reactModule.createElement(foundationModule.View, {
			ZIndex = 2,
			BorderSizePixel = 0,
			Selectable = false,
			Position = var15:map(function(p2)
				return UDim2.fromOffset(p2, 0)
			end),
			Size = UDim2.new(0, var13, 1, 0),
			backgroundStyle = p1.backgroundStyle
		}, t)
	})
end)