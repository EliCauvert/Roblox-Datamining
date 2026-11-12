local HttpService = game:GetService("HttpService")
local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local Parent = ServerTriggeredModals.Parent
local PromptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local _ = require(script.Parent.Types.PromptsTypes)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local NativePushNotificationPermissionPrompt = require(Parent.NotificationsUpsell).NativePushNotificationPermissionPrompt
local ChatPushUpsellLegacyPrompt = require(Parent.NotificationsUpsell).ChatPushUpsellLegacyPrompt
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local ParsePageEntriesFromResponseFunction = SduiSharedUtilitiesModule.SduiProtobufResponseHelpers.parsePageEntriesFromResponse
local FFlagSduiAllowNoConfigsBuilt = require(Parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local FFlagEdpGameLeavePromptsHandlerEnabled = require(Parent.SharedFlags).FFlagEdpGameLeavePromptsHandlerEnabled
local FFlagEdpOpenPromptsHandlerEnabled = require(Parent.SharedFlags).FFlagEdpOpenPromptsHandlerEnabled
local FFlagNotificationStreamPromptsHandlerEnabled = require(Parent.SharedFlags).FFlagNotificationStreamPromptsHandlerEnabled
local FFlagHomepagePromptsHandlerPassClientAttributes = require(Parent.SharedFlags).FFlagHomepagePromptsHandlerPassClientAttributes
local FFlagSduiExtendedCapabilitiesPrompts = require(Parent.SharedFlags).FFlagSduiExtendedCapabilitiesPrompts
local FFlagPushNotificationsUpsellHomePromptsExperiment = require(Parent.SharedFlags).FFlagPushNotificationsUpsellHomePromptsExperiment
local FFlagSplitPaneEducationalTour = require(Parent.SharedFlags).FFlagSplitPaneEducationalTour
local SplitPaneTourPromptModule = if FFlagSplitPaneEducationalTour then require(script.Parent.SplitPaneTourPrompt) else nil
local FFlagPlusUpsellSheetHomePromptModule = require(ServerTriggeredModals.Flags.FFlagPlusUpsellSheetHomePrompt)
local PlusUpsellSheetPromptModule = if FFlagPlusUpsellSheetHomePromptModule then require(script.Parent.PlusUpsellSheetPrompt) else nil
local FFlagPromptsEdpOpenReplaceOnFetch = require(Parent.SharedFlags).FFlagPromptsEdpOpenReplaceOnFetch
local FFlagChatPushUpsellPromptsEnabled = require(Parent.SharedFlags).FFlagChatPushUpsellPromptsEnabled

local function getPromptsUrl(EntryPoint, ClientAttributes, List)
	-- upvalues: UrlBuilder (copy), UrlBase (copy), HttpService (copy)
	local Query = { entryPoint = EntryPoint }
	
	if List ~= nil then
		Query.promptStyle = table.concat(List, ",")
	end
	local v1 = UrlBuilder.new({
		path = "modals-api/v1/prompts",
		base = UrlBase.APIS,
		query = Query
	})()
	
	return if ClientAttributes == nil then v1 else `{v1}&clientAttributes={HttpService:UrlEncode(HttpService:JSONEncode(ClientAttributes))}`
end

local function _(p1): boolean
	-- upvalues: FFlagChatPushUpsellPromptsEnabled (copy), PromptsEntryPointModule (copy)
	return FFlagChatPushUpsellPromptsEnabled and p1.entryPoint == PromptsEntryPointModule.ChatLandingOpen
end

local function getParsePageEntriesFromResponse(p1)
	-- upvalues: FFlagChatPushUpsellPromptsEnabled (copy), PromptsEntryPointModule (copy), ChatPushUpsellLegacyPrompt (copy), ParsePageEntriesFromResponseFunction (copy), FFlagPushNotificationsUpsellHomePromptsExperiment (copy), NativePushNotificationPermissionPrompt (copy), FFlagSplitPaneEducationalTour (copy), FFlagPlusUpsellSheetHomePromptModule (copy), SplitPaneTourPromptModule (copy), PlusUpsellSheetPromptModule (copy)
	if FFlagChatPushUpsellPromptsEnabled and p1.entryPoint == PromptsEntryPointModule.ChatLandingOpen then
		return function(p2)
			-- upvalues: ChatPushUpsellLegacyPrompt (upval), ParsePageEntriesFromResponseFunction (upval)
			ChatPushUpsellLegacyPrompt.handlePromptsResponse(p2)
			
			return ParsePageEntriesFromResponseFunction(p2)
		end
	elseif p1.entryPoint == PromptsEntryPointModule.HomepageLaunch and (FFlagPushNotificationsUpsellHomePromptsExperiment and NativePushNotificationPermissionPrompt.isEnabled() or (FFlagSplitPaneEducationalTour or FFlagPlusUpsellSheetHomePromptModule)) then
		return function(p2)
			-- upvalues: FFlagPushNotificationsUpsellHomePromptsExperiment (upval), NativePushNotificationPermissionPrompt (upval), FFlagSplitPaneEducationalTour (upval), SplitPaneTourPromptModule (upval), FFlagPlusUpsellSheetHomePromptModule (upval), PlusUpsellSheetPromptModule (upval), ParsePageEntriesFromResponseFunction (upval)
			if FFlagPushNotificationsUpsellHomePromptsExperiment and NativePushNotificationPermissionPrompt.isEnabled() then
				NativePushNotificationPermissionPrompt.handlePromptsResponse(p2)
			end
			if FFlagSplitPaneEducationalTour then
				SplitPaneTourPromptModule.handlePromptsResponse(p2)
			end
			if FFlagPlusUpsellSheetHomePromptModule then
				PlusUpsellSheetPromptModule.handlePromptsResponse(p2)
			end
			return ParsePageEntriesFromResponseFunction(p2)
		end
	else
		return nil
	end
end

return function(p1, p2)
	-- upvalues: Parent (copy), FFlagSduiExtendedCapabilitiesPrompts (copy), SduiSharedUtilitiesModule (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), UrlBuilder (copy), UrlBase (copy), FFlagEdpGameLeavePromptsHandlerEnabled (copy), FFlagEdpOpenPromptsHandlerEnabled (copy), FFlagHomepagePromptsHandlerPassClientAttributes (copy), FFlagChatPushUpsellPromptsEnabled (copy), PromptsEntryPointModule (copy), FFlagNotificationStreamPromptsHandlerEnabled (copy), getPromptsUrl (copy), FFlagPromptsEdpOpenReplaceOnFetch (copy), FFlagSduiAllowNoConfigsBuilt (copy), getParsePageEntriesFromResponse (copy)
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local GetEligiblePromptsRequest = ServiceContractsProtoModule.apppageplatform.prompts.prompts.GetEligiblePromptsRequest
	local config = {
		entry_points = { p1.entryPoint },
		client_attributes = p1.clientAttributes,
		client_capabilities = if FFlagSduiExtendedCapabilitiesPrompts then SduiSharedUtilitiesModule.SduiCapabilities.buildClientCapabilities() else nil,
		prompt_styles = p1.promptStyles
	}
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.ProtobufJson,
		url = if FFlagSduiExtendedCapabilitiesPrompts then UrlBuilder.new({ path = "modals-api/v1/prompts", base = UrlBase.APIS })() elseif FFlagEdpGameLeavePromptsHandlerEnabled or FFlagEdpOpenPromptsHandlerEnabled or FFlagHomepagePromptsHandlerPassClientAttributes then getPromptsUrl(p1.entryPoint, p1.clientAttributes, p1.promptStyles) elseif FFlagChatPushUpsellPromptsEnabled and p1.entryPoint == PromptsEntryPointModule.ChatLandingOpen or FFlagNotificationStreamPromptsHandlerEnabled and p1.entryPoint == PromptsEntryPointModule.NotificationStreamOpen then getPromptsUrl(p1.entryPoint, p1.clientAttributes, p1.promptStyles) else getPromptsUrl(p1.entryPoint, nil, p1.promptStyles),
		surfaceKey = p1.surfaceKey,
		configKey = p1.configKey,
		clearOnEmptyResponse = p1.clearOnEmptyResponse,
		replaceOnFetch = if FFlagPromptsEdpOpenReplaceOnFetch then p1.replaceOnFetch else nil,
		allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then p1.allowNoConfigsBuilt else nil,
		loadTimer = p1.loadTimer,
		apiProto = ServiceContractsProtoModule.apppageplatform.prompts.prompts.GetEligiblePromptsResponse,
		parsePageEntriesFromResponse = getParsePageEntriesFromResponse(p1),
		postConfig = if FFlagSduiExtendedCapabilitiesPrompts then {
			contentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType.Proto,
			protoMessage = GetEligiblePromptsRequest,
			body = GetEligiblePromptsRequest.new(config)
		} else nil
	}, p2)
end