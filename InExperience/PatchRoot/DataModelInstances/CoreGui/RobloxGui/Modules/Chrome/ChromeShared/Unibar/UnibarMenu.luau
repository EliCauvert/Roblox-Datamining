local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local contextActionService = game:GetService("ContextActionService")
local reactModule = require(corePackagesService.Packages.React)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getFFlagDebugEnableUnibarDummyIntegrations = sharedFlagsModule.GetFFlagDebugEnableUnibarDummyIntegrations
local getFIntIconSelectionTimeout = sharedFlagsModule.GetFIntIconSelectionTimeout
local getFFlagChromeCentralizedConfiguration = sharedFlagsModule.GetFFlagChromeCentralizedConfiguration
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagAddUILessMode = sharedFlagsModule.FFlagAddUILessMode
local fIntAddUILessModeVariant = sharedFlagsModule.FIntAddUILessModeVariant
local fFlagEnableInExperienceAvatarSwitcher = sharedFlagsModule.FFlagEnableInExperienceAvatarSwitcher
local fFlagAddMapToNineDot = sharedFlagsModule.FFlagAddMapToNineDot
local fFlagEnableInExperienceShop = sharedFlagsModule.FFlagEnableInExperienceShop
local fFlagAppNavMyStatsTab = sharedFlagsModule.FFlagAppNavMyStatsTab
local fFlagUnibarMenuOpenSubmenu = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local fFlagEnablePlaytestModeUnibar = sharedFlagsModule.FFlagEnablePlaytestModeUnibar
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle
local playtestModeThemeProviderModule = require(chromeShared.Unibar.PlaytestModeThemeProvider)
local serviceModule = require(chromeShared.Service)
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local _ = if getFFlagChromeCentralizedConfiguration() then nil else require(chromeShared.Parent.Integrations)
local subMenuModule = require(chromeShared.Unibar.SubMenu)
local windowManagerModule = require(chromeShared.Unibar.WindowManager)
local shortcutBarModule = require(chromeShared.Shortcuts.ShortcutBar)
local constantsModule = require(chromeShared.Unibar.Constants)
local buildMenuOrderModule = require(chromeShared.Unibar.buildMenuOrder)
local useChromeMenuItemsModule = require(chromeShared.Hooks.useChromeMenuItems)
local useObservableValueModule = require(chromeShared.Hooks.useObservableValue)
local useMappedObservableValueModule = require(chromeShared.Hooks.useMappedObservableValue)
local iconHostModule = require(chromeShared.Unibar.ComponentHosts.IconHost)
local reactOtterModule = require(corePackagesService.Packages.ReactOtter)
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local fFlagReduceTopBarInsetsWhileHidden = sharedFlagsModule.FFlagReduceTopBarInsetsWhileHidden
local stores = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Stores
local createEffect = require(corePackagesService.Packages.Signals).createEffect
local constantsModule_1 = require(chromeShared.Parent.Integrations.Party.Constants)
local isConnectUnibarEnabledModule = require(chromeShared.Parent.Integrations.Connect.isConnectUnibarEnabled)
local isConnectDropdownEnabledModule = require(chromeShared.Parent.Integrations.Connect.isConnectDropdownEnabled)
local var1 = if fFlagEnableConsoleExpControls then require(chromeShared.Parent.Parent.TopBar.Components.GamepadConnector) else nil
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local panel3DInSpatialUI = nil
local panelType = nil
local var2 = nil

if isInExperienceUIVREnabled then
	local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
	panel3DInSpatialUI = vrSpatialUiModule.Panel3DInSpatialUI
	panelType = vrSpatialUiModule.Constants.PanelType
	var2 = require(corePackagesService.Workspace.Packages.Observable).ObservableValue.new(true)
end
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local fFlagRemoveFriendsChatUnibarEntrypoints = sharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local fFlagExpChatCanShowFriendsTab = sharedFlagsModule.FFlagExpChatCanShowFriendsTab

