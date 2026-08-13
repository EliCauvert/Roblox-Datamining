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
local var21 = if fFlagEnableConsoleExpControls then require(chromeShared.Parent.Parent.TopBar.Components.GamepadConnector) else nil
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local panel3DInSpatialUI = nil
local panelType = nil
local var22 = nil

if isInExperienceUIVREnabled then
	local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
	panel3DInSpatialUI = vrSpatialUiModule.Panel3DInSpatialUI
	panelType = vrSpatialUiModule.Constants.PanelType
	var22 = require(corePackagesService.Workspace.Packages.Observable).ObservableValue.new(true)
end
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local fFlagRemoveFriendsChatUnibarEntrypoints = sharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local fFlagExpChatCanShowFriendsTab = sharedFlagsModule.FFlagExpChatCanShowFriendsTab

if not getFFlagChromeCentralizedConfiguration() then
	function configureUnibar() --[[ line: 83 ]]
		-- upvalues: fFlagAddMapToNineDot (ref), buildMenuOrderModule (ref), isConnectDropdownEnabledModule (ref), fFlagRemoveFriendsChatUnibarEntrypoints (ref), argoPartyExperimentation (ref), fFlagExpChatCanShowFriendsTab (ref), getFFlagDebugEnableUnibarDummyIntegrations (ref), isConnectUnibarEnabledModule (ref), constantsModule_1 (ref), fFlagAppNavMyStatsTab (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), serviceModule (ref), fFlagEnableInExperienceAvatarSwitcher (ref), constantsModule (ref), guiService (ref), fFlagEnableInExperienceShop (ref)
		local var27
		local _ = nil
		
		if fFlagAddMapToNineDot then
			var27 = buildMenuOrderModule()
		else
			var27 = { "leaderboard", "emotes", "backpack" }
			table.insert(var27, "respawn")
			table.insert(var27, 1, "trust_and_safety")
			
			if isConnectDropdownEnabledModule() and (not fFlagRemoveFriendsChatUnibarEntrypoints or not argoPartyExperimentation.getIsRenameEnabled() or not fFlagExpChatCanShowFriendsTab) then
				table.insert(var27, 1, "connect_dropdown")
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
				table.insert(var27, 2, "camera_entrypoint")
				table.insert(var27, 2, "selfie_view")
			elseif not isSpatial() then
				table.insert(var27, 2, "camera_entrypoint")
				table.insert(var27, 2, "selfie_view")
			end
			if fFlagEnableInExperienceAvatarSwitcher then
				table.insert(var27, 3, constantsModule.AVATAR_SWITCHER_ID)
			end
			if not isSpatial() and not guiService:IsTenFootInterface() then
				table.insert(var27, 4, "music_entrypoint")
			end
			if fFlagEnableInExperienceShop then
				table.insert(var27, 2, constantsModule.IN_EXPERIENCE_SHOP_ID)
			end
		end
		serviceModule:configureSubMenu("nine_dot", var27)
	end
	
	configureUnibar()
	
	if fFlagEnableConsoleExpControls then
		require(script.Parent.Parent.Shortcuts.ConfigureShortcuts)()
	end
end
function IconDivider(p0) --[[ line: 189 ]]
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref)
	local var30 = useStyle()
	local _ = nil
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Position = p0.position,
		Size = UDim2.new(0, constantsModule.DIVIDER_CELL_WIDTH, 1, 0)
	}, {
		DividerBar = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Position = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_DIVIDER_POSITION else constantsModule.ICON_DIVIDER_POSITION,
			AnchorPoint = Vector2.new(0, 0.5),
			Size = constantsModule.ICON_DIVIDER_SIZE,
			BackgroundColor3 = var30.Theme.Divider.Color,
			BackgroundTransparency = if p0.toggleTransition then p0.toggleTransition:map(function(p1) --[[ line: 213 ]]
				-- upvalues: var30 (ref)
				return var30.Theme.Divider.Transparency + (1 - p1) * (1 - var30.Theme.Divider.Transparency)
			end) else var30.Theme.Divider.Transparency,
			Visible = p0.visible or true
		})
	})
