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
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagAddInviteFriendsIntegration = sharedFlagsModule.FFlagAddInviteFriendsIntegration
local fFlagSideSheetSwapGalleryOrder = sharedFlagsModule.FFlagSideSheetSwapGalleryOrder
local fFlagIntegrateTraversalHistoryInSideSheet = sharedFlagsModule.FFlagIntegrateTraversalHistoryInSideSheet
local fFlagEnableInExperienceShop = sharedFlagsModule.FFlagEnableInExperienceShop
local fFlagAppNavMyStatsTab = sharedFlagsModule.FFlagAppNavMyStatsTab
local fFlagUnibarMenuOpenSubmenu = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu
local fFlagReverseUnibarModule = require(script.Parent.Parent.Parent.Flags.FFlagReverseUnibar)
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle
local serviceModule = require(chromeShared.Service)
local unibarStyle = require(corePackagesService.Workspace.Packages.Chrome).UnibarStyle
local _ = if getFFlagChromeCentralizedConfiguration() then nil else require(chromeShared.Parent.Integrations)
local subMenuModule = require(chromeShared.Unibar.SubMenu)
local windowManagerModule = require(chromeShared.Unibar.WindowManager)
local shortcutBarModule = require(chromeShared.Shortcuts.ShortcutBar)
local constantsModule = require(chromeShared.Unibar.Constants)
local useChromeMenuItemsModule = require(chromeShared.Hooks.useChromeMenuItems)
local useObservableValueModule = require(chromeShared.Hooks.useObservableValue)
local useMappedObservableValueModule = require(chromeShared.Hooks.useMappedObservableValue)
local iconHostModule = require(chromeShared.Unibar.ComponentHosts.IconHost)
local reactOtterModule = require(corePackagesService.Packages.ReactOtter)
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local fFlagReduceTopBarInsetsWhileHidden = sharedFlagsModule.FFlagReduceTopBarInsetsWhileHidden
local stores = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Stores
local createEffect = require(corePackagesService.Packages.Signals).createEffect
local inExperienceSideSheetModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheet)
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
local var24 = if fFlagIntegrateTraversalHistoryInSideSheet then require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).Traversal else nil
local var25 = if var24 then var24.Flags.FFlagAddTraversalHistory else false
local argoPartyExperimentation = require(corePackagesService.Workspace.Packages.SocialExperiments).ArgoPartyExperimentation
local fFlagRemoveFriendsChatUnibarEntrypoints = sharedFlagsModule.FFlagRemoveFriendsChatUnibarEntrypoints
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab

