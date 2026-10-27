local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local ReactModule = require(CorePackages.Packages.React)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagDebugEnableUnibarDummyIntegrationsFunction = SharedFlagsModule.GetFFlagDebugEnableUnibarDummyIntegrations
local GetFIntIconSelectionTimeout = SharedFlagsModule.GetFIntIconSelectionTimeout
local GetFFlagChromeCentralizedConfigurationFunction = SharedFlagsModule.GetFFlagChromeCentralizedConfiguration
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagAddUILessMode = SharedFlagsModule.FFlagAddUILessMode
local FIntAddUILessModeVariant = SharedFlagsModule.FIntAddUILessModeVariant
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local FFlagUnibarMenuOpenSubmenu = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local FFlagEnablePlaytestModeUnibar = SharedFlagsModule.FFlagEnablePlaytestModeUnibar
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local PlaytestModeThemeProviderModule = require(ChromeShared.Unibar.PlaytestModeThemeProvider)
local ServiceModule = require(ChromeShared.Service)
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle

if not GetFFlagChromeCentralizedConfigurationFunction() then
	local _ = require(ChromeShared.Parent.Integrations)
end
local SubMenuModule = require(ChromeShared.Unibar.SubMenu)
local WindowManagerModule = require(ChromeShared.Unibar.WindowManager)
local ShortcutBarModule = require(ChromeShared.Shortcuts.ShortcutBar)
local ConstantsModule = require(ChromeShared.Unibar.Constants)
local BuildMenuOrderModule = require(ChromeShared.Unibar.buildMenuOrder)
local UseChromeMenuItemsModule = require(ChromeShared.Hooks.useChromeMenuItems)
local UseObservableValueModule = require(ChromeShared.Hooks.useObservableValue)
local UseMappedObservableValueModule = require(ChromeShared.Hooks.useMappedObservableValue)
local IconHostModule = require(ChromeShared.Unibar.ComponentHosts.IconHost)
local ReactOtterModule = require(CorePackages.Packages.ReactOtter)
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local FFlagReduceTopBarInsetsWhileHidden = SharedFlagsModule.FFlagReduceTopBarInsetsWhileHidden
local Stores = require(CorePackages.Workspace.Packages.CoreGuiCommon).Stores
local CreateEffectFunction = require(CorePackages.Packages.Signals).createEffect
local ConstantsModule1 = require(ChromeShared.Parent.Integrations.Party.Constants)
local IsConnectUnibarEnabledModule = require(ChromeShared.Parent.Integrations.Connect.isConnectUnibarEnabled)
local GamepadConnectorModule = if FFlagEnableConsoleExpControls then require(ChromeShared.Parent.Parent.TopBar.Components.GamepadConnector) else nil
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local Panel3DInSpatialUI = nil
local PanelType = nil
local NewResult = nil

if IsInExperienceUIVREnabled then
	local VrSpatialUiModule = require(CorePackages.Workspace.Packages.VrSpatialUi)
	Panel3DInSpatialUI = VrSpatialUiModule.Panel3DInSpatialUI
	PanelType = VrSpatialUiModule.Constants.PanelType
	NewResult = require(CorePackages.Workspace.Packages.Observable).ObservableValue.new(true)
end
if not GetFFlagChromeCentralizedConfigurationFunction() then
	function configureUnibar()
		-- upvalues: BuildMenuOrderModule (copy), GetFFlagDebugEnableUnibarDummyIntegrationsFunction (copy), IsConnectUnibarEnabledModule (copy), ConstantsModule1 (copy), FFlagAppNavMyStatsTab (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), ServiceModule (copy)
		local MenuOrderModule = BuildMenuOrderModule()
		local List = { "nine_dot", "chat", "toggle_mic_mute" }
		table.insert(List, 3, "join_voice")
		
		if GetFFlagDebugEnableUnibarDummyIntegrationsFunction() then
			table.insert(List, "dummy_window")
			table.insert(List, "dummy_window_2")
		end
		if IsConnectUnibarEnabledModule() then
			table.insert(List, "party_entrypoint")
		end
		local FoundIndex: number? = table.find(List, "toggle_mic_mute")
		
		if FoundIndex then
			table.insert(List, FoundIndex, ConstantsModule1.TOGGLE_MIC_INTEGRATION_ID)
		end
		if FFlagAppNavMyStatsTab then
			table.insert(List, "assistant_build")
		end
		if IsInExperienceUIVREnabled and IsSpatialFunction() then
			ServiceModule:configureMenu({ { "vr_toggle_button", "vr_safety_bubble" }, List })
		else
			ServiceModule:configureMenu({ List })
		end
		ServiceModule:configureSubMenu("nine_dot", MenuOrderModule)
	end
	
	configureUnibar()
	
	if FFlagEnableConsoleExpControls then
		require(script.Parent.Parent.Shortcuts.ConfigureShortcuts)()
	end