if not getFFlagChromeCentralizedConfiguration() then
	function configureUnibar()
		-- upvalues: fFlagAddMapToNineDot (ref), buildMenuOrderModule (ref), isConnectDropdownEnabledModule (ref), fFlagRemoveFriendsChatUnibarEntrypoints (ref), argoPartyExperimentation (ref), fFlagExpChatCanShowFriendsTab (ref), getFFlagDebugEnableUnibarDummyIntegrations (ref), isConnectUnibarEnabledModule (ref), constantsModule_1 (ref), fFlagAppNavMyStatsTab (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), serviceModule (ref), fFlagEnableInExperienceAvatarSwitcher (ref), constantsModule (ref), guiService (ref), fFlagEnableInExperienceShop (ref)
		local var3
		local _ = nil
		
		if fFlagAddMapToNineDot then
			var3 = buildMenuOrderModule()
		else
			var3 = { "leaderboard", "emotes", "backpack" }
			table.insert(var3, "respawn")
			table.insert(var3, 1, "trust_and_safety")
			
			if isConnectDropdownEnabledModule() and (not fFlagRemoveFriendsChatUnibarEntrypoints or not argoPartyExperimentation.getIsRenameEnabled() or not fFlagExpChatCanShowFriendsTab) then
				table.insert(var3, 1, "connect_dropdown")
			end
		end
		local list = { "nine_dot", "chat", "toggle_mic_mute" }
		table.insert(list, 3, "join_voice")
		
		if getFFlagDebugEnableUnibarDummyIntegrations() then
			table.insert(list, "dummy_window")
			table.insert(list, "dummy_window_2")
		end
		if isConnectUnibarEnabledModule() then
			table.insert(list, if argoPartyExperimentation.getIsRenameEnabled() then "party_entrypoint" else "connect_unibar")
		end
		local index = table.find(list, "toggle_mic_mute")
		
		if index then
			table.insert(list, index, constantsModule_1.TOGGLE_MIC_INTEGRATION_ID)
		end
		if fFlagAppNavMyStatsTab then
			table.insert(list, "assistant_build")
		end
		if isInExperienceUIVREnabled and isSpatial() then
			serviceModule:configureMenu({ { "vr_toggle_button", "vr_safety_bubble" }, list })
		else
			serviceModule:configureMenu({ list })
		end
		if not fFlagAddMapToNineDot then
			if not isInExperienceUIVREnabled then
				table.insert(var3, 2, "camera_entrypoint")
				table.insert(var3, 2, "selfie_view")
			elseif not isSpatial() then
				table.insert(var3, 2, "camera_entrypoint")
				table.insert(var3, 2, "selfie_view")
			end
			if fFlagEnableInExperienceAvatarSwitcher then
				table.insert(var3, 3, constantsModule.AVATAR_SWITCHER_ID)
			end
			if not isSpatial() and not guiService:IsTenFootInterface() then
				table.insert(var3, 4, "music_entrypoint")
			end
			if fFlagEnableInExperienceShop then
				table.insert(var3, 2, constantsModule.IN_EXPERIENCE_SHOP_ID)
			end
		end
		serviceModule:configureSubMenu("nine_dot", var3)
	end
	
	configureUnibar()
	
	if fFlagEnableConsoleExpControls then
		require(script.Parent.Parent.Shortcuts.ConfigureShortcuts)()
	end
end
function IconDivider(p1)
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref)
	local var3 = useStyle()
	local _ = nil
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Position = p1.position,
		Size = UDim2.new(0, constantsModule.DIVIDER_CELL_WIDTH, 1, 0)
	}, {
		DividerBar = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_DIVIDER_POSITION else constantsModule.ICON_DIVIDER_POSITION,
			AnchorPoint = Vector2.new(0, 0.5),
			Size = constantsModule.ICON_DIVIDER_SIZE,
			BackgroundColor3 = var3.Theme.Divider.Color,
			BackgroundTransparency = if p1.toggleTransition then p1.toggleTransition:map(function(p2)
				-- upvalues: var3 (ref)
				return var3.Theme.Divider.Transparency + (1 - p2) * (1 - var3.Theme.Divider.Transparency)
			end) else var3.Theme.Divider.Transparency,
			Visible = p1.visible or true
		})
	})
