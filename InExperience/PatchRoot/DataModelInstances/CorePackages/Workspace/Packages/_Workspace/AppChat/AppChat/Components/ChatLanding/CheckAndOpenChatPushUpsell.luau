local IXPService = game:GetService("IXPService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local roactNavigationModule = require(parent.RoactNavigation)
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local appPage = require(parent.RobloxAppEnums).AppPage
local default = require(parent.LoggingProtocol).default
local notificationsUpsellModule = require(parent.NotificationsUpsell)
local useChatIsVisibleModule = require(appChat.Hooks.useChatIsVisible)
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local pushUpsellEventConfig = notificationsUpsellModule.PushUpsellEventConfig
local modalEventConstants = notificationsUpsellModule.ModalEventConstants
local setupPushNotificationsUpsell = notificationsUpsellModule.setupPushNotificationsUpsell
local notificationsUpsellConstants = notificationsUpsellModule.NotificationsUpsellConstants
local getFStringPushUpsellChatVariantName = require(parent.SharedFlags).GetFStringPushUpsellChatVariantName

return function()
	-- upvalues: useNavigationFocus (ref), useNavigation (ref), useChatIsVisibleModule (ref), useIsInExperienceModule (ref), reactModule (ref), useUserExperiment (ref), appUserLayers (ref), getFStringPushUpsellChatVariantName (ref), roactNavigationModule (ref), setupPushNotificationsUpsell (ref), notificationsUpsellConstants (ref), IXPService (ref), default (ref), pushUpsellEventConfig (ref), modalEventConstants (ref), appPage (ref)
	local var7 = useNavigationFocus()
	local var8 = useNavigation()
	local var9 = useChatIsVisibleModule()
	local var10 = useIsInExperienceModule()
	local var11, var12 = reactModule.useState(false)
	local var13 = useUserExperiment({ appUserLayers.SocialAppChat }, function(p0)
		-- upvalues: appUserLayers (copy), getFStringPushUpsellChatVariantName (copy)
		return {
			pushUpsellChatVariant = (p0[appUserLayers.SocialAppChat] or {})[getFStringPushUpsellChatVariantName()] or -1
		}
	end)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), roactNavigationModule (copy), var12 (ref)
		local var14 = var8.addListener(roactNavigationModule.Events.WillBlur, function(p1)
			-- upvalues: var12 (copy)
			if p1.action.routeName == "ChatConversation" then
				var12(true)
			end
		end)
		
		return function()
			-- upvalues: var14 (ref)
			var14.remove()
		end
	end, {})
	
	local function _()
		-- upvalues: setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy), IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), appPage (copy)
		setupPushNotificationsUpsell.ShouldShowUpsell(notificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(p2)
			-- upvalues: IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), appPage (copy), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy)
			if p2 then
				IXPService:LogUserLayerExposure(appUserLayers.SocialAppChat)
				default:logRobloxTelemetryEvent(pushUpsellEventConfig, {}, {
					[modalEventConstants.ActionType] = modalEventConstants.ShouldRequest,
					[modalEventConstants.EntryPoint] = appPage.Chat
				}, modalEventConstants.ModalContextPushEduUpsell)
				setupPushNotificationsUpsell.OpenModal(notificationsUpsellConstants.ModalKey.PushUpsellChat, true, appPage.Chat)
				
				return
			end
		end)
	end
	
	local _ = function()
		-- upvalues: var11 (ref), var12 (ref), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy), IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy)
		if var11 then
			var12(false)
			setupPushNotificationsUpsell.ShouldShowUpsell(notificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(p3)
				-- upvalues: IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy)
				if p3 then
					IXPService:LogUserLayerExposure(appUserLayers.SocialAppChat)
					default:logRobloxTelemetryEvent(pushUpsellEventConfig, {}, {
						[modalEventConstants.ActionType] = modalEventConstants.ShouldRequest,
						[modalEventConstants.EntryPoint] = "ChatConversation"
					}, modalEventConstants.ModalContextPushEduUpsell)
					setupPushNotificationsUpsell.OpenModal(notificationsUpsellConstants.ModalKey.PushUpsellChat, true, "ChatConversation")
					
					return
				end
			end)
			
			return
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var7 (ref), var10 (ref), var13 (ref), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy), IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), appPage (copy), var11 (ref), var12 (ref)
		if not var9 or not var7 or (var10 or var13.pushUpsellChatVariant == nil) or var13.pushUpsellChatVariant < 0 then return end
		if var13.pushUpsellChatVariant == 1 then
			setupPushNotificationsUpsell.ShouldShowUpsell(notificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(p4)
				-- upvalues: IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), appPage (copy), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy)
				if p4 then
					IXPService:LogUserLayerExposure(appUserLayers.SocialAppChat)
					default:logRobloxTelemetryEvent(pushUpsellEventConfig, {}, {
						[modalEventConstants.ActionType] = modalEventConstants.ShouldRequest,
						[modalEventConstants.EntryPoint] = appPage.Chat
					}, modalEventConstants.ModalContextPushEduUpsell)
					setupPushNotificationsUpsell.OpenModal(notificationsUpsellConstants.ModalKey.PushUpsellChat, true, appPage.Chat)
					
					return
				end
			end)
			
			return
		elseif var13.pushUpsellChatVariant == 2 then
			if not var11 then return end
			var12(false)
			setupPushNotificationsUpsell.ShouldShowUpsell(notificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(p5)
				-- upvalues: IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy)
				if p5 then
					IXPService:LogUserLayerExposure(appUserLayers.SocialAppChat)
					default:logRobloxTelemetryEvent(pushUpsellEventConfig, {}, {
						[modalEventConstants.ActionType] = modalEventConstants.ShouldRequest,
						[modalEventConstants.EntryPoint] = "ChatConversation"
					}, modalEventConstants.ModalContextPushEduUpsell)
					setupPushNotificationsUpsell.OpenModal(notificationsUpsellConstants.ModalKey.PushUpsellChat, true, "ChatConversation")
					
					return
				end
			end)
		end
	end, { var9, var7 })
end