if not getFFlagChromeCentralizedConfiguration() then
	function configureUnibar() --[[ line: 91 ]]
		-- upvalues: fFlagEnableSideSheet (ref), isConnectDropdownEnabledModule (ref), fFlagRemoveFriendsChatUnibarEntrypoints (ref), argoPartyExperimentation (ref), fFlagExpChatEnableFriendsTab (ref), fFlagReverseUnibarModule (ref), getFFlagDebugEnableUnibarDummyIntegrations (ref), isConnectUnibarEnabledModule (ref), constantsModule_1 (ref), fFlagAppNavMyStatsTab (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), serviceModule (ref), fFlagEnableInExperienceAvatarSwitcher (ref), constantsModule (ref), guiService (ref), fFlagSideSheetSwapGalleryOrder (ref), var25 (ref), fFlagIntegrateTraversalHistoryInSideSheet (ref), fFlagAddInviteFriendsIntegration (ref), inExperienceSideSheetModule (ref), fFlagEnableInExperienceShop (ref)
		local list = { "leaderboard", "emotes", "backpack" }
		
		if not fFlagEnableSideSheet then
			table.insert(list, "respawn")
		end
		table.insert(list, 1, "trust_and_safety")
		
		if isConnectDropdownEnabledModule() and (not fFlagRemoveFriendsChatUnibarEntrypoints or not argoPartyExperimentation.getIsRenameEnabled() or not fFlagExpChatEnableFriendsTab) then
			table.insert(list, 1, "connect_dropdown")
		end
		local list_1 = { "nine_dot", "chat", "toggle_mic_mute" }
		
		if fFlagReverseUnibarModule then
			table.insert(list_1, 3, "join_voice")
			
			if getFFlagDebugEnableUnibarDummyIntegrations() then
				table.insert(list_1, "dummy_window")
				table.insert(list_1, "dummy_window_2")
			end
			if isConnectUnibarEnabledModule() then
				table.insert(list_1, if argoPartyExperimentation.getIsRenameEnabled() then "party_entrypoint" else "connect_unibar")
			end
			local index = table.find(list_1, "toggle_mic_mute")
			
			if index then
				table.insert(list_1, index, constantsModule_1.TOGGLE_MIC_INTEGRATION_ID)
			end
		else
			list_1 = { "toggle_mic_mute", "chat", "nine_dot" }
			table.insert(list_1, 2, "join_voice")
			
			if getFFlagDebugEnableUnibarDummyIntegrations() then
				table.insert(list_1, 1, "dummy_window")
				table.insert(list_1, 1, "dummy_window_2")
			end
			if isConnectUnibarEnabledModule() then
				table.insert(list_1, 1, if argoPartyExperimentation.getIsRenameEnabled() then "party_entrypoint" else "connect_unibar")
			end
			local index = table.find(list_1, "toggle_mic_mute")
			
			if index then
				table.insert(list_1, index + 1, constantsModule_1.TOGGLE_MIC_INTEGRATION_ID)
			end
		end
		if fFlagAppNavMyStatsTab then
			table.insert(list_1, "assistant_build")
		end
		if isInExperienceUIVREnabled and isSpatial() then
			serviceModule:configureMenu({ { "vr_toggle_button", "vr_safety_bubble" }, list_1 })
		else
			serviceModule:configureMenu({ list_1 })
		end
		if not isInExperienceUIVREnabled then
			table.insert(list, 2, "camera_entrypoint")
			table.insert(list, 2, "selfie_view")
		elseif not isSpatial() then
			table.insert(list, 2, "camera_entrypoint")
			table.insert(list, 2, "selfie_view")
		end
		if fFlagEnableInExperienceAvatarSwitcher then
			table.insert(list, 3, constantsModule.AVATAR_SWITCHER_ID)
		end
		if not isSpatial() and not guiService:IsTenFootInterface() then
			table.insert(list, 4, "music_entrypoint")
		end
		if fFlagEnableSideSheet then
			table.insert(list, "people")
			table.insert(list, "settings")
			
			if fFlagSideSheetSwapGalleryOrder then
				table.insert(list, "gallery")
				table.remove(list, table.find(list, "trust_and_safety"))
				table.insert(list, "trust_and_safety")
			else
				table.remove(list, table.find(list, "trust_and_safety"))
				table.insert(list, "trust_and_safety")
				table.insert(list, "gallery")
			end
			table.insert(list, "help")
			
			if var25 and fFlagIntegrateTraversalHistoryInSideSheet then
				table.insert(list, "traversal_history")
			end
			if fFlagAddInviteFriendsIntegration then
				table.insert(list, 2, "invite_friends")
			end
			table.insert(list, inExperienceSideSheetModule.Enums.ActionBinding.Leave)
			table.insert(list, inExperienceSideSheetModule.Enums.ActionBinding.Respawn)
		end
		if fFlagEnableInExperienceShop then
			table.insert(list, 2, constantsModule.IN_EXPERIENCE_SHOP_ID)
		end
		serviceModule:configureSubMenu("nine_dot", list)
	end
	
	configureUnibar()
	
	if fFlagEnableConsoleExpControls then
		require(script.Parent.Parent.Shortcuts.ConfigureShortcuts)()
	end
