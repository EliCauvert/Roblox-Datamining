local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local CryoModule = require(CorePackages.Packages.Cryo)
local DashModule = require(CorePackages.Packages.Dash)
local TModule = require(CorePackages.Packages.t)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local ValidateImage = UIBloxModule.Core.ImageSet.Validator.validateImage
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactAnalyticsTopBarModule = require(Modules.LuaApp.Services.RoactAnalyticsTopBar)
local AppPageModule = require(Modules.LuaApp.AppPage)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local TopBarConstantsModule = require(Modules.LuaApp.Components.TopBar.TopBarConstants)
local GetFFlagEnableUseShowTopBarFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableUseShowTopBar
local FFlagLuaAppImproveAccountSwitcherPeekViewModule = require(Modules.LuaApp.Flags.FFlagLuaAppImproveAccountSwitcherPeekView)
local SocialNetworksInEditProfileIXP = require(CorePackages.Workspace.Packages.EditProfile.Flags).SocialNetworksInEditProfileIXP
local FFlagLuaAppMoveProfileIntoTopBar = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppMoveProfileIntoTopBar
local LuaAppFixWebViewUnderlyingBackButton = game:DefineFastFlag("LuaAppFixWebViewUnderlyingBackButton", false)
local AXMigrateMakeBackButtonToFocusNavigation3 = game:DefineFastFlag("AXMigrateMakeBackButtonToFocusNavigation3", false)
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local FFlagQRInSearchScanner = require(CorePackages.Workspace.Packages.SharedFlags).FFlagQRInSearchScanner
local FFlagQRInSearchProfileQR = require(CorePackages.Workspace.Packages.SharedFlags).FFlagQRInSearchProfileQR
local FFlagCiDeprecateFindFriendsModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCiDeprecateFindFriendsModal
local FFlagTCShareLinkErrorModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCShareLinkErrorModal
local FFlagFixMoreSubMenuTitleFlash = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFixMoreSubMenuTitleFlash
local WebViewRedesignEnabledEngineFeature = game:GetEngineFeature("WebViewRedesignEnabled")
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagEnableMobileGameJoinCard = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMobileGameJoinCard
local FFlagEnableHomeRobloxLogo = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableHomeRobloxLogo
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3bTopBar = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3bTopBar
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3bTopBar then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()
local IconsNavigationPushBack = UIBloxModule.App.ImageSet.Images["icons/navigation/pushBack"]
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function v50(p1)
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
	if FFlagUseNavigationSelectors then
		return Selectors.selectCurrentLegacyRoute(p1)
	else
		local History = p1.Navigation.history
		
		return History[#History]
	end
end

local function useFocusNavigationBindings(ButtonRef, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p1)
					-- upvalues: Callback (upval)
					p1.cancelled = true
					Callback()
				end)
			}
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, ButtonRef)))
end

