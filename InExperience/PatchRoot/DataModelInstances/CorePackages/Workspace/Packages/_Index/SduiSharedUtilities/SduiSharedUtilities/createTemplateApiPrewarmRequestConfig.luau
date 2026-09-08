local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local _ = require(sduiSharedUtilities.SduiApiRequestConfig)
local sduiIntegrationTypesModule = require(sduiSharedUtilities.SduiIntegrationTypes)
local _ = require(sduiSharedUtilities.SduiLoadTimer)
local sduiProtobufResponseHelpersModule = require(sduiSharedUtilities.SduiProtobufResponseHelpers)
local sduiTemplateApiModule = require(sduiSharedUtilities.SduiTemplateApi)

return function(p1)
	-- upvalues: sduiTemplateApiModule (ref), sduiIntegrationTypesModule (ref), sduiProtobufResponseHelpersModule (ref)
	local var1 = sduiTemplateApiModule.createRequest({
		surfaceKeys = p1.surfaceKeys,
		locale = p1.locale,
		capabilities = p1.capabilities
	})
	
	return if var1 == nil then nil else {
		surfaceKey = "TemplatePrewarm",
		allowNoConfigsBuilt = true,
		responseType = sduiIntegrationTypesModule.SduiResponseType.Protobuf,
		url = var1.url,
		configKey = p1.configKey or var1.cacheKey,
		loadTimer = p1.loadTimer,
		apiProto = var1.responseProto,
		postConfig = var1.postConfig,
		parsePageEntriesFromResponse = function()
			return {}
		end,
		parseTemplateEntriesFromResponse = function(value)
			-- upvalues: sduiTemplateApiModule (copy), var1 (ref)
			sduiTemplateApiModule.storeResponse(value, var1)
			
			return {}, {}, {}
		end,
		parseLocalizedLiteralsFromResponse = sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse
	}
end