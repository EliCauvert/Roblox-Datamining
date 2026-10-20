local Charts = script:FindFirstAncestor("Charts")
local Parent = Charts.Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiTemplateStoreFunction = SduiSharedUtilitiesModule.getSduiTemplateStore
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local SduiApiStorePostConfigContentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local SduiCapabilities = SduiSharedUtilitiesModule.SduiCapabilities
local ChartsConstantsModule = require(Charts.ChartsPage.ChartsConstants)
local ChartsPageScopeFieldsModule = require(Charts.ChartsPage.ChartsPageScopeFields)
local ChartsPageSessionModule = require(Charts.ChartsPage.ChartsPageSession)
local ChartsSortDetailScopeFieldsModule = require(Charts.ChartsSortDetailPage.ChartsSortDetailScopeFields)
local GetChartsSortDetailPostUrlModule = require(Charts.ChartsSortDetailPage.getChartsSortDetailPostUrl)
local GetChartsSortDetailPageKeyModule = require(Charts.ChartsSortDetailPage.getChartsSortDetailPageKey)
local BuildChartsSortDetailRequestModule = require(Charts.ChartsSortDetailPage.buildChartsSortDetailRequest)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiChartsSortDetailGenreFilter = SharedFlagsModule.FFlagSduiChartsSortDetailGenreFilter
local FFlagSduiAdvertiseRuntimeSupportSets = SharedFlagsModule.FFlagSduiAdvertiseRuntimeSupportSets

local function _()
	-- upvalues: GetSduiClientPageScopeFunction (copy), ChartsConstantsModule (copy), ChartsPageScopeFieldsModule (copy)
	return GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections)
end

local _ = function(p1)
	local NextContentPageToken = p1 and p1.next_content_page_token
	
	return if NextContentPageToken and NextContentPageToken ~= "" then NextContentPageToken else nil
end

local function getGenreForRequest(p1)
	-- upvalues: GetSduiClientPageScopeFunction (copy), ChartsSortDetailScopeFieldsModule (copy)
	local SduiClientPageScope = GetSduiClientPageScopeFunction(p1)
	local GetResult = SduiClientPageScope.get(ChartsSortDetailScopeFieldsModule.DesiredGenre)
	local GetResult1 = SduiClientPageScope.get(ChartsSortDetailScopeFieldsModule.SafeGenre)
	local IsNotGetResultMatch: boolean = typeof(GetResult) == "string" and GetResult ~= ""
	local IsNotGetResultMatch1: boolean = typeof(GetResult1) == "string" and GetResult1 ~= ""
	
	return if IsNotGetResultMatch and GetResult ~= GetResult1 then GetResult elseif IsNotGetResultMatch1 then GetResult1 else nil
end

local function getFilterSelectionsWithGenre(ConfigKey)
	-- upvalues: GetSduiClientPageScopeFunction (copy), ChartsConstantsModule (copy), ChartsPageScopeFieldsModule (copy), getGenreForRequest (copy)
	local GetResult = GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections)
	local GenreForRequest = getGenreForRequest(ConfigKey)
	
	if GenreForRequest == nil then
		return GetResult
	else
		local Copy = if GetResult then table.clone(GetResult) else {}
		Copy.selectedGenre = GenreForRequest
		
		return Copy
	end
end

local _ = function(p1)
	-- upvalues: GetSduiApiStoreFunction (copy), GetSduiClientPageScopeFunction (copy), ChartsSortDetailScopeFieldsModule (copy)
	local _, Data2 = GetSduiApiStoreFunction().getData(p1)
	
	if Data2 then
		local SduiClientPageScope = GetSduiClientPageScopeFunction(p1)
		SduiClientPageScope.set(ChartsSortDetailScopeFieldsModule.DesiredGenre, nil)
		SduiClientPageScope.set(ChartsSortDetailScopeFieldsModule.SafeGenre, nil)
	end
end

