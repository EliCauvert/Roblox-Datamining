local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local gamepadService = game:GetService("GamepadService")
local contextActionService = game:GetService("ContextActionService")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagReduceTopBarInsetsWhileHidden = sharedFlagsModule.FFlagReduceTopBarInsetsWhileHidden
local fFlagShowUnibarOnVirtualCursor = sharedFlagsModule.FFlagShowUnibarOnVirtualCursor
local fFlagAddUILessMode = sharedFlagsModule.FFlagAddUILessMode
local fIntAddUILessModeVariant = sharedFlagsModule.FIntAddUILessModeVariant
local _ = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local chrome = robloxGui.Modules.Chrome
local focusUtils = require(corePackagesService.Workspace.Packages.Chrome).FocusUtils
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local isInExperienceUIVREnabled = require(corePackagesService.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local var14 = if enabled() and (fFlagEnableConsoleExpControls or isInExperienceUIVREnabled) then require(chrome.Service) else nil
local var15 = if enabled() and fFlagEnableConsoleExpControls then require(chrome.ChromeShared.Unibar.Constants) else nil
local _ = require(robloxGui.Modules.TenFootInterface)
local isNewInGameMenuEnabledModule = require(robloxGui.Modules.isNewInGameMenuEnabled)
local inGameMenuConstantsModule = require(robloxGui.Modules.InGameMenuConstants)
local _ = require(robloxGui.Modules.PlayerList.PlayerListManager)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local badgeOver12Module = require(script.Parent.BadgeOver12)
local stores = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Stores
local signalsModule = require(corePackagesService.Packages.Signals)
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local createEffect = signalsModule.createEffect
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local isSubjectToDesktopPolicies = sharedFlagsModule.isSubjectToDesktopPolicies
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local coreGuiCommonModule = require(corePackagesService.Workspace.Packages.CoreGuiCommon)
local fFlagTopBarSignalizeKeepOutAreas = coreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local enableReferralRewardTooltip = game:DefineFastFlag("EnableReferralRewardTooltip", false)
local fFlagTopBarSignalizeMenuOpen = coreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local fFlagTopBarDeprecateDisplayOptionsRoduxModule = require(script.Parent.Parent.Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux)
local parent = script.Parent.Parent
local actions = parent.Parent.Actions
local constantsModule = require(parent.Parent.Constants)
local setGamepadMenuOpenModule = require(actions.SetGamepadMenuOpen)
local setKeepOutAreaModule = require(actions.SetKeepOutArea)
local menuIconHoveredSignalModule = require(script.Parent.menuIconHoveredSignal)
local var28 = if fFlagEnableConsoleExpControls and not enabled() then nil else require(script.Parent.Parent.GamepadConnector)
local var29 = if isNewInGameMenuEnabledModule() then require(robloxGui.Modules.InGameMenuInit) else nil
local isNewTiltIconEnabledModule = require(robloxGui.Modules.isNewTiltIconEnabled)
local tooltipCallout = nil
local isSpatial = nil
local panel3DInSpatialUI = nil
local panelType = nil
local SPATIAL_TOOLTIP_SPACING = nil
local _ = nil
local var31 = nil

if isInExperienceUIVREnabled then
	isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
	tooltipCallout = UIBloxModule.App.Dialog.TooltipCallout
	local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
	local UIManager = vrSpatialUiModule.UIManager
	panel3DInSpatialUI = vrSpatialUiModule.Panel3DInSpatialUI
	panelType = vrSpatialUiModule.Constants.PanelType
	SPATIAL_TOOLTIP_SPACING = vrSpatialUiModule.Constants.SPATIAL_TOOLTIP_SPACING
	
	var31 = function() --[[ line: 88 ]]
		-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (write), var14 (ref), UIManager (write)
		return if isInExperienceUIVREnabled and isSpatial() then not var14:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false
	end
end
local iconButtonModule = require(script.Parent.IconButton)
local withReferralRewardTooltipInfoModule = require(script.Parent.withReferralRewardTooltipInfo)
local menuIcon = roactModule.PureComponent:extend("MenuIcon")
local var36 = enabled()
local var37 = if var36 then 0.65 else 0.4
local list = { Enum.KeyCode.Escape }
menuIcon.validateProps = tModule.strictInterface({
	layoutOrder = tModule.integer,
	setGamepadMenuOpen = if fFlagTopBarDeprecateDisplayOptionsRoduxModule then nil else tModule.callback,
	iconScale = if fFlagTopBarSignalizeMenuOpen then nil else tModule.optional(tModule.number),
	onAreaChanged = tModule.optional(tModule.callback),
	showBadgeOver12 = tModule.optional(tModule.boolean),
	menuIconRef = if enabled() and fFlagEnableConsoleExpControls then tModule.optional(tModule.any) else nil,
	unibarMenuRef = if enabled() and fFlagEnableConsoleExpControls then tModule.optional(tModule.any) else nil,
	referralRewardTooltipText = tModule.optional(tModule.string)
})

function menuIcon.init(p0) --[[ line: 125 ]]
	-- upvalues: var36 (ref), signalsModule (ref), displayModule (ref), fFlagTopBarSignalizeMenuOpen (ref), settingsShowSignal (ref), enabled (ref), isInExperienceUIVREnabled (ref), var31 (write), robloxGui (ref), fFlagAddUILessMode (ref), inGameMenuConstantsModule (ref), VRService (ref), VRHub (ref), gamepadService (ref), var29 (write), isNewInGameMenuEnabledModule (ref), menuIconHoveredSignalModule (ref), var37 (ref), isSubjectToDesktopPolicies (ref), fFlagEnableConsoleExpControls (ref), fFlagShowUnibarOnVirtualCursor (ref), var15 (ref), var14 (ref), focusUtils (ref), guiService (ref), contextActionService (ref), var28 (ref), roactModule (ref), fFlagReduceTopBarInsetsWhileHidden (ref), constantsModule (ref), fIntAddUILessModeVariant (ref), stores (ref), createEffect (ref)
	p0:setState({
		vrShowMenuIcon = false,
		showTooltip = false,
		isHovering = false,
		enableFlashingDot = false,
		clickLatched = if var36 then false else nil
	})
	p0.disposeUiScaleEffect = signalsModule.createEffect(function(p1) --[[ line: 133 ]]
		-- upvalues: displayModule (copy), p0 (ref)
		p0:setState({
			UiScale = displayModule.GetDisplayStore(p1).getUIScale(p1)
		})
	end)
	
	if fFlagTopBarSignalizeMenuOpen then
		settingsShowSignal:connect(function(p2) --[[ line: 142 ]]
			-- upvalues: p0 (ref)
			p0:setState({ tiltMenuOpen = p2 })
		end)
	end
	if not enabled() then
		task.spawn(function() --[[ line: 151 ]]
			-- upvalues: p0 (ref)
			p0:setState({ enableFlashingDot = true })
		end)
	end
	function p0.menuIconActivated() --[[ line: 158 ]]
		-- upvalues: p0 (ref), var36 (copy), isInExperienceUIVREnabled (copy), var31 (copy), robloxGui (copy), fFlagAddUILessMode (copy), inGameMenuConstantsModule (copy), VRService (copy), VRHub (copy), gamepadService (copy), var29 (copy), isNewInGameMenuEnabledModule (copy)
		p0:setState({
			showTooltip = false,
			isHovering = if var36 then nil else false,
			clickLatched = if var36 then true else nil
		})
		
		if isInExperienceUIVREnabled then
			if var31() then return end
			local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
			
			if fFlagAddUILessMode then
				settingsHubModule:ToggleVisibility(nil, inGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
				
				return
			end
			settingsHubModule:ToggleVisibility(inGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
			
			return
		elseif VRService.VREnabled and (VRHub.ShowTopBar or gamepadService.GamepadCursorEnabled) then
			var29.openInGameMenu(inGameMenuConstantsModule.MainPagePageKey)
			
			return
		elseif isNewInGameMenuEnabledModule() then
			var29.openInGameMenu(inGameMenuConstantsModule.MainPagePageKey)
			
			return
		end
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		
		if fFlagAddUILessMode then
			settingsHubModule:ToggleVisibility(nil, inGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
			
			return
		end
		settingsHubModule:ToggleVisibility(inGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
	end
	
	function p0.fireMenuIconHoveredSignal(p3) --[[ line: 193 ]]
		-- upvalues: menuIconHoveredSignalModule (copy)
		menuIconHoveredSignalModule:fire(p3)
	end
	
	function p0.menuIconOnHover() --[[ line: 196 ]]
		-- upvalues: isInExperienceUIVREnabled (copy), var31 (copy), var36 (copy), p0 (ref), var37 (copy), isNewInGameMenuEnabledModule (copy), isSubjectToDesktopPolicies (copy), var29 (copy), inGameMenuConstantsModule (copy)
		if isInExperienceUIVREnabled and var31() then return end
		if var36 then
			p0:setState({ isHovering = true })
			p0.fireMenuIconHoveredSignal(true)
			delay(var37, function() --[[ line: 206 ]]
				-- upvalues: p0 (copy), isInExperienceUIVREnabled (copy), var31 (copy)
				if p0.state.isHovering and not p0.state.clickLatched then
					if isInExperienceUIVREnabled and var31() then return end
					p0:setState({ showTooltip = true })
				end
			end)
		else
			p0.fireMenuIconHoveredSignal(false)
		end
		if isNewInGameMenuEnabledModule() then
			if not isSubjectToDesktopPolicies() then return end
			var29.openInGameMenu(inGameMenuConstantsModule.InitalPageKey)
			var29.setMenuIconTooltipOpen(false)
		end
	end
	
	function p0.menuIconOnHoverEnd() --[[ line: 230 ]]
		-- upvalues: p0 (ref), var36 (copy)
		p0:setState({
			showTooltip = false,
			isHovering = false,
			clickLatched = if var36 then false else nil
		})
	end
	
	function p0.showTopBarCallback() --[[ line: 238 ]]
		-- upvalues: p0 (ref)
		if p0.state.vrShowMenuIcon ~= false then
			p0:setState({ vrShowMenuIcon = false })
		end
	end
	
	if enabled() and fFlagEnableConsoleExpControls then
		function p0.onMenuIconSelectionChanged(_, p4, _, p5) --[[ line: 248 ]]
			-- upvalues: fFlagEnableConsoleExpControls (copy), gamepadService (copy), fFlagShowUnibarOnVirtualCursor (copy), var15 (copy), var14 (copy), focusUtils (copy), guiService (copy), contextActionService (copy)
			if fFlagEnableConsoleExpControls then
				if gamepadService.GamepadCursorEnabled then return end
				if (not fFlagShowUnibarOnVirtualCursor or not gamepadService.GamepadCursorEnabled) and (p5 and string.find(p5.Name, var15.ICON_NAME_PREFIX)) then
					var14:enableFocusNav()
				end
				focusUtils.MenuIconSelectedSignal:set(p4)
				
				return
			else
				local function unfocusTilt(_, p6, _) --[[ line: 259 ]]
					-- upvalues: fFlagEnableConsoleExpControls (copy), guiService (copy)
					if (fFlagEnableConsoleExpControls or p6 ~= Enum.UserInputState.End) and (not fFlagEnableConsoleExpControls or p6 ~= Enum.UserInputState.Begin) then
						return Enum.ContextActionResult.Pass
					end
					guiService.SelectedCoreObject = nil
					
					return Enum.ContextActionResult.Sink
				end
				
				if p4 then
					contextActionService:BindCoreAction("Unfocus_Tilt", unfocusTilt, false, Enum.KeyCode.ButtonB)
					
					return
				end
				contextActionService:UnbindCoreAction("Unfocus_Tilt")
				
				if (not fFlagShowUnibarOnVirtualCursor or not gamepadService.GamepadCursorEnabled) and (p5 and string.find(p5.Name, var15.ICON_NAME_PREFIX)) then
					var14:enableFocusNav()
				end
			end
		end
	end
	if (if fFlagEnableConsoleExpControls then enabled() and var28 else enabled) and fFlagEnableConsoleExpControls then
		local showTopBar = var28:getShowTopBar()
		local var41, var42 = roactModule.createBinding(showTopBar:get())
		p0.showIcon = var41
		p0.setShowIcon = var42
		
		if fFlagReduceTopBarInsetsWhileHidden then
			p0.priorAbsolutePosition = Vector2.zero
			p0.priorAbsoluteSize = Vector2.zero
		end
		showTopBar:connect(function() --[[ line: 292 ]]
			-- upvalues: showTopBar (ref), p0 (ref), fFlagReduceTopBarInsetsWhileHidden (copy), constantsModule (copy)
			local var48 = showTopBar:get()
			p0.setShowIcon(var48)
			
			if fFlagReduceTopBarInsetsWhileHidden then
				if var48 then
					p0.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, p0.priorAbsolutePosition, p0.priorAbsoluteSize)
					
					return
				end
				p0.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero)
			end
		end)
	end
	if enabled() and fFlagEnableConsoleExpControls then
		var14:onTriggerMenuIcon():connect(function() --[[ line: 307 ]]
			-- upvalues: guiService (copy), p0 (ref), focusUtils (copy)
			guiService.SelectedCoreObject = p0.props.menuIconRef:getValue()
			focusUtils.MenuIconSelectedSignal:set(true)
		end)
	end
	if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and stores.GetUILessStore then
		p0.uiLessStore = stores.GetUILessStore(false)
		
		if p0.uiLessStore.getUILessModeEnabled(false) then
			local var43, var44 = roactModule.createBinding(true)
			p0.showIcon = var43
			p0.setShowIcon = var44
			p0.priorAbsolutePosition = Vector2.zero
			p0.priorAbsoluteSize = Vector2.zero
			p0.disposeEffect = createEffect(function(p7) --[[ line: 322 ]]
				-- upvalues: p0 (ref), constantsModule (copy)
				local UIVisible = p0.uiLessStore.getUIVisible(p7)
				p0.setShowIcon(UIVisible)
				
				if UIVisible then
					p0.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, p0.priorAbsolutePosition, p0.priorAbsoluteSize)
					
					return
				end
				p0.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero)
			end)
		end
	end
end

function menuIcon.renderWithTooltipCompat(p8, p9, p10, p11) --[[ line: 336 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (write), reactModule (ref), panel3DInSpatialUI (write), panelType (write), tooltipCallout (write), tooltipOrientation (ref), SPATIAL_TOOLTIP_SPACING (write), withTooltip (ref)
	return if not (not isInExperienceUIVREnabled or not isSpatial()) then reactModule.createElement(reactModule.Fragment, nil, {
		VRSpatialTooltip = if p10.active and p8.state.triggerPointSize and panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
			panelType = panelType.ToolTipsContainer,
			renderFunction = function(p12) --[[ line: 354 ]]
				-- upvalues: reactModule (copy), tooltipCallout (copy), p9 (ref), tooltipOrientation (copy), p8 (ref), SPATIAL_TOOLTIP_SPACING (copy)
				return reactModule.createElement(tooltipCallout, {
					distanceOffset = 0,
					textAlignment = Enum.TextXAlignment.Center,
					headerText = p9.headerText,
					orientation = tooltipOrientation.Top,
					triggerPointCenter = Vector2.new(p8.state.triggerPointPosition.X + p8.state.triggerPointSize.X / 2, p12.Y - SPATIAL_TOOLTIP_SPACING),
					contentOffsetVector = Vector2.zero,
					triggerPointRadius = Vector2.zero
				})
			end
		}) else nil,
		MenuIconTriggerPoint = p11(function(p13) --[[ line: 339 ]]
			-- upvalues: p8 (ref)
			p8:setState({
				triggerPointSize = p13.AbsoluteSize,
				triggerPointPosition = p13.AbsolutePosition
			})
		end)
	}) else withTooltip(p9, p10, p11)
end

function menuIcon.willUnmount(p14) --[[ line: 378 ]]
	-- upvalues: fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), fFlagTopBarSignalizeMenuOpen (ref)
	if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and (p14.uiLessStore.getUILessModeEnabled(false) and p14.disposeEffect) then
		p14.disposeEffect()
	end
	if fFlagTopBarSignalizeMenuOpen and p14.tiltMenuDisposeEffect then
		p14.tiltMenuDisposeEffect()
	end
	if p14.disposeUiScaleEffect then
		p14.disposeUiScaleEffect()
	end
