local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local VRService = game:GetService("VRService")
local reactOtterModule = require(corePackagesService.Packages.ReactOtter)
local signalsModule = require(corePackagesService.Packages.Signals)
local getUIScale = require(corePackagesService.Workspace.Packages.Display).GetDisplayStore(false).getUIScale
local interactable = require(corePackagesService.Packages.UIBlox).Core.Control.Interactable
local useStyleSheet = require(corePackagesService.Packages.Foundation).Hooks.useStyleSheet
local mouseIconOverrideService = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local selfieViewCursorOverride = require(corePackagesService.Workspace.Packages.AppCommonLib).Symbol.named("SelfieViewCursorOverride")
local debounceModule = require(chromeShared.Utility.debounce)
local serviceModule = require(chromeShared.Service)
local constantsModule = require(chromeShared.Unibar.Constants)
local _ = require(corePackagesService.Workspace.Packages.Chrome)
local chromeAnalyticsModule = require(chromeShared.Analytics.ChromeAnalytics)
local shouldRejectMultiTouchModule = require(chromeShared.Utility.shouldRejectMultiTouch)
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagTopBarSignalizeMenuOpen = coreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local useSelector = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local chromeWindowLayoutOrder = game:DefineFastInt("ChromeWindowLayoutOrder", 2)
local fixWindowDragError = game:DefineFastFlag("FixWindowDragError", false)
local fixWindowDragStaleConnection = game:DefineFastFlag("FixWindowDragStaleConnection", false)
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local useWindowSizeModule = require(chromeShared.Hooks.useWindowSize)
local t = { dampingRatio = 1, frequency = 3 }
local _ = {
	INTEGRATION = 1,
	CLOSE_BUTTON = 2,
	INPUT_SHIELD = 3,
	INPUT_WRAPPER = 4
}
local var1 = false