end
function IconDivider(p1)
	-- upvalues: UseStyleFunction (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), ReactModule (copy)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Position = p1.position,
		Size = UDim2.new(0, ConstantsModule.DIVIDER_CELL_WIDTH, 1, 0)
	}, {
		DividerBar = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_DIVIDER_POSITION else ConstantsModule.ICON_DIVIDER_POSITION,
			AnchorPoint = Vector2.new(0, 0.5),
			Size = ConstantsModule.ICON_DIVIDER_SIZE,
			BackgroundColor3 = UseStyleResult.Theme.Divider.Color,
			BackgroundTransparency = if p1.toggleTransition then p1.toggleTransition:map(function(p2: number): number
				-- upvalues: UseStyleResult (copy)
				return UseStyleResult.Theme.Divider.Transparency + (1 - p2) * (1 - UseStyleResult.Theme.Divider.Transparency)
			end) else UseStyleResult.Theme.Divider.Transparency,
			Visible = p1.visible or true
		})
	})
end

local function _(p1, p2)
	-- upvalues: ConstantsModule (copy)
	return p1.current:FindFirstChild(ConstantsModule.ICON_NAME_PREFIX .. tostring(p2), true)
end

function AnimationStateHelper(p1)
	-- upvalues: UseObservableValueModule (copy), ServiceModule (copy), ReactModule (copy), FFlagEnableConsoleExpControls (copy), ContextActionService (copy), GuiService (copy), ConstantsModule (copy), FFlagUnibarMenuOpenSubmenu (copy), ReactOtterModule (copy), GetFIntIconSelectionTimeout (copy)
	local UseObservableValueModuleResult = UseObservableValueModule(ServiceModule:currentSubMenu())
	local UseObservableValueModuleResult1 = UseObservableValueModule(ServiceModule:selectedItem())
	local UseObservableValueModuleResult2 = UseObservableValueModule(ServiceModule:inFocusNav())
	ReactModule.useEffect(function()
		-- upvalues: UseObservableValueModuleResult2 (copy), FFlagEnableConsoleExpControls (upval), ContextActionService (upval), ServiceModule (upval), GuiService (upval), p1 (copy), UseObservableValueModuleResult1 (copy), ConstantsModule (upval), FFlagUnibarMenuOpenSubmenu (upval)
		if UseObservableValueModuleResult2 then
			if not FFlagEnableConsoleExpControls then
				ContextActionService:BindCoreAction("RBXEscapeUnibar", function(_, UserInputState, _)
					-- upvalues: FFlagEnableConsoleExpControls (upval), ServiceModule (upval), GuiService (upval)
					if not FFlagEnableConsoleExpControls then
						ServiceModule:disableFocusNav()
					elseif UserInputState == Enum.UserInputState.End then
						ServiceModule:disableFocusNav()
						GuiService.SelectedCoreObject = nil
						
						return
					end
				end, false, Enum.KeyCode.ButtonB)
			end
			if FFlagEnableConsoleExpControls then
				if p1.menuFrameRef.current then
					local Child = p1.menuFrameRef.current:FindFirstChild(ConstantsModule.ICON_NAME_PREFIX .. tostring(UseObservableValueModuleResult1), true)
					
					if Child then
						GuiService.SelectedCoreObject = Child
						
						return
					end
					if not FFlagUnibarMenuOpenSubmenu then
						GuiService:Select(p1.menuFrameRef.current)
						
						return
					end
					if FFlagEnableConsoleExpControls then
						ServiceModule:selectedItem():set("nine_dot")
					end
					ServiceModule:toggleSubMenu("nine_dot")
					
					return
				end
			elseif p1.menuFrameRef.current then
				GuiService:Select(p1.menuFrameRef.current)
				
				return
			end
		else
			ContextActionService:UnbindCoreAction("RBXEscapeUnibar")
			
			if GuiService.SelectedCoreObject and p1.menuFrameRef.current:IsAncestorOf(GuiService.SelectedCoreObject) then
				GuiService.SelectedCoreObject = nil
			end
		end
	end, { UseObservableValueModuleResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseObservableValueModuleResult (copy), FFlagUnibarMenuOpenSubmenu (upval), UseObservableValueModuleResult2 (copy), GuiService (upval), p1 (copy), ReactOtterModule (upval), ConstantsModule (upval)
		if UseObservableValueModuleResult ~= "nine_dot" then
			p1.setToggleSubmenuTransition((ReactOtterModule.spring(0, ConstantsModule.MENU_ANIMATION_SPRING)))
			
			return
		end
		if FFlagUnibarMenuOpenSubmenu and UseObservableValueModuleResult2 then
			GuiService:Select(p1.subMenuHostRef.current)
		end
		p1.setToggleSubmenuTransition((ReactOtterModule.spring(1, ConstantsModule.MENU_ANIMATION_SPRING)))
	end, { UseObservableValueModuleResult })
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableConsoleExpControls (upval), UseObservableValueModuleResult (copy), UseObservableValueModuleResult1 (copy), GetFIntIconSelectionTimeout (upval), p1 (copy), ConstantsModule (upval), GuiService (upval)
		if not FFlagEnableConsoleExpControls or UseObservableValueModuleResult ~= UseObservableValueModuleResult1 then
			coroutine.resume((coroutine.create(function()
				-- upvalues: GetFIntIconSelectionTimeout (upval), p1 (upval), UseObservableValueModuleResult1 (upval), FFlagEnableConsoleExpControls (upval), ConstantsModule (upval), GuiService (upval)
				local Count = 0
				local Child = nil
				while Count < GetFIntIconSelectionTimeout() do
					Count += 1
					task.wait()
					
					if not p1.menuFrameRef.current or not UseObservableValueModuleResult1 then continue end
					Child = if FFlagEnableConsoleExpControls then p1.menuFrameRef.current:FindFirstChild(ConstantsModule.ICON_NAME_PREFIX .. tostring(UseObservableValueModuleResult1), true) else p1.menuFrameRef.current:FindFirstChild("IconHitArea_" .. UseObservableValueModuleResult1, true)
					
					if not Child then continue end
					GuiService.SelectedCoreObject = Child
					break
				end
			end)))
			
			return
		end
	end, {
		UseObservableValueModuleResult1,
		if FFlagEnableConsoleExpControls then UseObservableValueModuleResult else nil
	})
	
	return nil