end

local function _(p1, p2)
	-- upvalues: constantsModule (ref)
	return p1.current:FindFirstChild(constantsModule.ICON_NAME_PREFIX .. tostring(p2), true)
end

function AnimationStateHelper(p1)
	-- upvalues: useObservableValueModule (ref), serviceModule (ref), reactModule (ref), fFlagEnableConsoleExpControls (ref), contextActionService (ref), guiService (ref), constantsModule (ref), fFlagUnibarMenuOpenSubmenu (ref), reactOtterModule (ref), getFIntIconSelectionTimeout (ref)
	local var3 = useObservableValueModule(serviceModule:currentSubMenu())
	local var4 = useObservableValueModule(serviceModule:selectedItem())
	local var5 = useObservableValueModule(serviceModule:inFocusNav())
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), fFlagEnableConsoleExpControls (copy), contextActionService (copy), serviceModule (copy), guiService (copy), p1 (ref), var4 (ref), constantsModule (copy), fFlagUnibarMenuOpenSubmenu (copy)
		if var5 then
			if not fFlagEnableConsoleExpControls then
				contextActionService:BindCoreAction("RBXEscapeUnibar", function(_, p2, _)
					-- upvalues: fFlagEnableConsoleExpControls (copy), serviceModule (copy), guiService (copy)
					if fFlagEnableConsoleExpControls then
						if p2 == Enum.UserInputState.End then
							serviceModule:disableFocusNav()
							guiService.SelectedCoreObject = nil
							
							return
						end
					else
						serviceModule:disableFocusNav()
					end
				end, false, Enum.KeyCode.ButtonB)
			end
			if fFlagEnableConsoleExpControls then
				if not p1.menuFrameRef.current then return end
				local var6 = p1.menuFrameRef.current:FindFirstChild(constantsModule.ICON_NAME_PREFIX .. tostring(var4), true)
				
				if var6 then
					guiService.SelectedCoreObject = var6
					
					return
				elseif fFlagUnibarMenuOpenSubmenu then
					if fFlagEnableConsoleExpControls then
						serviceModule:selectedItem():set("nine_dot")
					end
					serviceModule:toggleSubMenu("nine_dot")
					
					return
				else
					guiService:Select(p1.menuFrameRef.current)
					
					return
				end
			elseif p1.menuFrameRef.current then
				guiService:Select(p1.menuFrameRef.current)
				
				return
			end
		else
			contextActionService:UnbindCoreAction("RBXEscapeUnibar")
			
			if guiService.SelectedCoreObject and p1.menuFrameRef.current:IsAncestorOf(guiService.SelectedCoreObject) then
				guiService.SelectedCoreObject = nil
			end
		end
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), fFlagUnibarMenuOpenSubmenu (copy), var5 (ref), guiService (copy), p1 (ref), reactOtterModule (copy), constantsModule (copy)
		if var3 ~= "nine_dot" then
			p1.setToggleSubmenuTransition(reactOtterModule.spring(0, constantsModule.MENU_ANIMATION_SPRING))
			
			return
		elseif fFlagUnibarMenuOpenSubmenu and var5 then
			guiService:Select(p1.subMenuHostRef.current)
		end
		p1.setToggleSubmenuTransition(reactOtterModule.spring(1, constantsModule.MENU_ANIMATION_SPRING))
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableConsoleExpControls (copy), var3 (ref), var4 (ref), getFIntIconSelectionTimeout (copy), p1 (ref), constantsModule (copy), guiService (copy)
		if fFlagEnableConsoleExpControls and var3 == var4 then
			return
		end
		coroutine.resume(coroutine.create(function()
			-- upvalues: getFIntIconSelectionTimeout (copy), p1 (copy), var4 (copy), fFlagEnableConsoleExpControls (copy), constantsModule (copy), guiService (copy)
			local var6 = 0
			while var6 < getFIntIconSelectionTimeout() do
				var6 += 1
				task.wait()
				
				if not p1.menuFrameRef.current or not var4 then continue end
				local var7 = if fFlagEnableConsoleExpControls then p1.menuFrameRef.current:FindFirstChild(constantsModule.ICON_NAME_PREFIX .. tostring(var4), true) else p1.menuFrameRef.current:FindFirstChild("IconHitArea_" .. var32, true)
				
				if not var7 then continue end
				guiService.SelectedCoreObject = var7
				
				return
			end
		end))
	end, {
		var4,
		if fFlagEnableConsoleExpControls then var3 else nil
	})
	
	return nil