return function(p1)
	-- upvalues: useWindowSizeModule (ref), reactModule (ref), fFlagTopBarSignalizeMenuOpen (ref), useSelector (ref), reactOtterModule (ref), t (ref), signalsModule (ref), coreGuiCommonModule (ref), settingsShowSignal (ref), serviceModule (ref), constantsModule (ref), chromeAnalyticsModule (ref), userInputService (ref), shouldRejectMultiTouchModule (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), getUIScale (ref), VRService (ref), var1 (write), mouseIconOverrideService (ref), selfieViewCursorOverride (ref), fixWindowDragStaleConnection (ref), fixWindowDragError (ref), tweenService (ref), chromeWindowLayoutOrder (ref), useStyleSheet (ref), reactRobloxModule (ref), debounceModule (ref), interactable (ref), coreGuiService (ref)
	local var2 = useWindowSizeModule(p1.integration.integration)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useBinding(false)
	local var7 = 0
	local var8 = reactModule.useMemo(function()
		return nil
	end, {})
	local var9, var10 = reactModule.useBinding(false)
	local var11, var12 = reactModule.useBinding(false)
	local var13 = if fFlagTopBarSignalizeMenuOpen then reactModule.joinBindings({ var9, var11 }):map(function(p2)
		return p2[1] or p2[2]
	end) else nil
	local var14 = if not fFlagTopBarSignalizeMenuOpen then useSelector(function(p2)
		return p2.displayOptions.menuOpen or p2.displayOptions.inspectMenuOpen
	end) else nil
	local var15, var16 = reactModule.useBinding(false)
	local var17, var18 = reactOtterModule.useAnimatedBinding(var2.X.Offset)
	local var19, var20 = reactOtterModule.useAnimatedBinding(var2.Y.Offset)
	local var21 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), var19 (ref), p1 (ref)
		return Vector2.new(var17:getValue(), var19:getValue()) * (p1.integration.integration.windowAnchorPoint or Vector2.zero)
	end, { var17, var19, p1.integration })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var18 (ref), reactOtterModule (copy), var2 (ref), t (copy)
		if var17:getValue() == 0 then
			var18(reactOtterModule.instant(var2.X.Offset))
			
			return
		end
		var18(reactOtterModule.spring(var2.X.Offset, t))
	end, { var2.X.Offset })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var20 (ref), reactOtterModule (copy), var2 (ref), t (copy)
		if var19:getValue() == 0 then
			var20(reactOtterModule.instant(var2.Y.Offset))
			
			return
		end
		var20(reactOtterModule.spring(var2.Y.Offset, t))
	end, { var2.Y.Offset })
	
	if fFlagTopBarSignalizeMenuOpen then
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), coreGuiCommonModule (copy), var12 (ref), settingsShowSignal (copy), var10 (ref)
			local var22 = signalsModule.createEffect(function(p2)
				-- upvalues: coreGuiCommonModule (copy), var12 (copy)
				var12(coreGuiCommonModule.Stores.GetInspectAndBuyStore(p2).getInspectAndBuyOpen(p2))
			end)
			settingsShowSignal:connect(function(p2)
				-- upvalues: var10 (copy)
				var10(p2)
			end)
			
			return function()
				-- upvalues: var22 (ref)
				var22()
			end
		end, {})
	end
	reactModule.useEffect(function()
		-- upvalues: serviceModule (copy), p1 (ref), var3 (ref), var4 (write), var6 (ref), var18 (ref), reactOtterModule (copy), constantsModule (copy), var20 (ref), var2 (ref), t (copy), chromeAnalyticsModule (copy), userInputService (copy), shouldRejectMultiTouchModule (copy), fFlagTokenizeUnibarConstantsWithStyleProvider (copy), getUIScale (copy)
		local connection = nil
		local inputObject = nil
		local id = serviceModule:dragConnection(p1.integration.id)
		
		if id then
			connection = id.connection
			inputObject = id.inputObject
		end
		assert(var3.current ~= nil)
		assert(var3.current.Parent ~= nil)
		local current = var3.current
		local absoluteSize = var3.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize
		
		if connection == nil then
			local var22
			local _ = nil
			
			if fFlagTokenizeUnibarConstantsWithStyleProvider and p1.position then
				local var23 = getUIScale(false)
				var22 = UDim2.new(p1.position.X.Scale, var23 * p1.position.X.Offset, p1.position.Y.Scale, var23 * p1.position.Y.Offset)
			else
				var22 = p1.position or UDim2.new()
			end
			if p1.integration.integration.cachePosition then
				local id_1 = serviceModule:windowPosition(p1.integration.id) or UDim2.new()
				current.Position = UDim2.new(0, (if id_1.X.Scale == 1 then absoluteSize.X else 0) + id_1.X.Offset, 0, id_1.Y.Offset)
			else
				current.Position = UDim2.new(0, (if var22.X.Scale == 1 then absoluteSize.X else 0) + var22.X.Offset, 0, var22.Y.Offset)
			end
		else
			var4 = connection
			var6(true)
			
			if var4 then
				var18(reactOtterModule.instant(constantsModule.WINDOW_ICON_SIZE))
				var20(reactOtterModule.instant(constantsModule.WINDOW_ICON_SIZE))
				task.defer(var18, reactOtterModule.spring(var2.X.Offset, t))
				task.defer(var20, reactOtterModule.spring(var2.Y.Offset, t))
				local vector3 = Vector3.new(var3.current.AbsolutePosition.X, var3.current.AbsolutePosition.Y, 0)
				chromeAnalyticsModule.default:setWindowDefaultPosition(p1.integration.id, Vector2.new(vector3.X, vector3.Y))
				var4.current = userInputService.InputChanged:Connect(function(p2, _)
					-- upvalues: shouldRejectMultiTouchModule (copy), inputObject (write), vector3 (ref), vector3 (ref), absoluteSize (ref), current (ref)
					local position = p2.Position
					
					if shouldRejectMultiTouchModule(inputObject, p2) then
						return
					end
					local var24 = position - vector3
					local t = {
						X = math.clamp((var24 + vector3).X, 0, absoluteSize.X),
						Y = math.clamp((var24 + vector3).Y, 0, absoluteSize.Y)
					}
					current.Position = UDim2.fromOffset(t.X, t.Y)
				end)
			end
		end
	end, {})
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), serviceModule (copy)
		if p1.integration.integration.cachePosition then
			serviceModule:updateWindowPosition(p1.integration.id, p2)
		end
	end, { p1.integration })
	local var23 = reactModule.useCallback(function()
		-- upvalues: VRService (copy), var1 (copy), mouseIconOverrideService (copy), selfieViewCursorOverride (copy)
		if not VRService.VREnabled then
			var1 = true
			mouseIconOverrideService.push(selfieViewCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
		end
	end)
	local var24 = reactModule.useCallback(function()
		-- upvalues: var1 (copy), mouseIconOverrideService (copy), selfieViewCursorOverride (copy)
		if var1 then
			var1 = false
			mouseIconOverrideService.pop(selfieViewCursorOverride)
		end
	end)
	local var25 = reactModule.useCallback(function(_, p2)
		-- upvalues: var3 (ref), var21 (ref), chromeAnalyticsModule (copy), p1 (ref), fixWindowDragStaleConnection (copy), var4 (write), var6 (ref), var15 (ref), fixWindowDragError (copy), var17 (ref), var19 (ref), userInputService (copy), shouldRejectMultiTouchModule (copy), var7 (write), constantsModule (copy)
		assert(var3.current ~= nil)
		assert(var3.current.Parent ~= nil)
		local current = var3.current
		local absoluteSize = var3.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize
		local var26 = var21()
		local position = p2.Position
		local vector3 = Vector3.new(var3.current.AbsolutePosition.X + var26.X, var3.current.AbsolutePosition.Y + var26.Y, 0)
		
		if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
			chromeAnalyticsModule.default:onWindowTouchBegan(p1.integration.id, Vector2.new(var3.current.AbsolutePosition.X, var3.current.AbsolutePosition.Y))
			
			if fixWindowDragStaleConnection and var4.current then
				var4.current:Disconnect()
				var4.current = nil
				var6(false)
			end
			if (if fixWindowDragStaleConnection then true else not var4.current) and not var15:getValue() then
				local t = {
					X = math.clamp(vector3.X, 0, if fixWindowDragError then math.max(0, absoluteSize.X - (var17:getValue() - var26.X)) else absoluteSize.X - (var17:getValue() - var26.X)),
					Y = math.clamp(vector3.Y, 0, if fixWindowDragError then math.max(0, absoluteSize.Y - (var19:getValue() - var26.Y)) else absoluteSize.Y - (var19:getValue() - var26.Y))
				}
				current.Position = UDim2.fromOffset(t.X, t.Y)
				var4.current = userInputService.InputChanged:Connect(function(p3, _)
					-- upvalues: shouldRejectMultiTouchModule (copy), p2 (ref), position (ref), var7 (copy), fixWindowDragStaleConnection (copy), constantsModule (copy), var6 (copy), vector3 (ref), var26 (ref), fixWindowDragError (copy), absoluteSize (ref), var17 (copy), var19 (copy), current (ref), chromeAnalyticsModule (copy), p1 (copy)
					if shouldRejectMultiTouchModule(p2, p3) then return end
					local position_1 = p3.Position
					local var27 = position_1 - position
					var7 = if fixWindowDragStaleConnection then var27.Magnitude else var7 + var27.Magnitude
					
					if constantsModule.WINDOW_MIN_DRAG_DISTANCE < var7 then
						var6(true)
						local t = {
							X = math.clamp((var27 + vector3).X, var26.X, if fixWindowDragError then math.max(var26.X, absoluteSize.X - (var17:getValue() - var26.X)) else absoluteSize.X - (var17:getValue() - var26.X)),
							Y = math.clamp((var27 + vector3).Y, var26.Y, if fixWindowDragError then math.max(var26.Y, absoluteSize.Y - (var19:getValue() - var26.Y)) else absoluteSize.Y - (var19:getValue() - var26.Y))
						}
						current.Position = UDim2.fromOffset(t.X, t.Y)
						chromeAnalyticsModule.default:onWindowDrag(p1.integration.id, position_1)
					end
				end)
			end
		end
	end, { var21 })
	
	local var26 = function(p2)
		-- upvalues: var21 (ref), var17 (ref), var19 (ref)
		local parent = p2.Parent
		local offset = p2.Position.X.Offset
		local offset_1 = p2.Position.Y.Offset
		local var27 = var21()
		local absoluteSize = parent.AbsoluteSize
		
		return if offset >= var27.X then if absoluteSize.X - (var17:getValue() - var27.X) >= offset then if offset_1 >= var27.Y then absoluteSize.Y - (var19:getValue() - var27.Y) < offset_1 else true else true else true
	end
	
	local var27 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var8 (write), var26 (ref), var21 (ref), var17 (ref), var19 (ref), var22 (ref), var16 (ref), tweenService (copy)
		if var3 == nil or var3.current == nil then return end
		assert(var3.current ~= nil)
		assert(var3.current.Parent ~= nil)
		local current = var3.current
		local offset = current.Position.X.Offset
		local offset_1 = current.Position.Y.Offset
		
		if var8 and var8.PlaybackState == Enum.PlaybackState.Playing then
			var8:Cancel()
		end
		if not var26(current) then
			var22(UDim2.new(0, offset, 0, offset_1))
			
			return
		elseif current == nil then return end
		local var28 = var21()
		local absoluteSize = var3.current.Parent.AbsoluteSize
		local var29 = 0
		local var30 = 0
		
		if var17:getValue() < absoluteSize.X then
			var29 = math.clamp(offset, var28.X, absoluteSize.X - (var17:getValue() - var28.X))
		end
		if var19:getValue() < absoluteSize.Y then
			var30 = math.clamp(offset_1, var28.Y, absoluteSize.Y - (var19:getValue() - var28.Y))
		end
		local uDim2 = UDim2.new(0, var29, 0, var30)
		var22(uDim2)
		
		if p2 then
			current.Position = uDim2
			
			return
		end
		var16(true)
		var8 = tweenService:Create(current, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { Position = uDim2 })
		assert(var8 ~= nil)
		var8.Completed:Connect(function(_)
			-- upvalues: var16 (copy), var8 (copy)
			var16(false)
			var8 = nil
		end)
		var8:Play()
	end, { var21 })
	
	return reactRobloxModule.createPortal({
		Name = reactModule.createElement("ScreenGui", {
			Name = constantsModule.WINDOW_HOST_GUI_NAME .. ":" .. p0.integration.id,
			[reactModule.Change.AbsoluteSize] = debounceModule(function()
				-- upvalues: var27 (ref)
				var27()
			end, 0.2),
			DisplayOrder = if fFlagTopBarSignalizeMenuOpen and var13 then var13:map(function(p2)
				-- upvalues: chromeWindowLayoutOrder (ref)
				return if p2 then -1 else chromeWindowLayoutOrder
			end) elseif var14 then -1 else chromeWindowLayoutOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			WindowFrame = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = reactModule.joinBindings({ var17, var19 }):map(function(p2)
					-- upvalues: var27 (ref)
					var27(true)
					
					return UDim2.fromOffset(p2[1], p2[2])
				end),
				ref = var3,
				AnchorPoint = if p1.integration.integration.windowAnchorPoint then p1.integration.integration.windowAnchorPoint else nil
			}, {
				WindowWrapper = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					Integration = p1.integration.component(p1) or nil,
					InputShield = reactModule.createElement(interactable, {
						ZIndex = 3,
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Visible = var5
					}),
					InputWrapper = reactModule.createElement("Frame", {
						ZIndex = 4,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1,
						[reactModule.Event.InputBegan] = var25,
						[reactModule.Event.InputEnded] = reactModule.useCallback(function(_, p2)
							-- upvalues: var7 (write), var3 (ref), chromeAnalyticsModule (copy), p1 (ref), var26 (ref), var4 (write), var6 (ref), serviceModule (copy), var27 (ref)
							var7 = 0
							
							if p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
								if var3.current then
									chromeAnalyticsModule.default:onWindowTouchEnded(p1.integration.id, Vector2.new(var3.current.AbsolutePosition.X, var3.current.AbsolutePosition.Y), var26(var3.current))
								end
								if var4.current then
									var4.current:Disconnect()
									var4.current = nil
									var6(false)
									serviceModule:gesture(p1.integration.id, nil)
									var27()
								end
							end
						end, {}),
						[reactModule.Event.MouseEnter] = var23,
						[reactModule.Event.MouseLeave] = var24,
						[reactModule.Event.Destroying] = var24
					})
				})
			}),
			FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = useStyleSheet() })
		})
	}, coreGuiService)
end