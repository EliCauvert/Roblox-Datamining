local localizationService = game:GetService("LocalizationService")
local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local sduiApiStorePostConfigModule = require(sduiSharedUtilities.SduiApiStorePostConfig)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)
local sduiSurfaceToDisplayLocationModule = require(sduiSharedUtilities.SduiSurfaceToDisplayLocation)
local getSduiTemplateStoreModule = require(sduiSharedUtilities.getSduiTemplateStore)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local serviceContractsProtoModule = require(parent.ServiceContractsProto)
local urlBuilderModule = require(parent.UrlBuilder)
local sduiCapabilities = sduiCoreSystemModule.SduiCapabilities
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiLogger = sduiCoreSystemModule.SduiLogger
local displayLocation = serviceContractsProtoModule.apppageplatform.shared.display_location.DisplayLocation
local templateApiMessages = serviceContractsProtoModule.apppageplatform.templates.template_api_messages
local fFlagSduiTemplateApiPostRequest = require(parent.SharedFlags).FFlagSduiTemplateApiPostRequest

local function _()
	-- upvalues: urlBuilderModule (ref)
	return `{urlBuilderModule.UrlBase.APIS}/landing-page-api/v1/templates`
end

local function resolveSurfaceKey(p1, p2)
	-- upvalues: sduiSurfaceToDisplayLocationModule (ref), sduiLogger (ref), sduiErrors (ref), displayLocation (ref)
	local var1 = sduiSurfaceToDisplayLocationModule[p1]
	
	if var1 == nil then
		sduiLogger.reportError(sduiErrors.SduiErrorType.CodeError, { name = p1, message = `Unmapped SDUI surfaceKey {p1}` }, p1)
		
		return
	end
	local ok, status = pcall(displayLocation.toNumber, var1)
	
	if not ok or type(status) ~= "number" then
		sduiLogger.reportError(sduiErrors.SduiErrorType.CodeError, {
			name = p1,
			message = `Invalid DisplayLocation {var1} for surfaceKey {p1}`
		}, p1)
		
		return
	elseif not p2.uniqueDisplayLocationNumbers[status] then
		p2.uniqueDisplayLocationNumbers[status] = true
		table.insert(p2.displayLocationNumbers, status)
	end
	local var2 = p2.surfaceKeysByDisplayLocation[var1]
	
	if var2 == nil then
		var2 = {}
		p2.surfaceKeysByDisplayLocation[var1] = var2
	end
	if not table.find(var2, p1) then
		table.insert(var2, p1)
	end
end

local function resolveSurfaceKeys(p3)
	-- upvalues: resolveSurfaceKey (ref), sduiLogger (ref), sduiErrors (ref)
	local t = {
		displayLocationNumbers = {},
		uniqueDisplayLocationNumbers = {},
		surfaceKeysByDisplayLocation = {}
	}
	
	for i, v in p3 do
		resolveSurfaceKey(v, t)
	end
	if #t.displayLocationNumbers ~= 0 then
		table.sort(t.displayLocationNumbers)
		
		return t
	elseif #p3 == 0 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.CodeError, {
			name = "SduiTemplateApi",
			message = "At least one surfaceKey is required"
		}, "Unknown")
	end
	return nil
end

local _ = function(p4)
	local list = table.create(#p4)
	
	for i, v in p4 do
		table.insert(list, tostring(v))
	end
	return list
end

local function buildGetUrl(p5, p6, p7)
	-- upvalues: sduiCapabilities (ref), urlBuilderModule (ref)
	local t = { platform = "App" }
	local concat = table.concat
	local list = table.create(#p5)
	
	for i, v in p5 do
		table.insert(list, tostring(v))
	end
	t.displayLocations = concat(list, ",")
	t.locale = p6
	sduiCapabilities.addToQueryParams(t, p7)
	
	return urlBuilderModule.UrlBuilder.addQueryString(`{urlBuilderModule.UrlBase.APIS}/landing-page-api/v1/templates`, t)
end

local function buildCachedComponentMappings(p8, p9)
	-- upvalues: getSduiTemplateStoreModule (ref), displayLocation (ref), templateApiMessages (ref)
	local t = {}
	local var3 = getSduiTemplateStoreModule()
	
	for i, v in p8 do
		local t_1 = {}
		
		for i_1, v_1 in p9[displayLocation.fromNumber(v)] or {} do
			for i_2, v_2 in var3.getCachedRobloxComponentToTemplateId(v_1) do
				t_1[i_2] = v_2
			end
		end
		if next(t_1) then
			table.insert(t, templateApiMessages.DisplayLocationTemplateMapping.new({
				display_location = v,
				roblox_component_to_template_id = t_1
			}))
		end
	end
	return t
end

local function buildPostConfig(p10, p11, p12)
	-- upvalues: serviceContractsProtoModule (ref), templateApiMessages (ref), sduiCapabilities (ref), buildCachedComponentMappings (ref), sduiApiStorePostConfigModule (ref)
	return {
		contentType = sduiApiStorePostConfigModule.SduiApiStorePostConfigContentType.Proto,
		protoMessage = templateApiMessages.GetTemplatesRequest,
		body = templateApiMessages.GetTemplatesRequest.new({
			display_locations = p10.displayLocationNumbers,
			client_capabilities = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
				enabled_capabilities = sduiCapabilities.getEnabledCapabilityNumbers(p12),
				platform = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.Platform.toNumber("PLATFORM_APP")
			}),
			cached_component_mappings = buildCachedComponentMappings(p10.displayLocationNumbers, p10.surfaceKeysByDisplayLocation),
			locale = p11
		})
	}
