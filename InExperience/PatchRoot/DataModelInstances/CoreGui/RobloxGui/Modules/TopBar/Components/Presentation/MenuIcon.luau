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
local var1 = if enabled() and (fFlagEnableConsoleExpControls or isInExperienceUIVREnabled) then require(chrome.Service) else nil
local var2 = if enabled() and fFlagEnableConsoleExpControls then require(chrome.ChromeShared.Unibar.Constants) else nil
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
local var3 = if fFlagEnableConsoleExpControls and not enabled() then nil else require(script.Parent.Parent.GamepadConnector)
local var4 = if isNewInGameMenuEnabledModule() then require(robloxGui.Modules.InGameMenuInit) else nil
local isNewTiltIconEnabledModule = require(robloxGui.Modules.isNewTiltIconEnabled)
local tooltipCallout = nil
local isSpatial = nil
local panel3DInSpatialUI = nil
local panelType = nil
local SPATIAL_TOOLTIP_SPACING = nil
local _ = nil
local var5 = nil

if isInExperienceUIVREnabled then
	isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
	tooltipCallout = UIBloxModule.App.Dialog.TooltipCallout
	local vrSpatialUiModule = require(corePackagesService.Workspace.Packages.VrSpatialUi)
	local UIManager = vrSpatialUiModule.UIManager
	panel3DInSpatialUI = vrSpatialUiModule.Panel3DInSpatialUI
	panelType = vrSpatialUiModule.Constants.PanelType
	SPATIAL_TOOLTIP_SPACING = vrSpatialUiModule.Constants.SPATIAL_TOOLTIP_SPACING
	
	var5 = function()
		-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (write), var1 (ref), UIManager (write)
		return if isInExperienceUIVREnabled and isSpatial() then not var1:showTopBar() and not UIManager.getInstance():isBottomBarInteractionOnAnimationSupported() else false
	end
end
local iconButtonModule = require(script.Parent.IconButton)
local withReferralRewardTooltipInfoModule = require(script.Parent.withReferralRewardTooltipInfo)
local menuIcon = roactModule.PureComponent:extend("MenuIcon")
local var6 = enabled()
local var7 = if var6 then 0.65 else 0.4
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