end

function linearInterpolation(p2, p3, p4)
	return p2 * (1 - p4) + p3 * p4
end

function IconPositionBinding(p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref)
	local _ = nil
	local var6 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().UNIBAR_END_PADDING else constantsModule.UNIBAR_END_PADDING
	
	return reactModule.joinBindings({ p2, p6, p7 }):map(function(p11)
		-- upvalues: p10 (ref), p4 (ref), p3 (ref), p5 (ref), p9 (ref), p8 (ref), var6 (write)
		local var7 = if p9 and not p8 then p5 - p11[3] else p5
		
		return UDim2.new(0, var6 + var7 + ((if p10.current then linearInterpolation(p4, p3, p11[2]) else linearInterpolation(p3, p4, p11[2])) - var7) * p11[1], 0, 0)
	end)
end

local function onUnibarSelectionChanged(p2, _, _, p3)
	-- upvalues: serviceModule (ref)
	if not p2:IsAncestorOf(p3) then
		serviceModule:disableFocusNav()
	end
end

function isLeft(p2)
	return p2 == Enum.HorizontalAlignment.Left
end

function Unibar(p2)
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), stores (ref), useChromeMenuItemsModule (ref), reactOtterModule (ref), serviceModule (ref), fFlagReduceTopBarInsetsWhileHidden (ref), var1 (ref), useMappedObservableValueModule (ref), iconHostModule (ref), createEffect (ref), useStyle (ref), fFlagUnibarMenuOpenSubmenu (ref)
	local ICON_CELL_WIDTH, UNIBAR_END_PADDING
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var6 = unibarStyle.use()
		ICON_CELL_WIDTH = var6.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = var6.UNIBAR_END_PADDING
	else
		ICON_CELL_WIDTH = constantsModule.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = constantsModule.UNIBAR_END_PADDING
	end
	local t = {}
	local var7 = reactModule.useRef({})
	local var8 = reactModule.useRef(Vector2.zero)
	local var9 = reactModule.useRef(Vector2.zero)
	local var10 = if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and stores.GetUILessStore then reactModule.useRef(stores.GetUILessStore(false)) else nil
	local var11 = false
	local current = var7.current or {}
	local var12 = useChromeMenuItemsModule()
	local var13, var14 = reactOtterModule.useAnimatedBinding(1)
	local var15, var16 = reactOtterModule.useAnimatedBinding(1)
	local var17, var18 = reactOtterModule.useAnimatedBinding(0)
	local var19 = reactModule.useRef(0)
	local var20, var21 = reactOtterModule.useAnimatedBinding(1)
	local var22 = reactModule.useRef(false)
	local var23 = reactModule.useRef(0)
	local var24, var25 = reactOtterModule.useAnimatedBinding(if serviceModule:currentSubMenu():get() == "nine_dot" then 1 else 0)
	local t_1 = {}
	local var26 = 0
	local var27 = 0
	local var28 = 0
	local var29 = 0
	local _ = 0
	local var30 = reactModule.useCallback(function(p3)
		-- upvalues: var8 (ref), serviceModule (copy), fFlagReduceTopBarInsetsWhileHidden (copy), var9 (ref), fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), var10 (write), var1 (copy), p2 (ref), constantsModule (copy)
		local zero = Vector2.zero
		local zero_1 = Vector2.zero
		
		if p3 then
			zero = p3.AbsolutePosition
			zero_1 = p3.AbsoluteSize
			
			if zero ~= var8.current then
				var8.current = zero
				serviceModule:setMenuAbsolutePosition(zero)
			end
			if fFlagReduceTopBarInsetsWhileHidden and zero_1 ~= var9.current then
				var9.current = zero_1
			end
			if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var10.current.getUILessModeEnabled(false) then
				if zero ~= var8.current then
					var8.current = zero
					serviceModule:setMenuAbsolutePosition(zero)
				end
				if zero_1 ~= var9.current then
					var9.current = zero_1
				end
			end
		end
		if fFlagReduceTopBarInsetsWhileHidden and var1 then
			if p3 and p2.onAreaChanged and var1:getShowTopBar():get() then
				p2.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, zero, zero_1)
				
				return
			end
		elseif fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var10.current.getUILessModeEnabled(false) then
			if p3 and p2.onAreaChanged and var10.current.getUIVisible(false) then
				p2.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, zero, zero_1)
				
				return
			end
		elseif p3 and p2.onAreaChanged then
			p2.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, zero, p3.AbsoluteSize)
		end
	end, {})
	local var31 = reactModule.joinBindings({ var15, var17 }):map(function(p3)
		-- upvalues: var29 (write), ICON_CELL_WIDTH (write)
		return UDim2.new(0, linearInterpolation(var29, p3[2], p3[1]), 0, ICON_CELL_WIDTH)
	end)
	local var32 = useMappedObservableValueModule(serviceModule:orderAlignment(), isLeft)
	
	for i, v in var12 do
		if v.integration.availability:get() == serviceModule.AvailabilitySignal.Pinned then
			var26 += 1
		end
	end
	local var33 = if var32 then 1 else math.max(var26 - 1, 0)
	
	for i_1, v_1 in var12 do
		if v_1.isDivider then
			local var34 = var27 + ICON_CELL_WIDTH * var33
			local id = current[v_1.id] or var27
			t[v_1.id] = var27
			var11 = var11 or id ~= var27
			local var35 = IconPositionBinding(var13, id, var27, var34, var20, var17, false, var32, var22)
			t_1[v_1.id or "icon" .. i_1] = reactModule.createElement(IconDivider, {
				position = var35,
				visible = if var32 then reactModule.joinBindings({ var35, var31 }):map(function(p3)
					-- upvalues: ICON_CELL_WIDTH (write)
					return ICON_CELL_WIDTH * 0.5 <= p3[1].X.Offset
				end) else reactModule.joinBindings({ var35, var31 }):map(function(p3)
					-- upvalues: ICON_CELL_WIDTH (write)
					return p3[1].X.Offset <= p3[2].X.Offset - ICON_CELL_WIDTH
				end),
				toggleTransition = var15
			})
			var27 += constantsModule.DIVIDER_CELL_WIDTH
		elseif v_1.integration then
			local var36 = false
			local var37 = var27 + ICON_CELL_WIDTH * var33
			
			if v_1.integration.availability:get() == serviceModule.AvailabilitySignal.Pinned then
				var36 = true
				var37 = var28
			end
			local var38 = if current[v_1.id] == nil then var27 else current[v_1.id]
			t[v_1.id] = var27
			var11 = var11 or var38 ~= var27
			local var39 = IconPositionBinding(var13, var38, var27, var37, var20, var17, var36, var32, var22)
			t_1[v_1.id or "icon" .. i_1] = reactModule.createElement(iconHostModule, {
				position = var39,
				visible = var36 or (if var32 then reactModule.joinBindings({ var39, var31 }):map(function(p3)
					-- upvalues: ICON_CELL_WIDTH (write)
					return ICON_CELL_WIDTH * 0.5 <= p3[1].X.Offset
				end) else reactModule.joinBindings({ var39, var31 }):map(function(p3)
					-- upvalues: ICON_CELL_WIDTH (write)
					return p3[1].X.Offset <= p3[2].X.Offset - ICON_CELL_WIDTH * 1.5
				end)),
				toggleTransition = var24,
				integration = v_1
			})
			var27 += ICON_CELL_WIDTH
			
			if var36 then
				var28 += ICON_CELL_WIDTH
			end
		end
	end
	var29 = var27
	
	if p2.onMinWidthChanged then
		p2.onMinWidthChanged(var29)
	end
	local var40 = UNIBAR_END_PADDING * 2 + var27
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var17 (ref), var18 (ref), reactOtterModule (copy), var40 (write), constantsModule (copy), serviceModule (copy), ICON_CELL_WIDTH (write)
		local current = var19.current
		
		if var17:getValue() == 0 then
			var18(reactOtterModule.instant(var40))
			var19.current = var40
		elseif current ~= var40 then
			var18(reactOtterModule.spring(var40, constantsModule.MENU_ANIMATION_SPRING))
			var19.current = var40
		end
		serviceModule:setMenuAbsoluteSize(Vector2.new(var40, ICON_CELL_WIDTH))
	end, { var40 })
	
	if var11 then
		var23.current = (var23.current or 0) + 1
	end
	var7.current = t
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), var21 (ref), reactOtterModule (copy), constantsModule (copy)
		if var22.current then
			var21(reactOtterModule.spring(1, constantsModule.MENU_ANIMATION_SPRING))
			var22.current = false
			
			return
		end
		var21(reactOtterModule.spring(0, constantsModule.MENU_ANIMATION_SPRING))
		var22.current = true
	end, { var23.current, var22 })
	reactModule.useEffect(function()
		-- upvalues: fFlagReduceTopBarInsetsWhileHidden (copy), var1 (copy), p2 (ref), constantsModule (copy), var8 (ref), var9 (ref)
		if fFlagReduceTopBarInsetsWhileHidden and var1 then
			local showTopBar = var1:getShowTopBar()
			showTopBar:connect(function()
				-- upvalues: showTopBar (ref), p2 (copy), constantsModule (copy), var8 (copy), var9 (copy)
				if showTopBar:get() then
					p2.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, var8.current, var9.current)
					
					return
				end
				p2.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
			end)
			p2.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), var10 (write), createEffect (copy), p2 (ref), constantsModule (copy), var8 (ref), var9 (ref)
		local var41 = nil
		
		if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var10.current.getUILessModeEnabled(false) then
			var41 = createEffect(function(p3)
				-- upvalues: var10 (copy), p2 (copy), constantsModule (copy), var8 (copy), var9 (copy)
				if var10.current.getUIVisible(p3) then
					p2.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, var8.current, var9.current)
					
					return
				end
				p2.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
			end)
			p2.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		end
		return function()
			-- upvalues: var41 (write)
			if var41 then
				var41()
			end
		end
	end, {})
	local var41 = useStyle()
	
	return reactModule.createElement("Frame", {
		Size = var31,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		SelectionGroup = true,
		ref = p2.menuFrameRef,
		[reactModule.Change.AbsoluteSize] = var30,
		[reactModule.Change.AbsolutePosition] = var30
	}, {
		reactModule.createElement(AnimationStateHelper, {
			setToggleIconTransition = var14,
			setToggleWidthTransition = var16,
			setToggleSubmenuTransition = var25,
			menuFrameRef = p2.menuFrameRef,
			subMenuHostRef = if fFlagUnibarMenuOpenSubmenu then p2.subMenuHostRef else nil
		}),
		reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = var41.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = var41.Theme.BackgroundUIContrast.Transparency * var41.Settings.PreferredTransparency
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0)
		}, t_1)
	})