end

local function createRequest(p10)
	-- upvalues: resolveSurfaceKeys (ref), localizationService (ref), sduiCapabilities (ref), fFlagSduiTemplateApiPostRequest (ref), urlBuilderModule (ref), buildGetUrl (ref), buildPostConfig (ref), templateApiMessages (ref)
	local var4 = resolveSurfaceKeys(p10.surfaceKeys)
	
	if var4 == nil then
		return nil
	end
	local locale = p10.locale or localizationService.RobloxLocaleId
	local capabilities = p10.capabilities or sduiCapabilities.getEnabledCapabilities()
	local cloned = table.clone(capabilities)
	table.sort(cloned)
	local t = {
		url = if fFlagSduiTemplateApiPostRequest then `{urlBuilderModule.UrlBase.APIS}/landing-page-api/v1/templates` else buildGetUrl(var4.displayLocationNumbers, locale, capabilities)
	}
	local var5 = "sdui-template-api:%*:%*:%*"
	local concat = table.concat
	local displayLocationNumbers = var4.displayLocationNumbers
	local list = table.create(#displayLocationNumbers)
	
	for i, v in displayLocationNumbers do
		table.insert(list, tostring(v))
	end
	t.cacheKey = var5:format(concat(list, ","), locale, table.concat(cloned, ","))
	t.postConfig = if fFlagSduiTemplateApiPostRequest then buildPostConfig(var4, locale, capabilities) else nil
	t.responseProto = templateApiMessages.GetTemplatesResponse
	t.surfaceKeysByDisplayLocation = var4.surfaceKeysByDisplayLocation
	
	return t
end

local _ = function(p11)
	-- upvalues: displayLocation (ref)
	if type(p11) ~= "number" then
		return p11
	end
	local ok, status = pcall(displayLocation.fromNumber, p11)
	
	return if ok then status else nil
end

local function extractTemplates(p11)
	local t = {}
	
	if p11.templates then
		for i, v in p11.templates do
			if v.template then
				t[i] = v.template
			end
		end
	end
	return t
end

return {
	createRequest = createRequest,
	parseResponseForSurface = function(p12, p13)
		-- upvalues: sduiSurfaceToDisplayLocationModule (ref), extractTemplates (ref), displayLocation (ref), getSduiTemplateStoreModule (ref)
		local var6 = sduiSurfaceToDisplayLocationModule[p13]
		local var7 = extractTemplates(p12)
		local t = {}
		
		if p12.component_mappings then
			for i, v in p12.component_mappings do
				local var8
				local displayLocation_1 = v.display_location
				
				if type(displayLocation_1) == "number" then
					local ok, status = pcall(displayLocation.fromNumber, displayLocation_1)
					var8 = if ok then status else nil
				else
					var8 = displayLocation_1
				end
				if var8 == var6 then
					t = v.roblox_component_to_template_id
					break
				end
			end
		end
		local t_1 = {}
		local var9 = getSduiTemplateStoreModule()
		
		for i, v in t do
			local var10 = var7[v] or var9.getTemplate(v)
			
			if var10 then
				t_1[i] = var10
			end
		end
		return var7, t_1, t
	end,
	storeResponse = function(p14, p15)
		-- upvalues: getSduiTemplateStoreModule (ref), extractTemplates (ref), displayLocation (ref), sduiLogger (ref), sduiErrors (ref)
		local var11 = getSduiTemplateStoreModule()
		var11.addTemplates(extractTemplates(p14))
		
		if p14.component_mappings then
			for i, v in p14.component_mappings do
				local var12
				local displayLocation_1 = v.display_location
				
				if type(displayLocation_1) == "number" then
					local ok, status = pcall(displayLocation.fromNumber, displayLocation_1)
					var12 = if ok then status else nil
				else
					var12 = displayLocation_1
				end
				if var12 == nil then
					local _, var13 = next(p15.surfaceKeysByDisplayLocation)
					sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
						name = tostring(v.display_location),
						message = `Unknown DisplayLocation {v.display_location}`
					}, if var13 then var13[1] else "Unknown")
				else
					local var14 = p15.surfaceKeysByDisplayLocation[var12]
					
					if var14 then
						for i_1, v_1 in var14 do
							var11.recordSurfaceTemplates(v_1, v.roblox_component_to_template_id)
						end
					end
				end
			end
		end
		var11.addLocalizedLiterals(p14.localized_literals or {})
		
		return p14
	end
}