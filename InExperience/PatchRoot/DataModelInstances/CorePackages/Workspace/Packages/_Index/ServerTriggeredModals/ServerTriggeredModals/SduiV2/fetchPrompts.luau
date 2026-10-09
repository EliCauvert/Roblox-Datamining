local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local promptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local _ = require(script.Parent.Types.PromptsTypes)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local nativePushNotificationPermissionPrompt = require(parent.NotificationsUpsell).NativePushNotificationPermissionPrompt
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local parsePageEntriesFromResponse = sduiSharedUtilitiesModule.SduiProtobufResponseHelpers.parsePageEntriesFromResponse
local fFlagSduiAllowNoConfigsBuilt = require(parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local fFlagEdpGameLeavePromptsHandlerEnabled = require(parent.SharedFlags).FFlagEdpGameLeavePromptsHandlerEnabled
local fFlagEdpOpenPromptsHandlerEnabled = require(parent.SharedFlags).FFlagEdpOpenPromptsHandlerEnabled
local fFlagHomepagePromptsHandlerPassClientAttributes = require(parent.SharedFlags).FFlagHomepagePromptsHandlerPassClientAttributes
local fFlagSduiExtendedCapabilitiesPrompts = require(parent.SharedFlags).FFlagSduiExtendedCapabilitiesPrompts
local fFlagPushNotificationsUpsellHomePromptsExperiment = require(parent.SharedFlags).FFlagPushNotificationsUpsellHomePromptsExperiment
local fFlagSplitPaneEducationalTour = require(parent.SharedFlags).FFlagSplitPaneEducationalTour
local var1 = if fFlagSplitPaneEducationalTour then require(script.Parent.SplitPaneTourPrompt) else nil

local function getPromptsUrl(p1, p2)
	-- upvalues: urlBuilder (ref), urlBase (ref), httpService (ref)
	local var2 = urlBuilder.new({
		path = "modals-api/v1/prompts",
		base = urlBase.APIS,
		query = { entryPoint = p1 }
	})()
	
	return if p2 == nil then var2 else `{var2}&clientAttributes={httpService:UrlEncode(httpService:JSONEncode(p2))}`
end

return function(p1, p2)
	-- upvalues: parent (ref), fFlagSduiExtendedCapabilitiesPrompts (ref), sduiSharedUtilitiesModule (ref), getSduiApiStore (ref), sduiResponseType (ref), urlBuilder (ref), urlBase (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref), fFlagEdpOpenPromptsHandlerEnabled (ref), fFlagHomepagePromptsHandlerPassClientAttributes (ref), getPromptsUrl (ref), fFlagSduiAllowNoConfigsBuilt (ref), promptsEntryPointModule (ref), fFlagPushNotificationsUpsellHomePromptsExperiment (ref), nativePushNotificationPermissionPrompt (ref), fFlagSplitPaneEducationalTour (ref), var1 (ref), parsePageEntriesFromResponse (ref)
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local getEligiblePromptsRequest = serviceContractsProtoModule.apppageplatform.prompts.prompts.GetEligiblePromptsRequest
	getSduiApiStore().fetchIfNeeded({
		responseType = sduiResponseType.ProtobufJson,
		url = if fFlagSduiExtendedCapabilitiesPrompts then urlBuilder.new({ path = "modals-api/v1/prompts", base = urlBase.APIS })() elseif fFlagEdpGameLeavePromptsHandlerEnabled or fFlagEdpOpenPromptsHandlerEnabled or fFlagHomepagePromptsHandlerPassClientAttributes then getPromptsUrl(p1.entryPoint, p1.clientAttributes) else urlBuilder.new({
			path = "modals-api/v1/prompts",
			base = urlBase.APIS,
			query = { entryPoint = p1.entryPoint }
		})(),
		surfaceKey = p1.surfaceKey,
		configKey = p1.configKey,
		clearOnEmptyResponse = p1.clearOnEmptyResponse,
		allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then p1.allowNoConfigsBuilt else nil,
		loadTimer = p1.loadTimer,
		apiProto = serviceContractsProtoModule.apppageplatform.prompts.prompts.GetEligiblePromptsResponse,
		parsePageEntriesFromResponse = if p1.entryPoint == promptsEntryPointModule.HomepageLaunch and (fFlagPushNotificationsUpsellHomePromptsExperiment and nativePushNotificationPermissionPrompt.isEnabled() or fFlagSplitPaneEducationalTour) then function(p3)
			-- upvalues: fFlagPushNotificationsUpsellHomePromptsExperiment (copy), nativePushNotificationPermissionPrompt (copy), fFlagSplitPaneEducationalTour (copy), var1 (copy), parsePageEntriesFromResponse (copy)
			if fFlagPushNotificationsUpsellHomePromptsExperiment and nativePushNotificationPermissionPrompt.isEnabled() then
				nativePushNotificationPermissionPrompt.handlePromptsResponse(p3)
			end
			if fFlagSplitPaneEducationalTour then
				var1.handlePromptsResponse(p3)
			end
			return parsePageEntriesFromResponse(p3)
		end else nil,
		postConfig = if fFlagSduiExtendedCapabilitiesPrompts then {
			contentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType.Proto,
			protoMessage = getEligiblePromptsRequest,
			body = getEligiblePromptsRequest.new({
				entry_points = { p1.entryPoint },
				client_attributes = p1.clientAttributes,
				client_capabilities = if fFlagSduiExtendedCapabilitiesPrompts then sduiSharedUtilitiesModule.SduiCapabilities.buildClientCapabilities() else nil
			})
		} else nil
	}, p2)
end