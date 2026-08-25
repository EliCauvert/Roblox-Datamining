local notificationService = game:GetService("NotificationService")
local playersService = game:GetService("Players")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appCommonLibModule = require(parent.AppCommonLib)
local formFactorModule = require(parent.FormFactor)
local reactModule = require(parent.React)
local realtimeDeliveryModule = require(parent.RealtimeDelivery)
local responsiveModule = require(parent.Responsive)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local loading = foundationModule.Loading
local useSignalState = require(parent.SignalsReact).useSignalState
local setFormFactor = formFactorModule.Actions.SetFormFactor
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local appChatEntryPointModule = require(appChat.AppChatEntryPoint)
local chatEventReceiverModule = require(appChat.Components.EventReceivers.ChatEventReceiver)
local chatExternalEventReceiverModule = require(appChat.App.Components.ChatExternalEventReceiver)
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
local _ = require(appChat.App.InExperienceAppChatModal)
local useParentContainerExtentsModule = require(appChat.Contexts.ParentContainer.useParentContainerExtents)
local containerModule = require(appChat.Components.ExternalNavigationHandler.Container)
local useExternalNavigationByScreenModule = require(appChat.Hooks.useExternalNavigationByScreen)
local useAppChatIsWideModeModule = require(appChat.Hooks.useAppChatIsWideMode)
local parentContainerContextModule = require(appChat.Contexts.ParentContainer.ParentContainerContext)
local localPlayer = playersService.LocalPlayer
local robloxEventReceiver = realtimeDeliveryModule.RobloxEventReceiver
local signal = appCommonLibModule.Signal
local squadAppChatEventReceiver = require(parent.SquadsCore.Components).SquadAppChatEventReceiver
local useMemo = reactModule.useMemo
local useState = reactModule.useState
local useEffect = reactModule.useEffect
local useCallback = reactModule.useCallback
local useContext = reactModule.useContext
local useRef = reactModule.useRef
local appChatInExperienceMountMinLoadingTimeMs = game:DefineFastInt("AppChatInExperienceMountMinLoadingTimeMs", 0)
local fFlagAppChatInExpSelectChatMembersMobileHeightModule = require(appChat.Flags.FFlagAppChatInExpSelectChatMembersMobileHeight)
local fFlagSquadAppChatRTNFix = sharedFlagsModule.FFlagSquadAppChatRTNFix
local fIntAppChatWideBreakpointMinHeightModule = require(appChat.Flags.FIntAppChatWideBreakpointMinHeight)
local fIntAppChatWideBreakpointMinWidthModule = require(appChat.Flags.FIntAppChatWideBreakpointMinWidth)
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local getFFlagAppChatEnableRootedNavigationModule = require(appChat.Flags.getFFlagAppChatEnableRootedNavigation)
local getFFlagAppChatRequestedRouteModule = require(appChat.Flags.getFFlagAppChatRequestedRoute)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local getRootedNavigationStoreModule = require(appChat.Stores.GetRootedNavigationStore)
local domLocatorsModule = require(appChat.Utils.DomLocators)

local function _()
	-- upvalues: appChat (ref)
	return require(appChat.EnumScreens)
end