end

local function _(p2, p3) --[[ line: 222 | named "getSelectedChild" ]]
	-- upvalues: constantsModule (ref)
	return p2.current:FindFirstChild(constantsModule.ICON_NAME_PREFIX .. tostring(p3), true)
end

function AnimationStateHelper(p4) --[[ line: 228 ]]
	-- upvalues: useObservableValueModule (ref), serviceModule (ref), reactModule (ref), fFlagEnableConsoleExpControls (ref), contextActionService (ref), guiService (ref), constantsModule (ref), fFlagUnibarMenuOpenSubmenu (ref), reactOtterModule (ref), getFIntIconSelectionTimeout (ref)
	local var31 = useObservableValueModule(serviceModule:currentSubMenu())
	local var32 = useObservableValueModule(serviceModule:selectedItem())
	local var33 = useObservableValueModule(serviceModule:inFocusNav())
	reactModule.useEffect(function() --[[ line: 234 ]]
		-- upvalues: var33 (ref), fFlagEnableConsoleExpControls (copy), contextActionService (copy), serviceModule (copy), guiService (copy), p4 (ref), var32 (ref), constantsModule (copy), fFlagUnibarMenuOpenSubmenu (copy)
		if var33 then
			if not fFlagEnableConsoleExpControls then
				contextActionService:BindCoreAction("RBXEscapeUnibar", function(_, p5, _) --[[ line: 237 ]]
					-- upvalues: fFlagEnableConsoleExpControls (copy), serviceModule (copy), guiService (copy)
					if fFlagEnableConsoleExpControls then
						if p5 == Enum.UserInputState.End then
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
				if not p4.menuFrameRef.current then return end
				local var34 = p4.menuFrameRef.current:FindFirstChild(constantsModule.ICON_NAME_PREFIX .. tostring(var32), true)
				
				if var34 then
					guiService.SelectedCoreObject = var34
					
					return
				elseif fFlagUnibarMenuOpenSubmenu then
					if fFlagEnableConsoleExpControls then
						serviceModule:selectedItem():set("nine_dot")
					end
					serviceModule:toggleSubMenu("nine_dot")
					
					return
				else
					guiService:Select(p4.menuFrameRef.current)
					
					return
				end
			elseif p4.menuFrameRef.current then
				guiService:Select(p4.menuFrameRef.current)
				
				return
			end
		else
			contextActionService:UnbindCoreAction("RBXEscapeUnibar")
			
			if guiService.SelectedCoreObject and p4.menuFrameRef.current:IsAncestorOf(guiService.SelectedCoreObject) then
				guiService.SelectedCoreObject = nil
			end
		end
	end, { var33 })
	reactModule.useEffect(function() --[[ line: 282 ]]
		-- upvalues: var31 (ref), fFlagUnibarMenuOpenSubmenu (copy), var33 (ref), guiService (copy), p4 (ref), reactOtterModule (copy), constantsModule (copy)
		if var31 ~= "nine_dot" then
			p4.setToggleSubmenuTransition(reactOtterModule.spring(0, constantsModule.MENU_ANIMATION_SPRING))
			
			return
		elseif fFlagUnibarMenuOpenSubmenu and var33 then
			guiService:Select(p4.subMenuHostRef.current)
		end
		p4.setToggleSubmenuTransition(reactOtterModule.spring(1, constantsModule.MENU_ANIMATION_SPRING))
	end, { var31 })
	reactModule.useEffect(function() --[[ line: 293 ]]
		-- upvalues: fFlagEnableConsoleExpControls (copy), var31 (ref), var32 (ref), getFIntIconSelectionTimeout (copy), p4 (ref), constantsModule (copy), guiService (copy)
		if fFlagEnableConsoleExpControls and var31 == var32 then
			return
		end
		coroutine.resume(coroutine.create(function() --[[ line: 298 ]]
			-- upvalues: getFIntIconSelectionTimeout (copy), p4 (copy), var32 (copy), fFlagEnableConsoleExpControls (copy), constantsModule (copy), guiService (copy)
			local var35 = 0
			while var35 < getFIntIconSelectionTimeout() do
				var35 += 1
				task.wait()
				
				if not p4.menuFrameRef.current or not var32 then continue end
				local var36 = if fFlagEnableConsoleExpControls then p4.menuFrameRef.current:FindFirstChild(constantsModule.ICON_NAME_PREFIX .. tostring(var32), true) else p4.menuFrameRef.current:FindFirstChild("IconHitArea_" .. var32, true)
				
				if not var36 then continue end
				guiService.SelectedCoreObject = var36
				
				return
			end
		end))
	end, {
		var32,
		if fFlagEnableConsoleExpControls then var31 else nil
	})
	
	return nil
end

function linearInterpolation(p6, p7, p8) --[[ line: 324 ]]
	return p6 * (1 - p8) + p7 * p8
end

function IconPositionBinding(p9, p10, p11, p12, p13, p14, p15, p16, p17) --[[ line: 328 ]]
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref)
	local _ = nil
	local var37 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().UNIBAR_END_PADDING else constantsModule.UNIBAR_END_PADDING
	
	return reactModule.joinBindings({ p9, p13, p14 }):map(function(p18) --[[ line: 348 ]]
		-- upvalues: p17 (ref), p11 (ref), p10 (ref), p12 (ref), p16 (ref), p15 (ref), var37 (write)
		local var38 = if p16 and not p15 then p12 - p18[3] else p12
		
		return UDim2.new(0, var37 + var38 + ((if p17.current then linearInterpolation(p11, p10, p18[2]) else linearInterpolation(p10, p11, p18[2])) - var38) * p18[1], 0, 0)
	end)
