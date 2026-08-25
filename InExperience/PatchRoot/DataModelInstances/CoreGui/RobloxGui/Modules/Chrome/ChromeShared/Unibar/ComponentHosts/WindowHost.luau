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
local var22 = false

return function(p0)
	-- upvalues: useWindowSizeModule (ref), reactModule (ref), fFlagTopBarSignalizeMenuOpen (ref), useSelector (ref), reactOtterModule (ref), t (ref), signalsModule (ref), coreGuiCommonModule (ref), settingsShowSignal (ref), serviceModule (ref), constantsModule (ref), chromeAnalyticsModule (ref), userInputService (ref), shouldRejectMultiTouchModule (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), getUIScale (ref), VRService (ref), var22 (write), mouseIconOverrideService (ref), selfieViewCursorOverride (ref), fixWindowDragStaleConnection (ref), fixWindowDragError (ref), tweenService (ref), chromeWindowLayoutOrder (ref), useStyleSheet (ref), reactRobloxModule (ref), debounceModule (ref), interactable (ref), coreGuiService (ref)
	local var23 = useWindowSizeModule(p0.integration.integration)
	local var24 = reactModule.useRef(nil)
	local var25 = reactModule.useRef(nil)
	local var26, var27 = reactModule.useBinding(false)
	local var28 = 0
	local var29 = reactModule.useMemo(function()
		return nil
	end, {})
	local var30, var31 = reactModule.useBinding(false)
	local var32, var33 = reactModule.useBinding(false)
	local var34 = if fFlagTopBarSignalizeMenuOpen then reactModule.joinBindings({ var30, var32 }):map(function(p1)
		return p1[1] or p1[2]
	end) else nil
	local var35 = if not fFlagTopBarSignalizeMenuOpen then useSelector(function(p2)
		return p2.displayOptions.menuOpen or p2.displayOptions.inspectMenuOpen
	end) else nil
	local var36, var37 = reactModule.useBinding(false)
	local var38, var39 = reactOtterModule.useAnimatedBinding(var23.X.Offset)
	local var40, var41 = reactOtterModule.useAnimatedBinding(var23.Y.Offset)
	local var42 = reactModule.useCallback(function()
		-- upvalues: var38 (ref), var40 (ref), p0 (ref)
		return Vector2.new(var38:getValue(), var40:getValue()) * (p0.integration.integration.windowAnchorPoint or Vector2.zero)
	end, { var38, var40, p0.integration })
	reactModule.useEffect(function()
		-- upvalues: var38 (ref), var39 (ref), reactOtterModule (copy), var23 (ref), t (copy)
		if var38:getValue() == 0 then
			var39(reactOtterModule.instant(var23.X.Offset))
			
			return
		end
		var39(reactOtterModule.spring(var23.X.Offset, t))
	end, { var23.X.Offset })
	reactModule.useEffect(function()
		-- upvalues: var40 (ref), var41 (ref), reactOtterModule (copy), var23 (ref), t (copy)
		if var40:getValue() == 0 then
			var41(reactOtterModule.instant(var23.Y.Offset))
			
			return
		end
		var41(reactOtterModule.spring(var23.Y.Offset, t))
	end, { var23.Y.Offset })
	
	if fFlagTopBarSignalizeMenuOpen then
		reactModule.useEffect(function()
			-- upvalues: signalsModule (copy), coreGuiCommonModule (copy), var33 (ref), settingsShowSignal (copy), var31 (ref)
			local var49 = signalsModule.createEffect(function(p3)
				-- upvalues: coreGuiCommonModule (copy), var33 (copy)
				var33(coreGuiCommonModule.Stores.GetInspectAndBuyStore(p3).getInspectAndBuyOpen(p3))
			end)
			settingsShowSignal:connect(function(p4)
				-- upvalues: var31 (copy)
				var31(p4)
			end)
			
			return function()
				-- upvalues: var49 (ref)
				var49()
			end
		end, {})
	end
	reactModule.useEffect(function()
		-- upvalues: serviceModule (copy), p0 (ref), var24 (ref), var25 (write), var27 (ref), var39 (ref), reactOtterModule (copy), constantsModule (copy), var41 (ref), var23 (ref), t (copy), chromeAnalyticsModule (copy), userInputService (copy), shouldRejectMultiTouchModule (copy), fFlagTokenizeUnibarConstantsWithStyleProvider (copy), getUIScale (copy)
		local connection = nil
		local inputObject = nil
		local id = serviceModule:dragConnection(p0.integration.id)
		
		if id then
			connection = id.connection
			inputObject = id.inputObject
		end
		assert(var24.current ~= nil)
		assert(var24.current.Parent ~= nil)
		local current = var24.current
		local absoluteSize = var24.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize
		
		if connection == nil then
			local var52
			local _ = nil
			
			if fFlagTokenizeUnibarConstantsWithStyleProvider and p0.position then
				local var53 = getUIScale(false)
				var52 = UDim2.new(p0.position.X.Scale, var53 * p0.position.X.Offset, p0.position.Y.Scale, var53 * p0.position.Y.Offset)
			else
				var52 = p0.position or UDim2.new()
			end
			if p0.integration.integration.cachePosition then
				local id_1 = serviceModule:windowPosition(p0.integration.id) or UDim2.new()
				current.Position = UDim2.new(0, (if id_1.X.Scale == 1 then absoluteSize.X else 0) + id_1.X.Offset, 0, id_1.Y.Offset)
			else
				current.Position = UDim2.new(0, (if var52.X.Scale == 1 then absoluteSize.X else 0) + var52.X.Offset, 0, var52.Y.Offset)
			end
		else
			var25 = connection
			var27(true)
			
			if var25 then
				var39(reactOtterModule.instant(constantsModule.WINDOW_ICON_SIZE))
				var41(reactOtterModule.instant(constantsModule.WINDOW_ICON_SIZE))
				task.defer(var39, reactOtterModule.spring(var23.X.Offset, t))
				task.defer(var41, reactOtterModule.spring(var23.Y.Offset, t))
				local vector3 = Vector3.new(var24.current.AbsolutePosition.X, var24.current.AbsolutePosition.Y, 0)
				chromeAnalyticsModule.default:setWindowDefaultPosition(p0.integration.id, Vector2.new(vector3.X, vector3.Y))
				var25.current = userInputService.InputChanged:Connect(function(p5, _)
					-- upvalues: shouldRejectMultiTouchModule (copy), inputObject (write), vector3 (ref), vector3 (ref), absoluteSize (ref), current (ref)
					local position = p5.Position
					
					if shouldRejectMultiTouchModule(inputObject, p5) then
						return
					end
					local var55 = position - vector3
					local t = {
						X = math.clamp((var55 + vector3).X, 0, absoluteSize.X),
						Y = math.clamp((var55 + vector3).Y, 0, absoluteSize.Y)
					}
					current.Position = UDim2.fromOffset(t.X, t.Y)
				end)
			end
		end
	end, {})
	local var43 = reactModule.useCallback(function(p6)
		-- upvalues: p0 (ref), serviceModule (copy)
		if p0.integration.integration.cachePosition then
			serviceModule:updateWindowPosition(p0.integration.id, p6)
		end
	end, { p0.integration })
	local var44 = reactModule.useCallback(function()
		-- upvalues: VRService (copy), var22 (copy), mouseIconOverrideService (copy), selfieViewCursorOverride (copy)
		if not VRService.VREnabled then
			var22 = true
			mouseIconOverrideService.push(selfieViewCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
		end
	end)
	local var45 = reactModule.useCallback(function()
		-- upvalues: var22 (copy), mouseIconOverrideService (copy), selfieViewCursorOverride (copy)
		if var22 then
			var22 = false
			mouseIconOverrideService.pop(selfieViewCursorOverride)
		end
	end)
	local var46 = reactModule.useCallback(function(_, p7)
		-- upvalues: var24 (ref), var42 (ref), chromeAnalyticsModule (copy), p0 (ref), fixWindowDragStaleConnection (copy), var25 (write), var27 (ref), var36 (ref), fixWindowDragError (copy), var38 (ref), var40 (ref), userInputService (copy), shouldRejectMultiTouchModule (copy), var28 (write), constantsModule (copy)
		assert(var24.current ~= nil)
		assert(var24.current.Parent ~= nil)
		local current = var24.current
		local absoluteSize = var24.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize
		local var57 = var42()
		local position = p7.Position
		local vector3 = Vector3.new(var24.current.AbsolutePosition.X + var57.X, var24.current.AbsolutePosition.Y + var57.Y, 0)
		
		if p7.UserInputType == Enum.UserInputType.MouseButton1 or p7.UserInputType == Enum.UserInputType.Touch then
			chromeAnalyticsModule.default:onWindowTouchBegan(p0.integration.id, Vector2.new(var24.current.AbsolutePosition.X, var24.current.AbsolutePosition.Y))
			
			if fixWindowDragStaleConnection and var25.current then
				var25.current:Disconnect()
				var25.current = nil
				var27(false)
			end
			if (if fixWindowDragStaleConnection then true else not var25.current) and not var36:getValue() then
				local t = {
					X = math.clamp(vector3.X, 0, if fixWindowDragError then math.max(0, absoluteSize.X - (var38:getValue() - var57.X)) else absoluteSize.X - (var38:getValue() - var57.X)),
					Y = math.clamp(vector3.Y, 0, if fixWindowDragError then math.max(0, absoluteSize.Y - (var40:getValue() - var57.Y)) else absoluteSize.Y - (var40:getValue() - var57.Y))
				}
				current.Position = UDim2.fromOffset(t.X, t.Y)
				var25.current = userInputService.InputChanged:Connect(function(p8, _)
					-- upvalues: shouldRejectMultiTouchModule (copy), p7 (ref), position (ref), var28 (copy), fixWindowDragStaleConnection (copy), constantsModule (copy), var27 (copy), vector3 (ref), var57 (ref), fixWindowDragError (copy), absoluteSize (ref), var38 (copy), var40 (copy), current (ref), chromeAnalyticsModule (copy), p0 (copy)
					if shouldRejectMultiTouchModule(p7, p8) then return end
					local position_1 = p8.Position
					local var60 = position_1 - position
					var28 = if fixWindowDragStaleConnection then var60.Magnitude else var28 + var60.Magnitude
					
					if constantsModule.WINDOW_MIN_DRAG_DISTANCE < var28 then
						var27(true)
						local t = {
							X = math.clamp((var60 + vector3).X, var57.X, if fixWindowDragError then math.max(var57.X, absoluteSize.X - (var38:getValue() - var57.X)) else absoluteSize.X - (var38:getValue() - var57.X)),
							Y = math.clamp((var60 + vector3).Y, var57.Y, if fixWindowDragError then math.max(var57.Y, absoluteSize.Y - (var40:getValue() - var57.Y)) else absoluteSize.Y - (var40:getValue() - var57.Y))
						}
						current.Position = UDim2.fromOffset(t.X, t.Y)
						chromeAnalyticsModule.default:onWindowDrag(p0.integration.id, position_1)
					end
				end)
			end
		end
	end, { var42 })
	
	local var47 = function(p9)
		-- upvalues: var42 (ref), var38 (ref), var40 (ref)
		local parent = p9.Parent
		local offset = p9.Position.X.Offset
		local offset_1 = p9.Position.Y.Offset
		local var62 = var42()
		local absoluteSize = parent.AbsoluteSize
		
		return if offset >= var62.X then if absoluteSize.X - (var38:getValue() - var62.X) >= offset then if offset_1 >= var62.Y then absoluteSize.Y - (var40:getValue() - var62.Y) < offset_1 else true else true else true
	end
	
	local var48 = reactModule.useCallback(function(p10)
		-- upvalues: var24 (ref), var29 (write), var47 (ref), var42 (ref), var38 (ref), var40 (ref), var43 (ref), var37 (ref), tweenService (copy)
		if var24 == nil or var24.current == nil then return end
		assert(var24.current ~= nil)
		assert(var24.current.Parent ~= nil)
		local current = var24.current
		local offset = current.Position.X.Offset
		local offset_1 = current.Position.Y.Offset
		
		if var29 and var29.PlaybackState == Enum.PlaybackState.Playing then
			var29:Cancel()
		end
		if not var47(current) then
			var43(UDim2.new(0, offset, 0, offset_1))
			
			return
		elseif current == nil then return end
		local var63 = var42()
		local absoluteSize = var24.current.Parent.AbsoluteSize
		local var64 = 0
		local var65 = 0
		
		if var38:getValue() < absoluteSize.X then
			var64 = math.clamp(offset, var63.X, absoluteSize.X - (var38:getValue() - var63.X))
		end
		if var40:getValue() < absoluteSize.Y then
			var65 = math.clamp(offset_1, var63.Y, absoluteSize.Y - (var40:getValue() - var63.Y))
		end
		local uDim2 = UDim2.new(0, var64, 0, var65)
		var43(uDim2)
		
		if p10 then
			current.Position = uDim2
			
			return
		end
		var37(true)
		var29 = tweenService:Create(current, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { Position = uDim2 })
		assert(var29 ~= nil)
		var29.Completed:Connect(function(_)
			-- upvalues: var37 (copy), var29 (copy)
			var37(false)
			var29 = nil
		end)
		var29:Play()
	end, { var42 })
	
	return reactRobloxModule.createPortal({
		Name = reactModule.createElement("ScreenGui", {
			Name = constantsModule.WINDOW_HOST_GUI_NAME .. ":" .. p0.integration.id,
			[reactModule.Change.AbsoluteSize] = debounceModule(function()
				-- upvalues: var48 (ref)
				var48()
			end, 0.2),
			DisplayOrder = if fFlagTopBarSignalizeMenuOpen and var34 then var34:map(function(p11)
				-- upvalues: chromeWindowLayoutOrder (ref)
				return if p11 then -1 else chromeWindowLayoutOrder
			end) elseif var35 then -1 else chromeWindowLayoutOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			WindowFrame = reactModule.createElement("Frame", {
				LayoutOrder = 1,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = reactModule.joinBindings({ var38, var40 }):map(function(p12)
					-- upvalues: var48 (ref)
					var48(true)
					
					return UDim2.fromOffset(p12[1], p12[2])
				end),
				ref = var24,
				AnchorPoint = if p0.integration.integration.windowAnchorPoint then p0.integration.integration.windowAnchorPoint else nil
			}, {
				WindowWrapper = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					Integration = p0.integration.component(p0) or nil,
					InputShield = reactModule.createElement(interactable, {
						ZIndex = 3,
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Visible = var26
					}),
					InputWrapper = reactModule.createElement("Frame", {
						ZIndex = 4,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1,
						[reactModule.Event.InputBegan] = var46,
						[reactModule.Event.InputEnded] = reactModule.useCallback(function(_, p13)
							-- upvalues: var28 (write), var24 (ref), chromeAnalyticsModule (copy), p0 (ref), var47 (ref), var25 (write), var27 (ref), serviceModule (copy), var48 (ref)
							var28 = 0
							
							if p13.UserInputType == Enum.UserInputType.MouseButton1 or p13.UserInputType == Enum.UserInputType.Touch then
								if var24.current then
									chromeAnalyticsModule.default:onWindowTouchEnded(p0.integration.id, Vector2.new(var24.current.AbsolutePosition.X, var24.current.AbsolutePosition.Y), var47(var24.current))
								end
								if var25.current then
									var25.current:Disconnect()
									var25.current = nil
									var27(false)
									serviceModule:gesture(p0.integration.id, nil)
									var48()
								end
							end
						end, {}),
						[reactModule.Event.MouseEnter] = var44,
						[reactModule.Event.MouseLeave] = var45,
						[reactModule.Event.Destroying] = var45
					})
				})
			}),
			FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = useStyleSheet() })
		})
	}, coreGuiService)
end