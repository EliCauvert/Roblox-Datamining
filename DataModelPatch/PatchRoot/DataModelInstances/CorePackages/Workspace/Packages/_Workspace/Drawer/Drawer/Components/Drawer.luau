local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("Drawer").Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local FoundationModule = require(Parent.Foundation)
local ReactOtterModule = require(Parent.ReactOtter)
local SignalsModule = require(Parent.Signals)
local GetDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)
local UseSetDrawerVisibleModule = require(script.Parent.Parent.Hooks.useSetDrawerVisible)
local UseSetDrawerShouldMountModule = require(script.Parent.Parent.Hooks.useSetDrawerShouldMount)
local ScrimModule = require(script.Parent.Scrim)
local ConstantsModule = require(script.Parent.Parent.Constants)
local _ = require(script.Parent.Parent.Types)
local DrawerPanelStatus = require(script.Parent.Parent.Enum).DrawerPanelStatus
local FocusNavigableSurfaceWrapper = nil
local FocusNavigableSurfaceIdentifierEnum = nil
local FocusNavigationEventNameEnum = nil
local InputHandlersModule = nil
local FFlagEnableDrawerFocusNav = require(Parent.SharedFlags).FFlagEnableDrawerFocusNav

if FFlagEnableDrawerFocusNav then
	local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
	FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
	FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
	FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
	InputHandlersModule = require(Parent.InputHandlers)