end

local function UnibarPills(p3)
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), useChromeMenuItemsModule (ref), serviceModule (ref), reactOtterModule (ref), reactModule (ref), iconHostModule (ref)
	local UNIBAR_END_PADDING, MENU_SUBMENU_PADDING
	local var42 = useStyle()
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var43 = unibarStyle.use()
		UNIBAR_END_PADDING = var43.UNIBAR_END_PADDING
		MENU_SUBMENU_PADDING = var43.MENU_SUBMENU_PADDING
	else
		UNIBAR_END_PADDING = constantsModule.UNIBAR_END_PADDING
		MENU_SUBMENU_PADDING = constantsModule.MENU_SUBMENU_PADDING
	end
	local var44 = useChromeMenuItemsModule()
	local var45, var46 = reactOtterModule.useAnimatedBinding(if serviceModule:currentSubMenu():get() == "nine_dot" then 1 else 0)
	assert(var44 ~= nil, "Menu items should not be nil")
	local t = {}
	local t_1 = {}
	
	for i, v in var44 do
		if v.integration and v.isDivider == false then
			t_1["icon_host" .. i] = reactModule.createElement(iconHostModule, { toggleTransition = var45, integration = v })
		end
		if v.isDivider or i == #var44 then
			t["pill_" .. i] = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundColor3 = var42.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = var42.Theme.BackgroundUIContrast.Transparency * var42.Settings.PreferredTransparency
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
				Padding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UNIBAR_END_PADDING),
					PaddingRight = UDim.new(0, UNIBAR_END_PADDING)
				}),
				PillsHorizontalList = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				})
			}, t_1)
			t_1 = {}
		end
	end
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		SelectionGroup = true,
		ref = p3.menuFrameRef,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		reactModule.createElement(AnimationStateHelper, {
			setToggleSubmenuTransition = var46,
			menuFrameRef = p3.menuFrameRef,
			subMenuHostRef = p3.subMenuHostRef
		}),
		reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, MENU_SUBMENU_PADDING)
		})
	}, t)
