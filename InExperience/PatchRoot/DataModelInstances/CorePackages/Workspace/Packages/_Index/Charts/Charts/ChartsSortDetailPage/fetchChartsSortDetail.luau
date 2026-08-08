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

local function _() --[[ line: 32 | named "getInheritedFilterSelections" ]]
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref)
	return getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
end

local _ = function(p0) --[[ line: 37 | named "extractNextContentPageToken" ]]
	local nextContentPageToken = p0 and p0.next_content_page_token
	
	return if nextContentPageToken and nextContentPageToken ~= "" then nextContentPageToken else nil
end

local function getGenreForRequest(p1) --[[ line: 50 ]]
	-- upvalues: getSduiClientPageScope (ref), chartsSortDetailScopeFieldsModule (ref)
	local var14 = getSduiClientPageScope(p1)
	local var15 = var14.get(chartsSortDetailScopeFieldsModule.DesiredGenre)
	local var16 = var14.get(chartsSortDetailScopeFieldsModule.SafeGenre)
	
	return if (typeof(var15) == "string" and var15 ~= "") and var15 ~= var16 then var15 elseif typeof(var16) == "string" and var16 ~= "" then var16 else nil
end

local function getFilterSelectionsWithGenre(p2) --[[ line: 70 ]]
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), getGenreForRequest (ref)
	local var17 = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
	local var18 = getGenreForRequest(p2)
	
	if var18 == nil then
		return var17
	end
	local var19 = if var17 then table.clone(var17) else {}
	var19.selectedGenre = var18
	
	return var19
end

local _ = function(value) --[[ line: 84 | named "resetStickyGenreIfStale" ]]
	-- upvalues: getSduiApiStore (ref), getSduiClientPageScope (ref), chartsSortDetailScopeFieldsModule (ref)
	local _, data = getSduiApiStore().getData(value)
	
	if data then
		local var21 = getSduiClientPageScope(value)
		var21.set(chartsSortDetailScopeFieldsModule.DesiredGenre, nil)
		var21.set(chartsSortDetailScopeFieldsModule.SafeGenre, nil)
	end
end