return function(Callback1, p1)
	-- upvalues: RoactModule (copy), TModule (copy), DashModule (copy), AXMigrateMakeBackButtonToFocusNavigation3 (copy), FFlagLuaAppMoveProfileIntoTopBar (copy), FFlagEnableFlyoutSidePanelModule (copy), FFlagEnableHomeRobloxLogo (copy), ValidateImage (copy), FFlagEnableLeftNavOnConsole (copy), GetFFlagEnableUseShowTopBarFunction (copy), IsTenFootInterface (copy), AppPageModule (copy), AvatarScreen (copy), FFlagFixMoreSubMenuTitleFlash (copy), AppPagePropertiesModule (copy), FFlagCiDeprecateFindFriendsModal (copy), FFlagTCShareLinkErrorModal (copy), FFlagQRInSearchScanner (copy), FFlagQRInSearchProfileQR (copy), FFlagLuaAppImproveAccountSwitcherPeekViewModule (copy), SocialNetworksInEditProfileIXP (copy), FFlagEnableMobileGameJoinCard (copy), RunService (copy), WebViewRedesignEnabledEngineFeature (copy), LuaAppFixWebViewUnderlyingBackButton (copy), WithStyleFunction (copy), IconsNavigationPushBack (copy), IconButton (copy), TopBarConstantsModule (copy), IconSize (copy), RoactGamepadModule (copy), UseNavigationFunction (copy), UseRoactServiceModule (copy), RoactAnalyticsTopBarModule (copy), FFlagSignalsNavP3bTopBar (copy), GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), UseSelectorFunction (copy), v50 (copy), UseDispatchFunction (copy), ReactModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy), useFocusNavigationBindings (copy), CryoModule (copy), UseTableWrappedCallbackRefFunction (copy), RoactNavigationModule (copy), RoactServices (copy), RoactRoduxModule (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	local BackButton = RoactModule.PureComponent:extend("BackButton")
	BackButton.validateProps = TModule.strictInterface({
		formFactor = TModule.string,
		isCompactView = TModule.boolean,
		isSearching = TModule.boolean,
		isSecondary = TModule.optional(TModule.boolean),
		setVisible = DashModule.isCallable,
		cancelSearch = DashModule.isCallable,
		activateSearch = DashModule.isCallable,
		buttonRef = TModule.optional(TModule.table),
		onGoBack = if AXMigrateMakeBackButtonToFocusNavigation3 then TModule.callback else nil,
		currentRoute = TModule.table,
		navigateBack = if AXMigrateMakeBackButtonToFocusNavigation3 then nil else DashModule.isCallable,
		navigation = TModule.table,
		analytics = TModule.table,
		titleText = if FFlagLuaAppMoveProfileIntoTopBar or FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then TModule.optional(TModule.string) else nil,
		customIcon = TModule.optional(ValidateImage),
		routeName = if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then TModule.optional(TModule.string) else nil
	})
	local Callback = nil
	Callback = if AXMigrateMakeBackButtonToFocusNavigation3 then function(p2): boolean
		-- upvalues: FFlagEnableLeftNavOnConsole (upval), GetFFlagEnableUseShowTopBarFunction (upval), IsTenFootInterface (upval), AppPageModule (upval)
		local IsTenFootInterface1 = not FFlagEnableLeftNavOnConsole and (not GetFFlagEnableUseShowTopBarFunction() and IsTenFootInterface)
		
		return if IsTenFootInterface1 then true else p2[#p2].name == AppPageModule.AvatarExperienceRoot
	end else function(p2): boolean
		-- upvalues: FFlagEnableLeftNavOnConsole (upval), GetFFlagEnableUseShowTopBarFunction (upval), IsTenFootInterface (upval), AppPageModule (upval)
		if not FFlagEnableLeftNavOnConsole and (not GetFFlagEnableUseShowTopBarFunction() and IsTenFootInterface) then
			return true
		else
			local CurrentRoute = p2.currentRoute
			
			return CurrentRoute[#CurrentRoute].name == AppPageModule.AvatarExperienceRoot
		end
	end
	
	local function _(p2): boolean
		-- upvalues: AvatarScreen (upval)
		return (p2 and p2.state and p2.state.routeName or "") ~= AvatarScreen.AvatarExperienceLandingPage
	end
	
	function BackButton.init(p2)
		-- upvalues: AXMigrateMakeBackButtonToFocusNavigation3 (upval), Callback (ref), Callback1 (copy)
		if not AXMigrateMakeBackButtonToFocusNavigation3 then
			function p2.defaultBackButtonHandler()
				-- upvalues: p2 (copy), Callback (upval), AXMigrateMakeBackButtonToFocusNavigation3 (upval)
				local Analytics = p2.props.analytics
				local CurrentRoute = p2.props.currentRoute
				local Navigation = p2.props.navigation
				local NavigateBackFunction: () -> () = p2.props.navigateBack
				
				if Callback(if AXMigrateMakeBackButtonToFocusNavigation3 then p2.props.currentRoute else p2.props) then
					Analytics.reportBackButtonClick(Navigation.state.routeName)
					Navigation.goBack()
					
					return
				else
					Analytics.reportBackButtonClick(CurrentRoute[#CurrentRoute].name)
					NavigateBackFunction()
				end
			end
			
			p2.onBackButtonActivated = Callback1 or p2.defaultBackButtonHandler
		end
	end
	
	local function isVisible(Props): boolean
		-- upvalues: p1 (copy), Callback (ref), AXMigrateMakeBackButtonToFocusNavigation3 (upval), AvatarScreen (upval), FFlagFixMoreSubMenuTitleFlash (upval), AppPagePropertiesModule (upval), AppPageModule (upval), FFlagCiDeprecateFindFriendsModal (upval), FFlagTCShareLinkErrorModal (upval), FFlagQRInSearchScanner (upval), FFlagQRInSearchProfileQR (upval), FFlagLuaAppImproveAccountSwitcherPeekViewModule (upval), SocialNetworksInEditProfileIXP (upval), FFlagEnableMobileGameJoinCard (upval), RunService (upval)
		if p1 then
			return true
		end
		if Callback(if AXMigrateMakeBackButtonToFocusNavigation3 then Props.currentRoute else Props) then
			local Navigation = Props.navigation
			
			return (Navigation and Navigation.state and Navigation.state.routeName or "") ~= AvatarScreen.AvatarExperienceLandingPage
		end
		if FFlagFixMoreSubMenuTitleFlash then
			local Navigation = Props.navigation
			local RouteName = Navigation and Navigation.state and Navigation.state.routeName or ""
			
			if AppPagePropertiesModule[RouteName] and AppPagePropertiesModule[RouteName].alwaysShowBackButton then
				return true
			end
		end
		local CurrentRoute = Props.currentRoute
		local Name = nil
		
		for i = #CurrentRoute, 1, -1 do
			Name = CurrentRoute[i].name
			
			if Name ~= AppPageModule.GameDetail and Name ~= AppPageModule.ProfilePlatform and ((not FFlagCiDeprecateFindFriendsModal or Name ~= AppPageModule.ContactImporter) and Name ~= AppPageModule.TrustedContactsModal and Name ~= AppPageModule.TrustedFriendsVPCPrologue) and ((not FFlagTCShareLinkErrorModal or Name ~= AppPageModule.TrustedFriendsShareLinkErrorModal) and Name ~= AppPageModule.FriendsRenameInfoModal) and ((not FFlagQRInSearchScanner and not FFlagQRInSearchProfileQR or Name ~= AppPageModule.SettingsPermissionInteractiveAlert) and Name ~= AppPageModule.SocialToast and Name ~= AppPageModule.SocialPurchaseExperience and Name ~= AppPageModule.SocialUnableToJoinExperience and Name ~= AppPageModule.InviteLinkExpiredModal and Name ~= AppPageModule.ShareLinkInvalidModal and Name ~= AppPageModule.SocialMessageToast and Name ~= AppPageModule.SquadLobby and Name ~= AppPageModule.InfoPeekView and Name ~= AppPageModule.SponsoredTooltipPeekView and (not FFlagLuaAppImproveAccountSwitcherPeekViewModule or Name ~= AppPageModule.AccountSelectorPeekView)) and (not FFlagLuaAppImproveAccountSwitcherPeekViewModule or Name ~= AppPageModule.AccountSwitchingAddAccountPeekView) and (not SocialNetworksInEditProfileIXP.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() or Name ~= AppPageModule.EditSocialNetworks) and ((not SocialNetworksInEditProfileIXP.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() or Name ~= AppPageModule.EditSocialNetworksError) and Name ~= AppPageModule.GameFilterMenuPeekView) and (not FFlagEnableMobileGameJoinCard or Name ~= AppPageModule.GameJoinCard) then
				return (not AppPagePropertiesModule[Name] or not AppPagePropertiesModule[Name].nativeWrapper or RunService:IsStudio()) and i > 1
			end
		end
		return false
	end
	
	function BackButton.updateVisibility(p2, p3)
		-- upvalues: isVisible (copy)
		local IsVisible = isVisible(p2.props)
		
		if IsVisible ~= p3 then
			p2.props.setVisible(IsVisible)
		end
	end
	
	function BackButton.didMount(p2)
		p2:updateVisibility(nil)
	end
	
	local _ = function(p2)
		-- upvalues: AppPagePropertiesModule (upval)
		local Name = p2[#p2].name
		
		return AppPagePropertiesModule[Name] and AppPagePropertiesModule[Name].nativeWrapper
	end
	
	function BackButton.didUpdate(p2, p3, _)
		-- upvalues: WebViewRedesignEnabledEngineFeature (upval), LuaAppFixWebViewUnderlyingBackButton (upval), AppPagePropertiesModule (upval), RunService (upval), isVisible (copy)
		if not WebViewRedesignEnabledEngineFeature and LuaAppFixWebViewUnderlyingBackButton then
			local CurrentRoute = p2.props.currentRoute
			local Name = CurrentRoute[#CurrentRoute].name
			
			if AppPagePropertiesModule[Name] and AppPagePropertiesModule[Name].nativeWrapper and not RunService:IsStudio() then
				return nil
			end
		end
		p2:updateVisibility((isVisible(p3)))
	end
	
	function BackButton.render(p2)
		-- upvalues: WithStyleFunction (upval), IconsNavigationPushBack (upval), RoactModule (upval), IconButton (upval), TopBarConstantsModule (upval), IconSize (upval), AXMigrateMakeBackButtonToFocusNavigation3 (upval), RoactGamepadModule (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p2 (copy), IconsNavigationPushBack (upval), RoactModule (upval), IconButton (upval), TopBarConstantsModule (upval), IconSize (upval), AXMigrateMakeBackButtonToFocusNavigation3 (upval), RoactGamepadModule (upval)
			return RoactModule.createElement(IconButton, {
				size = UDim2.new(0, TopBarConstantsModule.BACK_BUTTON_SIZE, 1, 0),
				position = if p2.props.isSecondary then UDim2.new(0, 0, 0, -8) else nil,
				icon = if p2.props.customIcon then p2.props.customIcon else IconsNavigationPushBack,
				iconSize = IconSize.Medium,
				iconColor3 = p3.Theme.IconEmphasis.Color,
				iconTransparency = p3.Theme.IconEmphasis.Transparency,
				onActivated = if AXMigrateMakeBackButtonToFocusNavigation3 then p2.props.onGoBack else p2.onBackButtonActivated,
				inputBindings = if AXMigrateMakeBackButtonToFocusNavigation3 then nil else {
					Back = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p2.onBackButtonActivated)
				},
				buttonRef = p2.props.buttonRef
			})
		end)
	end
	
	local function BackButtonContainer(p2)
		-- upvalues: UseNavigationFunction (upval), UseRoactServiceModule (upval), RoactAnalyticsTopBarModule (upval), FFlagSignalsNavP3bTopBar (upval), GetLegacyNavigationStore (upval), UseSignalStateFunction (upval), UseSelectorFunction (upval), v50 (upval), UseDispatchFunction (upval), ReactModule (upval), Callback1 (copy), Callback (ref), AXMigrateMakeBackButtonToFocusNavigation3 (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateBackModule (upval), useFocusNavigationBindings (upval), CryoModule (upval), UseTableWrappedCallbackRefFunction (upval), BackButton (ref)
		local UseNavigationResult = UseNavigationFunction()
		local UseRoactServiceModuleResult = UseRoactServiceModule(RoactAnalyticsTopBarModule)
		local UseSignalStateResult = nil
		UseSignalStateResult = if FFlagSignalsNavP3bTopBar then UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentLegacyRoute) else UseSelectorFunction(v50)
		local UseDispatchResult = UseDispatchFunction()
		local UseResult = ReactModule.useCallback(function()
			-- upvalues: Callback1 (upval), Callback (upval), AXMigrateMakeBackButtonToFocusNavigation3 (upval), UseSignalStateResult (ref), p2 (copy), UseNavigationResult (copy), UseRoactServiceModuleResult (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackModule (upval)
			if Callback1 then
				Callback1()
				
				return
			end
			if Callback(if AXMigrateMakeBackButtonToFocusNavigation3 then UseSignalStateResult else p2) then
				UseRoactServiceModuleResult.reportBackButtonClick(UseNavigationResult.state.routeName)
				UseNavigationResult.goBack()
				
				return
			end
			UseRoactServiceModuleResult.reportBackButtonClick(UseSignalStateResult[#UseSignalStateResult].name)
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back()
				
				return
			else
				UseDispatchResult(NavigateBackModule())
			end
		end, {
			Callback1,
			UseRoactServiceModuleResult,
			UseSignalStateResult,
			UseNavigationResult,
			UseDispatchResult
		})
		
		return ReactModule.createElement(BackButton, (CryoModule.Dictionary.join(p2, {
			onGoBack = UseResult,
			buttonRef = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(p2.buttonRef, UseResult))),
			analytics = UseRoactServiceModuleResult,
			navigation = UseNavigationResult,
			currentRoute = UseSignalStateResult
		})))
	end
	
	if AXMigrateMakeBackButtonToFocusNavigation3 then
		return BackButtonContainer
	end
	BackButton = RoactNavigationModule.withNavigation(BackButton)
	BackButton = RoactServices.connect({ analytics = RoactAnalyticsTopBarModule })(BackButton)
	BackButton = RoactRoduxModule.connect(function(p2, _)
		-- upvalues: FFlagSignalsNavP3bTopBar (upval), FFlagUseNavigationSelectors (upval), Selectors (upval)
		return {
			currentRoute = if FFlagSignalsNavP3bTopBar then nil elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p2) else p2.Navigation.history[#p2.Navigation.history]
		}
	end, function(Callback)
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateBackModule (upval)
		return {
			navigateBack = function()
				-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
				return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
			end
		}
	end)(BackButton)
	
	if FFlagSignalsNavP3bTopBar then
		local BackButton1 = BackButton
		
		BackButton = function(p2)
			-- upvalues: GetLegacyNavigationStore (upval), UseSignalStateFunction (upval), ReactModule (upval), BackButton1 (copy), CryoModule (upval)
			return ReactModule.createElement(BackButton1, CryoModule.Dictionary.union(p2, {
				currentRoute = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
			}))
		end
	end
	return BackButton
end