end

local function SubMenuWrapper(p4)
	-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (ref), panel3DInSpatialUI (write), useObservableValueModule (ref), serviceModule (ref), var2 (write), reactModule (ref), subMenuModule (ref), panelType (write)
	if isInExperienceUIVREnabled and isSpatial() and panel3DInSpatialUI then
		var2:set(useObservableValueModule(serviceModule:currentSubMenu()) ~= nil)
	end
	return if isInExperienceUIVREnabled and isSpatial() and panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
		panelType = panelType.ChromeSubMenu,
		renderFunction = reactModule.useCallback(function(p5)
			-- upvalues: reactModule (copy), subMenuModule (copy), p4 (ref)
			return reactModule.createElement(subMenuModule, { subMenuHostRef = p4.subMenuHostRef, panelSize = p5 })
		end, { p4.subMenuHostRef }),
		visibilityObservable = var2
	}) else reactModule.createElement(subMenuModule, { subMenuHostRef = p4.subMenuHostRef })
end

return reactModule.memo(function(p4)
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), fFlagEnableConsoleExpControls (ref), fFlagUnibarMenuOpenSubmenu (ref), useMappedObservableValueModule (ref), serviceModule (ref), var1 (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), stores (ref), createEffect (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), UnibarPills (ref), fFlagEnablePlaytestModeUnibar (ref), playtestModeThemeProviderModule (ref), onUnibarSelectionChanged (ref), SubMenuWrapper (ref), subMenuModule (ref), shortcutBarModule (ref), windowManagerModule (ref)
	local _ = nil
	local var47 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().MENU_SUBMENU_PADDING else constantsModule.MENU_SUBMENU_PADDING
	local var48 = if fFlagEnableConsoleExpControls and p4.menuRef then p4.menuRef else reactModule.useRef(nil)
	local var49 = reactModule.useRef(nil)
	local var50 = if fFlagUnibarMenuOpenSubmenu then reactModule.useRef(nil) else nil
	
	local function updateSize()
		-- upvalues: var49 (ref), var48 (write)
		if var49.current and var48.current then
			var49.current.Size = var48.current.Size
		end
	end
	
	local var51 = useMappedObservableValueModule(serviceModule:orderAlignment(), isLeft)
	local var52 = nil
	local var53 = nil
	local showTopBar = nil
	
	if fFlagEnableConsoleExpControls and var1 then
		local var54, var55 = reactModule.useBinding(var1:getShowTopBar():get())
		var52 = var54
		var53 = var55
		showTopBar = var1:getShowTopBar()
	end
	local var56 = nil
	
	if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and stores.GetUILessStore then
		var56 = reactModule.useRef(stores.GetUILessStore(false))
		
		if var56.current.getUILessModeEnabled(false) then
			local var57, var58 = reactModule.useBinding(true)
			var52 = var57
			var53 = var58
		end
	end
	reactModule.useEffect(function()
		-- upvalues: var48 (write), updateSize (ref), var49 (ref), fFlagEnableConsoleExpControls (copy), showTopBar (write), var53 (write)
		local var59 = if var48 and var48.current then var48.current:GetPropertyChangedSignal("Size"):Connect(updateSize) else nil
		
		if var49.current and var48.current then
			var49.current.Size = var48.current.Size
		end
		if fFlagEnableConsoleExpControls then
			showTopBar:connect(function()
				-- upvalues: var53 (copy), showTopBar (copy)
				var53(showTopBar:get())
			end)
		end
		return function()
			-- upvalues: var59 (write)
			if var59 then
				var59:disconnect()
			end
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), var56 (write), createEffect (copy), var53 (write)
		local var59 = if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var56.current.getUILessModeEnabled(false) then createEffect(function(p5)
			-- upvalues: var53 (copy), var56 (copy)
			var53(var56.current.getUIVisible(p5))
		end) else nil
		
		return function()
			-- upvalues: var59 (write)
			if var59 then
				var59()
			end
		end
	end, {})
	local var59 = if isInExperienceUIVREnabled and isSpatial() then reactModule.createElement(UnibarPills, { menuFrameRef = var48, subMenuHostRef = var50 }) else reactModule.createElement(Unibar, {
		menuFrameRef = var48,
		subMenuHostRef = if fFlagUnibarMenuOpenSubmenu then var50 else nil,
		onAreaChanged = p4.onAreaChanged,
		onMinWidthChanged = p4.onMinWidthChanged
	})
	
	if fFlagEnablePlaytestModeUnibar then
		var59 = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			PlaytestModeThemeProvider = reactModule.createElement(playtestModeThemeProviderModule, nil, { Unibar = var59 })
		})
	end
	return {
		reactModule.createElement("Frame", {
			Name = "UnibarMenu",
			AutomaticSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = p4.layoutOrder,
			SelectionGroup = true,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = if fFlagEnableConsoleExpControls then nil else Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			ref = var49,
			[reactModule.Event.SelectionChanged] = if fFlagEnableConsoleExpControls then onUnibarSelectionChanged else nil,
			Visible = if fFlagEnableConsoleExpControls or fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var56.current.getUILessModeEnabled(false) then var52 else nil
		}, {
			reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = if var51 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, var47)
			}),
			var59,
			if isInExperienceUIVREnabled then reactModule.createElement(SubMenuWrapper, { subMenuHostRef = var50 }) else reactModule.createElement(subMenuModule, { subMenuHostRef = var50 }),
			if fFlagEnableConsoleExpControls then reactModule.createElement(shortcutBarModule) else nil,
			reactModule.createElement(windowManagerModule)
		})
	}
end, function(_, _)
	return true
end)