local LocalizationService = game:GetService("LocalizationService")
local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local Parent = SduiSharedUtilities.Parent
local SduiApiStorePostConfigModule = require(SduiSharedUtilities.SduiApiStorePostConfig)
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)
local SduiSurfaceToDisplayLocationModule = require(SduiSharedUtilities.SduiSurfaceToDisplayLocation)
local GetSduiTemplateStoreModule = require(SduiSharedUtilities.getSduiTemplateStore)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
local UrlBuilderModule = require(Parent.UrlBuilder)
local SduiCapabilities = SduiCoreSystemModule.SduiCapabilities
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiLogger = SduiCoreSystemModule.SduiLogger
local DisplayLocation = ServiceContractsProtoModule.apppageplatform.shared.display_location.DisplayLocation
local TemplateApiMessages = ServiceContractsProtoModule.apppageplatform.templates.template_api_messages
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiTemplateApiPostRequest = SharedFlagsModule.FFlagSduiTemplateApiPostRequest
local FFlagSduiAdvertiseRuntimeSupportSets = SharedFlagsModule.FFlagSduiAdvertiseRuntimeSupportSets

local function _(): string
	-- upvalues: UrlBuilderModule (copy)
	return `{UrlBuilderModule.UrlBase.APIS}/landing-page-api/v1/templates`
end

local function resolveSurfaceKey(Value, p1)
	-- upvalues: SduiSurfaceToDisplayLocationModule (copy), SduiLogger (copy), SduiErrors (copy), DisplayLocation (copy)
	local SduiSurfaceToDisplayLocationModuleEntry = SduiSurfaceToDisplayLocationModule[Value]
	
	if SduiSurfaceToDisplayLocationModuleEntry == nil then
		SduiLogger.reportError(SduiErrors.SduiErrorType.CodeError, {
			name = Value,
			message = `Unmapped SDUI surfaceKey {Value}`
		}, Value)
		
		return
	end
	local Success, Result = pcall(DisplayLocation.toNumber, SduiSurfaceToDisplayLocationModuleEntry)
	
	if not Success or type(Result) ~= "number" then
		SduiLogger.reportError(SduiErrors.SduiErrorType.CodeError, {
			name = Value,
			message = `Invalid DisplayLocation {SduiSurfaceToDisplayLocationModuleEntry} for surfaceKey {Value}`
		}, Value)
		
		return
	end
	if not p1.uniqueDisplayLocationNumbers[Result] then
		p1.uniqueDisplayLocationNumbers[Result] = true
		table.insert(p1.displayLocationNumbers, Result)
	end
	local SurfaceKeysByDisplayLocationEntry = p1.surfaceKeysByDisplayLocation[SduiSurfaceToDisplayLocationModuleEntry]
	
	if SurfaceKeysByDisplayLocationEntry == nil then
		SurfaceKeysByDisplayLocationEntry = {}
		p1.surfaceKeysByDisplayLocation[SduiSurfaceToDisplayLocationModuleEntry] = SurfaceKeysByDisplayLocationEntry
	end
	if not table.find(SurfaceKeysByDisplayLocationEntry, Value) then
		table.insert(SurfaceKeysByDisplayLocationEntry, Value)
	end
end

local function resolveSurfaceKeys(SurfaceKeys)
	-- upvalues: resolveSurfaceKey (copy), SduiLogger (copy), SduiErrors (copy)
	local config = {
		displayLocationNumbers = {},
		uniqueDisplayLocationNumbers = {},
		surfaceKeysByDisplayLocation = {}
	}
	
	for _, surfaceKey in SurfaceKeys do
		resolveSurfaceKey(surfaceKey, config)
	end
	if #config.displayLocationNumbers ~= 0 then
		table.sort(config.displayLocationNumbers)
		
		return config
	end
	if #SurfaceKeys == 0 then
		SduiLogger.reportError(SduiErrors.SduiErrorType.CodeError, {
			name = "SduiTemplateApi",
			message = "At least one surfaceKey is required"
		}, "Unknown")
	end
	return nil
end

