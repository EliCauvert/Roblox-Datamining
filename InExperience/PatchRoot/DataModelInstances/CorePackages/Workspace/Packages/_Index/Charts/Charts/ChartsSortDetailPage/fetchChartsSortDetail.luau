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
local getChartsSortDetailUrlModule = require(charts.ChartsSortDetailPage.getChartsSortDetailUrl)
local getChartsSortDetailPostUrlModule = require(charts.ChartsSortDetailPage.getChartsSortDetailPostUrl)
local getChartsSortDetailPageKeyModule = require(charts.ChartsSortDetailPage.getChartsSortDetailPageKey)
local buildChartsSortDetailRequestModule = require(charts.ChartsSortDetailPage.buildChartsSortDetailRequest)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiChartsPostBody = sharedFlagsModule.FFlagSduiChartsPostBody
local fFlagSduiChartsSortDetailGenreFilter = sharedFlagsModule.FFlagSduiChartsSortDetailGenreFilter

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
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), fFlagSduiChartsPostBody (ref), getChartsSortDetailPageKeyModule (ref), fFlagSduiChartsSortDetailGenreFilter (ref), getSduiApiStore (ref), chartsSortDetailScopeFieldsModule (ref), getChartsSortDetailPostUrlModule (ref), parent (ref), sduiCapabilities (ref), buildChartsSortDetailRequestModule (ref), chartsPageSessionModule (ref), getFilterSelectionsWithGenre (ref), getSduiTemplateStore (ref), sduiResponseType (ref), sduiApiStorePostConfigContentType (ref), getChartsSortDetailUrlModule (ref), getGenreForRequest (ref)
	local var1 = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
	
	if fFlagSduiChartsPostBody then
		local var2 = getChartsSortDetailPageKeyModule(p1, nil, var1)
		
		if fFlagSduiChartsSortDetailGenreFilter then
			local _, data = getSduiApiStore().getData(var2)
			
			if data then
				local var3 = getSduiClientPageScope(var2)
				var3.set(chartsSortDetailScopeFieldsModule.DesiredGenre, nil)
				var3.set(chartsSortDetailScopeFieldsModule.SafeGenre, nil)
			end
		end
		local var4 = getChartsSortDetailPostUrlModule()
		local serviceContractsProtoModule = require(parent.ServiceContractsProto)
		local chartsPage = serviceContractsProtoModule.apppageplatform.charts.charts_page
		local var5 = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
			enabled_capabilities = sduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS" })
		})
		
		local function buildBody(p3)
			-- upvalues: buildChartsSortDetailRequestModule (copy), chartsPage (ref), p1 (ref), chartsPageSessionModule (copy), fFlagSduiChartsSortDetailGenreFilter (copy), getFilterSelectionsWithGenre (copy), var2 (ref), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), getSduiTemplateStore (copy), var5 (ref)
			return buildChartsSortDetailRequestModule(chartsPage, {
				sortId = p1,
				contentPageToken = p3,
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = if fFlagSduiChartsSortDetailGenreFilter then getFilterSelectionsWithGenre(var2) else getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
				cachedRobloxComponentToTemplateId = getSduiTemplateStore().getCachedRobloxComponentToTemplateId("ChartsSortDetail"),
				clientCapabilities = var5
			})
		end
		
		getSduiApiStore().fetchIfNeeded({
			surfaceKey = "ChartsSortDetail",
			enableTemplateCache = true,
			responseType = sduiResponseType.Protobuf,
			url = var4,
			configKey = var2,
			loadTimer = p2,
			apiProto = chartsPage.GetChartsSortDetailResponse,
			postConfig = {
				contentType = sduiApiStorePostConfigContentType.Proto,
				protoMessage = chartsPage.GetChartsSortDetailRequest,
				body = buildBody(nil)
			},
			buildNextPageUrl = function(p3)
				-- upvalues: var4 (ref)
				local nextContentPageToken = p3 and p3.next_content_page_token
				
				return if if nextContentPageToken and nextContentPageToken ~= "" then nextContentPageToken else nil then var4 else nil
			end,
			buildNextPagePostBody = function(p3)
				-- upvalues: buildBody (ref)
				local nextContentPageToken = p3 and p3.next_content_page_token
				local var6 = if nextContentPageToken and nextContentPageToken ~= "" then nextContentPageToken else nil
				
				return if var6 then buildBody(var6) else nil
			end,
			buildRefreshUrl = function()
				-- upvalues: var4 (ref)
				return var4
			end,
			buildRefreshPostBody = function()
				-- upvalues: buildBody (ref)
				return buildBody(nil)
			end
		})
		
		return var2
	else
		local var6 = nil
		
		if fFlagSduiChartsSortDetailGenreFilter then
			var6 = getChartsSortDetailPageKeyModule(p1, nil, var1)
			local var7 = var6
			local _, data = getSduiApiStore().getData(var7)
			
			if data then
				local var8 = getSduiClientPageScope(var7)
				var8.set(chartsSortDetailScopeFieldsModule.DesiredGenre, nil)
				var8.set(chartsSortDetailScopeFieldsModule.SafeGenre, nil)
			end
		end
		local var9 = getChartsSortDetailUrlModule({
			sortId = p1,
			sessionId = chartsPageSessionModule:Get(),
			filterSelections = var1
		})
		
		if not fFlagSduiChartsSortDetailGenreFilter then
			var6 = getChartsSortDetailPageKeyModule(p1, nil, var1)
		end
		getSduiApiStore().fetchIfNeeded({
			surfaceKey = "ChartsSortDetail",
			responseType = sduiResponseType.Protobuf,
			url = var9,
			configKey = var6,
			loadTimer = p2,
			apiProto = require(parent.ServiceContractsProto).apppageplatform.charts.charts_page.GetChartsSortDetailResponse,
			buildNextPageUrl = function(p3)
				-- upvalues: getChartsSortDetailUrlModule (copy), p1 (ref), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagSduiChartsSortDetailGenreFilter (copy), getGenreForRequest (copy), var6 (write)
				local nextContentPageToken = p3 and p3.next_content_page_token
				
				return if nextContentPageToken and nextContentPageToken ~= "" then getChartsSortDetailUrlModule({
					sortId = p1,
					contentPageToken = nextContentPageToken,
					sessionId = chartsPageSessionModule:Get(),
					filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
					selectedGenre = if fFlagSduiChartsSortDetailGenreFilter then getGenreForRequest(var6) else nil
				}) else nil
			end,
			buildRefreshUrl = function()
				-- upvalues: getChartsSortDetailUrlModule (copy), p1 (ref), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagSduiChartsSortDetailGenreFilter (copy), getGenreForRequest (copy), var6 (write)
				return getChartsSortDetailUrlModule({
					sortId = p1,
					sessionId = chartsPageSessionModule:Get(),
					filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
					selectedGenre = if fFlagSduiChartsSortDetailGenreFilter then getGenreForRequest(var6) else nil
				})
			end
		})
		
		return var6
	end
end