local Drawer = script:FindFirstAncestor("Drawer")
local UserInputService = game:GetService("UserInputService")
local Parent = Drawer.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local FoundationModule = require(Parent.Foundation)
local ReactOtterModule = require(Parent.ReactOtter)
local SignalsModule = require(Parent.Signals)
local GetDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)
local UseSetDrawerVisibleModule = require(script.Parent.Parent.Hooks.useSetDrawerVisible)
local UseSetDrawerShouldMountModule = require(script.Parent.Parent.Hooks.useSetDrawerShouldMount)
local UseSetDrawerAnimatingModule = require(script.Parent.Parent.Hooks.useSetDrawerAnimating)
local ScrimModule = require(script.Parent.Scrim)
local ConstantsModule = require(script.Parent.Parent.Constants)
local _ = require(script.Parent.Parent.Types)
local DrawerPanelStatus = require(script.Parent.Parent.Enum).DrawerPanelStatus
local FocusNavigableSurfaceWrapper = nil
local FocusNavigableSurfaceIdentifierEnum = nil
local FocusNavigationEventNameEnum = nil
local InputHandlersModule = nil
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableDrawerFocusNav = SharedFlagsModule.FFlagEnableDrawerFocusNav
local FFlagEnableDrawerAnimatingHook = SharedFlagsModule.FFlagEnableDrawerAnimatingHook
local FFlagSideSheetOpenPeoplePage = SharedFlagsModule.FFlagSideSheetOpenPeoplePage
local FFlagFixOverlayTopInsetForDeviceSafeInsets = SharedFlagsModule.FFlagFixOverlayTopInsetForDeviceSafeInsets
local FFlagFixDrawerNavigateBackWhileClosing = require(Drawer.Flags).FFlagFixDrawerNavigateBackWhileClosing

if FFlagEnableDrawerFocusNav then
	local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
	FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
	FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
	FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
	InputHandlersModule = require(Parent.InputHandlers)