return function(SortId, LoadTimer)
	-- upvalues: GetSduiClientPageScopeFunction (copy), ChartsConstantsModule (copy), ChartsPageScopeFieldsModule (copy), GetChartsSortDetailPageKeyModule (copy), FFlagSduiChartsSortDetailGenreFilter (copy), GetSduiApiStoreFunction (copy), ChartsSortDetailScopeFieldsModule (copy), GetChartsSortDetailPostUrlModule (copy), Parent (copy), FFlagSduiAdvertiseRuntimeSupportSets (copy), SduiCapabilities (copy), BuildChartsSortDetailRequestModule (copy), ChartsPageSessionModule (copy), getFilterSelectionsWithGenre (copy), GetSduiTemplateStoreFunction (copy), SduiResponseType (copy), SduiApiStorePostConfigContentType (copy)
	local ChartsSortDetailPageKeyModule = GetChartsSortDetailPageKeyModule(SortId, nil, (GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections)))
	
	if FFlagSduiChartsSortDetailGenreFilter then
		local _, Data2 = GetSduiApiStoreFunction().getData(ChartsSortDetailPageKeyModule)
		
		if Data2 then
			local SduiClientPageScope = GetSduiClientPageScopeFunction(ChartsSortDetailPageKeyModule)
			SduiClientPageScope.set(ChartsSortDetailScopeFieldsModule.DesiredGenre, nil)
			SduiClientPageScope.set(ChartsSortDetailScopeFieldsModule.SafeGenre, nil)
		end
	end
	local ChartsSortDetailPostUrlModule = GetChartsSortDetailPostUrlModule()
	local ServiceContractsProtoModule = require(Parent.ServiceContractsProto)
	local ChartsPage = ServiceContractsProtoModule.apppageplatform.charts.charts_page
	local ClientCapabilities = ServiceContractsProtoModule.apppageplatform.shared.client_capabilities.ClientCapabilities
	local ClientCapabilities1 = nil
	ClientCapabilities1 = if FFlagSduiAdvertiseRuntimeSupportSets then SduiCapabilities.buildClientCapabilities() else ClientCapabilities.new({
		enabled_capabilities = SduiCapabilities.getEnabledCapabilityNumbers({ "CAPABILITY_SUPPORTS_HYDRATION_CLIENT_HINTS" })
	})
	
	local function buildBody(ContentPageToken)
		-- upvalues: BuildChartsSortDetailRequestModule (upval), ChartsPage (copy), SortId (copy), ChartsPageSessionModule (upval), FFlagSduiChartsSortDetailGenreFilter (upval), getFilterSelectionsWithGenre (upval), ChartsSortDetailPageKeyModule (copy), GetSduiClientPageScopeFunction (upval), ChartsConstantsModule (upval), ChartsPageScopeFieldsModule (upval), GetSduiTemplateStoreFunction (upval), ClientCapabilities1 (ref)
		return BuildChartsSortDetailRequestModule(ChartsPage, {
			sortId = SortId,
			contentPageToken = ContentPageToken,
			sessionId = ChartsPageSessionModule:Get(),
			filterSelections = if FFlagSduiChartsSortDetailGenreFilter then getFilterSelectionsWithGenre(ChartsSortDetailPageKeyModule) else GetSduiClientPageScopeFunction(ChartsConstantsModule.ConfigKey).get(ChartsPageScopeFieldsModule.FilterSelections),
			cachedRobloxComponentToTemplateId = GetSduiTemplateStoreFunction().getCachedRobloxComponentToTemplateId("ChartsSortDetail"),
			clientCapabilities = ClientCapabilities1
		})
	end
	
	GetSduiApiStoreFunction().fetchIfNeeded({
		surfaceKey = "ChartsSortDetail",
		enableTemplateCache = true,
		responseType = SduiResponseType.Protobuf,
		url = ChartsSortDetailPostUrlModule,
		configKey = ChartsSortDetailPageKeyModule,
		loadTimer = LoadTimer,
		apiProto = ChartsPage.GetChartsSortDetailResponse,
		postConfig = {
			contentType = SduiApiStorePostConfigContentType.Proto,
			protoMessage = ChartsPage.GetChartsSortDetailRequest,
			body = buildBody(nil)
		},
		buildNextPageUrl = function(p1)
			-- upvalues: ChartsSortDetailPostUrlModule (copy)
			local NextContentPageToken = p1 and p1.next_content_page_token
			local NextContentPageToken1 = if NextContentPageToken and NextContentPageToken ~= "" then NextContentPageToken else nil
			
			return if NextContentPageToken1 then ChartsSortDetailPostUrlModule else nil
		end,
		buildNextPagePostBody = function(p1)
			-- upvalues: buildBody (copy)
			local NextContentPageToken = p1 and p1.next_content_page_token
			local NextContentPageToken1 = if NextContentPageToken and NextContentPageToken ~= "" then NextContentPageToken else nil
			
			return if NextContentPageToken1 then buildBody(NextContentPageToken1) else nil
		end,
		buildRefreshUrl = function()
			-- upvalues: ChartsSortDetailPostUrlModule (copy)
			return ChartsSortDetailPostUrlModule
		end,
		buildRefreshPostBody = function()
			-- upvalues: buildBody (copy)
			return buildBody(nil)
		end
	})
	
	return ChartsSortDetailPageKeyModule
end