function menuIcon.init(p1)
	-- upvalues: var6 (ref), signalsModule (ref), displayModule (ref), fFlagTopBarSignalizeMenuOpen (ref), settingsShowSignal (ref), enabled (ref), isInExperienceUIVREnabled (ref), var5 (write), robloxGui (ref), fFlagAddUILessMode (ref), inGameMenuConstantsModule (ref), VRService (ref), VRHub (ref), gamepadService (ref), var4 (write), isNewInGameMenuEnabledModule (ref), menuIconHoveredSignalModule (ref), var7 (ref), isSubjectToDesktopPolicies (ref), fFlagEnableConsoleExpControls (ref), fFlagShowUnibarOnVirtualCursor (ref), var2 (ref), var1 (ref), focusUtils (ref), guiService (ref), contextActionService (ref), var3 (ref), roactModule (ref), fFlagReduceTopBarInsetsWhileHidden (ref), constantsModule (ref), fIntAddUILessModeVariant (ref), stores (ref), createEffect (ref)
	p1:setState({
		vrShowMenuIcon = false,
		showTooltip = false,
		isHovering = false,
		enableFlashingDot = false,
		clickLatched = if var6 then false else nil
	})
	p1.disposeUiScaleEffect = signalsModule.createEffect(function(p2)
		-- upvalues: displayModule (copy), p1 (ref)
		p1:setState({
			UiScale = displayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	
	if fFlagTopBarSignalizeMenuOpen then
		settingsShowSignal:connect(function(p2)
			-- upvalues: p1 (ref)
			p1:setState({ tiltMenuOpen = p2 })
		end)
	end
	if not enabled() then
		task.spawn(function()
			-- upvalues: p1 (ref)
			p1:setState({ enableFlashingDot = true })
		end)
	end
	function p0.menuIconActivated()
		-- upvalues: p1 (ref), var6 (copy), isInExperienceUIVREnabled (copy), var5 (copy), robloxGui (copy), fFlagAddUILessMode (copy), inGameMenuConstantsModule (copy), VRService (copy), VRHub (copy), gamepadService (copy), var4 (copy), isNewInGameMenuEnabledModule (copy)
		p1:setState({
			showTooltip = false,
			isHovering = if var6 then nil else false,
			clickLatched = if var6 then true else nil
		})
		
		if isInExperienceUIVREnabled then
			if var5() then return end
			local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
			
			if fFlagAddUILessMode then
				settingsHubModule:ToggleVisibility(nil, inGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
				
				return
			end
			settingsHubModule:ToggleVisibility(inGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
			
			return
		elseif VRService.VREnabled and (VRHub.ShowTopBar or gamepadService.GamepadCursorEnabled) then
			var4.openInGameMenu(inGameMenuConstantsModule.MainPagePageKey)
			
			return
		elseif isNewInGameMenuEnabledModule() then
			var4.openInGameMenu(inGameMenuConstantsModule.MainPagePageKey)
			
			return
		end
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		
		if fFlagAddUILessMode then
			settingsHubModule:ToggleVisibility(nil, inGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
			
			return
		end
		settingsHubModule:ToggleVisibility(inGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
	end
	
	function p0.fireMenuIconHoveredSignal(p2)
		-- upvalues: menuIconHoveredSignalModule (copy)
		menuIconHoveredSignalModule:fire(p2)
	end
	
	function p0.menuIconOnHover()
		-- upvalues: isInExperienceUIVREnabled (copy), var5 (copy), var6 (copy), p1 (ref), var7 (copy), isNewInGameMenuEnabledModule (copy), isSubjectToDesktopPolicies (copy), var4 (copy), inGameMenuConstantsModule (copy)
		if isInExperienceUIVREnabled and var5() then return end
		if var6 then
			p1:setState({ isHovering = true })
			p1.fireMenuIconHoveredSignal(true)
			delay(var7, function()
				-- upvalues: p1 (copy), isInExperienceUIVREnabled (copy), var5 (copy)
				if p1.state.isHovering and not p1.state.clickLatched then
					if isInExperienceUIVREnabled and var5() then return end
					p1:setState({ showTooltip = true })
				end
			end)
		else
			p1.fireMenuIconHoveredSignal(false)
		end
		if isNewInGameMenuEnabledModule() then
			if not isSubjectToDesktopPolicies() then return end
			var4.openInGameMenu(inGameMenuConstantsModule.InitalPageKey)
			var4.setMenuIconTooltipOpen(false)
		end
	end
	
	function p0.menuIconOnHoverEnd()
		-- upvalues: p1 (ref), var6 (copy)
		p1:setState({
			showTooltip = false,
			isHovering = false,
			clickLatched = if var6 then false else nil
		})
	end
	
	function p0.showTopBarCallback()
		-- upvalues: p1 (ref)
		if p1.state.vrShowMenuIcon ~= false then
			p1:setState({ vrShowMenuIcon = false })
		end
	end
	
	if enabled() and fFlagEnableConsoleExpControls then
		function p0.onMenuIconSelectionChanged(_, p2, _, p3)
			-- upvalues: fFlagEnableConsoleExpControls (copy), gamepadService (copy), fFlagShowUnibarOnVirtualCursor (copy), var2 (copy), var1 (copy), focusUtils (copy), guiService (copy), contextActionService (copy)
			if fFlagEnableConsoleExpControls then
				if gamepadService.GamepadCursorEnabled then return end
				if (not fFlagShowUnibarOnVirtualCursor or not gamepadService.GamepadCursorEnabled) and (p3 and string.find(p3.Name, var2.ICON_NAME_PREFIX)) then
					var1:enableFocusNav()
				end
				focusUtils.MenuIconSelectedSignal:set(p2)
				
				return
			else
				local function unfocusTilt(_, p4, _)
					-- upvalues: fFlagEnableConsoleExpControls (copy), guiService (copy)
					if (fFlagEnableConsoleExpControls or p4 ~= Enum.UserInputState.End) and (not fFlagEnableConsoleExpControls or p4 ~= Enum.UserInputState.Begin) then
						return Enum.ContextActionResult.Pass
					end
					guiService.SelectedCoreObject = nil
					
					return Enum.ContextActionResult.Sink
				end
				
				if p2 then
					contextActionService:BindCoreAction("Unfocus_Tilt", unfocusTilt, false, Enum.KeyCode.ButtonB)
					
					return
				end
				contextActionService:UnbindCoreAction("Unfocus_Tilt")
				
				if (not fFlagShowUnibarOnVirtualCursor or not gamepadService.GamepadCursorEnabled) and (p3 and string.find(p3.Name, var2.ICON_NAME_PREFIX)) then
					var1:enableFocusNav()
				end
			end
		end
	end
	if (if fFlagEnableConsoleExpControls then enabled() and var3 else enabled) and fFlagEnableConsoleExpControls then
		local showTopBar = var3:getShowTopBar()
		local var8, var9 = roactModule.createBinding(showTopBar:get())
		p1.showIcon = var8
		p1.setShowIcon = var9
		
		if fFlagReduceTopBarInsetsWhileHidden then
			p1.priorAbsolutePosition = Vector2.zero
			p1.priorAbsoluteSize = Vector2.zero
		end
		showTopBar:connect(function()
			-- upvalues: showTopBar (ref), p1 (ref), fFlagReduceTopBarInsetsWhileHidden (copy), constantsModule (copy)
			local var10 = showTopBar:get()
			p1.setShowIcon(var10)
			
			if fFlagReduceTopBarInsetsWhileHidden then
				if var10 then
					p1.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, p1.priorAbsolutePosition, p1.priorAbsoluteSize)
					
					return
				end
				p1.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero)
			end
		end)
	end
	if enabled() and fFlagEnableConsoleExpControls then
		var1:onTriggerMenuIcon():connect(function()
			-- upvalues: guiService (copy), p1 (ref), focusUtils (copy)
			guiService.SelectedCoreObject = p1.props.menuIconRef:getValue()
			focusUtils.MenuIconSelectedSignal:set(true)
		end)
	end
	if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and stores.GetUILessStore then
		p1.uiLessStore = stores.GetUILessStore(false)
		
		if p1.uiLessStore.getUILessModeEnabled(false) then
			local var10, var11 = roactModule.createBinding(true)
			p1.showIcon = var10
			p1.setShowIcon = var11
			p1.priorAbsolutePosition = Vector2.zero
			p1.priorAbsoluteSize = Vector2.zero
			p1.disposeEffect = createEffect(function(p2)
				-- upvalues: p1 (ref), constantsModule (copy)
				local UIVisible = p1.uiLessStore.getUIVisible(p2)
				p1.setShowIcon(UIVisible)
				
				if UIVisible then
					p1.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, p1.priorAbsolutePosition, p1.priorAbsoluteSize)
					
					return
				end
				p1.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero)
			end)
		end
	end
end

function menuIcon.renderWithTooltipCompat(p1, p2, p3, p4)
	-- upvalues: isInExperienceUIVREnabled (ref), isSpatial (write), reactModule (ref), panel3DInSpatialUI (write), panelType (write), tooltipCallout (write), tooltipOrientation (ref), SPATIAL_TOOLTIP_SPACING (write), withTooltip (ref)
	return if not (not isInExperienceUIVREnabled or not isSpatial()) then reactModule.createElement(reactModule.Fragment, nil, {
		VRSpatialTooltip = if p3.active and p1.state.triggerPointSize and panel3DInSpatialUI then reactModule.createElement(panel3DInSpatialUI, {
			panelType = panelType.ToolTipsContainer,
			renderFunction = function(p5)
				-- upvalues: reactModule (copy), tooltipCallout (copy), p2 (ref), tooltipOrientation (copy), p1 (ref), SPATIAL_TOOLTIP_SPACING (copy)
				return reactModule.createElement(tooltipCallout, {
					distanceOffset = 0,
					textAlignment = Enum.TextXAlignment.Center,
					headerText = p2.headerText,
					orientation = tooltipOrientation.Top,
					triggerPointCenter = Vector2.new(p1.state.triggerPointPosition.X + p1.state.triggerPointSize.X / 2, p5.Y - SPATIAL_TOOLTIP_SPACING),
					contentOffsetVector = Vector2.zero,
					triggerPointRadius = Vector2.zero
				})
			end
		}) else nil,
		MenuIconTriggerPoint = p4(function(p5)
			-- upvalues: p1 (ref)
			p1:setState({
				triggerPointSize = p5.AbsoluteSize,
				triggerPointPosition = p5.AbsolutePosition
			})
		end)
	}) else withTooltip(p2, p3, p4)
end

function menuIcon.willUnmount(p1)
	-- upvalues: fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), fFlagTopBarSignalizeMenuOpen (ref)
	if fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and (p1.uiLessStore.getUILessModeEnabled(false) and p1.disposeEffect) then
		p1.disposeEffect()
	end
	if fFlagTopBarSignalizeMenuOpen and p1.tiltMenuDisposeEffect then
		p1.tiltMenuDisposeEffect()
	end
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
end

function menuIcon.render(p1)
	-- upvalues: isInExperienceUIVREnabled (ref), VRService (ref), constantsModule (ref), fFlagReduceTopBarInsetsWhileHidden (ref), fFlagEnableConsoleExpControls (ref), enabled (ref), var3 (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), roactModule (ref), iconButtonModule (ref), isNewTiltIconEnabledModule (ref), images (ref), fFlagTopBarSignalizeMenuOpen (ref), var6 (ref), gamepadService (ref), externalEventConnection (ref), VRHub (ref), badgeOver12Module (ref), robloxTranslatorModule (ref), list (ref), enableReferralRewardTooltip (ref), coreGuiService (ref), tooltipOrientation (ref), var1 (ref), var2 (ref)
	local var8
	local _ = nil
	local var9 = if isInExperienceUIVREnabled then true elseif VRService.VREnabled then p1.state.vrShowMenuIcon else not VRService.VREnabled
	local var10 = constantsModule.TopBarButtonHeight * p1.state.UiScale
	local var11 = constantsModule.TopBarButtonPadding * p1.state.UiScale
	local var12 = constantsModule.MENU_ICON_SIZE * p1.state.UiScale
	
	local var13 = function(p2)
		-- upvalues: fFlagReduceTopBarInsetsWhileHidden (copy), p1 (ref), fFlagEnableConsoleExpControls (copy), enabled (copy), var3 (copy), constantsModule (copy), fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy)
		if p2 then
			if fFlagReduceTopBarInsetsWhileHidden then
				p1.priorAbsolutePosition = p2.AbsolutePosition
				p1.priorAbsoluteSize = p2.AbsoluteSize
				
				if fFlagEnableConsoleExpControls and not enabled() or not var3:getShowTopBar():get() then
					return
				else
					p1.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, p2.AbsolutePosition, p2.AbsoluteSize)
					
					return
				end
			elseif fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and p1.uiLessStore.getUILessModeEnabled(false) then
				p1.priorAbsolutePosition = p2.AbsolutePosition
				p1.priorAbsoluteSize = p2.AbsoluteSize
				
				if p1.uiLessStore.getUIVisible(false) then
					p1.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, p2.AbsolutePosition, p2.AbsoluteSize)
					
					return
				end
			else
				p1.props.onAreaChanged(constantsModule.MenuIconKeepOutAreaId, p2.AbsolutePosition, p2.AbsoluteSize)
			end
		end
	end
	
	local createElement = roactModule.createElement
	createElement = createElement(iconButtonModule, {
		icon = if isNewTiltIconEnabledModule() then images["icons/logo/block"] else "rbxasset://textures/ui/TopBar/coloredlogo.png",
		iconSize = if fFlagTopBarSignalizeMenuOpen then var12 * (if p1.state.tiltMenuOpen then constantsModule.MenuIconOpenScale else 1) else var12 * (p1.props.iconScale or 1),
		useIconScaleAnimation = isNewTiltIconEnabledModule(),
		onActivated = p1.menuIconActivated,
		onHover = p1.menuIconOnHover,
		onHoverEnd = if var6 then p1.menuIconOnHoverEnd else nil,
		enableFlashingDot = p1.state.enableFlashingDot,
		modal = if fFlagAddUILessMode and fIntAddUILessModeVariant == 2 and p1.uiLessStore.getUILessModeEnabled(false) then true else nil
	})
	local var14 = gamepadService and roactModule.createElement(externalEventConnection, {
		event = VRHub.ShowTopBarChanged.Event or gamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"),
		callback = p1.showTopBarCallback
	})
	local var15 = if p1.props.showBadgeOver12 then roactModule.createElement(badgeOver12Module, {
		position = if enabled() then UDim2.new(0, 1, 1, -(var11 + 1)) else UDim2.new(0, -4, 1, 4)
	}) else nil
	
	if var6 then
		var8 = "Roblox Menu"
		pcall(function()
			-- upvalues: var8 (write), robloxTranslatorModule (copy)
			var8 = robloxTranslatorModule:FormatByKey("CoreScripts.TopBar.RobloxMenu")
		end)
		local t = {
			textAlignment = Enum.TextXAlignment.Center,
			headerText = var8,
			hotkeyCodes = list
		}
		
		if enableReferralRewardTooltip and p1.props.referralRewardTooltipText and p1.props.referralRewardTooltipText ~= "" then
			t.headerText = p1.props.referralRewardTooltipText
			t.hotkeyCodes = {}
		end
		local t_1 = {
			DisplayOrder = 10,
			active = p1.state.showTooltip,
			guiTarget = coreGuiService,
			preferredOrientation = tooltipOrientation.Bottom
		}
		
		if enableReferralRewardTooltip and p1.props.referralRewardTooltipText and p1.props.referralRewardTooltipText ~= "" then
			t_1.active = true
		end
		return p1:renderWithTooltipCompat(t, t_1, function(p2)
			-- upvalues: var13 (ref), enabled (copy), fFlagEnableConsoleExpControls (copy), p1 (ref), var1 (copy), var2 (copy), roactModule (copy), iconButtonModule (copy), isNewTiltIconEnabledModule (copy), images (copy), fFlagTopBarSignalizeMenuOpen (copy), var12 (ref), constantsModule (copy), var6 (copy), fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), var9 (write), var10 (ref), var15 (ref), createElement (ref), var14 (ref)
			local var16 = function(p3)
				-- upvalues: var13 (copy), p2 (ref)
				var13(p3)
				p2(p3)
			end
			
			local var17 = nil
			
			if enabled() and fFlagEnableConsoleExpControls and (p1.props.unibarMenuRef and p1.props.unibarMenuRef.current) then
				local var18 = var1:menuList():get()[1]
				local var19 = if var18 then var2.ICON_NAME_PREFIX .. var62.id else nil
				var17 = roactModule.createElement(iconButtonModule, {
					icon = if isNewTiltIconEnabledModule() then images["icons/logo/block"] else "rbxasset://textures/ui/TopBar/coloredlogo.png",
					iconSize = if fFlagTopBarSignalizeMenuOpen then var12 * (if p1.state.tiltMenuOpen then constantsModule.MenuIconOpenScale else 1) else var12 * (p1.props.iconScale or 1),
					useIconScaleAnimation = isNewTiltIconEnabledModule(),
					onActivated = p1.menuIconActivated,
					onHover = p1.menuIconOnHover,
					onHoverEnd = if var6 then p1.menuIconOnHoverEnd else nil,
					enableFlashingDot = p1.state.enableFlashingDot,
					onSelectionChanged = p1.onMenuIconSelectionChanged,
					nextSelectionRightRef = if p1.props.unibarMenuRef.current and var19 then p1.props.unibarMenuRef.current:FindFirstChild(var19, true) else nil,
					forwardRef = p1.props.menuIconRef
				})
			end
			return roactModule.createElement("Frame", {
				Visible = if enabled() and fFlagEnableConsoleExpControls or fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and p1.uiLessStore.getUILessModeEnabled(false) then p1.showIcon:map(function(p3)
					-- upvalues: var9 (copy)
					return var9 and p3
				end) else var9,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var10, 1, 0),
				LayoutOrder = p1.props.layoutOrder,
				SelectionGroup = if enabled() and fFlagEnableConsoleExpControls then true else nil,
				SelectionBehaviorLeft = if enabled() and fFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil,
				SelectionBehaviorUp = if enabled() and fFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil,
				SelectionBehaviorDown = if enabled() and fFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil,
				[roactModule.Change.AbsoluteSize] = var16,
				[roactModule.Change.AbsolutePosition] = var16
			}, {
				BadgeOver12 = var15,
				Background = if enabled() and fFlagEnableConsoleExpControls and (p1.props.unibarMenuRef and p1.props.unibarMenuRef.current) then nil else createElement,
				IconHitArea = if enabled() and fFlagEnableConsoleExpControls then var17 else nil,
				ShowTopBarListener = var14
			})
		end)
	else
		var8 = roactModule.createElement
		
		return var8("Frame", {
			Visible = if enabled() and fFlagEnableConsoleExpControls or fFlagAddUILessMode and fIntAddUILessModeVariant ~= 0 and p1.uiLessStore.getUILessModeEnabled(false) then p1.showIcon:map(function(p2)
				-- upvalues: var9 (write)
				return var9 and p2
			end) else var9,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var10, 1, 0),
			LayoutOrder = p1.props.layoutOrder,
			[roactModule.Change.AbsoluteSize] = var13,
			[roactModule.Change.AbsolutePosition] = var13
		}, {
			BadgeOver12 = var15,
			Background = createElement,
			ShowTopBarListener = var14
		})
	end
end

local var8 = roactRoduxModule.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: fFlagTopBarDeprecateDisplayOptionsRoduxModule (ref), setGamepadMenuOpenModule (ref), fFlagTopBarSignalizeKeepOutAreas (ref), setKeepOutAreaModule (ref)
	return {
		setGamepadMenuOpen = if fFlagTopBarDeprecateDisplayOptionsRoduxModule then nil else function(p2)
			-- upvalues: p1 (ref), setGamepadMenuOpenModule (copy)
			return p1(setGamepadMenuOpenModule(p2))
		end,
		onAreaChanged = if fFlagTopBarSignalizeKeepOutAreas then nil else function(p2, p3, p4)
			-- upvalues: p1 (ref), setKeepOutAreaModule (copy)
			return p1(setKeepOutAreaModule(p2, p3, p4))
		end
	}
end)(menuIcon)

return if enableReferralRewardTooltip then withReferralRewardTooltipInfoModule(var8) else var8