end

local function onUnibarSelectionChanged(p19, _, _, p20) --[[ line: 366 ]]
	-- upvalues: serviceModule (ref)
	if not p19:IsAncestorOf(p20) then
		serviceModule:disableFocusNav()
	end
end

function isLeft(p21) --[[ line: 385 ]]
	return p21 == Enum.HorizontalAlignment.Left
end

function Unibar(p22) --[[ line: 389 ]]
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), stores (ref), useChromeMenuItemsModule (ref), reactOtterModule (ref), serviceModule (ref), fFlagReduceTopBarInsetsWhileHidden (ref), var21 (ref), useMappedObservableValueModule (ref), iconHostModule (ref), createEffect (ref), useStyle (ref), fFlagUnibarMenuOpenSubmenu (ref)
	local ICON_CELL_WIDTH, UNIBAR_END_PADDING
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var39 = unibarStyle.use()
		ICON_CELL_WIDTH = var39.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = var39.UNIBAR_END_PADDING
	else
		ICON_CELL_WIDTH = constantsModule.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = constantsModule.UNIBAR_END_PADDING
	end
	local t = {}
	local var41 = reactModule.useRef({})
	local var42 = reactModule.useRef(Vector2.zero)
	local var43 = reactModule.useRef(Vector2.zero)
	local var44 = if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and stores.GetUILessStore then reactModule.useRef(stores.GetUILessStore(false)) else nil
	local var45 = false
	local current = var41.current or {}
	local var47 = useChromeMenuItemsModule()
	local var48, var49 = reactOtterModule.useAnimatedBinding(1)
	local var50, var51 = reactOtterModule.useAnimatedBinding(1)
	local var52, var53 = reactOtterModule.useAnimatedBinding(0)
	local var54 = reactModule.useRef(0)
	local var55, var56 = reactOtterModule.useAnimatedBinding(1)
	local var57 = reactModule.useRef(false)
	local var58 = reactModule.useRef(0)
	local var59, var60 = reactOtterModule.useAnimatedBinding(if serviceModule:currentSubMenu():get() == "nine_dot" then 1 else 0)
	local t_1 = {}
	local var62 = 0
	local var63 = 0
	local var64 = 0
	local var65 = 0
	local _ = 0
	local var66 = reactModule.useCallback(function(p23) --[[ line: 437 ]]
		-- upvalues: var42 (ref), serviceModule (copy), fFlagReduceTopBarInsetsWhileHidden (copy), var43 (ref), fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), var44 (write), var21 (copy), p22 (ref), constantsModule (copy)
		local zero = Vector2.zero
		local zero_1 = Vector2.zero
		
		if p23 then
			zero = p23.AbsolutePosition
			zero_1 = p23.AbsoluteSize
			
			if zero ~= var42.current then
				var42.current = zero
				serviceModule:setMenuAbsolutePosition(zero)
			end
			if fFlagReduceTopBarInsetsWhileHidden and zero_1 ~= var43.current then
				var43.current = zero_1
			end
			if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var44.current.getUILessModeEnabled(false) then
				if zero ~= var42.current then
					var42.current = zero
					serviceModule:setMenuAbsolutePosition(zero)
				end
				if zero_1 ~= var43.current then
					var43.current = zero_1
				end
			end
		end
		if fFlagReduceTopBarInsetsWhileHidden and var21 then
			if p23 and p22.onAreaChanged and var21:getShowTopBar():get() then
				p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, zero, zero_1)
				
				return
			end
		elseif fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var44.current.getUILessModeEnabled(false) then
			if p23 and p22.onAreaChanged and var44.current.getUIVisible(false) then
				p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, zero, zero_1)
				
				return
			end
		elseif p23 and p22.onAreaChanged then
			p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, zero, p23.AbsoluteSize)
		end
	end, {})
	local var67 = reactModule.joinBindings({ var50, var52 }):map(function(p24) --[[ line: 486 ]]
		-- upvalues: var65 (write), ICON_CELL_WIDTH (write)
		return UDim2.new(0, linearInterpolation(var65, p24[2], p24[1]), 0, ICON_CELL_WIDTH)
	end)
	local var68 = useMappedObservableValueModule(serviceModule:orderAlignment(), isLeft)
	
	for i, v in var47 do
		if v.integration.availability:get() == serviceModule.AvailabilitySignal.Pinned then
			var62 += 1
		end
	end
	local var69 = if var68 then 1 else math.max(var62 - 1, 0)
	
	for i_1, v_1 in var47 do
		if v_1.isDivider then
			local var72 = var63 + ICON_CELL_WIDTH * var69
			local id = current[v_1.id] or var63
			t[v_1.id] = var63
			var45 = var45 or id ~= var63
			local var74 = IconPositionBinding(var48, id, var63, var72, var55, var52, false, var68, var57)
			t_1[v_1.id or "icon" .. i_1] = reactModule.createElement(IconDivider, {
				position = var74,
				visible = if var68 then reactModule.joinBindings({ var74, var67 }):map(function(p26) --[[ line: 528 ]]
					-- upvalues: ICON_CELL_WIDTH (write)
					return ICON_CELL_WIDTH * 0.5 <= p26[1].X.Offset
				end) else reactModule.joinBindings({ var74, var67 }):map(function(p25) --[[ line: 533 ]]
					-- upvalues: ICON_CELL_WIDTH (write)
					return p25[1].X.Offset <= p25[2].X.Offset - ICON_CELL_WIDTH
				end),
				toggleTransition = var50
			})
			var63 += constantsModule.DIVIDER_CELL_WIDTH
		elseif v_1.integration then
			local var75 = false
			local var76 = var63 + ICON_CELL_WIDTH * var69
			
			if v_1.integration.availability:get() == serviceModule.AvailabilitySignal.Pinned then
				var75 = true
				var76 = var64
			end
			local var77 = if current[v_1.id] == nil then var63 else current[v_1.id]
			t[v_1.id] = var63
			var45 = var45 or var77 ~= var63
			local var78 = IconPositionBinding(var48, var77, var63, var76, var55, var52, var75, var68, var57)
			t_1[v_1.id or "icon" .. i_1] = reactModule.createElement(iconHostModule, {
				position = var78,
				visible = var75 or (if var68 then reactModule.joinBindings({ var78, var67 }):map(function(p28) --[[ line: 572 ]]
					-- upvalues: ICON_CELL_WIDTH (write)
					return ICON_CELL_WIDTH * 0.5 <= p28[1].X.Offset
				end) else reactModule.joinBindings({ var78, var67 }):map(function(p27) --[[ line: 577 ]]
					-- upvalues: ICON_CELL_WIDTH (write)
					return p27[1].X.Offset <= p27[2].X.Offset - ICON_CELL_WIDTH * 1.5
				end)),
				toggleTransition = var59,
				integration = v_1
			})
			var63 += ICON_CELL_WIDTH
			
			if var75 then
				var64 += ICON_CELL_WIDTH
			end
		end
	end
	var65 = var63
	
	if p22.onMinWidthChanged then
		p22.onMinWidthChanged(var65)
	end
	local var70 = UNIBAR_END_PADDING * 2 + var63
	reactModule.useEffect(function() --[[ line: 603 ]]
		-- upvalues: var54 (ref), var52 (ref), var53 (ref), reactOtterModule (copy), var70 (write), constantsModule (copy), serviceModule (copy), ICON_CELL_WIDTH (write)
		local current = var54.current
		
		if var52:getValue() == 0 then
			var53(reactOtterModule.instant(var70))
			var54.current = var70
		elseif current ~= var70 then
			var53(reactOtterModule.spring(var70, constantsModule.MENU_ANIMATION_SPRING))
			var54.current = var70
		end
		serviceModule:setMenuAbsoluteSize(Vector2.new(var70, ICON_CELL_WIDTH))
	end, { var70 })
	
	if var45 then
		var58.current = (var58.current or 0) + 1
	end
	var41.current = t
	reactModule.useEffect(function() --[[ line: 621 ]]
		-- upvalues: var57 (ref), var56 (ref), reactOtterModule (copy), constantsModule (copy)
		if var57.current then
			var56(reactOtterModule.spring(1, constantsModule.MENU_ANIMATION_SPRING))
			var57.current = false
			
			return
		end
		var56(reactOtterModule.spring(0, constantsModule.MENU_ANIMATION_SPRING))
		var57.current = true
	end, { var58.current, var57 })
	reactModule.useEffect(function() --[[ line: 633 ]]
		-- upvalues: fFlagReduceTopBarInsetsWhileHidden (copy), var21 (copy), p22 (ref), constantsModule (copy), var42 (ref), var43 (ref)
		if fFlagReduceTopBarInsetsWhileHidden and var21 then
			local showTopBar = var21:getShowTopBar()
			showTopBar:connect(function() --[[ line: 636 ]]
				-- upvalues: showTopBar (ref), p22 (copy), constantsModule (copy), var42 (copy), var43 (copy)
				if showTopBar:get() then
					p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, var42.current, var43.current)
					
					return
				end
				p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
			end)
			p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 651 ]]
		-- upvalues: fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), var44 (write), createEffect (copy), p22 (ref), constantsModule (copy), var42 (ref), var43 (ref)
		local var82 = nil
		
		if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var44.current.getUILessModeEnabled(false) then
			var82 = createEffect(function(p29) --[[ line: 654 ]]
				-- upvalues: var44 (copy), p22 (copy), constantsModule (copy), var42 (copy), var43 (copy)
				if var44.current.getUIVisible(p29) then
					p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, var42.current, var43.current)
					
					return
				end
				p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
			end)
			p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		end
		return function() --[[ line: 668 ]]
			-- upvalues: var82 (write)
			if var82 then
				var82()
			end
		end
	end, {})
	local var71 = useStyle()
	
	return reactModule.createElement("Frame", {
		Size = var67,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		SelectionGroup = true,
		ref = p22.menuFrameRef,
		[reactModule.Change.AbsoluteSize] = var66,
		[reactModule.Change.AbsolutePosition] = var66
	}, {
		reactModule.createElement(AnimationStateHelper, {
			setToggleIconTransition = var49,
			setToggleWidthTransition = var51,
			setToggleSubmenuTransition = var60,
			menuFrameRef = p22.menuFrameRef,
			subMenuHostRef = if fFlagUnibarMenuOpenSubmenu then p22.subMenuHostRef else nil
		}),
		reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = var71.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = var71.Theme.BackgroundUIContrast.Transparency * var71.Settings.PreferredTransparency
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

local function UnibarPills(p30) --[[ line: 723 ]]
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), useChromeMenuItemsModule (ref), serviceModule (ref), reactOtterModule (ref), reactModule (ref), iconHostModule (ref)
	local UNIBAR_END_PADDING, MENU_SUBMENU_PADDING
	local var83 = useStyle()
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var84 = unibarStyle.use()
		UNIBAR_END_PADDING = var84.UNIBAR_END_PADDING
		MENU_SUBMENU_PADDING = var84.MENU_SUBMENU_PADDING
	else
		UNIBAR_END_PADDING = constantsModule.UNIBAR_END_PADDING
		MENU_SUBMENU_PADDING = constantsModule.MENU_SUBMENU_PADDING
	end
	local var85 = useChromeMenuItemsModule()
	local var86, var87 = reactOtterModule.useAnimatedBinding(if serviceModule:currentSubMenu():get() == "nine_dot" then 1 else 0)
	assert(var85 ~= nil, "Menu items should not be nil")
	local t = {}
	local t_1 = {}
	
	for i, v in var85 do
		if v.integration and v.isDivider == false then
			t_1["icon_host" .. i] = reactModule.createElement(iconHostModule, { toggleTransition = var86, integration = v })
		end
		if v.isDivider or i == #var85 then
			t["pill_" .. i] = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundColor3 = var83.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = var83.Theme.BackgroundUIContrast.Transparency * var83.Settings.PreferredTransparency
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
		ref = p30.menuFrameRef,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		reactModule.createElement(AnimationStateHelper, {
			setToggleSubmenuTransition = var87,
			menuFrameRef = p30.menuFrameRef,
			subMenuHostRef = p30.subMenuHostRef
		}),
		reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, MENU_SUBMENU_PADDING)
		})
	}, t)
