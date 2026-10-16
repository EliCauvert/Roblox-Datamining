local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VRService = game:GetService("VRService")
local ReactOtterModule = require(CorePackages.Packages.ReactOtter)
local SignalsModule = require(CorePackages.Packages.Signals)
local GetUIScaleFunction = require(CorePackages.Workspace.Packages.Display).GetDisplayStore(false).getUIScale
local Interactable = require(CorePackages.Packages.UIBlox).Core.Control.Interactable
local UseStyleSheetFunction = require(CorePackages.Packages.Foundation).Hooks.useStyleSheet
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local SelfieViewCursorOverride = require(CorePackages.Workspace.Packages.AppCommonLib).Symbol.named("SelfieViewCursorOverride")
local DebounceModule = require(ChromeShared.Utility.debounce)
local ServiceModule = require(ChromeShared.Service)
local ConstantsModule = require(ChromeShared.Unibar.Constants)
local _ = require(CorePackages.Workspace.Packages.Chrome)
local ChromeAnalyticsModule = require(ChromeShared.Analytics.ChromeAnalytics)
local ShouldRejectMultiTouchModule = require(ChromeShared.Utility.shouldRejectMultiTouch)
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagTopBarSignalizeMenuOpen = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ChromeWindowLayoutOrder = game:DefineFastInt("ChromeWindowLayoutOrder", 2)
local FixWindowDragError = game:DefineFastFlag("FixWindowDragError", false)
local FixWindowDragStaleConnection = game:DefineFastFlag("FixWindowDragStaleConnection", false)
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local UseWindowSizeModule = require(ChromeShared.Hooks.useWindowSize)
local config = { dampingRatio = 1, frequency = 3 }
local Flag = false