end

function linearInterpolation(p2, p3, p4: number)
	return p2 * (1 - p4) + p3 * p4
end

function IconPositionBinding(p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), ReactModule (copy)
	local UNIBARENDPADDING = nil
	UNIBARENDPADDING = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().UNIBAR_END_PADDING else ConstantsModule.UNIBAR_END_PADDING
	
	return (ReactModule.joinBindings({ p2, p6, p7 }):map(function(Entry): UDim2
		-- upvalues: p10 (copy), p4 (copy), p3 (copy), p5 (copy), p9 (copy), p8 (copy), UNIBARENDPADDING (ref)
		local v1 = if p9 and not p8 then p5 - Entry[3] else p5
		
		return UDim2.new(0, UNIBARENDPADDING + v1 + ((if p10.current then linearInterpolation(p4, p3, Entry[2]) else linearInterpolation(p3, p4, Entry[2])) - v1) * Entry[1], 0, 0)
	end))
end

local function onUnibarSelectionChanged(Object, _, _, p2)
	-- upvalues: ServiceModule (copy)
	if not Object:IsAncestorOf(p2) then
		ServiceModule:disableFocusNav()
	end
end

function isLeft(HorizontalAlignment): boolean
	return HorizontalAlignment == Enum.HorizontalAlignment.Left
end

