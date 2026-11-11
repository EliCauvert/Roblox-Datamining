local Parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local _ = require(script.Parent.PromptsEntryPoint)
local _ = require(script.Parent.Types.PromptsTypes)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local FFlagSduiAllowNoConfigsBuilt = require(Parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt

local function getPromptsUrl(EntryPoint)
	-- upvalues: UrlBuilder (copy), UrlBase (copy)
	return UrlBuilder.new({
		path = "modals-api/v1/prompts",
		base = UrlBase.APIS,
		query = { entryPoint = EntryPoint }
	})()
end

return function(p1, p2)
	-- upvalues: Parent (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), getPromptsUrl (copy), FFlagSduiAllowNoConfigsBuilt (copy)
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.ProtobufJson,
		url = getPromptsUrl(p1.entryPoint),
		surfaceKey = p1.surfaceKey,
		configKey = p1.configKey,
		clearOnEmptyResponse = p1.clearOnEmptyResponse,
		allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then p1.allowNoConfigsBuilt else nil,
		loadTimer = p1.loadTimer,
		apiProto = require(Parent.ServiceContractsProto).apppageplatform.prompts.prompts.GetEligiblePromptsResponse
	}, p2)
end