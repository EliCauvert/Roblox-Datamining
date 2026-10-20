local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local _ = require(SduiSharedUtilities.SduiApiRequestConfig)
local SduiIntegrationTypesModule = require(SduiSharedUtilities.SduiIntegrationTypes)
local _ = require(SduiSharedUtilities.SduiLoadTimer)
local SduiProtobufResponseHelpersModule = require(SduiSharedUtilities.SduiProtobufResponseHelpers)
local SduiTemplateApiModule = require(SduiSharedUtilities.SduiTemplateApi)

return function(p1)
	-- upvalues: SduiTemplateApiModule (copy), SduiIntegrationTypesModule (copy), SduiProtobufResponseHelpersModule (copy)
	local Request = SduiTemplateApiModule.createRequest({
		surfaceKeys = p1.surfaceKeys,
		locale = p1.locale,
		capabilities = p1.capabilities
	})
	
	return if Request == nil then nil else {
		surfaceKey = "TemplatePrewarm",
		allowNoConfigsBuilt = true,
		responseType = SduiIntegrationTypesModule.SduiResponseType.Protobuf,
		url = Request.url,
		configKey = p1.configKey or Request.cacheKey,
		loadTimer = p1.loadTimer,
		apiProto = Request.responseProto,
		postConfig = Request.postConfig,
		parsePageEntriesFromResponse = function()
			return {}
		end,
		parseTemplateEntriesFromResponse = function(p2)
			-- upvalues: SduiTemplateApiModule (upval), Request (copy)
			SduiTemplateApiModule.storeResponse(p2, Request)
			
			return {}, {}, {}
		end,
		parseLocalizedLiteralsFromResponse = SduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse
	}
end