function Unibar(p2)
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), ReactModule (copy), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), Stores (copy), UseChromeMenuItemsModule (copy), ReactOtterModule (copy), ServiceModule (copy), FFlagReduceTopBarInsetsWhileHidden (copy), GamepadConnectorModule (copy), UseMappedObservableValueModule (copy), IconHostModule (copy), CreateEffectFunction (copy), UseStyleFunction (copy), FFlagUnibarMenuOpenSubmenu (copy)
	local ICONCELLWIDTH = nil
	local UNIBARENDPADDING = nil
	
	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local UseResult = UnibarStyle.use()
		ICONCELLWIDTH = UseResult.ICON_CELL_WIDTH
		UNIBARENDPADDING = UseResult.UNIBAR_END_PADDING
	else
		ICONCELLWIDTH = ConstantsModule.ICON_CELL_WIDTH
		UNIBARENDPADDING = ConstantsModule.UNIBAR_END_PADDING
	end
	local NewDIVIDERCELLWIDTHs = {}
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(Vector2.zero)
	local UseRefResult2 = ReactModule.useRef(Vector2.zero)
	local UseRefResult3 = if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and Stores.GetUILessStore then ReactModule.useRef(Stores.GetUILessStore(false)) else nil
	local v1 = false
	local Current = UseRefResult.current or {}
	local UseChromeMenuItemsModuleResult = UseChromeMenuItemsModule()
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(1)
	local UseAnimatedBindingResult3, UseAnimatedBindingResult2_2 = ReactOtterModule.useAnimatedBinding(0)
	local UseRefResult4 = ReactModule.useRef(0)
	local UseAnimatedBindingResult4, UseAnimatedBindingResult2_3 = ReactOtterModule.useAnimatedBinding(1)
	local UseRefResult5 = ReactModule.useRef(false)
	local UseRefResult6 = ReactModule.useRef(0)
	local IsNineDot = ServiceModule:currentSubMenu():get() == "nine_dot"
	local UseAnimatedBindingResult5, UseAnimatedBindingResult2_4 = ReactOtterModule.useAnimatedBinding(if IsNineDot then 1 else 0)
	local Elements = {}
	local Count = 0
	local NewDIVIDERCELLWIDTH = 0
	local Total = 0
	local v2 = 0
	local X = 0
	local UseResult = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseRefResult1 (copy), ServiceModule (upval), FFlagReduceTopBarInsetsWhileHidden (upval), UseRefResult2 (copy), FFlagAddUILessMode (upval), FIntAddUILessModeVariant (upval), UseRefResult3 (ref), GamepadConnectorModule (upval), p2 (copy), ConstantsModule (upval)
		local ZeroVector = Vector2.zero
		local ZeroVector1 = Vector2.zero
		
		if Frame then
			ZeroVector = Frame.AbsolutePosition
			ZeroVector1 = Frame.AbsoluteSize
			
			if ZeroVector ~= UseRefResult1.current then
				UseRefResult1.current = ZeroVector
				ServiceModule:setMenuAbsolutePosition(ZeroVector)
			end
			if FFlagReduceTopBarInsetsWhileHidden and ZeroVector1 ~= UseRefResult2.current then
				UseRefResult2.current = ZeroVector1
			end
			if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and UseRefResult3.current.getUILessModeEnabled(false) then
				if ZeroVector ~= UseRefResult1.current then
					UseRefResult1.current = ZeroVector
					ServiceModule:setMenuAbsolutePosition(ZeroVector)
				end
				if ZeroVector1 ~= UseRefResult2.current then
					UseRefResult2.current = ZeroVector1
				end
			end
		end
		if FFlagReduceTopBarInsetsWhileHidden and GamepadConnectorModule then
			if Frame and p2.onAreaChanged and GamepadConnectorModule:getShowTopBar():get() then
				p2.onAreaChanged(ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID, ZeroVector, ZeroVector1)
				
				return
			end
		elseif FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and UseRefResult3.current.getUILessModeEnabled(false) then
			if Frame and p2.onAreaChanged and UseRefResult3.current.getUIVisible(false) then
				p2.onAreaChanged(ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID, ZeroVector, ZeroVector1)
				
				return
			end
		elseif Frame and p2.onAreaChanged then
			p2.onAreaChanged(ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID, ZeroVector, Frame.AbsoluteSize)
		end
	end, {})
	local MapResult = ReactModule.joinBindings({ UseAnimatedBindingResult1, UseAnimatedBindingResult3 }):map(function(Entry): UDim2
		-- upvalues: v2 (ref), ICONCELLWIDTH (ref)
		return UDim2.new(0, linearInterpolation(v2, Entry[2], Entry[1]), 0, ICONCELLWIDTH)
	end)
	local UseMappedObservableValueModuleResult = UseMappedObservableValueModule(ServiceModule:orderAlignment(), isLeft)
	
	for _, value in UseChromeMenuItemsModuleResult do
		if value.integration.availability:get() == ServiceModule.AvailabilitySignal.Pinned then
			Count += 1
		end
	end
	local Largest: number = if UseMappedObservableValueModuleResult then 1 else math.max(Count - 1, 0)
	for i, Integration in UseChromeMenuItemsModuleResult do
		if Integration.isDivider then
			local CurrentEntry = Current[Integration.id] or NewDIVIDERCELLWIDTH
			NewDIVIDERCELLWIDTHs[Integration.id] = NewDIVIDERCELLWIDTH
			v1 = v1 or CurrentEntry ~= NewDIVIDERCELLWIDTH
			local IconPositionBindingResult = IconPositionBinding(UseAnimatedBindingResult, CurrentEntry, NewDIVIDERCELLWIDTH, NewDIVIDERCELLWIDTH + ICONCELLWIDTH * Largest, UseAnimatedBindingResult4, UseAnimatedBindingResult3, false, UseMappedObservableValueModuleResult, UseRefResult5)
			Elements[Integration.id or "icon" .. i] = ReactModule.createElement(IconDivider, {
				position = IconPositionBindingResult,
				visible = if UseMappedObservableValueModuleResult then ReactModule.joinBindings({ IconPositionBindingResult, MapResult }):map(function(Entry): boolean
					-- upvalues: ICONCELLWIDTH (ref)
					return ICONCELLWIDTH * 0.5 <= Entry[1].X.Offset
				end) else ReactModule.joinBindings({ IconPositionBindingResult, MapResult }):map(function(Entry): boolean
					-- upvalues: ICONCELLWIDTH (ref)
					return Entry[1].X.Offset <= Entry[2].X.Offset - ICONCELLWIDTH
				end),
				toggleTransition = UseAnimatedBindingResult1
			})
			NewDIVIDERCELLWIDTH += ConstantsModule.DIVIDER_CELL_WIDTH
		elseif Integration.integration then
			local Flag = false
			local NewNewDIVIDERCELLWIDTH = NewDIVIDERCELLWIDTH + ICONCELLWIDTH * Largest
			
			if Integration.integration.availability:get() == ServiceModule.AvailabilitySignal.Pinned then
				Flag = true
				NewNewDIVIDERCELLWIDTH = Total
			end
			local NewDIVIDERCELLWIDTH1 = if Current[Integration.id] == nil then NewDIVIDERCELLWIDTH else Current[Integration.id]
			NewDIVIDERCELLWIDTHs[Integration.id] = NewDIVIDERCELLWIDTH
			v1 = v1 or NewDIVIDERCELLWIDTH1 ~= NewDIVIDERCELLWIDTH
			local IconPositionBindingResult = IconPositionBinding(UseAnimatedBindingResult, NewDIVIDERCELLWIDTH1, NewDIVIDERCELLWIDTH, NewNewDIVIDERCELLWIDTH, UseAnimatedBindingResult4, UseAnimatedBindingResult3, Flag, UseMappedObservableValueModuleResult, UseRefResult5)
			local MapResult1 = if UseMappedObservableValueModuleResult then ReactModule.joinBindings({ IconPositionBindingResult, MapResult }):map(function(Entry): boolean
				-- upvalues: ICONCELLWIDTH (ref)
				return ICONCELLWIDTH * 0.5 <= Entry[1].X.Offset
			end) else ReactModule.joinBindings({ IconPositionBindingResult, MapResult }):map(function(Entry): boolean
				-- upvalues: ICONCELLWIDTH (ref)
				return Entry[1].X.Offset <= Entry[2].X.Offset - ICONCELLWIDTH * 1.5
			end)
			Elements[Integration.id or "icon" .. i] = ReactModule.createElement(IconHostModule, {
				position = IconPositionBindingResult,
				visible = Flag or MapResult1,
				toggleTransition = UseAnimatedBindingResult5,
				integration = Integration
			})
			NewDIVIDERCELLWIDTH += ICONCELLWIDTH
			
			if Flag then
				Total += ICONCELLWIDTH
			end
		end
	end
	v2 = NewDIVIDERCELLWIDTH
	
	if p2.onMinWidthChanged then
		p2.onMinWidthChanged(v2)
	end
	X = UNIBARENDPADDING * 2 + NewDIVIDERCELLWIDTH
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy), UseAnimatedBindingResult3 (copy), UseAnimatedBindingResult2_2 (copy), ReactOtterModule (upval), X (ref), ConstantsModule (upval), ServiceModule (upval), ICONCELLWIDTH (ref)
		local Current = UseRefResult4.current
		
		if UseAnimatedBindingResult3:getValue() == 0 then
			UseAnimatedBindingResult2_2((ReactOtterModule.instant(X)))
			UseRefResult4.current = X
		elseif Current ~= X then
			UseAnimatedBindingResult2_2(ReactOtterModule.spring(X, ConstantsModule.MENU_ANIMATION_SPRING))
			UseRefResult4.current = X
		end
		ServiceModule:setMenuAbsoluteSize(Vector2.new(X, ICONCELLWIDTH))
	end, { X })
	
	if v1 then
		UseRefResult6.current = (UseRefResult6.current or 0) + 1
	end
	UseRefResult.current = NewDIVIDERCELLWIDTHs
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult5 (copy), UseAnimatedBindingResult2_3 (copy), ReactOtterModule (upval), ConstantsModule (upval)
		if UseRefResult5.current then
			UseAnimatedBindingResult2_3(ReactOtterModule.spring(1, ConstantsModule.MENU_ANIMATION_SPRING))
			UseRefResult5.current = false
			
			return
		else
			UseAnimatedBindingResult2_3(ReactOtterModule.spring(0, ConstantsModule.MENU_ANIMATION_SPRING))
			UseRefResult5.current = true
		end
	end, { UseRefResult6.current, UseRefResult5 })
	ReactModule.useEffect(function()
		-- upvalues: FFlagReduceTopBarInsetsWhileHidden (upval), GamepadConnectorModule (upval), p2 (copy), ConstantsModule (upval), UseRefResult1 (copy), UseRefResult2 (copy)
		if FFlagReduceTopBarInsetsWhileHidden and GamepadConnectorModule then
			local ShowTopBar = GamepadConnectorModule:getShowTopBar()
			ShowTopBar:connect(function()
				-- upvalues: ShowTopBar (copy), p2 (upval), ConstantsModule (upval), UseRefResult1 (upval), UseRefResult2 (upval)
				if ShowTopBar:get() then
					p2.onAreaChanged(ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID, UseRefResult1.current, UseRefResult2.current)
					
					return
				else
					p2.onAreaChanged(ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
				end
			end)
			p2.onAreaChanged(ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FFlagAddUILessMode (upval), FIntAddUILessModeVariant (upval), UseRefResult3 (ref), CreateEffectFunction (upval), p2 (copy), ConstantsModule (upval), UseRefResult1 (copy), UseRefResult2 (copy)
		local Callback = nil
		
		if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and UseRefResult3.current.getUILessModeEnabled(false) then
			Callback = CreateEffectFunction(function(p3)
				-- upvalues: UseRefResult3 (upval), p2 (upval), ConstantsModule (upval), UseRefResult1 (upval), UseRefResult2 (upval)
				if UseRefResult3.current.getUIVisible(p3) then
					p2.onAreaChanged(ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID, UseRefResult1.current, UseRefResult2.current)
					
					return
				else
					p2.onAreaChanged(ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
				end
			end)
			p2.onAreaChanged(ConstantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		end
		return function()
			-- upvalues: Callback (ref)
			if Callback then
				Callback()
			end
		end
	end, {})
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		Size = MapResult,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		SelectionGroup = true,
		ref = p2.menuFrameRef,
		[ReactModule.Change.AbsoluteSize] = UseResult,
		[ReactModule.Change.AbsolutePosition] = UseResult
	}, {
		ReactModule.createElement(AnimationStateHelper, {
			setToggleIconTransition = UseAnimatedBindingResult2,
			setToggleWidthTransition = UseAnimatedBindingResult2_1,
			setToggleSubmenuTransition = UseAnimatedBindingResult2_4,
			menuFrameRef = p2.menuFrameRef,
			subMenuHostRef = if FFlagUnibarMenuOpenSubmenu then p2.subMenuHostRef else nil
		}),
		ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = UseStyleResult.Theme.BackgroundUIContrast.Transparency * UseStyleResult.Settings.PreferredTransparency
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, Elements)
	})
end

local function UnibarPills(p3)
	-- upvalues: UseStyleFunction (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), UseChromeMenuItemsModule (copy), ServiceModule (copy), ReactOtterModule (copy), ReactModule (copy), IconHostModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UNIBARENDPADDING = nil
	local MENUSUBMENUPADDING = nil
	
	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local UseResult = UnibarStyle.use()
		UNIBARENDPADDING = UseResult.UNIBAR_END_PADDING
		MENUSUBMENUPADDING = UseResult.MENU_SUBMENU_PADDING
	else
		UNIBARENDPADDING = ConstantsModule.UNIBAR_END_PADDING
		MENUSUBMENUPADDING = ConstantsModule.MENU_SUBMENU_PADDING
	end
	local UseChromeMenuItemsModuleResult = UseChromeMenuItemsModule()
	local IsNineDot = ServiceModule:currentSubMenu():get() == "nine_dot"
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if IsNineDot then 1 else 0)
	assert(UseChromeMenuItemsModuleResult ~= nil, "Menu items should not be nil")
	local Frames = {}
	local Elements = {}
	
	for i, Integration in UseChromeMenuItemsModuleResult do
		if Integration.integration and Integration.isDivider == false then
			Elements["icon_host" .. i] = ReactModule.createElement(IconHostModule, {
				toggleTransition = UseAnimatedBindingResult,
				integration = Integration
			})
		end
		if Integration.isDivider or i == #UseChromeMenuItemsModuleResult then
			Frames["pill_" .. i] = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundColor3 = UseStyleResult.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = UseStyleResult.Theme.BackgroundUIContrast.Transparency * UseStyleResult.Settings.PreferredTransparency
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				Padding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UNIBARENDPADDING),
					PaddingRight = UDim.new(0, UNIBARENDPADDING)
				}),
				PillsHorizontalList = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				})
			}, Elements)
			Elements = {}
		end
	end
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		SelectionGroup = true,
		ref = p3.menuFrameRef,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		ReactModule.createElement(AnimationStateHelper, {
			setToggleSubmenuTransition = UseAnimatedBindingResult2,
			menuFrameRef = p3.menuFrameRef,
			subMenuHostRef = p3.subMenuHostRef
		}),
		ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, MENUSUBMENUPADDING)
		})
	}, Frames)