return function(p1) --[[ Line: 71 ]]
	-- upvalues: UseWindowSizeModule (copy), ReactModule (copy), FFlagTopBarSignalizeMenuOpen (copy), UseSelectorFunction (copy), ReactOtterModule (copy), config (copy), SignalsModule (copy), CoreGuiCommonModule (copy), SettingsShowSignal (copy), ServiceModule (copy), ConstantsModule (copy), ChromeAnalyticsModule (copy), UserInputService (copy), ShouldRejectMultiTouchModule (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), GetUIScaleFunction (copy), VRService (copy), Flag (ref), MouseIconOverrideService (copy), SelfieViewCursorOverride (copy), FixWindowDragStaleConnection (copy), FixWindowDragError (copy), TweenService (copy), ChromeWindowLayoutOrder (copy), UseStyleSheetFunction (copy), ReactRobloxModule (copy), DebounceModule (copy), Interactable (copy), CoreGui (copy)
	local UseWindowSizeModuleResult = UseWindowSizeModule(p1.integration.integration)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local Magnitude = 0
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 77 ]]
		return nil
	end, {})
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(false)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(false)
	local MapResult = if FFlagTopBarSignalizeMenuOpen then ReactModule.joinBindings({ UseBindingResult1, UseBindingResult3 }):map(function(Entry) --[[ Line: 85 ]]
		return Entry[1] or Entry[2]
	end) else nil
	local UseSelectorResult = if FFlagTopBarSignalizeMenuOpen then nil else UseSelectorFunction(function(p2) --[[ Line: 91 ]]
		return p2.displayOptions.menuOpen or p2.displayOptions.inspectMenuOpen
	end)
	local UseBindingResult4, UseBindingResult2_3 = ReactModule.useBinding(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(UseWindowSizeModuleResult.X.Offset)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(UseWindowSizeModuleResult.Y.Offset)
	local UseResult = ReactModule.useCallback(function(): Vector2 --[[ Line: 102 ]]
		-- upvalues: UseAnimatedBindingResult (copy), UseAnimatedBindingResult1 (copy), p1 (copy)
		return Vector2.new(UseAnimatedBindingResult:getValue(), UseAnimatedBindingResult1:getValue()) * (p1.integration.integration.windowAnchorPoint or Vector2.zero)
	end, {
		UseAnimatedBindingResult,
		UseAnimatedBindingResult1,
		p1.integration
	})
	ReactModule.useEffect(function() --[[ Line: 107 ]]
		-- upvalues: UseAnimatedBindingResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseWindowSizeModuleResult (copy), config (upval)
		if UseAnimatedBindingResult:getValue() == 0 then
			UseAnimatedBindingResult2((ReactOtterModule.instant(UseWindowSizeModuleResult.X.Offset)))
			
			return
		else
			UseAnimatedBindingResult2(ReactOtterModule.spring(UseWindowSizeModuleResult.X.Offset, config))
		end
	end, { UseWindowSizeModuleResult.X.Offset })
	ReactModule.useEffect(function() --[[ Line: 115 ]]
		-- upvalues: UseAnimatedBindingResult1 (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval), UseWindowSizeModuleResult (copy), config (upval)
		if UseAnimatedBindingResult1:getValue() == 0 then
			UseAnimatedBindingResult2_1((ReactOtterModule.instant(UseWindowSizeModuleResult.Y.Offset)))
			
			return
		else
			UseAnimatedBindingResult2_1(ReactOtterModule.spring(UseWindowSizeModuleResult.Y.Offset, config))
		end
	end, { UseWindowSizeModuleResult.Y.Offset })
	
	if FFlagTopBarSignalizeMenuOpen then
		ReactModule.useEffect(function() --[[ Line: 124 ]]
			-- upvalues: SignalsModule (upval), CoreGuiCommonModule (upval), UseBindingResult2_2 (copy), SettingsShowSignal (upval), UseBindingResult2_1 (copy)
			local Effect = SignalsModule.createEffect(function(p2) --[[ Line: 125 ]]
				-- upvalues: CoreGuiCommonModule (upval), UseBindingResult2_2 (upval)
				UseBindingResult2_2((CoreGuiCommonModule.Stores.GetInspectAndBuyStore(p2).getInspectAndBuyOpen(p2)))
			end)
			SettingsShowSignal:connect(function(p2) --[[ Line: 130 ]]
				-- upvalues: UseBindingResult2_1 (upval)
				UseBindingResult2_1(p2)
			end)
			
			return function() --[[ Line: 134 ]]
				-- upvalues: Effect (copy)
				Effect()
			end
		end, {})
	end
	ReactModule.useEffect(function() --[[ Line: 144 ]]
		-- upvalues: ServiceModule (upval), p1 (copy), UseRefResult (copy), UseRefResult1 (ref), UseBindingResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), ConstantsModule (upval), UseAnimatedBindingResult2_1 (copy), UseWindowSizeModuleResult (copy), config (upval), ChromeAnalyticsModule (upval), UserInputService (upval), ShouldRejectMultiTouchModule (upval), FFlagTokenizeUnibarConstantsWithStyleProvider (upval), GetUIScaleFunction (upval)
		local Connection = nil
		local InputObject = nil
		local DragConnectionResult = ServiceModule:dragConnection(p1.integration.id)
		
		if DragConnectionResult then
			Connection = DragConnectionResult.connection
			InputObject = DragConnectionResult.inputObject
		end
		assert(UseRefResult.current ~= nil)
		assert(UseRefResult.current.Parent ~= nil)
		local Current = UseRefResult.current
		local AbsoluteSize = UseRefResult.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize
		
		if Connection == nil then
			local Position = nil
			if FFlagTokenizeUnibarConstantsWithStyleProvider and p1.position then
				local UIScale = GetUIScaleFunction(false)
				Position = UDim2.new(p1.position.X.Scale, UIScale * p1.position.X.Offset, p1.position.Y.Scale, UIScale * p1.position.Y.Offset)
			else
				Position = p1.position or UDim2.new()
			end
			if p1.integration.integration.cachePosition then
				local WindowPositionResult = ServiceModule:windowPosition(p1.integration.id) or UDim2.new()
				Current.Position = UDim2.new(0, (if WindowPositionResult.X.Scale == 1 then AbsoluteSize.X else 0) + WindowPositionResult.X.Offset, 0, WindowPositionResult.Y.Offset)
			else
				Current.Position = UDim2.new(0, (if Position.X.Scale == 1 then AbsoluteSize.X else 0) + Position.X.Offset, 0, Position.Y.Offset)
			end
		else
			UseRefResult1 = Connection
			UseBindingResult2(true)
			
			if UseRefResult1 then
				UseAnimatedBindingResult2((ReactOtterModule.instant(ConstantsModule.WINDOW_ICON_SIZE)))
				UseAnimatedBindingResult2_1((ReactOtterModule.instant(ConstantsModule.WINDOW_ICON_SIZE)))
				task.defer(UseAnimatedBindingResult2, ReactOtterModule.spring(UseWindowSizeModuleResult.X.Offset, config))
				task.defer(UseAnimatedBindingResult2_1, ReactOtterModule.spring(UseWindowSizeModuleResult.Y.Offset, config))
				local _Vector3 = Vector3.new(UseRefResult.current.AbsolutePosition.X, UseRefResult.current.AbsolutePosition.Y, 0)
				ChromeAnalyticsModule.default:setWindowDefaultPosition(p1.integration.id, Vector2.new(_Vector3.X, _Vector3.Y))
				UseRefResult1.current = UserInputService.InputChanged:Connect(function(Input, _) --[[ Line: 179 ]]
					-- upvalues: ShouldRejectMultiTouchModule (upval), InputObject (ref), _Vector3 (copy), _Vector3 (copy), AbsoluteSize (copy), Current (copy)
					local Position = Input.Position
					
					if not ShouldRejectMultiTouchModule(InputObject, Input) then
						local PositionDelta = Position - _Vector3
						local config = {
							X = math.clamp((PositionDelta + _Vector3).X, 0, AbsoluteSize.X),
							Y = math.clamp((PositionDelta + _Vector3).Y, 0, AbsoluteSize.Y)
						}
						Current.Position = UDim2.fromOffset(config.X, config.Y)
						
						return
					end
				end)
			end
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 220 ]]
		-- upvalues: p1 (copy), ServiceModule (upval)
		if p1.integration.integration.cachePosition then
			ServiceModule:updateWindowPosition(p1.integration.id, p2)
		end
	end, { p1.integration })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 233 ]]
		-- upvalues: Flag (upval), MouseIconOverrideService (upval), SelfieViewCursorOverride (upval)
		if Flag then
			Flag = false
			MouseIconOverrideService.pop(SelfieViewCursorOverride)
		end
	end)
	
	local function v51(Current): boolean --[[ Line: 346 ]]
		-- upvalues: UseResult (copy), UseAnimatedBindingResult (copy), UseAnimatedBindingResult1 (copy)
		local Parent = Current.Parent
		local Offset = Current.Position.X.Offset
		local Offset1 = Current.Position.Y.Offset
		local UseResultResult = UseResult()
		local AbsoluteSize = Parent.AbsoluteSize
		
		return Offset < UseResultResult.X or (AbsoluteSize.X - (UseAnimatedBindingResult:getValue() - UseResultResult.X) < Offset or (Offset1 < UseResultResult.Y or AbsoluteSize.Y - (UseAnimatedBindingResult1:getValue() - UseResultResult.Y) < Offset1))
	end
	
	local UseResult3 = ReactModule.useCallback(function(p2) --[[ Line: 363 ]]
		-- upvalues: UseRefResult (copy), UseMemoResult (ref), v51 (copy), UseResult (copy), UseAnimatedBindingResult (copy), UseAnimatedBindingResult1 (copy), UseResult1 (copy), UseBindingResult2_3 (copy), TweenService (upval)
		if UseRefResult == nil or UseRefResult.current == nil then return end
		assert(UseRefResult.current ~= nil)
		assert(UseRefResult.current.Parent ~= nil)
		local Current = UseRefResult.current
		local Offset: number = Current.Position.X.Offset
		local Offset1: number = Current.Position.Y.Offset
		
		if UseMemoResult and UseMemoResult.PlaybackState == Enum.PlaybackState.Playing then
			UseMemoResult:Cancel()
		end
		if not v51(Current) then
			UseResult1(UDim2.new(0, Offset, 0, Offset1))
			
			return
		end
		if Current == nil then return end
		local Parent = UseRefResult.current.Parent
		local UseResultResult = UseResult()
		local AbsoluteSize = Parent.AbsoluteSize
		local XOffset = 0
		local YOffset = 0
		
		if UseAnimatedBindingResult:getValue() < AbsoluteSize.X then
			XOffset = math.clamp(Offset, UseResultResult.X, AbsoluteSize.X - (UseAnimatedBindingResult:getValue() - UseResultResult.X))
		end
		if UseAnimatedBindingResult1:getValue() < AbsoluteSize.Y then
			YOffset = math.clamp(Offset1, UseResultResult.Y, AbsoluteSize.Y - (UseAnimatedBindingResult1:getValue() - UseResultResult.Y))
		end
		local _UDim2 = UDim2.new(0, XOffset, 0, YOffset)
		UseResult1(_UDim2)
		
		if p2 then
			Current.Position = _UDim2
			
			return
		else
			UseBindingResult2_3(true)
			UseMemoResult = TweenService:Create(Current, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { Position = _UDim2 })
			assert(UseMemoResult ~= nil)
			UseMemoResult.Completed:Connect(function(_) --[[ Line: 417 ]]
				-- upvalues: UseBindingResult2_3 (upval), UseMemoResult (upval)
				UseBindingResult2_3(false)
				UseMemoResult = nil
			end)
			UseMemoResult:Play()
		end
	end, { UseResult })
	
	return ReactRobloxModule.createPortal({
		Name = ReactModule.createElement("ScreenGui", {
			Name = ConstantsModule.WINDOW_HOST_GUI_NAME .. ":" .. p1.integration.id,
			[ReactModule.Change.AbsoluteSize] = DebounceModule(function() --[[ Line: 463 ]]
				-- upvalues: UseResult3 (copy)
				UseResult3()
			end, 0.2),
			DisplayOrder = if FFlagTopBarSignalizeMenuOpen and MapResult then MapResult:map(function(p2) --[[ Line: 467 ]]
				-- upvalues: ChromeWindowLayoutOrder (copy)
				return if p2 then -1 else ChromeWindowLayoutOrder
			end) elseif UseSelectorResult then -1 else ChromeWindowLayoutOrder,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			WindowFrame = ReactModule.createElement("Frame", {
				LayoutOrder = 1,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = ReactModule.joinBindings({ UseAnimatedBindingResult, UseAnimatedBindingResult1 }):map(function(Entry): UDim2 --[[ Line: 475 ]]
					-- upvalues: UseResult3 (copy)
					UseResult3(true)
					
					return UDim2.fromOffset(Entry[1], Entry[2])
				end),
				ref = UseRefResult,
				AnchorPoint = if p1.integration.integration.windowAnchorPoint then p1.integration.integration.windowAnchorPoint else nil
			}, {
				WindowWrapper = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					Integration = p1.integration.component(p1) or nil,
					InputShield = ReactModule.createElement(Interactable, {
						ZIndex = 3,
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						Visible = UseBindingResult
					}),
					InputWrapper = ReactModule.createElement("Frame", {
						ZIndex = 4,
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1,
						[ReactModule.Event.InputBegan] = ReactModule.useCallback(function(_, Input) --[[ Line: 240 ]]
							-- upvalues: UseRefResult (copy), UseResult (copy), ChromeAnalyticsModule (upval), p1 (copy), FixWindowDragStaleConnection (upval), UseRefResult1 (ref), UseBindingResult2 (copy), UseBindingResult4 (copy), FixWindowDragError (upval), UseAnimatedBindingResult (copy), UseAnimatedBindingResult1 (copy), UserInputService (upval), ShouldRejectMultiTouchModule (upval), Magnitude (ref), ConstantsModule (upval)
							assert(UseRefResult.current ~= nil)
							assert(UseRefResult.current.Parent ~= nil)
							local Current = UseRefResult.current
							local AbsoluteSize = UseRefResult.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize
							local UseResultResult = UseResult()
							local Position = Input.Position
							local _Vector3 = Vector3.new(UseRefResult.current.AbsolutePosition.X + UseResultResult.X, UseRefResult.current.AbsolutePosition.Y + UseResultResult.Y, 0)
							
							if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
								ChromeAnalyticsModule.default:onWindowTouchBegan(p1.integration.id, Vector2.new(UseRefResult.current.AbsolutePosition.X, UseRefResult.current.AbsolutePosition.Y))
								
								if FixWindowDragStaleConnection and UseRefResult1.current then
									UseRefResult1.current:Disconnect()
									UseRefResult1.current = nil
									UseBindingResult2(false)
								end
								if (if FixWindowDragStaleConnection then true else not UseRefResult1.current) and not UseBindingResult4:getValue() then
									local config = {
										X = math.clamp(_Vector3.X, 0, if FixWindowDragError then math.max(0, AbsoluteSize.X - (UseAnimatedBindingResult:getValue() - UseResultResult.X)) else AbsoluteSize.X - (UseAnimatedBindingResult:getValue() - UseResultResult.X)),
										Y = math.clamp(_Vector3.Y, 0, if FixWindowDragError then math.max(0, AbsoluteSize.Y - (UseAnimatedBindingResult1:getValue() - UseResultResult.Y)) else AbsoluteSize.Y - (UseAnimatedBindingResult1:getValue() - UseResultResult.Y))
									}
									Current.Position = UDim2.fromOffset(config.X, config.Y)
									UseRefResult1.current = UserInputService.InputChanged:Connect(function(Input1, _) --[[ Line: 300 ]]
										-- upvalues: ShouldRejectMultiTouchModule (upval), Input (copy), Position (copy), Magnitude (upval), FixWindowDragStaleConnection (upval), ConstantsModule (upval), UseBindingResult2 (upval), _Vector3 (copy), UseResultResult (copy), FixWindowDragError (upval), AbsoluteSize (copy), UseAnimatedBindingResult (upval), UseAnimatedBindingResult1 (upval), Current (copy), ChromeAnalyticsModule (upval), p1 (upval)
										if ShouldRejectMultiTouchModule(Input, Input1) then return end
										local Position1 = Input1.Position
										local PositionDelta = Position1 - Position
										Magnitude = if FixWindowDragStaleConnection then PositionDelta.Magnitude else Magnitude + PositionDelta.Magnitude
										
										if ConstantsModule.WINDOW_MIN_DRAG_DISTANCE < Magnitude then
											UseBindingResult2(true)
											local config = {
												X = math.clamp((PositionDelta + _Vector3).X, UseResultResult.X, if FixWindowDragError then math.max(UseResultResult.X, AbsoluteSize.X - (UseAnimatedBindingResult:getValue() - UseResultResult.X)) else AbsoluteSize.X - (UseAnimatedBindingResult:getValue() - UseResultResult.X)),
												Y = math.clamp((PositionDelta + _Vector3).Y, UseResultResult.Y, if FixWindowDragError then math.max(UseResultResult.Y, AbsoluteSize.Y - (UseAnimatedBindingResult1:getValue() - UseResultResult.Y)) else AbsoluteSize.Y - (UseAnimatedBindingResult1:getValue() - UseResultResult.Y))
											}
											Current.Position = UDim2.fromOffset(config.X, config.Y)
											ChromeAnalyticsModule.default:onWindowDrag(p1.integration.id, Position1)
										end
									end)
								end
							end
						end, { UseResult }),
						[ReactModule.Event.InputEnded] = ReactModule.useCallback(function(_, Input) --[[ Line: 430 ]]
							-- upvalues: Magnitude (ref), UseRefResult (copy), ChromeAnalyticsModule (upval), p1 (copy), v51 (copy), UseRefResult1 (ref), UseBindingResult2 (copy), ServiceModule (upval), UseResult3 (copy)
							Magnitude = 0
							
							if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
								if UseRefResult.current then
									ChromeAnalyticsModule.default:onWindowTouchEnded(p1.integration.id, Vector2.new(UseRefResult.current.AbsolutePosition.X, UseRefResult.current.AbsolutePosition.Y), (v51(UseRefResult.current)))
								end
								if UseRefResult1.current then
									UseRefResult1.current:Disconnect()
									UseRefResult1.current = nil
									UseBindingResult2(false)
									ServiceModule:gesture(p1.integration.id, nil)
									UseResult3()
								end
							end
						end, {}),
						[ReactModule.Event.MouseEnter] = ReactModule.useCallback(function() --[[ Line: 226 ]]
							-- upvalues: VRService (upval), Flag (upval), MouseIconOverrideService (upval), SelfieViewCursorOverride (upval)
							if not VRService.VREnabled then
								Flag = true
								MouseIconOverrideService.push(SelfieViewCursorOverride, Enum.OverrideMouseIconBehavior.ForceShow)
							end
						end),
						[ReactModule.Event.MouseLeave] = UseResult2,
						[ReactModule.Event.Destroying] = UseResult2
					})
				})
			}),
			FoundationStyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetFunction() })
		})
	}, CoreGui)
end