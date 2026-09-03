local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local _ = require(sduiSharedUtilities.SduiApiRequestConfig)
local sduiIntegrationTypesModule = require(sduiSharedUtilities.SduiIntegrationTypes)
local _ = require(sduiSharedUtilities.SduiLoadTimer)
local sduiProtobufResponseHelpersModule = require(sduiSharedUtilities.SduiProtobufResponseHelpers)
local sduiTemplateApiModule = require(sduiSharedUtilities.SduiTemplateApi)

return function(p1)
	-- upvalues: sduiTemplateApiModule (ref), sduiIntegrationTypesModule (ref), sduiProtobufResponseHelpersModule (ref)
	local var1 = sduiTemplateApiModule.createRequest({
		surfaceKeys = { p1.surfaceKey },
		locale = p1.locale,
		capabilities = p1.capabilities
	})
	
	return if var1 == nil then nil else {
		enableTemplateCache = true,
		responseType = sduiIntegrationTypesModule.SduiResponseType.Protobuf,
		url = var1.url,
		surfaceKey = p1.surfaceKey,
		configKey = p1.configKey or `template-api-page:{p1.surfaceKey}:{var1.cacheKey}`,
		loadTimer = p1.loadTimer,
		apiProto = var1.responseProto,
		allowNoConfigsBuilt = p1.allowNoConfigsBuilt,
		onSuccess = p1.onSuccess,
		postConfig = var1.postConfig,
		parsePageEntriesFromResponse = function()
			-- upvalues: p1 (ref)
			return p1.pageEntries
		end,
		parseTemplateEntriesFromResponse = function(value)
			-- upvalues: sduiTemplateApiModule (copy), p1 (ref)
			return sduiTemplateApiModule.parseResponseForSurface(value, p1.surfaceKey)
		end,
		parseLocalizedLiteralsFromResponse = sduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse
	}
end