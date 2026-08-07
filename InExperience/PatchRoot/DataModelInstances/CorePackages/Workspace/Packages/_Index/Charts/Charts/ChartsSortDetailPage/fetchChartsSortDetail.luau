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
local getChartsSortDetailUrlModule = require(charts.ChartsSortDetailPage.getChartsSortDetailUrl)
local getChartsSortDetailPostUrlModule = require(charts.ChartsSortDetailPage.getChartsSortDetailPostUrl)
local getChartsSortDetailPageKeyModule = require(charts.ChartsSortDetailPage.getChartsSortDetailPageKey)
local buildChartsSortDetailRequestModule = require(charts.ChartsSortDetailPage.buildChartsSortDetailRequest)
local fFlagSduiChartsPostBody = require(parent.SharedFlags).FFlagSduiChartsPostBody

local function _() --[[ line: 29 | named "getInheritedFilterSelections" ]]
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref)
	return getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
end

local _ = function(p0) --[[ line: 34 | named "extractNextContentPageToken" ]]
	local nextContentPageToken = p0 and p0.next_content_page_token
	
	return if nextContentPageToken and nextContentPageToken ~= "" then nextContentPageToken else nil
end

return function(p1, p2) --[[ line: 42 | named "fetchChartsSortDetail" ]]
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), fFlagSduiChartsPostBody (ref), getChartsSortDetailPageKeyModule (ref), getChartsSortDetailPostUrlModule (ref), parent (ref), sduiCapabilities (ref), buildChartsSortDetailRequestModule (ref), chartsPageSessionModule (ref), getSduiTemplateStore (ref), getSduiApiStore (ref), sduiResponseType (ref), sduiApiStorePostConfigContentType (ref), getChartsSortDetailUrlModule (ref)
	local var10 = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
	
	if fFlagSduiChartsPostBody then
		local var11 = getChartsSortDetailPageKeyModule(p1, nil, var10)
		local var12 = getChartsSortDetailPostUrlModule()
		local serviceContractsProtoModule = require(parent.ServiceContractsProto)
		local chartsPage = serviceContractsProtoModule.apppageplatform.charts.charts_page
		local var14 = serviceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities.new({
			enabled_capabilities = sduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS" })
		})
		
		local function buildBody(p3) --[[ line: 67 ]]
			-- upvalues: buildChartsSortDetailRequestModule (copy), chartsPage (ref), p1 (ref), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy), getSduiTemplateStore (copy), var14 (ref)
			return buildChartsSortDetailRequestModule(chartsPage, {
				sortId = p1,
				contentPageToken = p3,
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections),
				cachedRobloxComponentToTemplateId = getSduiTemplateStore().getCachedRobloxComponentToTemplateId("ChartsSortDetail"),
				clientCapabilities = var14
			})
		end
		
		getSduiApiStore().fetchIfNeeded({
			surfaceKey = "ChartsSortDetail",
			enableTemplateCache = true,
			responseType = sduiResponseType.Protobuf,
			url = var12,
			configKey = var11,
			loadTimer = p2,
			apiProto = chartsPage.GetChartsSortDetailResponse,
			postConfig = {
				contentType = sduiApiStorePostConfigContentType.Proto,
				protoMessage = chartsPage.GetChartsSortDetailRequest,
				body = buildBody(nil)
			},
			buildNextPageUrl = function(p4) --[[ line: 94 ]]
				-- upvalues: var12 (ref)
				local nextContentPageToken = p4 and p4.next_content_page_token
				
				return if if nextContentPageToken and nextContentPageToken ~= "" then nextContentPageToken else nil then var12 else nil
			end,
			buildNextPagePostBody = function(p5) --[[ line: 97 ]]
				-- upvalues: buildBody (ref)
				local nextContentPageToken = p5 and p5.next_content_page_token
				local var19 = if nextContentPageToken and nextContentPageToken ~= "" then nextContentPageToken else nil
				
				return if var19 then buildBody(var19) else nil
			end,
			buildRefreshUrl = function() --[[ line: 104 ]]
				-- upvalues: var12 (ref)
				return var12
			end,
			buildRefreshPostBody = function() --[[ line: 108 ]]
				-- upvalues: buildBody (ref)
				return buildBody(nil)
			end
		})
		
		return var11
	end
	local var16 = getChartsSortDetailPageKeyModule(p1, nil, var10)
	getSduiApiStore().fetchIfNeeded({
		surfaceKey = "ChartsSortDetail",
		responseType = sduiResponseType.Protobuf,
		url = getChartsSortDetailUrlModule({
			sortId = p1,
			sessionId = chartsPageSessionModule:Get(),
			filterSelections = var10
		}),
		configKey = var16,
		loadTimer = p2,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.charts.charts_page.GetChartsSortDetailResponse,
		buildNextPageUrl = function(p6) --[[ line: 134 ]]
			-- upvalues: getChartsSortDetailUrlModule (copy), p1 (ref), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy)
			local nextContentPageToken = p6 and p6.next_content_page_token
			
			return if nextContentPageToken and nextContentPageToken ~= "" then getChartsSortDetailUrlModule({
				sortId = p1,
				contentPageToken = nextContentPageToken,
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
			}) else nil
		end,
		buildRefreshUrl = function() --[[ line: 146 ]]
			-- upvalues: getChartsSortDetailUrlModule (copy), p1 (ref), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy)
			return getChartsSortDetailUrlModule({
				sortId = p1,
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
			})
		end
	})
	
	return var16
end