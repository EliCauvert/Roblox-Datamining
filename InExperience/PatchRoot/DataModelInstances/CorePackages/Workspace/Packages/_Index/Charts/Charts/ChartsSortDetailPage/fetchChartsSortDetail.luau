local charts = script:FindFirstAncestor("Charts")
local parent = charts.Parent
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiTemplateStore = sduiSharedUtilitiesModule.getSduiTemplateStore
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local sduiApiStorePostConfigContentType = sduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local sduiCapabilities = sduiSharedUtilitiesModule.SduiCapabilities
local chartsConstantsModule = require(charts.ChartsPage.ChartsConstants)
local chartsPageScopeFieldsModule = require(charts.ChartsPage.ChartsPageScopeFields)
local chartsPageSessionModule = require(charts.ChartsPage.ChartsPageSession)
local chartsSortDetailScopeFieldsModule = require(charts.ChartsSortDetailPage.ChartsSortDetailScopeFields)
local getChartsSortDetailPostUrlModule = require(charts.ChartsSortDetailPage.getChartsSortDetailPostUrl)
local getChartsSortDetailPageKeyModule = require(charts.ChartsSortDetailPage.getChartsSortDetailPageKey)
local buildChartsSortDetailRequestModule = require(charts.ChartsSortDetailPage.buildChartsSortDetailRequest)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiChartsSortDetailGenreFilter = sharedFlagsModule.FFlagSduiChartsSortDetailGenreFilter
local fFlagSduiAdvertiseRuntimeSupportSets = sharedFlagsModule.FFlagSduiAdvertiseRuntimeSupportSets

local function _()
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref)
	return getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
end

local _ = function(p1)
	local nextContentPageToken = p1 and p1.next_content_page_token
	
	return if nextContentPageToken and nextContentPageToken ~= "" then nextContentPageToken else nil
end

local function getGenreForRequest(p1)
	-- upvalues: getSduiClientPageScope (ref), chartsSortDetailScopeFieldsModule (ref)
	local var1 = getSduiClientPageScope(p1)
	local var2 = var1.get(chartsSortDetailScopeFieldsModule.DesiredGenre)
	local var3 = var1.get(chartsSortDetailScopeFieldsModule.SafeGenre)
	
	return if (typeof(var2) == "string" and var2 ~= "") and var2 ~= var3 then var2 elseif typeof(var3) == "string" and var3 ~= "" then var3 else nil
end

local function getFilterSelectionsWithGenre(p1)
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), getGenreForRequest (ref)
	local var1 = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
	local var2 = getGenreForRequest(p1)
	
	if var2 == nil then
		return var1
	end
	local var3 = if var1 then table.clone(var1) else {}
	var3.selectedGenre = var2
	
	return var3
end

local _ = function(value)
	-- upvalues: getSduiApiStore (ref), getSduiClientPageScope (ref), chartsSortDetailScopeFieldsModule (ref)
	local _, data = getSduiApiStore().getData(value)
	
	if data then
		local var1 = getSduiClientPageScope(value)
		var1.set(chartsSortDetailScopeFieldsModule.DesiredGenre, nil)
		var1.set(chartsSortDetailScopeFieldsModule.SafeGenre, nil)
	end
end

return function(p1, p2)
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), getChartsSortDetailPageKeyModule (ref), fFlagSduiChartsSortDetailGenreFilter (ref), getSduiApiStore (ref), chartsSortDetailScopeFieldsModule (ref), getChartsSortDetailPostUrlModule (ref), parent (ref), fFlagSduiAdvertiseRuntimeSupportSets (ref), sduiCapabilities (ref), buildChartsSortDetailRequestModule (ref), chartsPageSessionModule (ref), getFilterSelectionsWithGenre (ref), getSduiTemplateStore (ref), sduiResponseType (ref), sduiApiStorePostConfigContentType (ref)
	local var1 = getChartsSortDetailPageKeyModule(p1, nil, getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections))
	
	if fFlagSduiChartsSortDetailGenreFilter then
		local _, data = getSduiApiStore().getData(var1)
		
		if data then
			local var2 = getSduiClientPageScope(var1)
			var2.set(chartsSortDetailScopeFieldsModule.DesiredGenre, nil)
			var2.set(chartsSortDetailScopeFieldsModule.SafeGenre, nil)
		end
	end
	local var3 = getChartsSortDetailPostUrlModule()
	local serviceContractsProtoModule = require(parent.ServiceContractsProto)
	local chartsPage = serviceContractsProtoModule.apppageplatform.charts.charts_page
	local var4 = if fFlagSduiAdvertiseRuntimeSupportSets then sduiCapabilities.buildClientCapabilities() else serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
		enabled_capabilities = sduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS" })
	})
	
	local function buildBody(p3)
		-- upvalues: buildChartsSortDetailRequestModule (copy), chartsPage (ref), p1 (ref), chartsPageSessionModule (copy), fFlagSduiChartsSortDetailGenreFilter (copy), getFilterSelectionsWithGenre (copy), var1 (ref), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), getSduiTemplateStore (copy), var4 (write)
		return buildChartsSortDetailRequestModule(chartsPage, {
			sortId = p1,
			contentPageToken = p3,
			sessionId = chartsPageSessionModule:Get(),
			filterSelections = if fFlagSduiChartsSortDetailGenreFilter then getFilterSelectionsWithGenre(var1) else getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
			cachedRobloxComponentToTemplateId = getSduiTemplateStore().getCachedRobloxComponentToTemplateId("ChartsSortDetail"),
			clientCapabilities = var4
		})
	end
	
	getSduiApiStore().fetchIfNeeded({
		surfaceKey = "ChartsSortDetail",
		enableTemplateCache = true,
		responseType = sduiResponseType.Protobuf,
		url = var3,
		configKey = var1,
		loadTimer = p2,
		apiProto = chartsPage.GetChartsSortDetailResponse,
		postConfig = {
			contentType = sduiApiStorePostConfigContentType.Proto,
			protoMessage = chartsPage.GetChartsSortDetailRequest,
			body = buildBody(nil)
		},
		buildNextPageUrl = function(p3)
			-- upvalues: var3 (ref)
			local nextContentPageToken = p3 and p3.next_content_page_token
			
			return if if nextContentPageToken and nextContentPageToken ~= "" then nextContentPageToken else nil then var3 else nil
		end,
		buildNextPagePostBody = function(p3)
			-- upvalues: buildBody (ref)
			local nextContentPageToken = p3 and p3.next_content_page_token
			local var5 = if nextContentPageToken and nextContentPageToken ~= "" then nextContentPageToken else nil
			
			return if var5 then buildBody(var5) else nil
		end,
		buildRefreshUrl = function()
			-- upvalues: var3 (ref)
			return var3
		end,
		buildRefreshPostBody = function()
			-- upvalues: buildBody (ref)
			return buildBody(nil)
		end
	})
	
	return var1
end