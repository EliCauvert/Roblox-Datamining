local IXPService = game:GetService("IXPService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Default = require(Parent.LoggingProtocol).default
local NotificationsUpsellModule = require(Parent.NotificationsUpsell)
local UseChatIsVisibleModule = require(AppChat.Hooks.useChatIsVisible)
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local PushUpsellEventConfig = NotificationsUpsellModule.PushUpsellEventConfig
local ModalEventConstants = NotificationsUpsellModule.ModalEventConstants
local SetupPushNotificationsUpsell = NotificationsUpsellModule.setupPushNotificationsUpsell
local NotificationsUpsellConstants = NotificationsUpsellModule.NotificationsUpsellConstants
local GetFStringPushUpsellChatVariantNameFunction = require(Parent.SharedFlags).GetFStringPushUpsellChatVariantName

return function()
	-- upvalues: UseNavigationFocusFunction (copy), UseNavigationFunction (copy), UseChatIsVisibleModule (copy), UseIsInExperienceModule (copy), ReactModule (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), GetFStringPushUpsellChatVariantNameFunction (copy), RoactNavigationModule (copy), SetupPushNotificationsUpsell (copy), NotificationsUpsellConstants (copy), IXPService (copy), Default (copy), PushUpsellEventConfig (copy), ModalEventConstants (copy), AppPage (copy)
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseChatIsVisibleModuleResult = UseChatIsVisibleModule()
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseUserExperimentResult = UseUserExperimentFunction({ AppUserLayers.SocialAppChat }, function(p1)
		-- upvalues: AppUserLayers (upval), GetFStringPushUpsellChatVariantNameFunction (upval)
		return {
			pushUpsellChatVariant = (p1[AppUserLayers.SocialAppChat] or {})[GetFStringPushUpsellChatVariantNameFunction()] or -1
		}
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseNavigationResult (copy), RoactNavigationModule (upval), UseStateResult2 (copy)
		local AddListenerResult = UseNavigationResult.addListener(RoactNavigationModule.Events.WillBlur, function(p1)
			-- upvalues: UseStateResult2 (upval)
			if p1.action.routeName == "ChatConversation" then
				UseStateResult2(true)
			end
		end)
		
		return function()
			-- upvalues: AddListenerResult (copy)
			AddListenerResult.remove()
		end
	end, {})
	
	local function _()
		-- upvalues: SetupPushNotificationsUpsell (upval), NotificationsUpsellConstants (upval), IXPService (upval), AppUserLayers (upval), Default (upval), PushUpsellEventConfig (upval), ModalEventConstants (upval), AppPage (upval)
		SetupPushNotificationsUpsell.ShouldShowUpsell(NotificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(Result)
			-- upvalues: IXPService (upval), AppUserLayers (upval), Default (upval), PushUpsellEventConfig (upval), ModalEventConstants (upval), AppPage (upval), SetupPushNotificationsUpsell (upval), NotificationsUpsellConstants (upval)
			if Result then
				IXPService:LogUserLayerExposure(AppUserLayers.SocialAppChat)
				Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
					[ModalEventConstants.ActionType] = ModalEventConstants.ShouldRequest,
					[ModalEventConstants.EntryPoint] = AppPage.Chat
				}, ModalEventConstants.ModalContextPushEduUpsell)
				SetupPushNotificationsUpsell.OpenModal(NotificationsUpsellConstants.ModalKey.PushUpsellChat, true, AppPage.Chat)
				
				return
			end
		end)
	end
	
	local _ = function()
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), SetupPushNotificationsUpsell (upval), NotificationsUpsellConstants (upval), IXPService (upval), AppUserLayers (upval), Default (upval), PushUpsellEventConfig (upval), ModalEventConstants (upval)
		if UseStateResult then
			UseStateResult2(false)
			SetupPushNotificationsUpsell.ShouldShowUpsell(NotificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(Result)
				-- upvalues: IXPService (upval), AppUserLayers (upval), Default (upval), PushUpsellEventConfig (upval), ModalEventConstants (upval), SetupPushNotificationsUpsell (upval), NotificationsUpsellConstants (upval)
				if Result then
					IXPService:LogUserLayerExposure(AppUserLayers.SocialAppChat)
					Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
						[ModalEventConstants.ActionType] = ModalEventConstants.ShouldRequest,
						[ModalEventConstants.EntryPoint] = "ChatConversation"
					}, ModalEventConstants.ModalContextPushEduUpsell)
					SetupPushNotificationsUpsell.OpenModal(NotificationsUpsellConstants.ModalKey.PushUpsellChat, true, "ChatConversation")
					
					return
				end
			end)
			
			return
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseChatIsVisibleModuleResult (copy), UseNavigationFocusResult (copy), UseIsInExperienceModuleResult (copy), UseUserExperimentResult (copy), SetupPushNotificationsUpsell (upval), NotificationsUpsellConstants (upval), IXPService (upval), AppUserLayers (upval), Default (upval), PushUpsellEventConfig (upval), ModalEventConstants (upval), AppPage (upval), UseStateResult (copy), UseStateResult2 (copy)
		if not UseChatIsVisibleModuleResult or not UseNavigationFocusResult or UseIsInExperienceModuleResult or UseUserExperimentResult.pushUpsellChatVariant == nil or UseUserExperimentResult.pushUpsellChatVariant < 0 then return end
		if UseUserExperimentResult.pushUpsellChatVariant == 1 then
			SetupPushNotificationsUpsell.ShouldShowUpsell(NotificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(Result)
				-- upvalues: IXPService (upval), AppUserLayers (upval), Default (upval), PushUpsellEventConfig (upval), ModalEventConstants (upval), AppPage (upval), SetupPushNotificationsUpsell (upval), NotificationsUpsellConstants (upval)
				if Result then
					IXPService:LogUserLayerExposure(AppUserLayers.SocialAppChat)
					Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
						[ModalEventConstants.ActionType] = ModalEventConstants.ShouldRequest,
						[ModalEventConstants.EntryPoint] = AppPage.Chat
					}, ModalEventConstants.ModalContextPushEduUpsell)
					SetupPushNotificationsUpsell.OpenModal(NotificationsUpsellConstants.ModalKey.PushUpsellChat, true, AppPage.Chat)
					
					return
				end
			end)
			
			return
		end
		if UseUserExperimentResult.pushUpsellChatVariant == 2 then
			if not UseStateResult then return end
			UseStateResult2(false)
			SetupPushNotificationsUpsell.ShouldShowUpsell(NotificationsUpsellConstants.ModalKey.PushUpsellChat):andThen(function(Result)
				-- upvalues: IXPService (upval), AppUserLayers (upval), Default (upval), PushUpsellEventConfig (upval), ModalEventConstants (upval), SetupPushNotificationsUpsell (upval), NotificationsUpsellConstants (upval)
				if Result then
					IXPService:LogUserLayerExposure(AppUserLayers.SocialAppChat)
					Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
						[ModalEventConstants.ActionType] = ModalEventConstants.ShouldRequest,
						[ModalEventConstants.EntryPoint] = "ChatConversation"
					}, ModalEventConstants.ModalContextPushEduUpsell)
					SetupPushNotificationsUpsell.OpenModal(NotificationsUpsellConstants.ModalKey.PushUpsellChat, true, "ChatConversation")
					
					return
				end
			end)
		end
	end, { UseChatIsVisibleModuleResult, UseNavigationFocusResult })
end