return function(p3, p4) --[[ line: 93 | named "fetchChartsSortDetail" ]]
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), fFlagSduiChartsPostBody (ref), getChartsSortDetailPageKeyModule (ref), fFlagSduiChartsSortDetailGenreFilter (ref), getSduiApiStore (ref), chartsSortDetailScopeFieldsModule (ref), getChartsSortDetailPostUrlModule (ref), parent (ref), sduiCapabilities (ref), buildChartsSortDetailRequestModule (ref), chartsPageSessionModule (ref), getFilterSelectionsWithGenre (ref), getSduiTemplateStore (ref), sduiResponseType (ref), sduiApiStorePostConfigContentType (ref), getChartsSortDetailUrlModule (ref), getGenreForRequest (ref)
	local var22 = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
	
	if fFlagSduiChartsPostBody then
		local var23 = getChartsSortDetailPageKeyModule(p3, nil, var22)
		
		if fFlagSduiChartsSortDetailGenreFilter then
			local _, data = getSduiApiStore().getData(var23)
			
			if data then
				local var25 = getSduiClientPageScope(var23)
				var25.set(chartsSortDetailScopeFieldsModule.DesiredGenre, nil)
				var25.set(chartsSortDetailScopeFieldsModule.SafeGenre, nil)
			end
		end
		local var26 = getChartsSortDetailPostUrlModule()
		local serviceContractsProtoModule = require(parent.ServiceContractsProto)
		local chartsPage = serviceContractsProtoModule.apppageplatform.charts.charts_page
		local var28 = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
			enabled_capabilities = sduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS" })
		})
		
		local function buildBody(p5) --[[ line: 124 ]]
			-- upvalues: buildChartsSortDetailRequestModule (copy), chartsPage (ref), p3 (ref), chartsPageSessionModule (copy), fFlagSduiChartsSortDetailGenreFilter (copy), getFilterSelectionsWithGenre (copy), var23 (ref), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), getSduiTemplateStore (copy), var28 (ref)
			return buildChartsSortDetailRequestModule(chartsPage, {
				sortId = p3,
				contentPageToken = p5,
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = if fFlagSduiChartsSortDetailGenreFilter then getFilterSelectionsWithGenre(var23) else getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
				cachedRobloxComponentToTemplateId = getSduiTemplateStore().getCachedRobloxComponentToTemplateId("ChartsSortDetail"),
				clientCapabilities = var28
			})
		end
		
		getSduiApiStore().fetchIfNeeded({
			surfaceKey = "ChartsSortDetail",
			enableTemplateCache = true,
			responseType = sduiResponseType.Protobuf,
			url = var26,
			configKey = var23,
			loadTimer = p4,
			apiProto = chartsPage.GetChartsSortDetailResponse,
			postConfig = {
				contentType = sduiApiStorePostConfigContentType.Proto,
				protoMessage = chartsPage.GetChartsSortDetailRequest,
				body = buildBody(nil)
			},
			buildNextPageUrl = function(p6) --[[ line: 153 ]]
				-- upvalues: var26 (ref)
				local nextContentPageToken = p6 and p6.next_content_page_token
				
				return if if nextContentPageToken and nextContentPageToken ~= "" then nextContentPageToken else nil then var26 else nil
			end,
			buildNextPagePostBody = function(p7) --[[ line: 156 ]]
				-- upvalues: buildBody (ref)
				local nextContentPageToken = p7 and p7.next_content_page_token
				local var37 = if nextContentPageToken and nextContentPageToken ~= "" then nextContentPageToken else nil
				
				return if var37 then buildBody(var37) else nil
			end,
			buildRefreshUrl = function() --[[ line: 163 ]]
				-- upvalues: var26 (ref)
				return var26
			end,
			buildRefreshPostBody = function() --[[ line: 167 ]]
				-- upvalues: buildBody (ref)
				return buildBody(nil)
			end
		})
		
		return var23
	else
		local var30 = nil
		
		if fFlagSduiChartsSortDetailGenreFilter then
			var30 = getChartsSortDetailPageKeyModule(p3, nil, var22)
			local var31 = var30
			local _, data = getSduiApiStore().getData(var31)
			
			if data then
				local var33 = getSduiClientPageScope(var31)
				var33.set(chartsSortDetailScopeFieldsModule.DesiredGenre, nil)
				var33.set(chartsSortDetailScopeFieldsModule.SafeGenre, nil)
			end
		end
		local var34 = getChartsSortDetailUrlModule({
			sortId = p3,
			sessionId = chartsPageSessionModule:Get(),
			filterSelections = var22
		})
		
		if not fFlagSduiChartsSortDetailGenreFilter then
			var30 = getChartsSortDetailPageKeyModule(p3, nil, var22)
		end
		getSduiApiStore().fetchIfNeeded({
			surfaceKey = "ChartsSortDetail",
			responseType = sduiResponseType.Protobuf,
			url = var34,
			configKey = var30,
			loadTimer = p4,
			apiProto = require(parent.ServiceContractsProto).apppageplatform.charts.charts_page.GetChartsSortDetailResponse,
			buildNextPageUrl = function(p8) --[[ line: 201 ]]
				-- upvalues: getChartsSortDetailUrlModule (copy), p3 (ref), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagSduiChartsSortDetailGenreFilter (copy), getGenreForRequest (copy), var30 (write)
				local nextContentPageToken = p8 and p8.next_content_page_token
				
				return if nextContentPageToken and nextContentPageToken ~= "" then getChartsSortDetailUrlModule({
					sortId = p3,
					contentPageToken = nextContentPageToken,
					sessionId = chartsPageSessionModule:Get(),
					filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
					selectedGenre = if fFlagSduiChartsSortDetailGenreFilter then getGenreForRequest(var30) else nil
				}) else nil
			end,
			buildRefreshUrl = function() --[[ line: 214 ]]
				-- upvalues: getChartsSortDetailUrlModule (copy), p3 (ref), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), fFlagSduiChartsSortDetailGenreFilter (copy), getGenreForRequest (copy), var30 (write)
				return getChartsSortDetailUrlModule({
					sortId = p3,
					sessionId = chartsPageSessionModule:Get(),
					filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
					selectedGenre = if fFlagSduiChartsSortDetailGenreFilter then getGenreForRequest(var30) else nil
				})
			end
		})
		
		return var30
	end
end