end

local function SubMenuWrapper(p4)
	-- upvalues: IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), Panel3DInSpatialUI (ref), UseObservableValueModule (copy), ServiceModule (copy), NewResult (ref), ReactModule (copy), SubMenuModule (copy), PanelType (ref)
	if IsInExperienceUIVREnabled and IsSpatialFunction() and Panel3DInSpatialUI then
		NewResult:set(UseObservableValueModule(ServiceModule:currentSubMenu()) ~= nil)
	end
	local UseResult = ReactModule.useCallback(function(PanelSize)
		-- upvalues: ReactModule (upval), SubMenuModule (upval), p4 (copy)
		return (ReactModule.createElement(SubMenuModule, {
			subMenuHostRef = p4.subMenuHostRef,
			panelSize = PanelSize
		}))
	end, { p4.subMenuHostRef })
	
	return if IsInExperienceUIVREnabled and IsSpatialFunction() and Panel3DInSpatialUI then ReactModule.createElement(Panel3DInSpatialUI, {
		panelType = PanelType.ChromeSubMenu,
		renderFunction = UseResult,
		visibilityObservable = NewResult
	}) else ReactModule.createElement(SubMenuModule, { subMenuHostRef = p4.subMenuHostRef })
end

return ReactModule.memo(function(p4)
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), ReactModule (copy), FFlagEnableConsoleExpControls (copy), FFlagUnibarMenuOpenSubmenu (copy), UseMappedObservableValueModule (copy), ServiceModule (copy), GamepadConnectorModule (copy), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), Stores (copy), CreateEffectFunction (copy), IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), UnibarPills (copy), FFlagEnablePlaytestModeUnibar (copy), PlaytestModeThemeProviderModule (copy), onUnibarSelectionChanged (copy), SubMenuWrapper (copy), SubMenuModule (copy), ShortcutBarModule (copy), WindowManagerModule (copy)
	local MENUSUBMENUPADDING = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().MENU_SUBMENU_PADDING else ConstantsModule.MENU_SUBMENU_PADDING
	local MenuRef = if FFlagEnableConsoleExpControls and p4.menuRef then p4.menuRef else ReactModule.useRef(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = if FFlagUnibarMenuOpenSubmenu then ReactModule.useRef(nil) else nil
	
	local function updateSize()
		-- upvalues: UseRefResult (copy), MenuRef (ref)
		if UseRefResult.current and MenuRef.current then
			UseRefResult.current.Size = MenuRef.current.Size
		end
	end
	
	local UseMappedObservableValueModuleResult = UseMappedObservableValueModule(ServiceModule:orderAlignment(), isLeft)
	local v3 = nil
	local Callback = nil
	local ShowTopBar = nil
	
	if FFlagEnableConsoleExpControls and GamepadConnectorModule then
		v3, Callback = ReactModule.useBinding(GamepadConnectorModule:getShowTopBar():get())
		ShowTopBar = GamepadConnectorModule:getShowTopBar()
	end
	local UseRefResult2 = nil
	
	if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and Stores.GetUILessStore then
		UseRefResult2 = ReactModule.useRef(Stores.GetUILessStore(false))
		
		if UseRefResult2.current.getUILessModeEnabled(false) then
			v3, Callback = ReactModule.useBinding(true)
		end
	end
	ReactModule.useEffect(function()
		-- upvalues: MenuRef (ref), updateSize (copy), UseRefResult (copy), FFlagEnableConsoleExpControls (upval), ShowTopBar (ref), Callback (ref)
		local Connection = if MenuRef and MenuRef.current then MenuRef.current:GetPropertyChangedSignal("Size"):Connect(updateSize) else nil
		
		if UseRefResult.current and MenuRef.current then
			UseRefResult.current.Size = MenuRef.current.Size
		end
		if FFlagEnableConsoleExpControls then
			ShowTopBar:connect(function()
				-- upvalues: Callback (upval), ShowTopBar (upval)
				Callback(ShowTopBar:get())
			end)
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:disconnect()
			end
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: FFlagAddUILessMode (upval), FIntAddUILessModeVariant (upval), UseRefResult2 (ref), CreateEffectFunction (upval), Callback (ref)
		local Effect = if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and UseRefResult2.current.getUILessModeEnabled(false) then CreateEffectFunction(function(p5)
			-- upvalues: Callback (upval), UseRefResult2 (upval)
			Callback(UseRefResult2.current.getUIVisible(p5))
		end) else nil
		
		return function()
			-- upvalues: Effect (ref)
			if Effect then
				Effect()
			end
		end
	end, {})
	local Element = if IsInExperienceUIVREnabled and IsSpatialFunction() then ReactModule.createElement(UnibarPills, { menuFrameRef = MenuRef, subMenuHostRef = UseRefResult1 }) else ReactModule.createElement(Unibar, {
		menuFrameRef = MenuRef,
		subMenuHostRef = if FFlagUnibarMenuOpenSubmenu then UseRefResult1 else nil,
		onAreaChanged = p4.onAreaChanged,
		onMinWidthChanged = p4.onMinWidthChanged
	})
	
	if FFlagEnablePlaytestModeUnibar then
		Element = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			PlaytestModeThemeProvider = ReactModule.createElement(PlaytestModeThemeProviderModule, nil, { Unibar = Element })
		})
	end
	return {
		ReactModule.createElement("Frame", {
			Name = "UnibarMenu",
			AutomaticSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = p4.layoutOrder,
			SelectionGroup = true,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = if FFlagEnableConsoleExpControls then nil else Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			ref = UseRefResult,
			[ReactModule.Event.SelectionChanged] = if FFlagEnableConsoleExpControls then onUnibarSelectionChanged else nil,
			Visible = if FFlagEnableConsoleExpControls or FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and UseRefResult2.current.getUILessModeEnabled(false) then v3 else nil
		}, {
			ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = if UseMappedObservableValueModuleResult then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, MENUSUBMENUPADDING)
			}),
			Element,
			if IsInExperienceUIVREnabled then ReactModule.createElement(SubMenuWrapper, { subMenuHostRef = UseRefResult1 }) else ReactModule.createElement(SubMenuModule, { subMenuHostRef = UseRefResult1 }),
			if FFlagEnableConsoleExpControls then ReactModule.createElement(ShortcutBarModule) else nil,
			(ReactModule.createElement(WindowManagerModule))
		})
	}
end, function(_, _): boolean
	return true
end)