local _ = function(List)
	local Buffer = table.create(#List)
	
	for _, value in List do
		table.insert(Buffer, (tostring(value)))
	end
	return Buffer
end

local function buildGetUrl(DisplayLocationNumbers, Locale, Capabilities)
	-- upvalues: SduiCapabilities (copy), UrlBuilderModule (copy)
	local config = { platform = "App" }
	local ConcatFunction = table.concat
	local Buffer = table.create(#DisplayLocationNumbers)
	
	for _, displayLocationNumber in DisplayLocationNumbers do
		table.insert(Buffer, (tostring(displayLocationNumber)))
	end
	config.displayLocations = ConcatFunction(Buffer, ",")
	config.locale = Locale
	SduiCapabilities.addToQueryParams(config, Capabilities)
	
	return UrlBuilderModule.UrlBuilder.addQueryString(`{UrlBuilderModule.UrlBase.APIS}/landing-page-api/v1/templates`, config)
end

local function buildCachedComponentMappings(DisplayLocationNumbers, SurfaceKeysByDisplayLocation)
	-- upvalues: GetSduiTemplateStoreModule (copy), DisplayLocation (copy), TemplateApiMessages (copy)
	local List = {}
	local SduiTemplateStoreModule = GetSduiTemplateStoreModule()
	
	for _, displayLocationNumber in DisplayLocationNumbers do
		local Roblox_component_to_template_id = {}
		local SurfaceKeysByDisplayLocationEntry = SurfaceKeysByDisplayLocation[DisplayLocation.fromNumber(displayLocationNumber)] or {}
		for _, value in SurfaceKeysByDisplayLocationEntry do
			for i, value1 in SduiTemplateStoreModule.getCachedRobloxComponentToTemplateId(value) do
				Roblox_component_to_template_id[i] = value1
			end
		end
		if next(Roblox_component_to_template_id) then
			table.insert(List, TemplateApiMessages.DisplayLocationTemplateMapping.new({
				display_location = displayLocationNumber,
				roblox_component_to_template_id = Roblox_component_to_template_id
			}))
		end
	end
	return List
end

local function buildPostConfig(p2, Locale, Capabilities)
	-- upvalues: ServiceContractsProtoModule (copy), TemplateApiMessages (copy), SduiCapabilities (copy), buildCachedComponentMappings (copy), SduiApiStorePostConfigModule (copy)
	return {
		contentType = SduiApiStorePostConfigModule.SduiApiStorePostConfigContentType.Proto,
		protoMessage = TemplateApiMessages.GetTemplatesRequest,
		body = TemplateApiMessages.GetTemplatesRequest.new({
			display_locations = p2.displayLocationNumbers,
			client_capabilities = ServiceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
				enabled_capabilities = SduiCapabilities.getEnabledCapabilityNumbers(Capabilities),
				platform = ServiceContractsProtoModule.apppageplatform.shared.client_capabilities.Platform.toNumber("PLATFORM_APP")
			}),
			cached_component_mappings = buildCachedComponentMappings(p2.displayLocationNumbers, p2.surfaceKeysByDisplayLocation),
			locale = Locale
		})
	}
end

local function buildPostConfigWithRuntimeSupport(p2, Locale, Client_capabilities)
	-- upvalues: TemplateApiMessages (copy), buildCachedComponentMappings (copy), SduiApiStorePostConfigModule (copy)
	return {
		contentType = SduiApiStorePostConfigModule.SduiApiStorePostConfigContentType.Proto,
		protoMessage = TemplateApiMessages.GetTemplatesRequest,
		body = TemplateApiMessages.GetTemplatesRequest.new({
			display_locations = p2.displayLocationNumbers,
			client_capabilities = Client_capabilities,
			cached_component_mappings = buildCachedComponentMappings(p2.displayLocationNumbers, p2.surfaceKeysByDisplayLocation),
			locale = Locale
		})
	}
end

local _ = function(p2)
	-- upvalues: DisplayLocation (copy)
	if type(p2) == "number" then
		local Success, Result = pcall(DisplayLocation.fromNumber, p2)
		
		return if Success then Result else nil
	else
		return p2
	end
end

local function extractTemplates(p2)
	local Templates = {}
	
	if p2.templates then
		for i, template in p2.templates do
			if template.template then
				Templates[i] = template.template
			end
		end
	end
	return Templates
end

