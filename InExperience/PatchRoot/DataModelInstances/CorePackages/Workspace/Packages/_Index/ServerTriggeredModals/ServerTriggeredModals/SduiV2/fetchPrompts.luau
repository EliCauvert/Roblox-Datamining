local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local PromptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local _ = require(script.Parent.Types.PromptsTypes)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local NativePushNotificationPermissionPrompt = require(Parent.NotificationsUpsell).NativePushNotificationPermissionPrompt
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local ParsePageEntriesFromResponseFunction = SduiSharedUtilitiesModule.SduiProtobufResponseHelpers.parsePageEntriesFromResponse
local FFlagSduiAllowNoConfigsBuilt = require(Parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local FFlagEdpGameLeavePromptsHandlerEnabled = require(Parent.SharedFlags).FFlagEdpGameLeavePromptsHandlerEnabled
local FFlagEdpOpenPromptsHandlerEnabled = require(Parent.SharedFlags).FFlagEdpOpenPromptsHandlerEnabled
local FFlagHomepagePromptsHandlerPassClientAttributes = require(Parent.SharedFlags).FFlagHomepagePromptsHandlerPassClientAttributes
local FFlagSduiExtendedCapabilitiesPrompts = require(Parent.SharedFlags).FFlagSduiExtendedCapabilitiesPrompts
local FFlagPushNotificationsUpsellHomePromptsExperiment = require(Parent.SharedFlags).FFlagPushNotificationsUpsellHomePromptsExperiment
local FFlagSplitPaneEducationalTour = require(Parent.SharedFlags).FFlagSplitPaneEducationalTour
local SplitPaneTourPromptModule = if FFlagSplitPaneEducationalTour then require(script.Parent.SplitPaneTourPrompt) else nil
local FFlagPromptsEdpOpenReplaceOnFetch = require(Parent.SharedFlags).FFlagPromptsEdpOpenReplaceOnFetch

local function getPromptsUrl(EntryPoint, ClientAttributes) --[[ Line: 43 ]]
	-- upvalues: UrlBuilder (copy), UrlBase (copy), HttpService (copy)
	local v1 = UrlBuilder.new({
		path = "modals-api/v1/prompts",
		base = UrlBase.APIS,
		query = { entryPoint = EntryPoint }
	})()
	
	return if ClientAttributes == nil then v1 else `{v1}&clientAttributes={HttpService:UrlEncode(HttpService:JSONEncode(ClientAttributes))}`
end

return function(p1, p2) --[[ Line: 60 | Named "fetchPrompts" ]]
	-- upvalues: Parent (copy), FFlagSduiExtendedCapabilitiesPrompts (copy), SduiSharedUtilitiesModule (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), UrlBuilder (copy), UrlBase (copy), FFlagEdpGameLeavePromptsHandlerEnabled (copy), FFlagEdpOpenPromptsHandlerEnabled (copy), FFlagHomepagePromptsHandlerPassClientAttributes (copy), getPromptsUrl (copy), FFlagPromptsEdpOpenReplaceOnFetch (copy), FFlagSduiAllowNoConfigsBuilt (copy), PromptsEntryPointModule (copy), FFlagPushNotificationsUpsellHomePromptsExperiment (copy), NativePushNotificationPermissionPrompt (copy), FFlagSplitPaneEducationalTour (copy), SplitPaneTourPromptModule (copy), ParsePageEntriesFromResponseFunction (copy)
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local GetEligiblePromptsRequest = ServiceContractsProtoModule.apppageplatform.prompts.prompts.GetEligiblePromptsRequest
	local ClientCapabilities = if FFlagSduiExtendedCapabilitiesPrompts then SduiSharedUtilitiesModule.SduiCapabilities.buildClientCapabilities() else nil
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.ProtobufJson,
		url = if FFlagSduiExtendedCapabilitiesPrompts then UrlBuilder.new({ path = "modals-api/v1/prompts", base = UrlBase.APIS })() elseif FFlagEdpGameLeavePromptsHandlerEnabled or FFlagEdpOpenPromptsHandlerEnabled or FFlagHomepagePromptsHandlerPassClientAttributes then getPromptsUrl(p1.entryPoint, p1.clientAttributes) else UrlBuilder.new({
			path = "modals-api/v1/prompts",
			base = UrlBase.APIS,
			query = { entryPoint = p1.entryPoint }
		})(),
		surfaceKey = p1.surfaceKey,
		configKey = p1.configKey,
		clearOnEmptyResponse = p1.clearOnEmptyResponse,
		replaceOnFetch = if FFlagPromptsEdpOpenReplaceOnFetch then p1.replaceOnFetch else nil,
		allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then p1.allowNoConfigsBuilt else nil,
		loadTimer = p1.loadTimer,
		apiProto = ServiceContractsProtoModule.apppageplatform.prompts.prompts.GetEligiblePromptsResponse,
		parsePageEntriesFromResponse = if p1.entryPoint == PromptsEntryPointModule.HomepageLaunch then if FFlagPushNotificationsUpsellHomePromptsExperiment and NativePushNotificationPermissionPrompt.isEnabled() then function(p3) --[[ Line: 96 ]]
			-- upvalues: FFlagPushNotificationsUpsellHomePromptsExperiment (upval), NativePushNotificationPermissionPrompt (upval), FFlagSplitPaneEducationalTour (upval), SplitPaneTourPromptModule (upval), ParsePageEntriesFromResponseFunction (upval)
			if FFlagPushNotificationsUpsellHomePromptsExperiment and NativePushNotificationPermissionPrompt.isEnabled() then
				NativePushNotificationPermissionPrompt.handlePromptsResponse(p3)
			end
			if FFlagSplitPaneEducationalTour then
				SplitPaneTourPromptModule.handlePromptsResponse(p3)
			end
			return ParsePageEntriesFromResponseFunction(p3)
		end elseif FFlagSplitPaneEducationalTour then function(p3) --[[ Line: 96 ]]
			-- upvalues: FFlagPushNotificationsUpsellHomePromptsExperiment (upval), NativePushNotificationPermissionPrompt (upval), FFlagSplitPaneEducationalTour (upval), SplitPaneTourPromptModule (upval), ParsePageEntriesFromResponseFunction (upval)
			if FFlagPushNotificationsUpsellHomePromptsExperiment and NativePushNotificationPermissionPrompt.isEnabled() then
				NativePushNotificationPermissionPrompt.handlePromptsResponse(p3)
			end
			if FFlagSplitPaneEducationalTour then
				SplitPaneTourPromptModule.handlePromptsResponse(p3)
			end
			return ParsePageEntriesFromResponseFunction(p3)
		end else nil else nil,
		postConfig = if FFlagSduiExtendedCapabilitiesPrompts then {
			contentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType.Proto,
			protoMessage = GetEligiblePromptsRequest,
			body = GetEligiblePromptsRequest.new({
				entry_points = { p1.entryPoint },
				client_attributes = p1.clientAttributes,
				client_capabilities = ClientCapabilities
			})
		} else nil
	}, p2)
end