end

local function SubMenuWrapper(p31) --[[ line: 815 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (ref), panel3DInSpatialUI (write), useObservableValueModule (ref), serviceModule (ref), var22 (write), reactModule (ref), subMenuModule (ref), panelType (write)
	if isInExperienceUIVREnabled and isSpatial() and panel3DInSpatialUI then
		var22:set(useObservableValueModule(serviceModule:currentSubMenu()) ~= nil)
	end
	return if isInExperienceUIVREnabled and isSpatial() and panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
		panelType = panelType.ChromeSubMenu,
		renderFunction = reactModule.useCallback(function(p32) --[[ line: 820 ]]
			-- upvalues: reactModule (copy), subMenuModule (copy), p31 (ref)
			return reactModule.createElement(subMenuModule, { subMenuHostRef = p31.subMenuHostRef, panelSize = p32 })
		end, { p31.subMenuHostRef }),
		visibilityObservable = var22
	}) else reactModule.createElement(subMenuModule, { subMenuHostRef = p31.subMenuHostRef })
end

return reactModule.memo(function(p33) --[[ line: 839 ]]
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), fFlagEnableConsoleExpControls (ref), fFlagUnibarMenuOpenSubmenu (ref), useMappedObservableValueModule (ref), serviceModule (ref), var21 (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), stores (ref), createEffect (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), UnibarPills (ref), fFlagEnablePlaytestModeUnibar (ref), playtestModeThemeProviderModule (ref), onUnibarSelectionChanged (ref), SubMenuWrapper (ref), subMenuModule (ref), shortcutBarModule (ref), windowManagerModule (ref)
	local _ = nil
	local var90 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().MENU_SUBMENU_PADDING else constantsModule.MENU_SUBMENU_PADDING
	local var91 = if fFlagEnableConsoleExpControls and p33.menuRef then p33.menuRef else reactModule.useRef(nil)
	local var92 = reactModule.useRef(nil)
	local var93 = if fFlagUnibarMenuOpenSubmenu then reactModule.useRef(nil) else nil
	
	local function updateSize() --[[ line: 861 ]]
		-- upvalues: var92 (ref), var91 (write)
		if var92.current and var91.current then
			var92.current.Size = var91.current.Size
		end
	end
	
	local var95 = useMappedObservableValueModule(serviceModule:orderAlignment(), isLeft)
	local var96 = nil
	local var97 = nil
	local showTopBar = nil
	
	if fFlagEnableConsoleExpControls and var21 then
		local var99, var100 = reactModule.useBinding(var21:getShowTopBar():get())
		var96 = var99
		var97 = var100
		showTopBar = var21:getShowTopBar()
	end
	local var101 = nil
	
	if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and stores.GetUILessStore then
		var101 = reactModule.useRef(stores.GetUILessStore(false))
		
		if var101.current.getUILessModeEnabled(false) then
			local var102, var103 = reactModule.useBinding(true)
			var96 = var102
			var97 = var103
		end
	end
	reactModule.useEffect(function() --[[ line: 886 ]]
		-- upvalues: var91 (write), updateSize (ref), var92 (ref), fFlagEnableConsoleExpControls (copy), showTopBar (write), var97 (write)
		local var105 = if var91 and var91.current then var91.current:GetPropertyChangedSignal("Size"):Connect(updateSize) else nil
		
		if var92.current and var91.current then
			var92.current.Size = var91.current.Size
		end
		if fFlagEnableConsoleExpControls then
			showTopBar:connect(function() --[[ line: 895 ]]
				-- upvalues: var97 (copy), showTopBar (copy)
				var97(showTopBar:get())
			end)
		end
		return function() --[[ line: 900 ]]
			-- upvalues: var105 (write)
			if var105 then
				var105:disconnect()
			end
		end
	end)
	reactModule.useEffect(function() --[[ line: 907 ]]
		-- upvalues: fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), var101 (write), createEffect (copy), var97 (write)
		local var106 = if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var101.current.getUILessModeEnabled(false) then createEffect(function(p34) --[[ line: 910 ]]
			-- upvalues: var97 (copy), var101 (copy)
			var97(var101.current.getUIVisible(p34))
		end) else nil
		
		return function() --[[ line: 915 ]]
			-- upvalues: var106 (write)
			if var106 then
				var106()
			end
		end
	end, {})
	local var104 = if isInExperienceUIVREnabled and isSpatial() then reactModule.createElement(UnibarPills, { menuFrameRef = var91, subMenuHostRef = var93 }) else reactModule.createElement(Unibar, {
		menuFrameRef = var91,
		subMenuHostRef = if fFlagUnibarMenuOpenSubmenu then var93 else nil,
		onAreaChanged = p33.onAreaChanged,
		onMinWidthChanged = p33.onMinWidthChanged
	})
	
	if fFlagEnablePlaytestModeUnibar then
		var104 = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			PlaytestModeThemeProvider = reactModule.createElement(playtestModeThemeProviderModule, nil, { Unibar = var104 })
		})
	end
	return {
		reactModule.createElement("Frame", {
			Name = "UnibarMenu",
			AutomaticSize = Enum.AutomaticSize.Y,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = p33.layoutOrder,
			SelectionGroup = true,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = if fFlagEnableConsoleExpControls then nil else Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			ref = var92,
			[reactModule.Event.SelectionChanged] = if fFlagEnableConsoleExpControls then onUnibarSelectionChanged else nil,
			Visible = if fFlagEnableConsoleExpControls or fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var101.current.getUILessModeEnabled(false) then var96 else nil
		}, {
			reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = if var95 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, var90)
			}),
			var104,
			if isInExperienceUIVREnabled then reactModule.createElement(SubMenuWrapper, { subMenuHostRef = var93 }) else reactModule.createElement(subMenuModule, { subMenuHostRef = var93 }),
			if fFlagEnableConsoleExpControls then reactModule.createElement(shortcutBarModule) else nil,
			reactModule.createElement(windowManagerModule)
		})
	}
end, function(_, _) --[[ line: 987 ]]
	return true
end)