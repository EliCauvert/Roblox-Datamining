local charts = script:FindFirstAncestor("Charts")
local parent = charts.Parent
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiResponseType = sduiSharedUtilitiesModule.SduiResponseType
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local chartsConstantsModule = require(charts.ChartsPage.ChartsConstants)
local chartsPageScopeFieldsModule = require(charts.ChartsPage.ChartsPageScopeFields)
local chartsPageSessionModule = require(charts.ChartsPage.ChartsPageSession)
local getChartsSortDetailUrlModule = require(charts.ChartsSortDetailPage.getChartsSortDetailUrl)
local getChartsSortDetailPageKeyModule = require(charts.ChartsSortDetailPage.getChartsSortDetailPageKey)

local function _() --[[ line: 22 | named "getInheritedFilterSelections" ]]
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref)
	return getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
end

return function(p0, p1) --[[ line: 26 | named "fetchChartsSortDetail" ]]
	-- upvalues: getSduiClientPageScope (ref), chartsConstantsModule (ref), chartsPageScopeFieldsModule (ref), getChartsSortDetailUrlModule (ref), chartsPageSessionModule (ref), getChartsSortDetailPageKeyModule (ref), parent (ref), getSduiApiStore (ref), sduiResponseType (ref)
	local var7 = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
	local var8 = getChartsSortDetailPageKeyModule(p0, nil, var7)
	getSduiApiStore().fetchIfNeeded({
		surfaceKey = "ChartsSortDetail",
		responseType = sduiResponseType.Protobuf,
		url = getChartsSortDetailUrlModule({
			sortId = p0,
			sessionId = chartsPageSessionModule:Get(),
			filterSelections = var7
		}),
		configKey = var8,
		loadTimer = p1,
		apiProto = require(parent.ServiceContractsProto).apppageplatform.charts.charts_page.GetChartsSortDetailResponse,
		buildNextPageUrl = function(p2) --[[ line: 45 ]]
			-- upvalues: getChartsSortDetailUrlModule (copy), p0 (ref), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy)
			local nextContentPageToken = p2 and p2.next_content_page_token
			
			return if nextContentPageToken and nextContentPageToken ~= "" then getChartsSortDetailUrlModule({
				sortId = p0,
				contentPageToken = nextContentPageToken,
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
			}) else nil
		end,
		buildRefreshUrl = function() --[[ line: 57 ]]
			-- upvalues: getChartsSortDetailUrlModule (copy), p0 (ref), chartsPageSessionModule (copy), getSduiClientPageScope (copy), chartsConstantsModule (copy), chartsPageScopeFieldsModule (copy)
			return getChartsSortDetailUrlModule({
				sortId = p0,
				sessionId = chartsPageSessionModule:Get(),
				filterSelections = getSduiClientPageScope(chartsConstantsModule.ConfigKey).get(chartsPageScopeFieldsModule.FilterSelections)
			})
		end
	})
	
	return var8
end