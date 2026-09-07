local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local _ = require(script.Parent.PromptsEntryPoint)
local _ = require(script.Parent.Types.PromptsTypes)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local fFlagSduiAllowNoConfigsBuilt = require(parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local fFlagEdpGameLeavePromptsHandlerEnabled = require(parent.SharedFlags).FFlagEdpGameLeavePromptsHandlerEnabled

local function getPromptsUrl(p1, p2)
	-- upvalues: urlBuilder (ref), urlBase (ref), httpService (ref)
	local var1 = urlBuilder.new({
		path = "modals-api/v1/prompts",
		base = urlBase.APIS,
		query = { entryPoint = p1 }
	})()
	
	return if p2 == nil then var1 else `{var1}&clientAttributes={httpService:UrlEncode(httpService:JSONEncode(p2))}`
end

return function(p1, p2)
	-- upvalues: parent (ref), getSduiApiStore (ref), sduiResponseType (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref), getPromptsUrl (ref), urlBuilder (ref), urlBase (ref), fFlagSduiAllowNoConfigsBuilt (ref)
	getSduiApiStore().fetchIfNeeded({
		responseType = sduiResponseType.ProtobufJson,
		url = if fFlagEdpGameLeavePromptsHandlerEnabled then getPromptsUrl(p1.entryPoint, p1.clientAttributes) else urlBuilder.new({
			path = "modals-api/v1/prompts",
			base = urlBase.APIS,
			query = { entryPoint = p1.entryPoint }
		})(),
		surfaceKey = p1.surfaceKey,
		configKey = p1.configKey,
		clearOnEmptyResponse = p1.clearOnEmptyResponse,
		allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then p1.allowNoConfigsBuilt else nil,
		loadTimer = p1.loadTimer,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.prompts.prompts.GetEligiblePromptsResponse
	}, p2)
end