end
return ReactModule.memo(function(p1) --[[ Line: 42 ]]
	-- upvalues: UseSetDrawerVisibleModule (copy), UseSetDrawerShouldMountModule (copy), FFlagEnableDrawerAnimatingHook (copy), UseSetDrawerAnimatingModule (copy), ReactModule (copy), DrawerPanelStatus (copy), FFlagEnableDrawerFocusNav (copy), ReactIsModule (copy), FFlagFixOverlayTopInsetForDeviceSafeInsets (copy), FFlagSideSheetOpenPeoplePage (copy), ReactOtterModule (copy), ConstantsModule (copy), GetDrawerVisibleStoreModule (copy), SignalsModule (copy), UserInputService (copy), FoundationModule (copy), FocusNavigationEventNameEnum (ref), InputHandlersModule (ref), FFlagFixDrawerNavigateBackWhileClosing (copy), ScrimModule (copy), FocusNavigableSurfaceWrapper (ref), FocusNavigableSurfaceIdentifierEnum (ref)
	local UseSetDrawerVisibleModuleResult = UseSetDrawerVisibleModule()
	local UseSetDrawerShouldMountModuleResult = UseSetDrawerShouldMountModule()
	local UseSetDrawerAnimatingModuleResult = if FFlagEnableDrawerAnimatingHook then UseSetDrawerAnimatingModule() else function(_) --[[ Line: 47 ]] end
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(DrawerPanelStatus.Scrollable)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 51 ]]
		-- upvalues: UseBindingResult (copy), DrawerPanelStatus (upval)
		return UseBindingResult:map(function(Scrollable): boolean --[[ Line: 52 ]]
			-- upvalues: DrawerPanelStatus (upval)
			return Scrollable == DrawerPanelStatus.Scrollable
		end)
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 57 ]]
		-- upvalues: UseBindingResult (copy), DrawerPanelStatus (upval)
		return UseBindingResult:map(function(Movable): number --[[ Line: 58 ]]
			-- upvalues: DrawerPanelStatus (upval)
			return if Movable == DrawerPanelStatus.Movable then 3 else 1
		end)
	end, {})
	local UseMemoResult2 = if FFlagEnableDrawerFocusNav then ReactModule.useMemo(function() --[[ Line: 70 ]]
		-- upvalues: p1 (copy), ReactIsModule (upval)
		local BackgroundStyle = p1.backgroundStyle
		
		return if BackgroundStyle == nil then nil elseif ReactIsModule.isBinding(BackgroundStyle) then BackgroundStyle:map(function(p2) --[[ Line: 76 ]]
			return p2.Color3
		end) else BackgroundStyle.Color3
	end, { p1.backgroundStyle }) else nil
	local UseMemoResult3 = if FFlagEnableDrawerFocusNav then ReactModule.useMemo(function() --[[ Line: 85 ]]
		-- upvalues: p1 (copy), ReactIsModule (upval)
		local BackgroundStyle = p1.backgroundStyle
		
		return if BackgroundStyle == nil then nil elseif ReactIsModule.isBinding(BackgroundStyle) then BackgroundStyle:map(function(p2) --[[ Line: 91 ]]
			return p2.Transparency
		end) else BackgroundStyle.Transparency
	end, { p1.backgroundStyle }) else nil
	local TopOffset = p1.topOffset or 0
	local BottomOffset = p1.bottomOffset or 0
	local LeftOffset = p1.leftOffset or 0
	local DeviceSafeInsets = if FFlagFixOverlayTopInsetForDeviceSafeInsets then p1.deviceSafeInsets else nil
	local IsAllowOutsideInteraction: boolean = FFlagSideSheetOpenPeoplePage and p1.allowOutsideInteraction == true
	local NewMenuWidth = p1.menuWidth + LeftOffset
	local UseRefResult2 = ReactModule.useRef(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(-NewMenuWidth, (ReactModule.useCallback(function(p2) --[[ Line: 107 ]]
		-- upvalues: FFlagEnableDrawerAnimatingHook (upval), UseSetDrawerAnimatingModuleResult (copy), UseBindingResult (copy), DrawerPanelStatus (upval), UseBindingResult2 (copy), NewMenuWidth (copy), UseSetDrawerShouldMountModuleResult (copy)
		if FFlagEnableDrawerAnimatingHook then
			UseSetDrawerAnimatingModuleResult(false)
		end
		if UseBindingResult:getValue() == DrawerPanelStatus.Closing then
			UseBindingResult2(DrawerPanelStatus.Scrollable)
		end
		if p2 == -NewMenuWidth then
			UseSetDrawerShouldMountModuleResult(false)
		end
	end, if FFlagSideSheetOpenPeoplePage or FFlagEnableDrawerAnimatingHook then {
		NewMenuWidth,
		UseSetDrawerAnimatingModuleResult,
		UseSetDrawerShouldMountModuleResult
	} else {})))
	local UseRefResult3 = ReactModule.useRef(NewMenuWidth)
	UseRefResult3.current = NewMenuWidth
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(1)
	local UseResult = if FFlagSideSheetOpenPeoplePage then ReactModule.useCallback(function(p2): boolean --[[ Line: 131 ]]
		-- upvalues: UseRefResult4 (copy)
		local Current = UseRefResult4.current
		
		if Current == nil then
			return false
		else
			local Position = p2.Position
			local AbsolutePosition = Current.AbsolutePosition
			local AbsoluteSize = Current.AbsoluteSize
			
			return AbsolutePosition.X <= Position.X and (Position.X <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= Position.Y) and Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y
		end
	end, {}) else nil
	local UseResult1 = ReactModule.useCallback(function(Source) --[[ Line: 151 ]]
		-- upvalues: UseSetDrawerVisibleModuleResult (copy), UseBindingResult2 (copy), DrawerPanelStatus (upval), p1 (copy)
		UseSetDrawerVisibleModuleResult(false)
		UseBindingResult2(DrawerPanelStatus.Closing)
		
		if p1.onDrawerClosedAnalytics then
			p1.onDrawerClosedAnalytics({ source = Source })
		end
	end, if FFlagSideSheetOpenPeoplePage then {
		p1.onDrawerClosedAnalytics,
		UseSetDrawerVisibleModuleResult
	} else { p1.onDrawerClosedAnalytics })
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 167 ]]
		-- upvalues: UseRefResult2 (copy), UseBindingResult (copy), DrawerPanelStatus (upval), IsAllowOutsideInteraction (copy), UseResult (copy), UseRefResult (copy), UseRefResult1 (copy), UseBindingResult2 (copy)
		if not UseRefResult2.current then return end
		if UseBindingResult:getValue() == DrawerPanelStatus.Closing then return end
		if not IsAllowOutsideInteraction or UseResult(p2) then
			UseRefResult.current = p2.Position
			UseRefResult1.current = DateTime.now().UnixTimestampMillis
			UseBindingResult2(DrawerPanelStatus.Static)
			
			return
		end
	end, if FFlagSideSheetOpenPeoplePage then { IsAllowOutsideInteraction, UseResult } else {})
	local UseResult3 = ReactModule.useCallback(function(p2) --[[ Line: 184 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult (copy), UseRefResult1 (copy), UseBindingResult (copy), DrawerPanelStatus (upval), UseRefResult3 (copy), ConstantsModule (upval), UseResult1 (copy), FFlagEnableDrawerAnimatingHook (upval), UseSetDrawerAnimatingModuleResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseBindingResult2 (copy)
		if not UseRefResult2.current then
			UseRefResult.current = nil
			UseRefResult1.current = nil
			
			return
		end
		if UseRefResult.current == nil or UseRefResult1.current == nil or UseBindingResult:getValue() ~= DrawerPanelStatus.Movable then
			UseRefResult.current = nil
			UseRefResult1.current = nil
			
			return
		end
		local XDelta = UseRefResult.current.X - p2.Position.X
		
		if UseRefResult3.current * ConstantsModule.DRAWER_SWIPE_THRESHOLD_PERCENT <= XDelta then
			UseResult1("swipe")
		elseif XDelta > 0 then
			local UnixTimestampMillisRatio = (DateTime.now().UnixTimestampMillis - UseRefResult1.current) / 1000
			
			if UnixTimestampMillisRatio > 0.01 and ConstantsModule.DRAWER_VELOCITY_THRESHOLD <= XDelta / UnixTimestampMillisRatio then
				UseResult1("swipe")
			end
		end
		if UseBindingResult:getValue() ~= DrawerPanelStatus.Closing then
			if FFlagEnableDrawerAnimatingHook then
				UseSetDrawerAnimatingModuleResult(true)
			end
			UseAnimatedBindingResult2(ReactOtterModule.ease(0, ConstantsModule.DRAWER_ANIM_SETTINGS))
			UseBindingResult2(DrawerPanelStatus.Scrollable)
		end
		UseRefResult.current = nil
		UseRefResult1.current = nil
	end, if FFlagEnableDrawerAnimatingHook then { UseResult1, UseSetDrawerAnimatingModuleResult } else {})
	local UseResult4 = ReactModule.useCallback(function(p2) --[[ Line: 225 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult (copy), UseBindingResult (copy), DrawerPanelStatus (upval), UseBindingResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if not UseRefResult2.current then return end
		if UseRefResult.current == nil or UseBindingResult:getValue() == DrawerPanelStatus.Closing then return end
		local XDelta = p2.Position.X - UseRefResult.current.X
		
		if UseBindingResult:getValue() == DrawerPanelStatus.Static then
			if math.abs(p2.Position.Y - UseRefResult.current.Y) < math.abs(XDelta) then
				UseBindingResult2(DrawerPanelStatus.Movable)
			else
				UseBindingResult2(DrawerPanelStatus.Scrollable)
			end
		end
		if UseBindingResult:getValue() == DrawerPanelStatus.Movable and XDelta < 0 then
			UseAnimatedBindingResult2((ReactOtterModule.instant(XDelta)))
		end
		if UseRefResult.current.X < p2.Position.X then
			UseRefResult.current = p2.Position
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 255 ]]
		-- upvalues: GetDrawerVisibleStoreModule (upval), SignalsModule (upval), UseRefResult2 (copy), UseRefResult3 (copy), FFlagEnableDrawerAnimatingHook (upval), UseSetDrawerAnimatingModuleResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), ConstantsModule (upval), FFlagSideSheetOpenPeoplePage (upval), UseAnimatedBindingResult2_1 (copy)
		local GetDrawerVisibleFunction = GetDrawerVisibleStoreModule(false).getDrawerVisible
		
		return SignalsModule.createEffect(function(p2) --[[ Line: 257 ]]
			-- upvalues: GetDrawerVisibleFunction (copy), UseRefResult2 (upval), UseRefResult3 (upval), FFlagEnableDrawerAnimatingHook (upval), UseSetDrawerAnimatingModuleResult (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), ConstantsModule (upval), FFlagSideSheetOpenPeoplePage (upval), UseAnimatedBindingResult2_1 (upval)
			local DrawerVisible = GetDrawerVisibleFunction(p2)
			UseRefResult2.current = DrawerVisible
			local Negated = if DrawerVisible then 0 else -UseRefResult3.current
			
			if FFlagEnableDrawerAnimatingHook then
				UseSetDrawerAnimatingModuleResult(true)
			end
			UseAnimatedBindingResult2(ReactOtterModule.ease(Negated, ConstantsModule.DRAWER_ANIM_SETTINGS))
			
			if not FFlagSideSheetOpenPeoplePage then
				UseAnimatedBindingResult2_1(ReactOtterModule.ease(if DrawerVisible then ConstantsModule.SCRIM_TRANSPARENCY else 1, ConstantsModule.DRAWER_ANIM_SETTINGS))
			end
		end)
	end, if FFlagEnableDrawerAnimatingHook then { UseSetDrawerAnimatingModuleResult } else {})
	
	if FFlagSideSheetOpenPeoplePage then
		ReactModule.useEffect(function() --[[ Line: 275 ]]
			-- upvalues: GetDrawerVisibleStoreModule (upval), SignalsModule (upval), IsAllowOutsideInteraction (copy), ConstantsModule (upval), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval)
			local GetDrawerVisibleFunction = GetDrawerVisibleStoreModule(false).getDrawerVisible
			
			return SignalsModule.createEffect(function(p2) --[[ Line: 277 ]]
				-- upvalues: GetDrawerVisibleFunction (copy), IsAllowOutsideInteraction (upval), ConstantsModule (upval), UseAnimatedBindingResult2_1 (upval), ReactOtterModule (upval)
				UseAnimatedBindingResult2_1(ReactOtterModule.ease(if GetDrawerVisibleFunction(p2) and not IsAllowOutsideInteraction then ConstantsModule.SCRIM_TRANSPARENCY else 1, ConstantsModule.DRAWER_ANIM_SETTINGS))
			end)
		end, { IsAllowOutsideInteraction })
	end
	ReactModule.useEffect(function() --[[ Line: 289 ]]
		-- upvalues: FFlagSideSheetOpenPeoplePage (upval), UseRefResult2 (copy), UseAnimatedBindingResult (copy), NewMenuWidth (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if FFlagSideSheetOpenPeoplePage and not UseRefResult2.current and UseAnimatedBindingResult:getValue() ~= -NewMenuWidth then
			UseAnimatedBindingResult2((ReactOtterModule.instant(-NewMenuWidth)))
		end
	end, { NewMenuWidth })
	ReactModule.useEffect(function() --[[ Line: 299 ]]
		-- upvalues: UserInputService (upval), UseResult2 (copy), UseResult3 (copy), UseResult4 (copy)
		local TouchStartedConnection = UserInputService.TouchStarted:Connect(UseResult2)
		local TouchEndedConnection = UserInputService.TouchEnded:Connect(UseResult3)
		local TouchMovedConnection = UserInputService.TouchMoved:Connect(UseResult4)
		
		return function() --[[ Line: 303 ]]
			-- upvalues: TouchStartedConnection (copy), TouchEndedConnection (copy), TouchMovedConnection (copy)
			TouchStartedConnection:Disconnect()
			TouchEndedConnection:Disconnect()
			TouchMovedConnection:Disconnect()
		end
	end, if FFlagSideSheetOpenPeoplePage then { UseResult3, UseResult4, UseResult2 } else {})
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 310 ]]
		-- upvalues: UseBindingResult (copy), DrawerPanelStatus (upval), UseResult1 (copy)
		if UseBindingResult:getValue() == DrawerPanelStatus.Closing then return end
		if UseBindingResult:getValue() ~= DrawerPanelStatus.Movable then
			UseResult1("shield")
		end
	end, { UseBindingResult, UseResult1 })
	local config = {
		DrawerContent = ReactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			Selectable = false,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			ClipsDescendants = true,
			ZIndex = 2,
			ref = UseRefResult4,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(0, p1.menuWidth, 1, -TopOffset - BottomOffset),
			Position = UDim2.new(0, LeftOffset, 0, TopOffset),
			CanvasSize = UDim2.new(0, p1.menuWidth, 0, 0),
			Active = UseMemoResult,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = UseMemoResult
		}, p1.children),
		DeviceSafeInsetsBackground = if DeviceSafeInsets then ReactModule.createElement(FoundationModule.View, {
			ZIndex = 0,
			Position = UDim2.fromOffset(-DeviceSafeInsets.left, -DeviceSafeInsets.top),
			Size = UDim2.new(1, DeviceSafeInsets.left, 1, DeviceSafeInsets.top + DeviceSafeInsets.bottom),
			backgroundStyle = p1.backgroundStyle
		}) else nil,
		SinkInput = ReactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			AutoButtonColor = false,
			Position = if DeviceSafeInsets then UDim2.fromOffset(-DeviceSafeInsets.left, -DeviceSafeInsets.top) else nil,
			Size = if DeviceSafeInsets then UDim2.new(1, DeviceSafeInsets.left, 1, DeviceSafeInsets.top + DeviceSafeInsets.bottom) else UDim2.fromScale(1, 1),
			ZIndex = UseMemoResult1
		})
	}
	local UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 376 ]]
		-- upvalues: FFlagEnableDrawerFocusNav (upval), FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), FFlagFixDrawerNavigateBackWhileClosing (upval), UseBindingResult (copy), DrawerPanelStatus (upval), UseResult1 (copy)
		return if FFlagEnableDrawerFocusNav then {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 382 ]]
					-- upvalues: FFlagFixDrawerNavigateBackWhileClosing (upval), UseBindingResult (upval), DrawerPanelStatus (upval), UseResult1 (upval)
					if FFlagFixDrawerNavigateBackWhileClosing then
						if UseBindingResult:getValue() ~= DrawerPanelStatus.Closing then
							UseResult1("focus-navigation-back")
						end
					else
						UseResult1("focus-navigation-back")
					end
					p2:cancel()
				end)
			}
		} else {}
	end, { UseResult1 })
	
	return ReactModule.createElement(FoundationModule.View, {
		testId = if FFlagSideSheetOpenPeoplePage then "drawer-root" else nil,
		Size = if IsAllowOutsideInteraction then UDim2.new(0, NewMenuWidth, 1, 0) else UDim2.fromScale(1, 1),
		ClipsDescendants = IsAllowOutsideInteraction,
		backgroundStyle = { Transparency = 1 },
		Visible = if FFlagSideSheetOpenPeoplePage then ReactModule.useMemo(function() --[[ Line: 323 ]]
			-- upvalues: ReactModule (upval), UseAnimatedBindingResult (copy), UseAnimatedBindingResult1 (copy), NewMenuWidth (copy)
			return ReactModule.joinBindings({
				menuPosX = UseAnimatedBindingResult,
				scrimTransparency = UseAnimatedBindingResult1
			}):map(function(p2): boolean --[[ Line: 327 ]]
				-- upvalues: NewMenuWidth (upval)
				return -NewMenuWidth < p2.menuPosX or p2.scrimTransparency < 1
			end)
		end, { NewMenuWidth }) else UseAnimatedBindingResult1:map(function(p2: number): boolean --[[ Line: 332 ]]
			return p2 < 1
		end)
	}, {
		Scrim = if IsAllowOutsideInteraction then nil elseif DeviceSafeInsets then ReactModule.createElement(FoundationModule.View, {
			ZIndex = 1,
			Position = UDim2.fromOffset(-DeviceSafeInsets.left, -DeviceSafeInsets.top),
			Size = UDim2.new(1, DeviceSafeInsets.left + DeviceSafeInsets.right, 1, DeviceSafeInsets.top + DeviceSafeInsets.bottom),
			backgroundStyle = { Transparency = 1 }
		}, {
			Scrim = ReactModule.createElement(ScrimModule, {
				zIndex = 1,
				onActivated = UseResult5,
				transparencyBinding = UseAnimatedBindingResult1,
				isModal = p1.scrimIsModal
			})
		}) else ReactModule.createElement(ScrimModule, {
			zIndex = 1,
			onActivated = UseResult5,
			transparencyBinding = UseAnimatedBindingResult1,
			isModal = p1.scrimIsModal
		}),
		DrawerAnimatedFrame = if FFlagEnableDrawerFocusNav then ReactModule.createElement(FocusNavigableSurfaceWrapper, {
			isIsolated = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.Drawer,
			frameProps = {
				ZIndex = 2,
				BorderSizePixel = 0,
				Selectable = false,
				Position = UseAnimatedBindingResult:map(function(XOffset): UDim2 --[[ Line: 435 ]]
					return UDim2.fromOffset(XOffset, 0)
				end),
				Size = UDim2.new(0, NewMenuWidth, 1, 0),
				BackgroundColor3 = UseMemoResult2,
				BackgroundTransparency = UseMemoResult3,
				SelectionBehaviorRight = if IsAllowOutsideInteraction then Enum.SelectionBehavior.Escape else nil
			},
			customEventHandlers = UseMemoResult4
		}, config) else ReactModule.createElement(FoundationModule.View, {
			ZIndex = 2,
			BorderSizePixel = 0,
			Selectable = false,
			Position = UseAnimatedBindingResult:map(function(XOffset): UDim2 --[[ Line: 450 ]]
				return UDim2.fromOffset(XOffset, 0)
			end),
			Size = UDim2.new(0, NewMenuWidth, 1, 0),
			backgroundStyle = p1.backgroundStyle
		}, config)
	})
end)