end
function IconDivider(p0) --[[ line: 245 ]]
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref)
	local var33 = useStyle()
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
			BackgroundColor3 = var33.Theme.Divider.Color,
			BackgroundTransparency = if p0.toggleTransition then p0.toggleTransition:map(function(p1) --[[ line: 269 ]]
				-- upvalues: var33 (ref)
				return var33.Theme.Divider.Transparency + (1 - p1) * (1 - var33.Theme.Divider.Transparency)
			end) else var33.Theme.Divider.Transparency,
			Visible = p0.visible or true
		})
	})
end

local function _(p2, p3) --[[ line: 278 | named "getSelectedChild" ]]
	-- upvalues: constantsModule (ref)
	return p2.current:FindFirstChild(constantsModule.ICON_NAME_PREFIX .. tostring(p3), true)
end

function AnimationStateHelper(p4) --[[ line: 284 ]]
	-- upvalues: useObservableValueModule (ref), serviceModule (ref), reactModule (ref), fFlagEnableConsoleExpControls (ref), contextActionService (ref), guiService (ref), constantsModule (ref), fFlagUnibarMenuOpenSubmenu (ref), reactOtterModule (ref), getFIntIconSelectionTimeout (ref)
	local var34 = useObservableValueModule(serviceModule:currentSubMenu())
	local var35 = useObservableValueModule(serviceModule:selectedItem())
	local var36 = useObservableValueModule(serviceModule:inFocusNav())
	reactModule.useEffect(function() --[[ line: 290 ]]
		-- upvalues: var36 (ref), fFlagEnableConsoleExpControls (copy), contextActionService (copy), serviceModule (copy), guiService (copy), p4 (ref), var35 (ref), constantsModule (copy), fFlagUnibarMenuOpenSubmenu (copy)
		if var36 then
			if not fFlagEnableConsoleExpControls then
				contextActionService:BindCoreAction("RBXEscapeUnibar", function(_, p5, _) --[[ line: 293 ]]
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
				local var37 = p4.menuFrameRef.current:FindFirstChild(constantsModule.ICON_NAME_PREFIX .. tostring(var35), true)
				
				if var37 then
					guiService.SelectedCoreObject = var37
					
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
	end, { var36 })
	reactModule.useEffect(function() --[[ line: 338 ]]
		-- upvalues: var34 (ref), fFlagUnibarMenuOpenSubmenu (copy), var36 (ref), guiService (copy), p4 (ref), reactOtterModule (copy), constantsModule (copy)
		if var34 ~= "nine_dot" then
			p4.setToggleSubmenuTransition(reactOtterModule.spring(0, constantsModule.MENU_ANIMATION_SPRING))
			
			return
		elseif fFlagUnibarMenuOpenSubmenu and var36 then
			guiService:Select(p4.subMenuHostRef.current)
		end
		p4.setToggleSubmenuTransition(reactOtterModule.spring(1, constantsModule.MENU_ANIMATION_SPRING))
	end, { var34 })
	reactModule.useEffect(function() --[[ line: 349 ]]
		-- upvalues: fFlagEnableConsoleExpControls (copy), var34 (ref), var35 (ref), getFIntIconSelectionTimeout (copy), p4 (ref), constantsModule (copy), guiService (copy)
		if fFlagEnableConsoleExpControls and var34 == var35 then
			return
		end
		coroutine.resume(coroutine.create(function() --[[ line: 354 ]]
			-- upvalues: getFIntIconSelectionTimeout (copy), p4 (copy), var35 (copy), fFlagEnableConsoleExpControls (copy), constantsModule (copy), guiService (copy)
			local var38 = 0
			while var38 < getFIntIconSelectionTimeout() do
				var38 += 1
				task.wait()
				
				if not p4.menuFrameRef.current or not var35 then continue end
				local var39 = if fFlagEnableConsoleExpControls then p4.menuFrameRef.current:FindFirstChild(constantsModule.ICON_NAME_PREFIX .. tostring(var35), true) else p4.menuFrameRef.current:FindFirstChild("IconHitArea_" .. var35, true)
				
				if not var39 then continue end
				guiService.SelectedCoreObject = var39
				
				return
			end
		end))
	end, {
		var35,
		if fFlagEnableConsoleExpControls then var34 else nil
	})
	
	return nil
end

function linearInterpolation(p6, p7, p8) --[[ line: 380 ]]
	return p6 * (1 - p8) + p7 * p8
end

function IconPositionBinding(p9, p10, p11, p12, p13, p14, p15, p16, p17) --[[ line: 384 ]]
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref)
	local _ = nil
	local var40 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().UNIBAR_END_PADDING else constantsModule.UNIBAR_END_PADDING
	
	return reactModule.joinBindings({ p9, p13, p14 }):map(function(p18) --[[ line: 404 ]]
		-- upvalues: p17 (ref), p11 (ref), p10 (ref), p12 (ref), p16 (ref), p15 (ref), var40 (write)
		local var41 = if p16 and not p15 then p12 - p18[3] else p12
		
		return UDim2.new(0, var40 + var41 + ((if p17.current then linearInterpolation(p11, p10, p18[2]) else linearInterpolation(p10, p11, p18[2])) - var41) * p18[1], 0, 0)
	end)
