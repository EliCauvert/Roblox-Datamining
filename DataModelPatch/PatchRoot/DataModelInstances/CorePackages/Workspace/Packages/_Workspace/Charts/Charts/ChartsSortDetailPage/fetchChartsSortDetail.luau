local Charts = script:FindFirstAncestor("Charts")
local Parent = Charts.Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local ChartsConstantsModule = require(Charts.ChartsPage.ChartsConstants)
local ChartsPageScopeFieldsModule = require(Charts.ChartsPage.ChartsPageScopeFields)
local ChartsPageSessionModule = require(Charts.ChartsPage.ChartsPageSession)
local GetChartsSortDetailUrlModule = require(Charts.ChartsSortDetailPage.getChartsSortDetailUrl)
local GetChartsSortDetailPageKeyModule = require(Charts.ChartsSortDetailPage.getChartsSortDetailPageKey)

local function _()
	-- upvalues: GetSduiClientPageScopeFunction (copy), ChartsConstantsModule (copy), ChartsPageScopeFieldsModule (copy)
	return GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections)
end

return function(SortId, LoadTimer)
	-- upvalues: GetSduiClientPageScopeFunction (copy), ChartsConstantsModule (copy), ChartsPageScopeFieldsModule (copy), GetChartsSortDetailUrlModule (copy), ChartsPageSessionModule (copy), GetChartsSortDetailPageKeyModule (copy), Parent (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy)
	local GetResult = GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections)
	local ChartsSortDetailUrlModule = GetChartsSortDetailUrlModule({
		sortId = SortId,
		sessionId = ChartsPageSessionModule:Get(),
		filterSelections = GetResult
	})
	local ChartsSortDetailPageKeyModule = GetChartsSortDetailPageKeyModule(SortId, nil, GetResult)
	GetSduiApiStoreFunction().fetchIfNeeded({
		surfaceKey = "ChartsSortDetail",
		responseType = SduiResponseType.Protobuf,
		url = ChartsSortDetailUrlModule,
		configKey = ChartsSortDetailPageKeyModule,
		loadTimer = LoadTimer,
		apiProto = require(Parent.ServiceContractsProto).apppageplatform.charts.charts_page.GetChartsSortDetailResponse,
		buildNextPageUrl = function(p1)
			-- upvalues: GetChartsSortDetailUrlModule (upval), SortId (copy), ChartsPageSessionModule (upval), GetSduiClientPageScopeFunction (upval), ChartsConstantsModule (upval), ChartsPageScopeFieldsModule (upval)
			local NextContentPageToken = p1 and p1.next_content_page_token
			
			return if NextContentPageToken and NextContentPageToken ~= "" then GetChartsSortDetailUrlModule({
				sortId = SortId,
				contentPageToken = NextContentPageToken,
				sessionId = ChartsPageSessionModule:Get(),
				filterSelections = GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections)
			}) else nil
		end,
		buildRefreshUrl = function()
			-- upvalues: GetChartsSortDetailUrlModule (upval), SortId (copy), ChartsPageSessionModule (upval), GetSduiClientPageScopeFunction (upval), ChartsConstantsModule (upval), ChartsPageScopeFieldsModule (upval)
			return GetChartsSortDetailUrlModule({
				sortId = SortId,
				sessionId = ChartsPageSessionModule:Get(),
				filterSelections = GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections)
			})
		end
	})
	
	return ChartsSortDetailPageKeyModule
end