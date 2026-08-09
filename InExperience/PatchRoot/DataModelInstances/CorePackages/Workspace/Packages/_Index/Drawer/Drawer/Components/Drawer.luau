local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("Drawer").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local getDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)
local useSetDrawerVisibleModule = require(script.Parent.Parent.Hooks.useSetDrawerVisible)
local useSetDrawerShouldMountModule = require(script.Parent.Parent.Hooks.useSetDrawerShouldMount)
local scrimModule = require(script.Parent.Scrim)
local constantsModule = require(script.Parent.Parent.Constants)
local _ = require(script.Parent.Parent.Types)
local drawerPanelStatus = require(script.Parent.Parent.Enum).DrawerPanelStatus

return reactModule.memo(function(p0) --[[ line: 20 ]]
	-- upvalues: useSetDrawerVisibleModule (ref), useSetDrawerShouldMountModule (ref), reactModule (ref), drawerPanelStatus (ref), reactOtterModule (ref), constantsModule (ref), getDrawerVisibleStoreModule (ref), signalsModule (ref), userInputService (ref), foundationModule (ref), scrimModule (ref)
	local var10 = useSetDrawerVisibleModule()
	local var11 = useSetDrawerShouldMountModule()
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(nil)
	local var14, var15 = reactModule.useBinding(drawerPanelStatus.Scrollable)
	local var16 = reactModule.useMemo(function() --[[ line: 26 ]]
		-- upvalues: var14 (ref), drawerPanelStatus (copy)
		return var14:map(function(p1) --[[ line: 27 ]]
			-- upvalues: drawerPanelStatus (copy)
			return p1 == drawerPanelStatus.Scrollable
		end)
	end, {})
	local var17 = reactModule.useMemo(function() --[[ line: 32 ]]
		-- upvalues: var14 (ref), drawerPanelStatus (copy)
		return var14:map(function(p2) --[[ line: 33 ]]
			-- upvalues: drawerPanelStatus (copy)
			return if p2 == drawerPanelStatus.Movable then 3 else 1
		end)
	end, {})
	local topOffset = p0.topOffset or 0
	local bottomOffset = p0.bottomOffset or 0
	local leftOffset = p0.leftOffset or 0
	local var21 = p0.menuWidth + leftOffset
	local var22, var23 = reactOtterModule.useAnimatedBinding(-var21, reactModule.useCallback(function(p3) --[[ line: 48 ]]
		-- upvalues: var14 (ref), drawerPanelStatus (copy), var15 (ref), var21 (ref), var11 (ref)
		if var14:getValue() == drawerPanelStatus.Closing then
			var15(drawerPanelStatus.Scrollable)
		end
		if p3 == -var21 then
			var11(false)
		end
	end, {}))
	local var24 = reactModule.useRef(var21)
	var24.current = var21
	local var25 = reactModule.useRef(false)
	local var26, var27 = reactOtterModule.useAnimatedBinding(1)
	local var28 = reactModule.useCallback(function(p4) --[[ line: 64 ]]
		-- upvalues: var10 (ref), var15 (ref), drawerPanelStatus (copy), p0 (ref)
		var10(false)
		var15(drawerPanelStatus.Closing)
		
		if p0.onDrawerClosedAnalytics then
			p0.onDrawerClosedAnalytics({ source = p4 })
		end
	end, { p0.onDrawerClosedAnalytics })
	local var29 = reactModule.useCallback(function(p5) --[[ line: 72 ]]
		-- upvalues: var25 (ref), var14 (ref), drawerPanelStatus (copy), var12 (ref), var13 (ref), var15 (ref)
		if not var25.current then return end
		if var14:getValue() == drawerPanelStatus.Closing then
			return
		end
		var12.current = p5.Position
		var13.current = DateTime.now().UnixTimestampMillis
		var15(drawerPanelStatus.Static)
	end, {})
	local var30 = reactModule.useCallback(function(p6) --[[ line: 84 ]]
		-- upvalues: var25 (ref), var12 (ref), var13 (ref), var14 (ref), drawerPanelStatus (copy), var24 (ref), constantsModule (copy), var28 (ref), var23 (ref), reactOtterModule (copy), var15 (ref)
		if not var25.current then
			var12.current = nil
			var13.current = nil
			
			return
		elseif var12.current == nil or var13.current == nil or var14:getValue() ~= drawerPanelStatus.Movable then
			var12.current = nil
			var13.current = nil
			
			return
		end
		local var32 = var12.current.X - p6.Position.X
		
		if var24.current * constantsModule.DRAWER_SWIPE_THRESHOLD_PERCENT <= var32 then
			var28("swipe")
		elseif var32 > 0 then
			local var33 = (DateTime.now().UnixTimestampMillis - var13.current) / 1000
			
			if var33 > 0.01 and constantsModule.DRAWER_VELOCITY_THRESHOLD <= var32 / var33 then
				var28("swipe")
			end
		end
		if var14:getValue() ~= drawerPanelStatus.Closing then
			var23(reactOtterModule.ease(0, constantsModule.DRAWER_ANIM_SETTINGS))
			var15(drawerPanelStatus.Scrollable)
		end
		var12.current = nil
		var13.current = nil
	end, {})
	local var31 = reactModule.useCallback(function(p7) --[[ line: 122 ]]
		-- upvalues: var25 (ref), var12 (ref), var14 (ref), drawerPanelStatus (copy), var15 (ref), var23 (ref), reactOtterModule (copy)
		if not var25.current then return end
		if var12.current == nil or var14:getValue() == drawerPanelStatus.Closing then return end
		local var34 = p7.Position.X - var12.current.X
		
		if var14:getValue() == drawerPanelStatus.Static then
			if math.abs(p7.Position.Y - var12.current.Y) < math.abs(var34) then
				var15(drawerPanelStatus.Movable)
			else
				var15(drawerPanelStatus.Scrollable)
			end
		end
		if var14:getValue() == drawerPanelStatus.Movable and var34 < 0 then
			var23(reactOtterModule.instant(var34))
		end
		if var12.current.X < p7.Position.X then
			var12.current = p7.Position
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 149 ]]
		-- upvalues: getDrawerVisibleStoreModule (copy), signalsModule (copy), var25 (ref), var24 (ref), var23 (ref), reactOtterModule (copy), constantsModule (copy), var27 (ref)
		local getDrawerVisible = getDrawerVisibleStoreModule(false).getDrawerVisible
		
		return signalsModule.createEffect(function(p8) --[[ line: 151 ]]
			-- upvalues: getDrawerVisible (ref), var25 (copy), var24 (copy), var23 (copy), reactOtterModule (copy), constantsModule (copy), var27 (copy)
			local var35 = getDrawerVisible(p8)
			var25.current = var35
			var23(reactOtterModule.ease(if var35 then 0 else -var24.current, constantsModule.DRAWER_ANIM_SETTINGS))
			var27(reactOtterModule.ease(if var35 then constantsModule.SCRIM_TRANSPARENCY else 1, constantsModule.DRAWER_ANIM_SETTINGS))
		end)
	end, {})
	reactModule.useEffect(function() --[[ line: 163 ]]
		-- upvalues: userInputService (copy), var29 (ref), var30 (ref), var31 (ref)
		local touchStartedConnection = userInputService.TouchStarted:Connect(var29)
		local touchEndedConnection = userInputService.TouchEnded:Connect(var30)
		local touchMovedConnection = userInputService.TouchMoved:Connect(var31)
		
		return function() --[[ line: 167 ]]
			-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref), touchMovedConnection (ref)
			touchStartedConnection:Disconnect()
			touchEndedConnection:Disconnect()
			touchMovedConnection:Disconnect()
		end
	end, {})
	
	return reactModule.createElement(foundationModule.View, {
		Size = UDim2.fromScale(1, 1),
		backgroundStyle = { Transparency = 1 },
		Visible = var26:map(function(p9) --[[ line: 185 ]]
			return p9 < 1
		end)
	}, {
		Scrim = reactModule.createElement(scrimModule, {
			zIndex = 1,
			onActivated = reactModule.useCallback(function() --[[ line: 174 ]]
				-- upvalues: var14 (ref), drawerPanelStatus (copy), var28 (ref)
				if var14:getValue() == drawerPanelStatus.Closing then return end
				if var14:getValue() ~= drawerPanelStatus.Movable then
					var28("shield")
				end
			end, { var14, var28 }),
			transparencyBinding = var26,
			isModal = p0.scrimIsModal
		}),
		DrawerAnimatedFrame = reactModule.createElement(foundationModule.View, {
			ZIndex = 2,
			BorderSizePixel = 0,
			Selectable = false,
			Position = var22:map(function(p10) --[[ line: 203 ]]
				return UDim2.fromOffset(p10, 0)
			end),
			Size = UDim2.new(0, var21, 1, 0),
			backgroundStyle = p0.backgroundStyle
		}, {
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
				Active = var16,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ScrollingEnabled = var16
			}, p0.children),
			SinkInput = reactModule.createElement("ImageButton", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				AutoButtonColor = false,
				Size = UDim2.fromScale(1, 1),
				ZIndex = var17
			})
		})
	})
end)