end
return ReactModule.memo(function(p1)
	-- upvalues: UseSetDrawerVisibleModule (copy), UseSetDrawerShouldMountModule (copy), ReactModule (copy), DrawerPanelStatus (copy), FFlagEnableDrawerFocusNav (copy), ReactIsModule (copy), ReactOtterModule (copy), ConstantsModule (copy), GetDrawerVisibleStoreModule (copy), SignalsModule (copy), UserInputService (copy), FocusNavigationEventNameEnum (ref), InputHandlersModule (ref), FoundationModule (copy), ScrimModule (copy), FocusNavigableSurfaceWrapper (ref), FocusNavigableSurfaceIdentifierEnum (ref)
	local UseSetDrawerVisibleModuleResult = UseSetDrawerVisibleModule()
	local UseSetDrawerShouldMountModuleResult = UseSetDrawerShouldMountModule()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(DrawerPanelStatus.Scrollable)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult (copy), DrawerPanelStatus (upval)
		return UseBindingResult:map(function(Scrollable): boolean
			-- upvalues: DrawerPanelStatus (upval)
			return Scrollable == DrawerPanelStatus.Scrollable
		end)
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseBindingResult (copy), DrawerPanelStatus (upval)
		return UseBindingResult:map(function(Movable): number
			-- upvalues: DrawerPanelStatus (upval)
			return if Movable == DrawerPanelStatus.Movable then 3 else 1
		end)
	end, {})
	local UseMemoResult2 = if FFlagEnableDrawerFocusNav then ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactIsModule (upval)
		local BackgroundStyle = p1.backgroundStyle
		
		return if BackgroundStyle == nil then nil elseif ReactIsModule.isBinding(BackgroundStyle) then BackgroundStyle:map(function(p2)
			return p2.Color3
		end) else BackgroundStyle.Color3
	end, { p1.backgroundStyle }) else nil
	local UseMemoResult3 = if FFlagEnableDrawerFocusNav then ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactIsModule (upval)
		local BackgroundStyle = p1.backgroundStyle
		
		return if BackgroundStyle == nil then nil elseif ReactIsModule.isBinding(BackgroundStyle) then BackgroundStyle:map(function(p2)
			return p2.Transparency
		end) else BackgroundStyle.Transparency
	end, { p1.backgroundStyle }) else nil
	local TopOffset = p1.topOffset or 0
	local BottomOffset = p1.bottomOffset or 0
	local LeftOffset = p1.leftOffset or 0
	local NewMenuWidth = p1.menuWidth + LeftOffset
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(-NewMenuWidth, (ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult (copy), DrawerPanelStatus (upval), UseBindingResult2 (copy), NewMenuWidth (copy), UseSetDrawerShouldMountModuleResult (copy)
		if UseBindingResult:getValue() == DrawerPanelStatus.Closing then
			UseBindingResult2(DrawerPanelStatus.Scrollable)
		end
		if p2 == -NewMenuWidth then
			UseSetDrawerShouldMountModuleResult(false)
		end
	end, {})))
	local UseRefResult2 = ReactModule.useRef(NewMenuWidth)
	UseRefResult2.current = NewMenuWidth
	local UseRefResult3 = ReactModule.useRef(false)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(1)
	local UseResult = ReactModule.useCallback(function(Source)
		-- upvalues: UseSetDrawerVisibleModuleResult (copy), UseBindingResult2 (copy), DrawerPanelStatus (upval), p1 (copy)
		UseSetDrawerVisibleModuleResult(false)
		UseBindingResult2(DrawerPanelStatus.Closing)
		
		if p1.onDrawerClosedAnalytics then
			p1.onDrawerClosedAnalytics({ source = Source })
		end
	end, { p1.onDrawerClosedAnalytics })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult3 (copy), UseBindingResult (copy), DrawerPanelStatus (upval), UseRefResult (copy), UseRefResult1 (copy), UseBindingResult2 (copy)
		if not UseRefResult3.current then return end
		if UseBindingResult:getValue() ~= DrawerPanelStatus.Closing then
			UseRefResult.current = p2.Position
			UseRefResult1.current = DateTime.now().UnixTimestampMillis
			UseBindingResult2(DrawerPanelStatus.Static)
			
			return
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult3 (copy), UseRefResult (copy), UseRefResult1 (copy), UseBindingResult (copy), DrawerPanelStatus (upval), UseRefResult2 (copy), ConstantsModule (upval), UseResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseBindingResult2 (copy)
		if not UseRefResult3.current then
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
		
		if UseRefResult2.current * ConstantsModule.DRAWER_SWIPE_THRESHOLD_PERCENT <= XDelta then
			UseResult("swipe")
		elseif XDelta > 0 then
			local UnixTimestampMillisRatio = (DateTime.now().UnixTimestampMillis - UseRefResult1.current) / 1000
			
			if UnixTimestampMillisRatio > 0.01 and ConstantsModule.DRAWER_VELOCITY_THRESHOLD <= XDelta / UnixTimestampMillisRatio then
				UseResult("swipe")
			end
		end
		if UseBindingResult:getValue() ~= DrawerPanelStatus.Closing then
			UseAnimatedBindingResult2(ReactOtterModule.ease(0, ConstantsModule.DRAWER_ANIM_SETTINGS))
			UseBindingResult2(DrawerPanelStatus.Scrollable)
		end
		UseRefResult.current = nil
		UseRefResult1.current = nil
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult3 (copy), UseRefResult (copy), UseBindingResult (copy), DrawerPanelStatus (upval), UseBindingResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if not UseRefResult3.current then return end
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
	ReactModule.useEffect(function()
		-- upvalues: GetDrawerVisibleStoreModule (upval), SignalsModule (upval), UseRefResult3 (copy), UseRefResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), ConstantsModule (upval), UseAnimatedBindingResult2_1 (copy)
		local GetDrawerVisibleFunction = GetDrawerVisibleStoreModule(false).getDrawerVisible
		
		return SignalsModule.createEffect(function(p2)
			-- upvalues: GetDrawerVisibleFunction (copy), UseRefResult3 (upval), UseRefResult2 (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), ConstantsModule (upval), UseAnimatedBindingResult2_1 (upval)
			local DrawerVisible = GetDrawerVisibleFunction(p2)
			UseRefResult3.current = DrawerVisible
			UseAnimatedBindingResult2(ReactOtterModule.ease(if DrawerVisible then 0 else -UseRefResult2.current, ConstantsModule.DRAWER_ANIM_SETTINGS))
			UseAnimatedBindingResult2_1(ReactOtterModule.ease(if DrawerVisible then ConstantsModule.SCRIM_TRANSPARENCY else 1, ConstantsModule.DRAWER_ANIM_SETTINGS))
		end)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), UseResult1 (copy), UseResult2 (copy), UseResult3 (copy)
		local TouchStartedConnection = UserInputService.TouchStarted:Connect(UseResult1)
		local TouchEndedConnection = UserInputService.TouchEnded:Connect(UseResult2)
		local TouchMovedConnection = UserInputService.TouchMoved:Connect(UseResult3)
		
		return function()
			-- upvalues: TouchStartedConnection (copy), TouchEndedConnection (copy), TouchMovedConnection (copy)
			TouchStartedConnection:Disconnect()
			TouchEndedConnection:Disconnect()
			TouchMovedConnection:Disconnect()
		end
	end, {})
	local config = {
		DrawerContent = ReactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			Selectable = false,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			ClipsDescendants = true,
			ZIndex = 2,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(0, p1.menuWidth, 1, -TopOffset - BottomOffset),
			Position = UDim2.new(0, LeftOffset, 0, TopOffset),
			CanvasSize = UDim2.new(0, p1.menuWidth, 0, 0),
			Active = UseMemoResult,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = UseMemoResult
		}, p1.children),
		SinkInput = ReactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			AutoButtonColor = false,
			Size = UDim2.fromScale(1, 1),
			ZIndex = UseMemoResult1
		})
	}
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: FFlagEnableDrawerFocusNav (upval), FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy)
		return if FFlagEnableDrawerFocusNav then {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: UseResult (upval)
					UseResult("focus-navigation-back")
					p2:cancel()
				end)
			}
		} else {}
	end, { UseResult })
	
	return ReactModule.createElement(FoundationModule.View, {
		Size = UDim2.fromScale(1, 1),
		backgroundStyle = { Transparency = 1 },
		Visible = UseAnimatedBindingResult1:map(function(p2: number): boolean
			return p2 < 1
		end)
	}, {
		Scrim = ReactModule.createElement(ScrimModule, {
			zIndex = 1,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseBindingResult (copy), DrawerPanelStatus (upval), UseResult (copy)
				if UseBindingResult:getValue() == DrawerPanelStatus.Closing then return end
				if UseBindingResult:getValue() ~= DrawerPanelStatus.Movable then
					UseResult("shield")
				end
			end, { UseBindingResult, UseResult }),
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
				Position = UseAnimatedBindingResult:map(function(XOffset): UDim2
					return UDim2.fromOffset(XOffset, 0)
				end),
				Size = UDim2.new(0, NewMenuWidth, 1, 0),
				BackgroundColor3 = UseMemoResult2,
				BackgroundTransparency = UseMemoResult3
			},
			customEventHandlers = UseMemoResult4
		}, config) else ReactModule.createElement(FoundationModule.View, {
			ZIndex = 2,
			BorderSizePixel = 0,
			Selectable = false,
			Position = UseAnimatedBindingResult:map(function(XOffset): UDim2
				return UDim2.fromOffset(XOffset, 0)
			end),
			Size = UDim2.new(0, NewMenuWidth, 1, 0),
			backgroundStyle = p1.backgroundStyle
		}, config)
	})
end)