local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local GamepadService = game:GetService("GamepadService")
local ContextActionService = game:GetService("ContextActionService")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagReduceTopBarInsetsWhileHidden = SharedFlagsModule.FFlagReduceTopBarInsetsWhileHidden
local FFlagShowUnibarOnVirtualCursor = SharedFlagsModule.FFlagShowUnibarOnVirtualCursor
local FFlagAddUILessMode = SharedFlagsModule.FFlagAddUILessMode
local FIntAddUILessModeVariant = SharedFlagsModule.FIntAddUILessModeVariant
local _ = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local Chrome = RobloxGui.Modules.Chrome
local FocusUtils = require(CorePackages.Workspace.Packages.Chrome).FocusUtils
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local ServiceModule = if EnabledFunction() and (FFlagEnableConsoleExpControls or IsInExperienceUIVREnabled) then require(Chrome.Service) else nil
local ConstantsModule = if EnabledFunction() and FFlagEnableConsoleExpControls then require(Chrome.ChromeShared.Unibar.Constants) else nil
local _ = require(RobloxGui.Modules.TenFootInterface)
local IsNewInGameMenuEnabledModule = require(RobloxGui.Modules.isNewInGameMenuEnabled)
local InGameMenuConstantsModule = require(RobloxGui.Modules.InGameMenuConstants)
local _ = require(RobloxGui.Modules.PlayerList.PlayerListManager)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local BadgeOver12Module = require(script.Parent.BadgeOver12)
local Stores = require(CorePackages.Workspace.Packages.CoreGuiCommon).Stores
local SignalsModule = require(CorePackages.Packages.Signals)
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local CreateEffectFunction = SignalsModule.createEffect
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local IsSubjectToDesktopPoliciesFunction = SharedFlagsModule.isSubjectToDesktopPolicies
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local CoreGuiCommonModule = require(CorePackages.Workspace.Packages.CoreGuiCommon)
local FFlagTopBarSignalizeKeepOutAreas = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeKeepOutAreas
local EnableReferralRewardTooltip = game:DefineFastFlag("EnableReferralRewardTooltip", false)
local FFlagTopBarSignalizeMenuOpen = CoreGuiCommonModule.Flags.FFlagTopBarSignalizeMenuOpen
local FFlagTopBarDeprecateDisplayOptionsRoduxModule = require(script.Parent.Parent.Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux)
local Parent = script.Parent.Parent
local Actions = Parent.Parent.Actions
local ConstantsModule1 = require(Parent.Parent.Constants)
local SetGamepadMenuOpenModule = require(Actions.SetGamepadMenuOpen)
local SetKeepOutAreaModule = require(Actions.SetKeepOutArea)
local MenuIconHoveredSignalModule = require(script.Parent.menuIconHoveredSignal)
local GamepadConnectorModule = if FFlagEnableConsoleExpControls and not EnabledFunction() then nil else require(script.Parent.Parent.GamepadConnector)
local InGameMenuInitModule = if IsNewInGameMenuEnabledModule() then require(RobloxGui.Modules.InGameMenuInit) else nil
local IsNewTiltIconEnabledModule = require(RobloxGui.Modules.isNewTiltIconEnabled)
local TooltipCallout = nil
local IsSpatialFunction = nil
local Panel3DInSpatialUI = nil
local PanelType = nil
local SPATIALTOOLTIPSPACING = nil
local UIManager = nil
local Callback: (() -> boolean)? = nil

if IsInExperienceUIVREnabled then
	IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
	TooltipCallout = UIBloxModule.App.Dialog.TooltipCallout
	local VrSpatialUiModule = require(CorePackages.Workspace.Packages.VrSpatialUi)
	UIManager = VrSpatialUiModule.UIManager
	Panel3DInSpatialUI = VrSpatialUiModule.Panel3DInSpatialUI
	PanelType = VrSpatialUiModule.Constants.PanelType
	SPATIALTOOLTIPSPACING = VrSpatialUiModule.Constants.SPATIAL_TOOLTIP_SPACING
	
	Callback = function(): boolean --[[ Line: 88 ]]
		-- upvalues: IsInExperienceUIVREnabled (copy), IsSpatialFunction (ref), ServiceModule (copy), UIManager (ref)
		if IsInExperienceUIVREnabled and IsSpatialFunction() then
			local IsBottomBarInteractionOnAnimationSupported = UIManager.getInstance():isBottomBarInteractionOnAnimationSupported()
			
			return not ServiceModule:showTopBar() and not IsBottomBarInteractionOnAnimationSupported
		else
			return false
		end
	end
