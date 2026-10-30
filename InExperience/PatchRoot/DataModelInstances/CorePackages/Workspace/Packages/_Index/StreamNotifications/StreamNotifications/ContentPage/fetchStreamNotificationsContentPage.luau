local Parent = script:FindFirstAncestor("StreamNotifications").Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local FFlagSduiAllowNoConfigsBuilt = require(Parent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local ContentPageConstantsModule = require(script.Parent.ContentPageConstants)
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local SduiApiStorePostConfigContentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local SduiCapabilities = SduiSharedUtilitiesModule.SduiCapabilities
local ConfigKey = ContentPageConstantsModule.ConfigKey
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	base = require(Parent.Http).Url.NOTIFICATION_URL,
	path = ContentPageConstantsModule.ApiPath
})

return function(Client_attributes)
	-- upvalues: Parent (copy), SduiCapabilities (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), NewResult (copy), ConfigKey (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiLoadTimer (copy), SduiApiStorePostConfigContentType (copy)
	local StreamPage = require(Parent.ServiceContractsProto).apppageplatform.notifications.stream_page
	
	return GetSduiApiStoreFunction().fetchIfNeeded({
		clearOnEmptyResponse = true,
		replaceOnFetch = true,
		responseType = SduiResponseType.Protobuf,
		url = NewResult(),
		surfaceKey = ConfigKey,
		configKey = ConfigKey,
		allowNoConfigsBuilt = if FFlagSduiAllowNoConfigsBuilt then true else nil,
		loadTimer = SduiLoadTimer.createLoadTimer(ConfigKey),
		apiProto = StreamPage.StreamPageResponse,
		postConfig = {
			contentType = SduiApiStorePostConfigContentType.Proto,
			protoMessage = StreamPage.StreamPageRequest,
			body = StreamPage.StreamPageRequest.new({
				client_capabilities = SduiCapabilities.buildClientCapabilities(),
				client_attributes = Client_attributes
			})
		}
	}, true)
end