return function(p0)
	-- upvalues: useDispatch (ref), useContext (ref), parentContainerContextModule (ref), useState (ref), useExternalNavigationByScreenModule (ref), useMemo (ref), signal (ref), robloxEventReceiver (ref), notificationService (ref), reactModule (ref), responsiveModule (ref), fIntAppChatWideBreakpointMinWidthModule (ref), fIntAppChatWideBreakpointMinHeightModule (ref), fFlagAppChatInExpSelectChatMembersMobileHeightModule (ref), useAppChatIsWideModeModule (ref), getFFlagAppChatRequestedRouteModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), appChat (ref), useRef (ref), useSignalState (ref), getRootedNavigationStoreModule (ref), useEffect (ref), partyPageCarouselExperimentation (ref), setFormFactor (ref), formFactorModule (ref), useParentContainerExtentsModule (ref), useCallback (ref), appChatInExperienceMountMinLoadingTimeMs (ref), appChatEntryPointModule (ref), localPlayer (ref), chatPlacementContextModule (ref), loading (ref), iconSize (ref), iconButton (ref), iconName (ref), buttonSize (ref), buttonVariant (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), chatEventReceiverModule (ref), chatExternalEventReceiverModule (ref), containerModule (ref), fFlagSquadAppChatRTNFix (ref), squadAppChatEventReceiver (ref)
	local var29 = useDispatch()
	local hideParentContainer = useContext(parentContainerContextModule).hideParentContainer
	local var30, var31 = useState(0)
	local var32, var33 = useExternalNavigationByScreenModule()
	local var34 = useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var35 = useMemo(function()
		-- upvalues: robloxEventReceiver (copy), notificationService (copy)
		return robloxEventReceiver.new(notificationService)
	end, {})
	local var36 = reactModule.useRef(nil)
	local var37 = responsiveModule.useOrientation()
	local var38 = if not (fFlagAppChatInExpSelectChatMembersMobileHeightModule or var37 ~= responsiveModule.Keys.Portrait and responsiveModule.useResponsive({
		{
			Key = "wide",
			minWidth = fIntAppChatWideBreakpointMinWidthModule,
			minHeight = fIntAppChatWideBreakpointMinHeightModule
		}
	}) == "wide") then false elseif fFlagAppChatInExpSelectChatMembersMobileHeightModule then useAppChatIsWideModeModule(true) else true
	local var39 = getFFlagAppChatRequestedRouteModule()
	local var40 = getFFlagAppChatEnableRootedNavigationModule()
	local var41 = useRef(false)
	
	if var40 and (p0.requestedRoute ~= nil and (p0.requestedRoute.screen == require(appChat.EnumScreens).ChatDetails and (p0.requestedRoute.params ~= nil and p0.requestedRoute.params.rooted == true))) then
		var41.current = true
	end
	local var42 = if var41.current then false else var38
	local var43 = if var40 then useSignalState(getRootedNavigationStoreModule(false).getIsNavigationPending) else false
	useEffect(function()
		-- upvalues: partyPageCarouselExperimentation (copy), var42 (ref), var29 (ref), setFormFactor (copy), formFactorModule (copy)
		if partyPageCarouselExperimentation.getAppChatFormFactorEnabled() then
			if var42 then
				var29(setFormFactor(formFactorModule.Enums.FormFactor.WIDE))
				
				return
			end
			var29(setFormFactor(formFactorModule.Enums.FormFactor.COMPACT))
		end
	end, { var42, var29 })
	local var44, var45 = useParentContainerExtentsModule()
	local var46 = var37 == responsiveModule.DefaultKey
	local var47, var48 = useState(var46)
	local var49 = useRef(os.clock())
	local var50 = useCallback(function()
		-- upvalues: p0 (ref), hideParentContainer (ref)
		p0.hideAppChat()
		hideParentContainer()
	end, { hideParentContainer, p0.hideAppChat })
	useEffect(function()
		-- upvalues: var46 (ref), var49 (ref), appChatInExperienceMountMinLoadingTimeMs (copy), var48 (ref)
		if not var46 then
			local var52 = os.clock() - var49.current
			local var53 = appChatInExperienceMountMinLoadingTimeMs / 1000
			
			if var52 < var53 then
				delay(var53 - var52, function()
					-- upvalues: var48 (copy)
					var48(false)
				end)
				
				return
			end
			var48(false)
		end
	end, { var46, var48 })
	local var51 = reactModule.createElement(appChatEntryPointModule, {
		isVisible = true,
		setActiveConversationId = var31,
		localUserId = if localPlayer then localPlayer.UserId else nil,
		chatPlacement = chatPlacementContextModule.Enum.InExperienceDefault,
		initialConversationId = p0.initialConversationId,
		setInitialConversationId = p0.setInitialConversationId,
		requestedRoute = if var39 then p0.requestedRoute else nil,
		clearRequestedRoute = if var39 then p0.clearRequestedRoute else nil,
		wideMode = var42,
		navigateToRootStack = var50,
		updateExternalNavigationForScreen = var33
	})
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		AppChatWindow = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.new(0, 0, 0),
			Size = var44:map(function(p1)
				return UDim2.fromOffset(p1.X, p1.Y)
			end),
			Position = var45:map(function(p2)
				return UDim2.fromOffset(p2.X, p2.Y)
			end),
			ref = var36
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			containerRef = reactModule.createElement(responsiveModule.ContainerRef.Provider, { value = var36 }, {
				AppChatContent = if var47 then if var43 then nil else reactModule.createElement(loading, {
					size = iconSize.Large,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				}) elseif var40 then reactModule.createElement("Frame", {
					Name = "AppChatContent",
					[reactModule.Tag] = "data-testid=app-chat-content",
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Visible = not var43
				}, { AppChatEntryPoint = var51 }) else var51,
				LoadingOverlay = if var43 then reactModule.createElement("Frame", {
					Name = "AppChatLoadingOverlay",
					[reactModule.Tag] = "data-testid=app-chat-loading-overlay",
					Active = true,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 2
				}, {
					Spinner = reactModule.createElement(loading, {
						size = iconSize.Large,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					}),
					BackButton = reactModule.createElement(iconButton, {
						ZIndex = 3,
						icon = iconName.ChevronLargeLeft,
						size = buttonSize.XSmall,
						variant = buttonVariant.Utility,
						AnchorPoint = Vector2.new(0, 0),
						Position = UDim2.fromOffset(12, 12),
						onActivated = var50,
						testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.appChatLoadingOverlayBackButton() else nil
					})
				}) else nil
			})
		}),
		ChatEventReceiver = reactModule.createElement(chatEventReceiverModule, {
			robloxEventReceiver = var35,
			rnBypassActionSignal = var34,
			activeConversationId = tostring(var30)
		}),
		ChatExternalEventReceiver = reactModule.createElement(chatExternalEventReceiverModule, {
			robloxEventReceiver = var35,
			localUserId = if localPlayer then localPlayer.UserId else nil
		}),
		ExternalNavigationHandler = reactModule.createElement(containerModule, { navigationByScreen = var32 }),
		SquadAppChatEventReceiver = if fFlagSquadAppChatRTNFix then reactModule.createElement(squadAppChatEventReceiver) else nil
	})
end