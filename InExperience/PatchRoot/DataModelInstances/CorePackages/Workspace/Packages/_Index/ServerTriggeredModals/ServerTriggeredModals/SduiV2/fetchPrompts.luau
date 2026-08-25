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

local function getPromptsUrl(p0, p1)
	-- upvalues: urlBuilder (ref), urlBase (ref), httpService (ref)
	local var3 = urlBuilder.new({
		path = "modals-api/v1/prompts",
		base = urlBase.APIS,
		query = { entryPoint = p0 }
	})()
	
	return if p1 == nil then var3 else `{var3}&clientAttributes={httpService:UrlEncode(httpService:JSONEncode(p1))}`
end

return function(p2, p3)
	-- upvalues: parent (ref), getSduiApiStore (ref), sduiResponseType (ref), fFlagEdpGameLeavePromptsHandlerEnabled (ref), getPromptsUrl (ref), urlBuilder (ref), urlBase (ref), fFlagSduiAllowNoConfigsBuilt (ref)
	getSduiApiStore().fetchIfNeeded({
		responseType = sduiResponseType.ProtobufJson,
		url = if fFlagEdpGameLeavePromptsHandlerEnabled then getPromptsUrl(p2.entryPoint, p2.clientAttributes) else urlBuilder.new({
			path = "modals-api/v1/prompts",
			base = urlBase.APIS,
			query = { entryPoint = p2.entryPoint }
		})(),
		surfaceKey = p2.surfaceKey,
		configKey = p2.configKey,
		clearOnEmptyResponse = p2.clearOnEmptyResponse,
		allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then p2.allowNoConfigsBuilt else nil,
		loadTimer = p2.loadTimer,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.prompts.prompts.GetEligiblePromptsResponse
	}, p3)
end