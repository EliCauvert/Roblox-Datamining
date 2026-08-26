local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local searchTypes = require(parent.RobloxAppEnums).SearchTypes
local searchSourceEvent = require(parent.DiscoveryTypes).SearchSourceEvent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local searchPageTabSwitchBridgeModule = require(serverDrivenUi.System.SearchPageTabSwitchBridge)

local function _(p1, p2, p3)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.OpenSearchResultsTab,
		message = p2,
		propName = p3
	}, p1.appPage)
end

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), searchTypes (ref), searchSourceEvent (ref), searchPageTabSwitchBridgeModule (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = sduiActionType.OpenSearchResultsTab
		}, p2.appPage)
		
		return
	end
	local searchType = var1.searchType
	
	if typeof(searchType) ~= "string" or searchType == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "searchType",
			name = sduiActionType.OpenSearchResultsTab,
			message = `Invalid or missing searchType: {tostring(searchType)}`
		}, p2.appPage)
		
		return
	elseif searchTypes[searchType] == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "searchType",
			name = sduiActionType.OpenSearchResultsTab,
			message = `Unknown searchType: {searchType}`
		}, p2.appPage)
		
		return
	end
	local sourceEvent = var1.sourceEvent
	local var2 = nil
	
	if sourceEvent == nil then
		var2 = searchSourceEvent.SeeAll
	elseif typeof(sourceEvent) == "string" and searchSourceEvent[sourceEvent] ~= nil then
		var2 = searchSourceEvent[sourceEvent]
	else
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "sourceEvent",
			name = sduiActionType.OpenSearchResultsTab,
			message = `Unknown sourceEvent: {tostring(sourceEvent)}`
		}, p2.appPage)
		
		return
	end
	searchPageTabSwitchBridgeModule.switchTab(searchType, var2)
end