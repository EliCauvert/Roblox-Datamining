local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local _ = require(script.Parent.PromptsEntryPoint)
local _ = require(script.Parent.Types.PromptsTypes)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local fFlagSduiAllowNoConfigsBuilt = require(parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt

local function getPromptsUrl(p0) --[[ line: 26 ]]
	-- upvalues: urlBuilder (ref), urlBase (ref)
	return urlBuilder.new({
		path = "modals-api/v1/prompts",
		base = urlBase.APIS,
		query = { entryPoint = p0 }
	})()
end

return function(p1, p2) --[[ line: 37 | named "fetchPrompts" ]]
	-- upvalues: parent (ref), getSduiApiStore (ref), sduiResponseType (ref), getPromptsUrl (ref), fFlagSduiAllowNoConfigsBuilt (ref)
	getSduiApiStore().fetchIfNeeded({
		responseType = sduiResponseType.ProtobufJson,
		url = getPromptsUrl(p1.entryPoint),
		surfaceKey = p1.surfaceKey,
		configKey = p1.configKey,
		clearOnEmptyResponse = p1.clearOnEmptyResponse,
		allowNoConfigsBuilt = if fFlagSduiAllowNoConfigsBuilt then p1.allowNoConfigsBuilt else nil,
		loadTimer = p1.loadTimer,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.prompts.prompts.GetEligiblePromptsResponse
	}, p2)
end