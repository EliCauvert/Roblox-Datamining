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
	local var1 = useNavigationFocus()
	local var2 = useNavigation()
	local var3 = useChatIsVisibleModule()
	local var4 = useIsInExperienceModule()
	local var5, var6 = reactModule.useState(false)
	local var7 = useUserExperiment({ appUserLayers.SocialAppChat }, function(p1)
		-- upvalues: appUserLayers (copy), getFStringPushUpsellChatVariantName (copy)
		return {
			pushUpsellChatVariant = (p1[appUserLayers.SocialAppChat] or {})[getFStringPushUpsellChatVariantName()] or -1
		}
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), roactNavigationModule (copy), var6 (ref)
		local var8 = var2.addListener(roactNavigationModule.Events.WillBlur, function(p1)
			-- upvalues: var6 (copy)
			if p1.action.routeName == "ChatConversation" then
				var6(true)
			end
		end)
		
		return function()
			-- upvalues: var8 (ref)
			var8.remove()
		end
	end, {})
	
	local function _()
		-- upvalues: setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy), IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), appPage (copy)
		setupPushNotificationsUpsell.ShouldShowUpsell(notificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(p1)
			-- upvalues: IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), appPage (copy), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy)
			if p1 then
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
		-- upvalues: var5 (ref), var6 (ref), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy), IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy)
		if var5 then
			var6(false)
			setupPushNotificationsUpsell.ShouldShowUpsell(notificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(p1)
				-- upvalues: IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy)
				if p1 then
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
		-- upvalues: var3 (ref), var1 (ref), var4 (ref), var7 (ref), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy), IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), appPage (copy), var5 (ref), var6 (ref)
		if not var3 or not var1 or (var4 or var7.pushUpsellChatVariant == nil) or var7.pushUpsellChatVariant < 0 then return end
		if var7.pushUpsellChatVariant == 1 then
			setupPushNotificationsUpsell.ShouldShowUpsell(notificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(p1)
				-- upvalues: IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), appPage (copy), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy)
				if p1 then
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
		elseif var7.pushUpsellChatVariant == 2 then
			if not var5 then return end
			var6(false)
			setupPushNotificationsUpsell.ShouldShowUpsell(notificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(p1)
				-- upvalues: IXPService (copy), appUserLayers (copy), default (copy), pushUpsellEventConfig (copy), modalEventConstants (copy), setupPushNotificationsUpsell (copy), notificationsUpsellConstants (copy)
				if p1 then
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
	end, { var3, var1 })
end