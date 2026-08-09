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
local loading = foundationModule.Loading
local setFormFactor = formFactorModule.Actions.SetFormFactor
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local appChatEntryPointModule = require(appChat.AppChatEntryPoint)
local chatEventReceiverModule = require(appChat.Components.EventReceivers.ChatEventReceiver)
local chatExternalEventReceiverModule = require(appChat.App.Components.ChatExternalEventReceiver)
local chatPlacementContextModule = require(appChat.Contexts.ChatPlacementContext)
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

return function(p0) --[[ line: 58 ]]
	-- upvalues: useDispatch (ref), useContext (ref), parentContainerContextModule (ref), useState (ref), useExternalNavigationByScreenModule (ref), useMemo (ref), signal (ref), robloxEventReceiver (ref), notificationService (ref), reactModule (ref), responsiveModule (ref), fIntAppChatWideBreakpointMinWidthModule (ref), fIntAppChatWideBreakpointMinHeightModule (ref), fFlagAppChatInExpSelectChatMembersMobileHeightModule (ref), useAppChatIsWideModeModule (ref), useEffect (ref), partyPageCarouselExperimentation (ref), setFormFactor (ref), formFactorModule (ref), useParentContainerExtentsModule (ref), useRef (ref), useCallback (ref), appChatInExperienceMountMinLoadingTimeMs (ref), loading (ref), iconSize (ref), appChatEntryPointModule (ref), localPlayer (ref), chatPlacementContextModule (ref), chatEventReceiverModule (ref), chatExternalEventReceiverModule (ref), containerModule (ref), fFlagSquadAppChatRTNFix (ref), squadAppChatEventReceiver (ref)
	local var24 = useDispatch()
	local hideParentContainer = useContext(parentContainerContextModule).hideParentContainer
	local var25, var26 = useState(0)
	local var27, var28 = useExternalNavigationByScreenModule()
	local var29 = useMemo(function() --[[ line: 63 ]]
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var30 = useMemo(function() --[[ line: 67 ]]
		-- upvalues: robloxEventReceiver (copy), notificationService (copy)
		return robloxEventReceiver.new(notificationService)
	end, {})
	local var31 = reactModule.useRef(nil)
	local var32 = responsiveModule.useOrientation()
	local var33 = if not (fFlagAppChatInExpSelectChatMembersMobileHeightModule or var32 ~= responsiveModule.Keys.Portrait and responsiveModule.useResponsive({
		{
			Key = "wide",
			minWidth = fIntAppChatWideBreakpointMinWidthModule,
			minHeight = fIntAppChatWideBreakpointMinHeightModule
		}
	}) == "wide") then false elseif fFlagAppChatInExpSelectChatMembersMobileHeightModule then useAppChatIsWideModeModule(true) else true
	useEffect(function() --[[ line: 90 ]]
		-- upvalues: partyPageCarouselExperimentation (copy), var33 (write), var24 (ref), setFormFactor (copy), formFactorModule (copy)
		if partyPageCarouselExperimentation.getAppChatFormFactorEnabled() then
			if var33 then
				var24(setFormFactor(formFactorModule.Enums.FormFactor.WIDE))
				
				return
			end
			var24(setFormFactor(formFactorModule.Enums.FormFactor.COMPACT))
		end
	end, { var33 })
	local var34, var35 = useParentContainerExtentsModule()
	local var36 = var32 == responsiveModule.DefaultKey
	local var37, var38 = useState(var36)
	local var39 = useRef(os.clock())
	local var40 = useCallback(function() --[[ line: 106 ]]
		-- upvalues: p0 (ref), hideParentContainer (ref)
		p0.hideAppChat()
		hideParentContainer()
	end, { hideParentContainer, p0.hideAppChat })
	useEffect(function() --[[ line: 111 ]]
		-- upvalues: var36 (ref), var39 (ref), appChatInExperienceMountMinLoadingTimeMs (copy), var38 (ref)
		if not var36 then
			local var41 = os.clock() - var39.current
			local var42 = appChatInExperienceMountMinLoadingTimeMs / 1000
			
			if var41 < var42 then
				delay(var42 - var41, function() --[[ line: 117 ]]
					-- upvalues: var38 (copy)
					var38(false)
				end)
				
				return
			end
			var38(false)
		end
	end, { var36, var38 })
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		AppChatWindow = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.new(0, 0, 0),
			Size = var34:map(function(p1) --[[ line: 130 ]]
				return UDim2.fromOffset(p1.X, p1.Y)
			end),
			Position = var35:map(function(p2) --[[ line: 133 ]]
				return UDim2.fromOffset(p2.X, p2.Y)
			end),
			ref = var31
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			containerRef = reactModule.createElement(responsiveModule.ContainerRef.Provider, { value = var31 }, {
				AppChatEntryPoint = if var37 then reactModule.createElement(loading, {
					size = iconSize.Large,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				}) else reactModule.createElement(appChatEntryPointModule, {
					isVisible = true,
					setActiveConversationId = var26,
					localUserId = if localPlayer then localPlayer.UserId else nil,
					chatPlacement = chatPlacementContextModule.Enum.InExperienceDefault,
					initialConversationId = p0.initialConversationId,
					setInitialConversationId = p0.setInitialConversationId,
					wideMode = var33,
					navigateToRootStack = var40,
					updateExternalNavigationForScreen = var28
				})
			})
		}),
		ChatEventReceiver = reactModule.createElement(chatEventReceiverModule, {
			robloxEventReceiver = var30,
			rnBypassActionSignal = var29,
			activeConversationId = tostring(var25)
		}),
		ChatExternalEventReceiver = reactModule.createElement(chatExternalEventReceiverModule, {
			robloxEventReceiver = var30,
			localUserId = if localPlayer then localPlayer.UserId else nil
		}),
		ExternalNavigationHandler = reactModule.createElement(containerModule, { navigationByScreen = var27 }),
		SquadAppChatEventReceiver = if fFlagSquadAppChatRTNFix then reactModule.createElement(squadAppChatEventReceiver) else nil
	})
end