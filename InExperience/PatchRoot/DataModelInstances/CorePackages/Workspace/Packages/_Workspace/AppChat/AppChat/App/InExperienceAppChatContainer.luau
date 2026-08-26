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

return function(p1)
	-- upvalues: useDispatch (ref), useContext (ref), parentContainerContextModule (ref), useState (ref), useExternalNavigationByScreenModule (ref), useMemo (ref), signal (ref), robloxEventReceiver (ref), notificationService (ref), reactModule (ref), responsiveModule (ref), fIntAppChatWideBreakpointMinWidthModule (ref), fIntAppChatWideBreakpointMinHeightModule (ref), fFlagAppChatInExpSelectChatMembersMobileHeightModule (ref), useAppChatIsWideModeModule (ref), getFFlagAppChatRequestedRouteModule (ref), getFFlagAppChatEnableRootedNavigationModule (ref), appChat (ref), useRef (ref), useSignalState (ref), getRootedNavigationStoreModule (ref), useEffect (ref), partyPageCarouselExperimentation (ref), setFormFactor (ref), formFactorModule (ref), useParentContainerExtentsModule (ref), useCallback (ref), appChatInExperienceMountMinLoadingTimeMs (ref), appChatEntryPointModule (ref), localPlayer (ref), chatPlacementContextModule (ref), loading (ref), iconSize (ref), iconButton (ref), iconName (ref), buttonSize (ref), buttonVariant (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), chatEventReceiverModule (ref), chatExternalEventReceiverModule (ref), containerModule (ref), fFlagSquadAppChatRTNFix (ref), squadAppChatEventReceiver (ref)
	local var1 = useDispatch()
	local hideParentContainer = useContext(parentContainerContextModule).hideParentContainer
	local var2, var3 = useState(0)
	local var4, var5 = useExternalNavigationByScreenModule()
	local var6 = useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var7 = useMemo(function()
		-- upvalues: robloxEventReceiver (copy), notificationService (copy)
		return robloxEventReceiver.new(notificationService)
	end, {})
	local var8 = reactModule.useRef(nil)
	local var9 = responsiveModule.useOrientation()
	local var10 = if not (fFlagAppChatInExpSelectChatMembersMobileHeightModule or var9 ~= responsiveModule.Keys.Portrait and responsiveModule.useResponsive({
		{
			Key = "wide",
			minWidth = fIntAppChatWideBreakpointMinWidthModule,
			minHeight = fIntAppChatWideBreakpointMinHeightModule
		}
	}) == "wide") then false elseif fFlagAppChatInExpSelectChatMembersMobileHeightModule then useAppChatIsWideModeModule(true) else true
	local var11 = getFFlagAppChatRequestedRouteModule()
	local var12 = getFFlagAppChatEnableRootedNavigationModule()
	local var13 = useRef(false)
	
	if var12 and (p1.requestedRoute ~= nil and (p1.requestedRoute.screen == require(appChat.EnumScreens).ChatDetails and (p1.requestedRoute.params ~= nil and p1.requestedRoute.params.rooted == true))) then
		var13.current = true
	end
	local var14 = if var13.current then false else var10
	local var15 = if var12 then useSignalState(getRootedNavigationStoreModule(false).getIsNavigationPending) else false
	useEffect(function()
		-- upvalues: partyPageCarouselExperimentation (copy), var14 (ref), var1 (ref), setFormFactor (copy), formFactorModule (copy)
		if partyPageCarouselExperimentation.getAppChatFormFactorEnabled() then
			if var14 then
				var1(setFormFactor(formFactorModule.Enums.FormFactor.WIDE))
				
				return
			end
			var1(setFormFactor(formFactorModule.Enums.FormFactor.COMPACT))
		end
	end, { var14, var1 })
	local var16, var17 = useParentContainerExtentsModule()
	local var18 = var9 == responsiveModule.DefaultKey
	local var19, var20 = useState(var18)
	local var21 = useRef(os.clock())
	local var22 = useCallback(function()
		-- upvalues: p1 (ref), hideParentContainer (ref)
		p1.hideAppChat()
		hideParentContainer()
	end, { hideParentContainer, p1.hideAppChat })
	useEffect(function()
		-- upvalues: var18 (ref), var21 (ref), appChatInExperienceMountMinLoadingTimeMs (copy), var20 (ref)
		if not var18 then
			local var23 = os.clock() - var21.current
			local var24 = appChatInExperienceMountMinLoadingTimeMs / 1000
			
			if var23 < var24 then
				delay(var24 - var23, function()
					-- upvalues: var20 (copy)
					var20(false)
				end)
				
				return
			end
			var20(false)
		end
	end, { var18, var20 })
	local var23 = reactModule.createElement(appChatEntryPointModule, {
		isVisible = true,
		setActiveConversationId = var3,
		localUserId = if localPlayer then localPlayer.UserId else nil,
		chatPlacement = chatPlacementContextModule.Enum.InExperienceDefault,
		initialConversationId = p1.initialConversationId,
		setInitialConversationId = p1.setInitialConversationId,
		requestedRoute = if var11 then p1.requestedRoute else nil,
		clearRequestedRoute = if var11 then p1.clearRequestedRoute else nil,
		wideMode = var14,
		navigateToRootStack = var22,
		updateExternalNavigationForScreen = var5
	})
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		AppChatWindow = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.new(0, 0, 0),
			Size = var16:map(function(p2)
				return UDim2.fromOffset(p2.X, p2.Y)
			end),
			Position = var17:map(function(p2)
				return UDim2.fromOffset(p2.X, p2.Y)
			end),
			ref = var8
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			containerRef = reactModule.createElement(responsiveModule.ContainerRef.Provider, { value = var8 }, {
				AppChatContent = if var19 then if var15 then nil else reactModule.createElement(loading, {
					size = iconSize.Large,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				}) elseif var12 then reactModule.createElement("Frame", {
					Name = "AppChatContent",
					[reactModule.Tag] = "data-testid=app-chat-content",
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Visible = not var15
				}, { AppChatEntryPoint = var23 }) else var23,
				LoadingOverlay = if var15 then reactModule.createElement("Frame", {
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
						onActivated = var22,
						testId = if fFlagDebugAppChatEnableDomLocatorsModule then domLocatorsModule.appChatLoadingOverlayBackButton() else nil
					})
				}) else nil
			})
		}),
		ChatEventReceiver = reactModule.createElement(chatEventReceiverModule, {
			robloxEventReceiver = var7,
			rnBypassActionSignal = var6,
			activeConversationId = tostring(var2)
		}),
		ChatExternalEventReceiver = reactModule.createElement(chatExternalEventReceiverModule, {
			robloxEventReceiver = var7,
			localUserId = if localPlayer then localPlayer.UserId else nil
		}),
		ExternalNavigationHandler = reactModule.createElement(containerModule, { navigationByScreen = var4 }),
		SquadAppChatEventReceiver = if fFlagSquadAppChatRTNFix then reactModule.createElement(squadAppChatEventReceiver) else nil
	})
end