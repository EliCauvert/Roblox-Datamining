local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local _ = require(SduiSharedUtilities.SduiApiRequestConfig)
local SduiIntegrationTypesModule = require(SduiSharedUtilities.SduiIntegrationTypes)
local _ = require(SduiSharedUtilities.SduiLoadTimer)
local SduiProtobufResponseHelpersModule = require(SduiSharedUtilities.SduiProtobufResponseHelpers)
local SduiTemplateApiModule = require(SduiSharedUtilities.SduiTemplateApi)

return function(p1) --[[ Line: 24 | Named "createTemplateApiRequestConfig" ]]
	-- upvalues: SduiTemplateApiModule (copy), SduiIntegrationTypesModule (copy), SduiProtobufResponseHelpersModule (copy)
	local Request = SduiTemplateApiModule.createRequest({
		surfaceKeys = { p1.surfaceKey },
		locale = p1.locale,
		capabilities = p1.capabilities
	})
	
	return if Request == nil then nil else {
		enableTemplateCache = true,
		responseType = SduiIntegrationTypesModule.SduiResponseType.Protobuf,
		url = Request.url,
		surfaceKey = p1.surfaceKey,
		configKey = p1.configKey or `template-api-page:{p1.surfaceKey}:{Request.cacheKey}`,
		loadTimer = p1.loadTimer,
		apiProto = Request.responseProto,
		allowNoConfigsBuilt = p1.allowNoConfigsBuilt,
		onSuccess = p1.onSuccess,
		postConfig = Request.postConfig,
		parsePageEntriesFromResponse = function() --[[ Line: 45 ]]
			-- upvalues: p1 (copy)
			return p1.pageEntries
		end,
		parseTemplateEntriesFromResponse = function(p2) --[[ Line: 48 ]]
			-- upvalues: SduiTemplateApiModule (upval), p1 (copy)
			return SduiTemplateApiModule.parseResponseForSurface(p2, p1.surfaceKey)
		end,
		parseLocalizedLiteralsFromResponse = SduiProtobufResponseHelpersModule.parseLocalizedLiteralsFromResponse
	}
end