end

function menuIcon.render(p15) --[[ line: 395 ]]
	-- upvalues: isInExperienceUIVREnabled (ref), VRService (ref), constantsModule (ref), fFlagReduceTopBarInsetsWhileHidden (ref), fFlagEnableConsoleExpControls (ref), enabled (ref), var28 (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), roactModule (ref), iconButtonModule (ref), isNewTiltIconEnabledModule (ref), images (ref), fFlagTopBarSignalizeMenuOpen (ref), var36 (ref), gamepadService (ref), externalEventConnection (ref), VRHub (ref), badgeOver12Module (ref), robloxTranslatorModule (ref), list (ref), enableReferralRewardTooltip (ref), coreGuiService (ref), tooltipOrientation (ref), var14 (ref), var15 (ref)
	local var57
	local _ = nil
	local var50 = if isInExperienceUIVREnabled then true elseif VRService.VREnabled then p15.state.vrShowMenuIcon else not VRService.VREnabled
	local var51 = constantsModule.TopBarButtonHeight * p15.state.UiScale
	local var52 = constantsModule.TopBarButtonPadding * p15.state.UiScale
	local var53 = constantsModule.MENU_ICON_SIZE * p15.state.UiScale
	
	local var54 = function(p16) --[[ line: 407 ]]
		-- upvalues: fFlagReduceTopBarInsetsWhileHidden (copy), p15 (ref), fFlagEnableConsoleExpControls (copy), enabled (copy), var28 (copy), constantsModule (copy), fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy)
		if p16 then
			if fFlagReduceTopBarInsetsWhileHidden then
				p15.priorAbsolutePosition = p16.AbsolutePosition
				p15.priorAbsoluteSize = p16.AbsoluteSize
				
				if fFlagEnableConsoleExpControls and not enabled() or not var28:getShowTopBar():get() then
					return
				else
					p15.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, p16.AbsolutePosition, p16.AbsoluteSize)
					
					return
				end
			elseif fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and p15.uiLessStore.getUILessModeEnabled(false) then
				p15.priorAbsolutePosition = p16.AbsolutePosition
				p15.priorAbsoluteSize = p16.AbsoluteSize
				
				if p15.uiLessStore.getUIVisible(false) then
					p15.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, p16.AbsolutePosition, p16.AbsoluteSize)
					
					return
				end
			else
				p15.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, p16.AbsolutePosition, p16.AbsoluteSize)
			end
		end
	end
	
	local createElement = roactModule.createElement
	createElement = createElement(iconButtonModule, {
		icon = if isNewTiltIconEnabledModule() then images["icons/logo/block"] else "rbxasset://textures/ui/TopBar/coloredlogo.png",
		iconSize = if fFlagTopBarSignalizeMenuOpen then var53 * (if p15.state.tiltMenuOpen then constantsModule.MenuIconOpenScale else 1) else var53 * (p15.props.iconScale or 1),
		useIconScaleAnimation = isNewTiltIconEnabledModule(),
		onActivated = p15.menuIconActivated,
		onHover = p15.menuIconOnHover,
		onHoverEnd = if var36 then p15.menuIconOnHoverEnd else nil,
		enableFlashingDot = p15.state.enableFlashingDot,
		modal = if fFlagAddUILessMode and fIntAddUILessModeVariant == 2 and p15.uiLessStore.getUILessModeEnabled(false) then true else nil
	})
	local var55 = gamepadService and roactModule.createElement(externalEventConnection, {
		event = VRHub.ShowTopBarChanged.Event or gamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"),
		callback = p15.showTopBarCallback
	})
	local var56 = if p15.props.showBadgeOver12 then roactModule.createElement(badgeOver12Module, {
		position = if enabled() then UDim2.new(0, 1, 1, -(var52 + 1)) else UDim2.new(0, -4, 1, 4)
	}) else nil
	
	if var36 then
		var57 = "Roblox Menu"
		pcall(function() --[[ line: 459 ]]
			-- upvalues: var57 (write), robloxTranslatorModule (copy)
			var57 = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.RobloxMenu")
		end)
		local t = {
			textAlignment = Enum.TextXAlignment.Center,
			headerText = var57,
			hotkeyCodes = list
		}
		
		if enableReferralRewardTooltip and p15.props.referralRewardTooltipText and p15.props.referralRewardTooltipText ~= "" then
			t.headerText = p15.props.referralRewardTooltipText
			t.hotkeyCodes = {}
		end
		local t_1 = {
			DisplayOrder = 10,
			active = p15.state.showTooltip,
			guiTarget = coreGuiService,
			preferredOrientation = tooltipOrientation.Bottom
		}
		
		if enableReferralRewardTooltip and p15.props.referralRewardTooltipText and p15.props.referralRewardTooltipText ~= "" then
			t_1.active = true
		end
		return p15:renderWithTooltipCompat(t, t_1, function(p17) --[[ line: 484 ]]
			-- upvalues: var54 (ref), enabled (copy), fFlagEnableConsoleExpControls (copy), p15 (ref), var14 (copy), var15 (copy), roactModule (copy), iconButtonModule (copy), isNewTiltIconEnabledModule (copy), images (copy), fFlagTopBarSignalizeMenuOpen (copy), var53 (ref), constantsModule (copy), var36 (copy), fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), var50 (write), var51 (ref), var56 (ref), createElement (ref), var55 (ref)
			local var60 = function(p18) --[[ line: 485 ]]
				-- upvalues: var54 (copy), p17 (ref)
				var54(p18)
				p17(p18)
			end
			
			local var61 = nil
			
			if enabled() and fFlagEnableConsoleExpControls and (p15.props.unibarMenuRef and p15.props.unibarMenuRef.current) then
				local var62 = var14:menuList():get()[1]
				local var63 = if var62 then var15.ICON_NAME_PREFIX .. var62.id else nil
				var61 = roactModule.createElement(iconButtonModule, {
					icon = if isNewTiltIconEnabledModule() then images["icons/logo/block"] else "rbxasset://textures/ui/TopBar/coloredlogo.png",
					iconSize = if fFlagTopBarSignalizeMenuOpen then var53 * (if p15.state.tiltMenuOpen then constantsModule.MenuIconOpenScale else 1) else var53 * (p15.props.iconScale or 1),
					useIconScaleAnimation = isNewTiltIconEnabledModule(),
					onActivated = p15.menuIconActivated,
					onHover = p15.menuIconOnHover,
					onHoverEnd = if var36 then p15.menuIconOnHoverEnd else nil,
					enableFlashingDot = p15.state.enableFlashingDot,
					onSelectionChanged = p15.onMenuIconSelectionChanged,
					nextSelectionRightRef = if p15.props.unibarMenuRef.current and var63 then p15.props.unibarMenuRef.current:FindFirstChild(var63, true) else nil,
					forwardRef = p15.props.menuIconRef
				})
			end
			return roactModule.createElement("Frame", {
				Visible = if enabled() and fFlagEnableConsoleExpControls or fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and p15.uiLessStore.getUILessModeEnabled(false) then p15.showIcon:map(function(p19) --[[ line: 516 ]]
					-- upvalues: var50 (copy)
					return var50 and p19
				end) else var50,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var51, 1, 0),
				LayoutOrder = p15.props.layoutOrder,
				SelectionGroup = if enabled() and fFlagEnableConsoleExpControls then true else nil,
				SelectionBehaviorLeft = if enabled() and fFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil,
				SelectionBehaviorUp = if enabled() and fFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil,
				SelectionBehaviorDown = if enabled() and fFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil,
				[roactModule.Change.AbsoluteSize] = var60,
				[roactModule.Change.AbsolutePosition] = var60
			}, {
				BadgeOver12 = var56,
				Background = if enabled() and fFlagEnableConsoleExpControls and (p15.props.unibarMenuRef and p15.props.unibarMenuRef.current) then nil else createElement,
				IconHitArea = if enabled() and fFlagEnableConsoleExpControls then var61 else nil,
				ShowTopBarListener = var55
			})
		end)
	else
		var57 = roactModule.createElement
		
		return var57("Frame", {
			Visible = if enabled() and fFlagEnableConsoleExpControls or fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and p15.uiLessStore.getUILessModeEnabled(false) then p15.showIcon:map(function(p20) --[[ line: 537 ]]
				-- upvalues: var50 (write)
				return var50 and p20
			end) else var50,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var51, 1, 0),
			LayoutOrder = p15.props.layoutOrder,
			[roactModule.Change.AbsoluteSize] = var54,
			[roactModule.Change.AbsolutePosition] = var54
		}, {
			BadgeOver12 = var56,
			Background = createElement,
			ShowTopBarListener = var55
		})
	end
end

local var39 = roactRoduxModule.UNSTABLE_connect2(nil, function(p21) --[[ line: 553 | named "mapDispatchToProps" ]]
	-- upvalues: fFlagTopBarDeprecateDisplayOptionsRoduxModule (ref), setGamepadMenuOpenModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref)
	return {
		setGamepadMenuOpen = if fFlagTopBarDeprecateDisplayOptionsRoduxModule then nil else function(p22) --[[ line: 557 ]]
			-- upvalues: p21 (ref), setGamepadMenuOpenModule (copy)
			return p21(setGamepadMenuOpenModule(p22))
		end,
		onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p23, p24, p25) --[[ line: 562 ]]
			-- upvalues: p21 (ref), setKeepOutAreaModule (copy)
			return p21(setKeepOutAreaModule(p23, p24, p25))
		end
	}
end)(menuIcon)

return if enableReferralRewardTooltip then withReferralRewardTooltipInfoModule(var39) else var39