end
local IconButtonModule = require(script.Parent.IconButton)
local WithReferralRewardTooltipInfoModule = require(script.Parent.withReferralRewardTooltipInfo)
local MenuIcon = RoactModule.PureComponent:extend("MenuIcon")
local EnabledResult = EnabledFunction()
local v1: number = if EnabledResult then 0.65 else 0.4
local HotkeyCodes = { Enum.KeyCode.Escape }
MenuIcon.validateProps = TModule.strictInterface({
	layoutOrder = TModule.integer,
	setGamepadMenuOpen = if FFlagTopBarDeprecateDisplayOptionsRoduxModule then nil else TModule.callback,
	iconScale = if FFlagTopBarSignalizeMenuOpen then nil else TModule.optional(TModule.number),
	onAreaChanged = TModule.optional(TModule.callback),
	showBadgeOver12 = TModule.optional(TModule.boolean),
	menuIconRef = if EnabledFunction() and FFlagEnableConsoleExpControls then TModule.optional(TModule.any) else nil,
	unibarMenuRef = if EnabledFunction() and FFlagEnableConsoleExpControls then TModule.optional(TModule.any) else nil,
	referralRewardTooltipText = TModule.optional(TModule.string)
})

function MenuIcon.init(p1) --[[ Line: 125 ]]
	-- upvalues: EnabledResult (copy), SignalsModule (copy), DisplayModule (copy), FFlagTopBarSignalizeMenuOpen (copy), SettingsShowSignal (copy), EnabledFunction (copy), IsInExperienceUIVREnabled (copy), Callback (ref), RobloxGui (copy), FFlagAddUILessMode (copy), InGameMenuConstantsModule (copy), VRService (copy), VRHub (copy), GamepadService (copy), InGameMenuInitModule (ref), IsNewInGameMenuEnabledModule (copy), MenuIconHoveredSignalModule (copy), v1 (copy), IsSubjectToDesktopPoliciesFunction (copy), FFlagEnableConsoleExpControls (copy), FFlagShowUnibarOnVirtualCursor (copy), ConstantsModule (copy), ServiceModule (copy), FocusUtils (copy), GuiService (copy), ContextActionService (copy), GamepadConnectorModule (copy), RoactModule (copy), FFlagReduceTopBarInsetsWhileHidden (copy), ConstantsModule1 (copy), FIntAddUILessModeVariant (copy), Stores (copy), CreateEffectFunction (copy)
	p1:setState({
		vrShowMenuIcon = false,
		showTooltip = false,
		isHovering = false,
		enableFlashingDot = false,
		clickLatched = not EnabledResult and nil
	})
	p1.disposeUiScaleEffect = SignalsModule.createEffect(function(p2) --[[ Line: 133 ]]
		-- upvalues: DisplayModule (upval), p1 (copy)
		p1:setState({
			UiScale = DisplayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
	
	if FFlagTopBarSignalizeMenuOpen then
		SettingsShowSignal:connect(function(TiltMenuOpen) --[[ Line: 142 ]]
			-- upvalues: p1 (copy)
			p1:setState({ tiltMenuOpen = TiltMenuOpen })
		end)
	end
	if not EnabledFunction() then
		task.spawn(function() --[[ Line: 151 ]]
			-- upvalues: p1 (copy)
			p1:setState({ enableFlashingDot = true })
		end)
	end
	function p1.menuIconActivated() --[[ Line: 158 ]]
		-- upvalues: p1 (copy), EnabledResult (upval), IsInExperienceUIVREnabled (upval), Callback (upval), RobloxGui (upval), FFlagAddUILessMode (upval), InGameMenuConstantsModule (upval), VRService (upval), VRHub (upval), GamepadService (upval), InGameMenuInitModule (upval), IsNewInGameMenuEnabledModule (upval)
		p1:setState({
			showTooltip = false,
			isHovering = if EnabledResult then nil else false,
			clickLatched = if EnabledResult then true else nil
		})
		
		if IsInExperienceUIVREnabled then
			if Callback() then return end
			local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
			
			if FFlagAddUILessMode then
				SettingsHubModule:ToggleVisibility(nil, InGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
				
				return
			else
				SettingsHubModule:ToggleVisibility(InGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
				
				return
			end
		elseif VRService.VREnabled and (VRHub.ShowTopBar or GamepadService.GamepadCursorEnabled) then
			InGameMenuInitModule.openInGameMenu(InGameMenuConstantsModule.MainPagePageKey)
			
			return
		else
			if IsNewInGameMenuEnabledModule() then
				InGameMenuInitModule.openInGameMenu(InGameMenuConstantsModule.MainPagePageKey)
				
				return
			end
			local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
			
			if FFlagAddUILessMode then
				SettingsHubModule:ToggleVisibility(nil, InGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
				
				return
			else
				SettingsHubModule:ToggleVisibility(InGameMenuConstantsModule.AnalyticsMenuOpenTypes.TopbarButton)
			end
		end
	end
	
	function p1.fireMenuIconHoveredSignal(p2) --[[ Line: 193 ]]
		-- upvalues: MenuIconHoveredSignalModule (upval)
		MenuIconHoveredSignalModule:fire(p2)
	end
	
	function p1.menuIconOnHover() --[[ Line: 196 ]]
		-- upvalues: IsInExperienceUIVREnabled (upval), Callback (upval), EnabledResult (upval), p1 (copy), v1 (upval), IsNewInGameMenuEnabledModule (upval), IsSubjectToDesktopPoliciesFunction (upval), InGameMenuInitModule (upval), InGameMenuConstantsModule (upval)
		if IsInExperienceUIVREnabled and Callback() then return end
		if EnabledResult then
			p1:setState({ isHovering = true })
			p1.fireMenuIconHoveredSignal(true)
			delay(v1, function() --[[ Line: 206 ]]
				-- upvalues: p1 (upval), IsInExperienceUIVREnabled (upval), Callback (upval)
				if p1.state.isHovering and not p1.state.clickLatched then
					if IsInExperienceUIVREnabled and Callback() then return end
					p1:setState({ showTooltip = true })
				end
			end)
		else
			p1.fireMenuIconHoveredSignal(false)
		end
		if IsNewInGameMenuEnabledModule() then
			if not IsSubjectToDesktopPoliciesFunction() then return end
			InGameMenuInitModule.openInGameMenu(InGameMenuConstantsModule.InitalPageKey)
			InGameMenuInitModule.setMenuIconTooltipOpen(false)
		end
	end
	
	function p1.menuIconOnHoverEnd() --[[ Line: 230 ]]
		-- upvalues: p1 (copy), EnabledResult (upval)
		p1:setState({
			showTooltip = false,
			isHovering = false,
			clickLatched = not EnabledResult and nil
		})
	end
	
	function p1.showTopBarCallback() --[[ Line: 238 ]]
		-- upvalues: p1 (copy)
		if p1.state.vrShowMenuIcon ~= false then
			p1:setState({ vrShowMenuIcon = false })
		end
	end
	
	if EnabledFunction() and FFlagEnableConsoleExpControls then
		function p1:onMenuIconSelectionChanged(p2, _, p3) --[[ Line: 248 ]]
			-- upvalues: FFlagEnableConsoleExpControls (upval), GamepadService (upval), FFlagShowUnibarOnVirtualCursor (upval), ConstantsModule (upval), ServiceModule (upval), FocusUtils (upval), GuiService (upval), ContextActionService (upval)
			if FFlagEnableConsoleExpControls then
				if GamepadService.GamepadCursorEnabled then return end
				if (not FFlagShowUnibarOnVirtualCursor or not GamepadService.GamepadCursorEnabled) and p3 and string.find(p3.Name, ConstantsModule.ICON_NAME_PREFIX) then
					ServiceModule:enableFocusNav()
				end
				FocusUtils.MenuIconSelectedSignal:set(p2)
				
				return
			else
				local function unfocusTilt(_, UserInputState, _) --[[ Line: 259 ]]
					-- upvalues: FFlagEnableConsoleExpControls (upval), GuiService (upval)
					if (FFlagEnableConsoleExpControls or UserInputState ~= Enum.UserInputState.End) and (not FFlagEnableConsoleExpControls or UserInputState ~= Enum.UserInputState.Begin) then
						return Enum.ContextActionResult.Pass
					else
						GuiService.SelectedCoreObject = nil
						
						return Enum.ContextActionResult.Sink
					end
				end
				
				if p2 then
					ContextActionService:BindCoreAction("Unfocus_Tilt", unfocusTilt, false, Enum.KeyCode.ButtonB)
					
					return
				end
				ContextActionService:UnbindCoreAction("Unfocus_Tilt")
				
				if (not FFlagShowUnibarOnVirtualCursor or not GamepadService.GamepadCursorEnabled) and p3 and string.find(p3.Name, ConstantsModule.ICON_NAME_PREFIX) then
					ServiceModule:enableFocusNav()
				end
			end
		end
	end
	if (if FFlagEnableConsoleExpControls then EnabledFunction() and GamepadConnectorModule else EnabledFunction) and FFlagEnableConsoleExpControls then
		local ShowTopBar = GamepadConnectorModule:getShowTopBar()
		p1.showIcon, p1.setShowIcon = RoactModule.createBinding(ShowTopBar:get())
		
		if FFlagReduceTopBarInsetsWhileHidden then
			p1.priorAbsolutePosition = Vector2.zero
			p1.priorAbsoluteSize = Vector2.zero
		end
		ShowTopBar:connect(function() --[[ Line: 292 ]]
			-- upvalues: ShowTopBar (copy), p1 (copy), FFlagReduceTopBarInsetsWhileHidden (upval), ConstantsModule1 (upval)
			local GetResult = ShowTopBar:get()
			p1.setShowIcon(GetResult)
			
			if FFlagReduceTopBarInsetsWhileHidden then
				if GetResult then
					p1.props.onAreaChanged(ConstantsModule1.MenuIconKeepOutAreaId, p1.priorAbsolutePosition, p1.priorAbsoluteSize)
					
					return
				end
				p1.props.onAreaChanged(ConstantsModule1.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero)
			end
		end)
	end
	if EnabledFunction() and FFlagEnableConsoleExpControls then
		ServiceModule:onTriggerMenuIcon():connect(function() --[[ Line: 307 ]]
			-- upvalues: GuiService (upval), p1 (copy), FocusUtils (upval)
			GuiService.SelectedCoreObject = p1.props.menuIconRef:getValue()
			FocusUtils.MenuIconSelectedSignal:set(true)
		end)
	end
	if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and Stores.GetUILessStore then
		p1.uiLessStore = Stores.GetUILessStore(false)
		
		if p1.uiLessStore.getUILessModeEnabled(false) then
			p1.showIcon, p1.setShowIcon = RoactModule.createBinding(true)
			p1.priorAbsolutePosition = Vector2.zero
			p1.priorAbsoluteSize = Vector2.zero
			p1.disposeEffect = CreateEffectFunction(function(p2) --[[ Line: 322 ]]
				-- upvalues: p1 (copy), ConstantsModule1 (upval)
				local UIVisible = p1.uiLessStore.getUIVisible(p2)
				p1.setShowIcon(UIVisible)
				
				if UIVisible then
					p1.props.onAreaChanged(ConstantsModule1.MenuIconKeepOutAreaId, p1.priorAbsolutePosition, p1.priorAbsoluteSize)
					
					return
				else
					p1.props.onAreaChanged(ConstantsModule1.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero)
				end
			end)
		end
	end
end

function MenuIcon.renderWithTooltipCompat(p1, p2, p3, Callback) --[[ Line: 336 ]]
	-- upvalues: IsInExperienceUIVREnabled (copy), IsSpatialFunction (ref), ReactModule (copy), Panel3DInSpatialUI (ref), PanelType (ref), TooltipCallout (ref), TooltipOrientation (copy), SPATIALTOOLTIPSPACING (ref), WithTooltipFunction (copy)
	return if IsInExperienceUIVREnabled and IsSpatialFunction() then ReactModule.createElement(ReactModule.Fragment, nil, {
		VRSpatialTooltip = if p3.active and p1.state.triggerPointSize and Panel3DInSpatialUI then ReactModule.createElement(Panel3DInSpatialUI, {
			panelType = PanelType.ToolTipsContainer,
			renderFunction = function(p4) --[[ Line: 354 ]]
				-- upvalues: ReactModule (upval), TooltipCallout (upval), p2 (copy), TooltipOrientation (upval), p1 (copy), SPATIALTOOLTIPSPACING (upval)
				return ReactModule.createElement(TooltipCallout, {
					distanceOffset = 0,
					textAlignment = Enum.TextXAlignment.Center,
					headerText = p2.headerText,
					orientation = TooltipOrientation.Top,
					triggerPointCenter = Vector2.new(p1.state.triggerPointPosition.X + p1.state.triggerPointSize.X / 2, p4.Y - SPATIALTOOLTIPSPACING),
					contentOffsetVector = Vector2.zero,
					triggerPointRadius = Vector2.zero
				})
			end
		}) else nil,
		MenuIconTriggerPoint = Callback(function(Frame: Frame) --[[ Line: 339 ]]
			-- upvalues: p1 (copy)
			p1:setState({
				triggerPointSize = Frame.AbsoluteSize,
				triggerPointPosition = Frame.AbsolutePosition
			})
		end)
	}) else WithTooltipFunction(p2, p3, Callback)
end

function MenuIcon.willUnmount(p1) --[[ Line: 378 ]]
	-- upvalues: FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), FFlagTopBarSignalizeMenuOpen (copy)
	if FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and p1.uiLessStore.getUILessModeEnabled(false) and p1.disposeEffect then
		p1.disposeEffect()
	end
	if FFlagTopBarSignalizeMenuOpen and p1.tiltMenuDisposeEffect then
		p1.tiltMenuDisposeEffect()
	end
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
end

function MenuIcon.render(p1) --[[ Line: 395 ]]
	-- upvalues: IsInExperienceUIVREnabled (copy), VRService (copy), ConstantsModule1 (copy), FFlagReduceTopBarInsetsWhileHidden (copy), FFlagEnableConsoleExpControls (copy), EnabledFunction (copy), GamepadConnectorModule (copy), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), RoactModule (copy), IconButtonModule (copy), IsNewTiltIconEnabledModule (copy), Images (copy), FFlagTopBarSignalizeMenuOpen (copy), EnabledResult (copy), GamepadService (copy), ExternalEventConnection (copy), VRHub (copy), BadgeOver12Module (copy), RobloxTranslatorModule (copy), HotkeyCodes (copy), EnableReferralRewardTooltip (copy), CoreGui (copy), TooltipOrientation (copy), ServiceModule (copy), ConstantsModule (copy)
	local NoVREnabled = nil
	NoVREnabled = if IsInExperienceUIVREnabled then true else not VRService.VREnabled or p1.state.vrShowMenuIcon
	local ScaledTopBarButtonHeight = ConstantsModule1.TopBarButtonHeight * p1.state.UiScale
	local ScaledTopBarButtonPadding = ConstantsModule1.TopBarButtonPadding * p1.state.UiScale
	local ScaledMENUICONSIZE = ConstantsModule1.MENU_ICON_SIZE * p1.state.UiScale
	
	local function v78(Frame: Frame) --[[ Line: 407 ]]
		-- upvalues: FFlagReduceTopBarInsetsWhileHidden (upval), p1 (copy), FFlagEnableConsoleExpControls (upval), EnabledFunction (upval), GamepadConnectorModule (upval), ConstantsModule1 (upval), FFlagAddUILessMode (upval), FIntAddUILessModeVariant (upval)
		if Frame then
			if FFlagReduceTopBarInsetsWhileHidden then
				p1.priorAbsolutePosition = Frame.AbsolutePosition
				p1.priorAbsoluteSize = Frame.AbsoluteSize
				
				if (not FFlagEnableConsoleExpControls or EnabledFunction()) and GamepadConnectorModule:getShowTopBar():get() then
					p1.props.onAreaChanged(ConstantsModule1.MenuIconKeepOutAreaId, Frame.AbsolutePosition, Frame.AbsoluteSize)
					
					return
				end
			elseif FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and p1.uiLessStore.getUILessModeEnabled(false) then
				p1.priorAbsolutePosition = Frame.AbsolutePosition
				p1.priorAbsoluteSize = Frame.AbsoluteSize
				
				if p1.uiLessStore.getUIVisible(false) then
					p1.props.onAreaChanged(ConstantsModule1.MenuIconKeepOutAreaId, Frame.AbsolutePosition, Frame.AbsoluteSize)
					
					return
				end
			else
				p1.props.onAreaChanged(ConstantsModule1.MenuIconKeepOutAreaId, Frame.AbsolutePosition, Frame.AbsoluteSize)
			end
		end
	end
	
	local Element = RoactModule.createElement(IconButtonModule, {
		icon = if IsNewTiltIconEnabledModule() then Images["icons/logo/block"] else "rbxasset://textures/ui/TopBar/coloredlogo.png",
		iconSize = if FFlagTopBarSignalizeMenuOpen then ScaledMENUICONSIZE * (if p1.state.tiltMenuOpen then ConstantsModule1.MenuIconOpenScale else 1) else ScaledMENUICONSIZE * (p1.props.iconScale or 1),
		useIconScaleAnimation = IsNewTiltIconEnabledModule(),
		onActivated = p1.menuIconActivated,
		onHover = p1.menuIconOnHover,
		onHoverEnd = if EnabledResult then p1.menuIconOnHoverEnd else nil,
		enableFlashingDot = p1.state.enableFlashingDot,
		modal = if FFlagAddUILessMode and FIntAddUILessModeVariant == 2 and p1.uiLessStore.getUILessModeEnabled(false) then true else nil
	})
	local Element1 = GamepadService and RoactModule.createElement(ExternalEventConnection, {
		event = VRHub.ShowTopBarChanged.Event or GamepadService:GetPropertyChangedSignal("GamepadCursorEnabled"),
		callback = p1.showTopBarCallback
	})
	local Element2 = if p1.props.showBadgeOver12 then RoactModule.createElement(BadgeOver12Module, {
		position = if EnabledFunction() then UDim2.new(0, 1, 1, -(ScaledTopBarButtonPadding + 1)) else UDim2.new(0, -4, 1, 4)
	}) else nil
	
	if not EnabledResult then
		local CoreScriptsTopBarRobloxMenu = RoactModule
		CoreScriptsTopBarRobloxMenu = CoreScriptsTopBarRobloxMenu.createElement
		
		return CoreScriptsTopBarRobloxMenu("Frame", {
			Visible = if EnabledFunction() and FFlagEnableConsoleExpControls then p1.showIcon:map(function(p2) --[[ Line: 537 ]]
				-- upvalues: NoVREnabled (ref)
				return NoVREnabled and p2
			end) elseif FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and p1.uiLessStore.getUILessModeEnabled(false) then p1.showIcon:map(function(p2) --[[ Line: 537 ]]
				-- upvalues: NoVREnabled (ref)
				return NoVREnabled and p2
			end) else NoVREnabled,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ScaledTopBarButtonHeight, 1, 0),
			LayoutOrder = p1.props.layoutOrder,
			[RoactModule.Change.AbsoluteSize] = v78,
			[RoactModule.Change.AbsolutePosition] = v78
		}, {
			BadgeOver12 = Element2,
			Background = Element,
			ShowTopBarListener = Element1
		})
	end
	local CoreScriptsTopBarRobloxMenu = "Roblox Menu"
	pcall(function() --[[ Line: 459 ]]
		-- upvalues: CoreScriptsTopBarRobloxMenu (ref), RobloxTranslatorModule (upval)
		CoreScriptsTopBarRobloxMenu = RobloxTranslatorModule:FormatByKey("CoreScripts.TopBar.RobloxMenu")
	end)
	local config = {
		textAlignment = Enum.TextXAlignment.Center,
		headerText = CoreScriptsTopBarRobloxMenu,
		hotkeyCodes = HotkeyCodes
	}
	
	if EnableReferralRewardTooltip and p1.props.referralRewardTooltipText and p1.props.referralRewardTooltipText ~= "" then
		config.headerText = p1.props.referralRewardTooltipText
		config.hotkeyCodes = {}
	end
	local config1 = {
		DisplayOrder = 10,
		active = p1.state.showTooltip,
		guiTarget = CoreGui,
		preferredOrientation = TooltipOrientation.Bottom
	}
	
	if EnableReferralRewardTooltip and p1.props.referralRewardTooltipText and p1.props.referralRewardTooltipText ~= "" then
		config1.active = true
	end
	return p1:renderWithTooltipCompat(config, config1, function(Callback) --[[ Line: 484 ]]
		-- upvalues: v78 (copy), EnabledFunction (upval), FFlagEnableConsoleExpControls (upval), p1 (copy), ServiceModule (upval), ConstantsModule (upval), RoactModule (upval), IconButtonModule (upval), IsNewTiltIconEnabledModule (upval), Images (upval), FFlagTopBarSignalizeMenuOpen (upval), ScaledMENUICONSIZE (copy), ConstantsModule1 (upval), EnabledResult (upval), FFlagAddUILessMode (upval), FIntAddUILessModeVariant (upval), NoVREnabled (ref), ScaledTopBarButtonHeight (copy), Element2 (copy), Element (copy), Element1 (copy)
		local function v85(Frame) --[[ Line: 485 ]]
			-- upvalues: v78 (upval), Callback (copy)
			v78(Frame)
			Callback(Frame)
		end
		
		local Element3 = nil
		
		if EnabledFunction() and FFlagEnableConsoleExpControls and p1.props.unibarMenuRef and p1.props.unibarMenuRef.current then
			local GetResultEntry = ServiceModule:menuList():get()[1]
			local Text = if GetResultEntry then ConstantsModule.ICON_NAME_PREFIX .. GetResultEntry.id else nil
			Element3 = RoactModule.createElement(IconButtonModule, {
				icon = if IsNewTiltIconEnabledModule() then Images["icons/logo/block"] else "rbxasset://textures/ui/TopBar/coloredlogo.png",
				iconSize = if FFlagTopBarSignalizeMenuOpen then ScaledMENUICONSIZE * (if p1.state.tiltMenuOpen then ConstantsModule1.MenuIconOpenScale else 1) else ScaledMENUICONSIZE * (p1.props.iconScale or 1),
				useIconScaleAnimation = IsNewTiltIconEnabledModule(),
				onActivated = p1.menuIconActivated,
				onHover = p1.menuIconOnHover,
				onHoverEnd = if EnabledResult then p1.menuIconOnHoverEnd else nil,
				enableFlashingDot = p1.state.enableFlashingDot,
				onSelectionChanged = p1.onMenuIconSelectionChanged,
				nextSelectionRightRef = if p1.props.unibarMenuRef.current and Text then p1.props.unibarMenuRef.current:FindFirstChild(Text, true) else nil,
				forwardRef = p1.props.menuIconRef
			})
		end
		return RoactModule.createElement("Frame", {
			Visible = if EnabledFunction() and FFlagEnableConsoleExpControls then p1.showIcon:map(function(p2) --[[ Line: 516 ]]
				-- upvalues: NoVREnabled (upval)
				return NoVREnabled and p2
			end) elseif FFlagAddUILessMode and FIntAddUILessModeVariant ~= 0 and p1.uiLessStore.getUILessModeEnabled(false) then p1.showIcon:map(function(p2) --[[ Line: 516 ]]
				-- upvalues: NoVREnabled (upval)
				return NoVREnabled and p2
			end) else NoVREnabled,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ScaledTopBarButtonHeight, 1, 0),
			LayoutOrder = p1.props.layoutOrder,
			SelectionGroup = if EnabledFunction() and FFlagEnableConsoleExpControls then true else nil,
			SelectionBehaviorLeft = if EnabledFunction() and FFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorUp = if EnabledFunction() and FFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil,
			SelectionBehaviorDown = if EnabledFunction() and FFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil,
			[RoactModule.Change.AbsoluteSize] = v85,
			[RoactModule.Change.AbsolutePosition] = v85
		}, {
			BadgeOver12 = Element2,
			Background = if EnabledFunction() and FFlagEnableConsoleExpControls and (p1.props.unibarMenuRef and p1.props.unibarMenuRef.current) then nil else Element,
			IconHitArea = if EnabledFunction() and FFlagEnableConsoleExpControls then Element3 else nil,
			ShowTopBarListener = Element1
		})
	end)
end

local v2 = RoactRoduxModule.UNSTABLE_connect2(nil, function(Callback) --[[ Line: 553 | Named "mapDispatchToProps" ]]
	-- upvalues: FFlagTopBarDeprecateDisplayOptionsRoduxModule (copy), SetGamepadMenuOpenModule (copy), FFlagTopBarSignalizeKeepOutAreas (copy), SetKeepOutAreaModule (copy)
	return {
		setGamepadMenuOpen = if FFlagTopBarDeprecateDisplayOptionsRoduxModule then nil else function(p1) --[[ Line: 557 ]]
			-- upvalues: Callback (copy), SetGamepadMenuOpenModule (upval)
			return Callback(SetGamepadMenuOpenModule(p1))
		end,
		onAreaChanged = if FFlagTopBarSignalizeKeepOutAreas then nil else function(p1, p2, p3) --[[ Line: 562 ]]
			-- upvalues: Callback (copy), SetKeepOutAreaModule (upval)
			return Callback(SetKeepOutAreaModule(p1, p2, p3))
		end
	}
end)(MenuIcon)

return if EnableReferralRewardTooltip then WithReferralRewardTooltipInfoModule(v2) else v2