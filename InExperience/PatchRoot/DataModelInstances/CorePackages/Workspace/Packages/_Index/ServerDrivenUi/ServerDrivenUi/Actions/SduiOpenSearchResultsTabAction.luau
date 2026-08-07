local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local searchTypes = require(parent.RobloxAppEnums).SearchTypes
local searchSourceEvent = require(parent.DiscoveryTypes).SearchSourceEvent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local searchPageTabSwitchBridgeModule = require(serverDrivenUi.System.SearchPageTabSwitchBridge)

local function _(p0, p1, p2) --[[ line: 31 | named "reportInvalidParam" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p0.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.OpenSearchResultsTab,
		message = p1,
		propName = p2
	}, p0.appPage)
end

return function(p3, _, p4, _) --[[ line: 39 | named "SduiOpenSearchResultsTabAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), searchTypes (ref), searchSourceEvent (ref), searchPageTabSwitchBridgeModule (ref)
	local var3 = if p3 then p3.actionParams else nil
	
	if var3 == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = sduiActionType.OpenSearchResultsTab
		}, p4.appPage)
		
		return
	end
	local searchType = var3.searchType
	
	if typeof(searchType) ~= "string" or searchType == "" then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "searchType",
			name = sduiActionType.OpenSearchResultsTab,
			message = `Invalid or missing searchType: {tostring(searchType)}`
		}, p4.appPage)
		
		return
	elseif searchTypes[searchType] == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "searchType",
			name = sduiActionType.OpenSearchResultsTab,
			message = `Unknown searchType: {searchType}`
		}, p4.appPage)
		
		return
	end
	local sourceEvent = var3.sourceEvent
	local var4 = nil
	
	if sourceEvent == nil then
		var4 = searchSourceEvent.SeeAll
	elseif typeof(sourceEvent) == "string" and searchSourceEvent[sourceEvent] ~= nil then
		var4 = searchSourceEvent[sourceEvent]
	else
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "sourceEvent",
			name = sduiActionType.OpenSearchResultsTab,
			message = `Unknown sourceEvent: {tostring(sourceEvent)}`
		}, p4.appPage)
		
		return
	end
	searchPageTabSwitchBridgeModule.switchTab(searchType, var4)
end