return {
	createRequest = function(p3)
		-- upvalues: resolveSurfaceKeys (copy), LocalizationService (copy), SduiCapabilities (copy), FFlagSduiAdvertiseRuntimeSupportSets (copy), FFlagSduiTemplateApiPostRequest (copy), UrlBuilderModule (copy), buildGetUrl (copy), buildPostConfigWithRuntimeSupport (copy), TemplateApiMessages (copy), buildPostConfig (copy)
		local ResolveSurfaceKeysResult = resolveSurfaceKeys(p3.surfaceKeys)
		
		if ResolveSurfaceKeysResult == nil then
			return nil
		end
		local Locale = p3.locale or LocalizationService.RobloxLocaleId
		local Capabilities = p3.capabilities or SduiCapabilities.getEnabledCapabilities()
		
		if FFlagSduiAdvertiseRuntimeSupportSets then
			local Copy = table.clone(SduiCapabilities.getEnabledCapabilities())
			table.sort(Copy)
			local ClientCapabilities = SduiCapabilities.buildClientCapabilities()
			local config = {
				url = if FFlagSduiTemplateApiPostRequest then `{UrlBuilderModule.UrlBase.APIS}/landing-page-api/v1/templates` else buildGetUrl(ResolveSurfaceKeysResult.displayLocationNumbers, Locale, Capabilities)
			}
			local v1 = "sdui-template-api:%*:%*:%*"
			local ConcatFunction = table.concat
			local DisplayLocationNumbers = ResolveSurfaceKeysResult.displayLocationNumbers
			local Buffer = table.create(#DisplayLocationNumbers)
			
			for _, displayLocationNumber in DisplayLocationNumbers do
				table.insert(Buffer, (tostring(displayLocationNumber)))
			end
			config.cacheKey = v1:format(ConcatFunction(Buffer, ","), Locale, (table.concat(Copy, ",")))
			config.postConfig = if FFlagSduiTemplateApiPostRequest then buildPostConfigWithRuntimeSupport(ResolveSurfaceKeysResult, Locale, ClientCapabilities) else nil
			config.responseProto = TemplateApiMessages.GetTemplatesResponse
			config.surfaceKeysByDisplayLocation = ResolveSurfaceKeysResult.surfaceKeysByDisplayLocation
			
			return config
		else
			local Copy1 = table.clone(Capabilities)
			table.sort(Copy1)
			local config1 = {
				url = if FFlagSduiTemplateApiPostRequest then `{UrlBuilderModule.UrlBase.APIS}/landing-page-api/v1/templates` else buildGetUrl(ResolveSurfaceKeysResult.displayLocationNumbers, Locale, Capabilities)
			}
			local v2 = "sdui-template-api:%*:%*:%*"
			local ConcatFunction1 = table.concat
			local DisplayLocationNumbers = ResolveSurfaceKeysResult.displayLocationNumbers
			local Buffer1 = table.create(#DisplayLocationNumbers)
			
			for _, displayLocationNumber1 in DisplayLocationNumbers do
				table.insert(Buffer1, (tostring(displayLocationNumber1)))
			end
			config1.cacheKey = v2:format(ConcatFunction1(Buffer1, ","), Locale, (table.concat(Copy1, ",")))
			config1.postConfig = if FFlagSduiTemplateApiPostRequest then buildPostConfig(ResolveSurfaceKeysResult, Locale, Capabilities) else nil
			config1.responseProto = TemplateApiMessages.GetTemplatesResponse
			config1.surfaceKeysByDisplayLocation = ResolveSurfaceKeysResult.surfaceKeysByDisplayLocation
			
			return config1
		end
	end,
	parseResponseForSurface = function(p4, p5)
		-- upvalues: SduiSurfaceToDisplayLocationModule (copy), extractTemplates (copy), DisplayLocation (copy), GetSduiTemplateStoreModule (copy)
		local SduiSurfaceToDisplayLocationModuleEntry = SduiSurfaceToDisplayLocationModule[p5]
		local ExtractTemplatesResult = extractTemplates(p4)
		local RobloxComponentToTemplateId = {}
		
		if p4.component_mappings then
			for _, componentMapping in p4.component_mappings do
				local DisplayLocation1 = componentMapping.display_location
				local Result1 = nil
				
				if type(DisplayLocation1) == "number" then
					local Success, Result = pcall(DisplayLocation.fromNumber, DisplayLocation1)
					Result1 = if Success then Result else nil
				else
					Result1 = DisplayLocation1
				end
				if Result1 == SduiSurfaceToDisplayLocationModuleEntry then
					RobloxComponentToTemplateId = componentMapping.roblox_component_to_template_id
					break
				end
			end
		end
		local t = {}
		local SduiTemplateStoreModule = GetSduiTemplateStoreModule()
		
		for i, value in RobloxComponentToTemplateId do
			local ExtractTemplatesResultEntry = ExtractTemplatesResult[value] or SduiTemplateStoreModule.getTemplate(value)
			
			if ExtractTemplatesResultEntry then
				t[i] = ExtractTemplatesResultEntry
			end
		end
		return ExtractTemplatesResult, t, RobloxComponentToTemplateId
	end,
	storeResponse = function(p6, p7)
		-- upvalues: GetSduiTemplateStoreModule (copy), extractTemplates (copy), DisplayLocation (copy), SduiLogger (copy), SduiErrors (copy)
		local SduiTemplateStoreModule = GetSduiTemplateStoreModule()
		SduiTemplateStoreModule.addTemplates((extractTemplates(p6)))
		
		if p6.component_mappings then
			for _, componentMapping in p6.component_mappings do
				local DisplayLocation1 = componentMapping.display_location
				local Result1 = nil
				
				if type(DisplayLocation1) == "number" then
					local Success, Result = pcall(DisplayLocation.fromNumber, DisplayLocation1)
					Result1 = if Success then Result else nil
				else
					Result1 = DisplayLocation1
				end
				if Result1 == nil then
					local _, Value = next(p7.surfaceKeysByDisplayLocation)
					SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
						name = tostring(componentMapping.display_location),
						message = `Unknown DisplayLocation {componentMapping.display_location}`
					}, if Value then Value[1] else "Unknown")
				else
					local SurfaceKeysByDisplayLocationEntry = p7.surfaceKeysByDisplayLocation[Result1]
					
					if SurfaceKeysByDisplayLocationEntry then
						for _, value in SurfaceKeysByDisplayLocationEntry do
							SduiTemplateStoreModule.recordSurfaceTemplates(value, componentMapping.roblox_component_to_template_id)
						end
					end
				end
			end
		end
		SduiTemplateStoreModule.addLocalizedLiterals(p6.localized_literals or {})
		
		return p6
	end
}