end

local function onUnibarSelectionChanged(p19, _, _, p20) --[[ line: 422 ]]
	-- upvalues: serviceModule (ref)
	if not p19:IsAncestorOf(p20) then
		serviceModule:disableFocusNav()
	end
end

function isLeft(p21) --[[ line: 441 ]]
	return p21 == Enum.HorizontalAlignment.Left
end

function Unibar(p22) --[[ line: 445 ]]
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), stores (ref), useChromeMenuItemsModule (ref), reactOtterModule (ref), serviceModule (ref), fFlagReduceTopBarInsetsWhileHidden (ref), var21 (ref), useMappedObservableValueModule (ref), iconHostModule (ref), createEffect (ref), useStyle (ref), fFlagUnibarMenuOpenSubmenu (ref)
	local ICON_CELL_WIDTH, UNIBAR_END_PADDING
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var42 = unibarStyle.use()
		ICON_CELL_WIDTH = var42.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = var42.UNIBAR_END_PADDING
	else
		ICON_CELL_WIDTH = constantsModule.ICON_CELL_WIDTH
		UNIBAR_END_PADDING = constantsModule.UNIBAR_END_PADDING
	end
	local t = {}
	local var44 = reactModule.useRef({})
	local var45 = reactModule.useRef(Vector2.zero)
	local var46 = reactModule.useRef(Vector2.zero)
	local var47 = if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and stores.GetUILessStore then reactModule.useRef(stores.GetUILessStore(false)) else nil
	local var48 = false
	local current = var44.current or {}
	local var50 = useChromeMenuItemsModule()
	local var51, var52 = reactOtterModule.useAnimatedBinding(1)
	local var53, var54 = reactOtterModule.useAnimatedBinding(1)
	local var55, var56 = reactOtterModule.useAnimatedBinding(0)
	local var57 = reactModule.useRef(0)
	local var58, var59 = reactOtterModule.useAnimatedBinding(1)
	local var60 = reactModule.useRef(false)
	local var61 = reactModule.useRef(0)
	local var62, var63 = reactOtterModule.useAnimatedBinding(if serviceModule:currentSubMenu():get() == "nine_dot" then 1 else 0)
	local t_1 = {}
	local var65 = 0
	local var66 = 0
	local var67 = 0
	local var68 = 0
	local _ = 0
	local var69 = reactModule.useCallback(function(p23) --[[ line: 493 ]]
		-- upvalues: var45 (ref), serviceModule (copy), fFlagReduceTopBarInsetsWhileHidden (copy), var46 (ref), fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), var47 (write), var21 (copy), p22 (ref), constantsModule (copy)
		local zero = Vector2.zero
		local zero_1 = Vector2.zero
		
		if p23 then
			zero = p23.AbsolutePosition
			zero_1 = p23.AbsoluteSize
			
			if zero ~= var45.current then
				var45.current = zero
				serviceModule:setMenuAbsolutePosition(zero)
			end
			if fFlagReduceTopBarInsetsWhileHidden and zero_1 ~= var46.current then
				var46.current = zero_1
			end
			if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var47.current.getUILessModeEnabled(false) then
				if zero ~= var45.current then
					var45.current = zero
					serviceModule:setMenuAbsolutePosition(zero)
				end
				if zero_1 ~= var46.current then
					var46.current = zero_1
				end
			end
		end
		if fFlagReduceTopBarInsetsWhileHidden and var21 then
			if p23 and p22.onAreaChanged and var21:getShowTopBar():get() then
				p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, zero, zero_1)
				
				return
			end
		elseif fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var47.current.getUILessModeEnabled(false) then
			if p23 and p22.onAreaChanged and var47.current.getUIVisible(false) then
				p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, zero, zero_1)
				
				return
			end
		elseif p23 and p22.onAreaChanged then
			p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, zero, p23.AbsoluteSize)
		end
	end, {})
	local var70 = reactModule.joinBindings({ var53, var55 }):map(function(p24) --[[ line: 542 ]]
		-- upvalues: var68 (write), ICON_CELL_WIDTH (write)
		return UDim2.new(0, linearInterpolation(var68, p24[2], p24[1]), 0, ICON_CELL_WIDTH)
	end)
	local var71 = useMappedObservableValueModule(serviceModule:orderAlignment(), isLeft)
	
	for i, v in var50 do
		if v.integration.availability:get() == serviceModule.AvailabilitySignal.Pinned then
			var65 += 1
		end
	end
	local var72 = if var71 then 1 else math.max(var65 - 1, 0)
	
	for i_1, v_1 in var50 do
		if v_1.isDivider then
			local var75 = var66 + ICON_CELL_WIDTH * var72
			local id = current[v_1.id] or var66
			t[v_1.id] = var66
			var48 = var48 or id ~= var66
			local var77 = IconPositionBinding(var51, id, var66, var75, var58, var55, false, var71, var60)
			t_1[v_1.id or "icon" .. i_1] = reactModule.createElement(IconDivider, {
				position = var77,
				visible = if var71 then reactModule.joinBindings({ var77, var70 }):map(function(p26) --[[ line: 584 ]]
					-- upvalues: ICON_CELL_WIDTH (write)
					return ICON_CELL_WIDTH * 0.5 <= p26[1].X.Offset
				end) else reactModule.joinBindings({ var77, var70 }):map(function(p25) --[[ line: 589 ]]
					-- upvalues: ICON_CELL_WIDTH (write)
					return p25[1].X.Offset <= p25[2].X.Offset - ICON_CELL_WIDTH
				end),
				toggleTransition = var53
			})
			var66 += constantsModule.DIVIDER_CELL_WIDTH
		elseif v_1.integration then
			local var78 = false
			local var79 = var66 + ICON_CELL_WIDTH * var72
			
			if v_1.integration.availability:get() == serviceModule.AvailabilitySignal.Pinned then
				var78 = true
				var79 = var67
			end
			local var80 = if current[v_1.id] == nil then var66 else current[v_1.id]
			t[v_1.id] = var66
			var48 = var48 or var80 ~= var66
			local var81 = IconPositionBinding(var51, var80, var66, var79, var58, var55, var78, var71, var60)
			t_1[v_1.id or "icon" .. i_1] = reactModule.createElement(iconHostModule, {
				position = var81,
				visible = var78 or (if var71 then reactModule.joinBindings({ var81, var70 }):map(function(p28) --[[ line: 628 ]]
					-- upvalues: ICON_CELL_WIDTH (write)
					return ICON_CELL_WIDTH * 0.5 <= p28[1].X.Offset
				end) else reactModule.joinBindings({ var81, var70 }):map(function(p27) --[[ line: 633 ]]
					-- upvalues: ICON_CELL_WIDTH (write)
					return p27[1].X.Offset <= p27[2].X.Offset - ICON_CELL_WIDTH * 1.5
				end)),
				toggleTransition = var62,
				integration = v_1
			})
			var66 += ICON_CELL_WIDTH
			
			if var78 then
				var67 += ICON_CELL_WIDTH
			end
		end
	end
	var68 = var66
	
	if p22.onMinWidthChanged then
		p22.onMinWidthChanged(var68)
	end
	local var73 = UNIBAR_END_PADDING * 2 + var66
	reactModule.useEffect(function() --[[ line: 659 ]]
		-- upvalues: var57 (ref), var55 (ref), var56 (ref), reactOtterModule (copy), var73 (write), constantsModule (copy), serviceModule (copy), ICON_CELL_WIDTH (write)
		local current = var57.current
		
		if var55:getValue() == 0 then
			var56(reactOtterModule.instant(var73))
			var57.current = var73
		elseif current ~= var73 then
			var56(reactOtterModule.spring(var73, constantsModule.MENU_ANIMATION_SPRING))
			var57.current = var73
		end
		serviceModule:setMenuAbsoluteSize(Vector2.new(var73, ICON_CELL_WIDTH))
	end, { var73 })
	
	if var48 then
		var61.current = (var61.current or 0) + 1
	end
	var44.current = t
	reactModule.useEffect(function() --[[ line: 677 ]]
		-- upvalues: var60 (ref), var59 (ref), reactOtterModule (copy), constantsModule (copy)
		if var60.current then
			var59(reactOtterModule.spring(1, constantsModule.MENU_ANIMATION_SPRING))
			var60.current = false
			
			return
		end
		var59(reactOtterModule.spring(0, constantsModule.MENU_ANIMATION_SPRING))
		var60.current = true
	end, { var61.current, var60 })
	reactModule.useEffect(function() --[[ line: 689 ]]
		-- upvalues: fFlagReduceTopBarInsetsWhileHidden (copy), var21 (copy), p22 (ref), constantsModule (copy), var45 (ref), var46 (ref)
		if fFlagReduceTopBarInsetsWhileHidden and var21 then
			local showTopBar = var21:getShowTopBar()
			showTopBar:connect(function() --[[ line: 692 ]]
				-- upvalues: showTopBar (ref), p22 (copy), constantsModule (copy), var45 (copy), var46 (copy)
				if showTopBar:get() then
					p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, var45.current, var46.current)
					
					return
				end
				p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
			end)
			p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 707 ]]
		-- upvalues: fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), var47 (write), createEffect (copy), p22 (ref), constantsModule (copy), var45 (ref), var46 (ref)
		local var85 = nil
		
		if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var47.current.getUILessModeEnabled(false) then
			var85 = createEffect(function(p29) --[[ line: 710 ]]
				-- upvalues: var47 (copy), p22 (copy), constantsModule (copy), var45 (copy), var46 (copy)
				if var47.current.getUIVisible(p29) then
					p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, var45.current, var46.current)
					
					return
				end
				p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
			end)
			p22.onAreaChanged(constantsModule.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		end
		return function() --[[ line: 724 ]]
			-- upvalues: var85 (write)
			if var85 then
				var85()
			end
		end
	end, {})
	local var74 = useStyle()
	
	return reactModule.createElement("Frame", {
		Size = var70,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		SelectionGroup = true,
		ref = p22.menuFrameRef,
		[reactModule.Change.AbsoluteSize] = var69,
		[reactModule.Change.AbsolutePosition] = var69
	}, {
		reactModule.createElement(AnimationStateHelper, {
			setToggleIconTransition = var52,
			setToggleWidthTransition = var54,
			setToggleSubmenuTransition = var63,
			menuFrameRef = p22.menuFrameRef,
			subMenuHostRef = if fFlagUnibarMenuOpenSubmenu then p22.subMenuHostRef else nil
		}),
		reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = var74.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = var74.Theme.BackgroundUIContrast.Transparency * var74.Settings.PreferredTransparency
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

local function UnibarPills(p30) --[[ line: 779 ]]
	-- upvalues: useStyle (ref), fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), useChromeMenuItemsModule (ref), serviceModule (ref), reactOtterModule (ref), reactModule (ref), iconHostModule (ref)
	local UNIBAR_END_PADDING, MENU_SUBMENU_PADDING
	local var86 = useStyle()
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagTokenizeUnibarConstantsWithStyleProvider then
		local var87 = unibarStyle.use()
		UNIBAR_END_PADDING = var87.UNIBAR_END_PADDING
		MENU_SUBMENU_PADDING = var87.MENU_SUBMENU_PADDING
	else
		UNIBAR_END_PADDING = constantsModule.UNIBAR_END_PADDING
		MENU_SUBMENU_PADDING = constantsModule.MENU_SUBMENU_PADDING
	end
	local var88 = useChromeMenuItemsModule()
	local var89, var90 = reactOtterModule.useAnimatedBinding(if serviceModule:currentSubMenu():get() == "nine_dot" then 1 else 0)
	assert(var88 ~= nil, "Menu items should not be nil")
	local t = {}
	local t_1 = {}
	
	for i, v in var88 do
		if v.integration and v.isDivider == false then
			t_1["icon_host" .. i] = reactModule.createElement(iconHostModule, { toggleTransition = var89, integration = v })
		end
		if v.isDivider or i == #var88 then
			t["pill_" .. i] = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundColor3 = var86.Theme.BackgroundUIContrast.Color,
				BackgroundTransparency = var86.Theme.BackgroundUIContrast.Transparency * var86.Settings.PreferredTransparency
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
			setToggleSubmenuTransition = var90,
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

local function SubMenuWrapper(p31) --[[ line: 871 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (ref), panel3DInSpatialUI (write), useObservableValueModule (ref), serviceModule (ref), var22 (write), reactModule (ref), subMenuModule (ref), panelType (write)
	if isInExperienceUIVREnabled and isSpatial() and panel3DInSpatialUI then
		var22:set(useObservableValueModule(serviceModule:currentSubMenu()) ~= nil)
	end
	return if isInExperienceUIVREnabled and isSpatial() and panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
		panelType = panelType.ChromeSubMenu,
		renderFunction = reactModule.useCallback(function(p32) --[[ line: 876 ]]
			-- upvalues: reactModule (copy), subMenuModule (copy), p31 (ref)
			return reactModule.createElement(subMenuModule, { subMenuHostRef = p31.subMenuHostRef, panelSize = p32 })
		end, { p31.subMenuHostRef }),
		visibilityObservable = var22
	}) else reactModule.createElement(subMenuModule, { subMenuHostRef = p31.subMenuHostRef })
end

return reactModule.memo(function(p33) --[[ line: 895 ]]
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), reactModule (ref), fFlagEnableConsoleExpControls (ref), fFlagUnibarMenuOpenSubmenu (ref), useMappedObservableValueModule (ref), serviceModule (ref), var21 (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), stores (ref), createEffect (ref), onUnibarSelectionChanged (ref), isInExperienceUIVREnabled (ref), isSpatial (ref), UnibarPills (ref), SubMenuWrapper (ref), subMenuModule (ref), shortcutBarModule (ref), windowManagerModule (ref)
	local _ = nil
	local var93 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().MENU_SUBMENU_PADDING else constantsModule.MENU_SUBMENU_PADDING
	local var94 = if fFlagEnableConsoleExpControls and p33.menuRef then p33.menuRef else reactModule.useRef(nil)
	local var95 = reactModule.useRef(nil)
	local var96 = if fFlagUnibarMenuOpenSubmenu then reactModule.useRef(nil) else nil
	
	local function updateSize() --[[ line: 917 ]]
		-- upvalues: var95 (ref), var94 (write)
		if var95.current and var94.current then
			var95.current.Size = var94.current.Size
		end
	end
	
	local var98 = useMappedObservableValueModule(serviceModule:orderAlignment(), isLeft)
	local var99 = nil
	local var100 = nil
	local showTopBar = nil
	
	if fFlagEnableConsoleExpControls and var21 then
		local var102, var103 = reactModule.useBinding(var21:getShowTopBar():get())
		var99 = var102
		var100 = var103
		showTopBar = var21:getShowTopBar()
	end
	local var104 = nil
	
	if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and stores.GetUILessStore then
		var104 = reactModule.useRef(stores.GetUILessStore(false))
		
		if var104.current.getUILessModeEnabled(false) then
			local var105, var106 = reactModule.useBinding(true)
			var99 = var105
			var100 = var106
		end
	end
	reactModule.useEffect(function() --[[ line: 942 ]]
		-- upvalues: var94 (write), updateSize (ref), var95 (ref), fFlagEnableConsoleExpControls (copy), showTopBar (write), var100 (write)
		local var107 = if var94 and var94.current then var94.current:GetPropertyChangedSignal("Size"):Connect(updateSize) else nil
		
		if var95.current and var94.current then
			var95.current.Size = var94.current.Size
		end
		if fFlagEnableConsoleExpControls then
			showTopBar:connect(function() --[[ line: 951 ]]
				-- upvalues: var100 (copy), showTopBar (copy)
				var100(showTopBar:get())
			end)
		end
		return function() --[[ line: 956 ]]
			-- upvalues: var107 (write)
			if var107 then
				var107:disconnect()
			end
		end
	end)
	reactModule.useEffect(function() --[[ line: 963 ]]
		-- upvalues: fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), var104 (write), createEffect (copy), var100 (write)
		local var108 = if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var104.current.getUILessModeEnabled(false) then createEffect(function(p34) --[[ line: 966 ]]
			-- upvalues: var100 (copy), var104 (copy)
			var100(var104.current.getUIVisible(p34))
		end) else nil
		
		return function() --[[ line: 971 ]]
			-- upvalues: var108 (write)
			if var108 then
				var108()
			end
		end
	end, {})
	
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
			ref = var95,
			[reactModule.Event.SelectionChanged] = if fFlagEnableConsoleExpControls then onUnibarSelectionChanged else nil,
			Visible = if fFlagEnableConsoleExpControls or fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and var104.current.getUILessModeEnabled(false) then var99 else nil
		}, {
			reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = if var98 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, var93)
			}),
			if isInExperienceUIVREnabled and isSpatial() then reactModule.createElement(UnibarPills, { menuFrameRef = var94, subMenuHostRef = var96 }) else reactModule.createElement(Unibar, {
				menuFrameRef = var94,
				subMenuHostRef = if fFlagUnibarMenuOpenSubmenu then var96 else nil,
				onAreaChanged = p33.onAreaChanged,
				onMinWidthChanged = p33.onMinWidthChanged
			}),
			if isInExperienceUIVREnabled then reactModule.createElement(SubMenuWrapper, { subMenuHostRef = var96 }) else reactModule.createElement(subMenuModule, { subMenuHostRef = var96 }),
			if fFlagEnableConsoleExpControls then reactModule.createElement(shortcutBarModule) else nil,
			reactModule.createElement(windowManagerModule)
		})
	}
end, function(_, _) --[[ line: 1029 ]]
	return true
end)