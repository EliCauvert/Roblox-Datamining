local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local SearchTypes = require(Parent.RobloxAppEnums).SearchTypes
local SearchSourceEvent = require(Parent.DiscoveryTypes).SearchSourceEvent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SearchPageTabSwitchBridgeModule = require(ServerDrivenUi.System.SearchPageTabSwitchBridge)

local function _(p1, Message, PropName) --[[ Line: 31 | Named "reportInvalidParam" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.OpenSearchResultsTab,
		message = Message,
		propName = PropName
	}, p1.appPage)
end

return function(p1, _, p2, _) --[[ Line: 39 | Named "SduiOpenSearchResultsTabAction" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), SearchTypes (copy), SearchSourceEvent (copy), SearchPageTabSwitchBridgeModule (copy)
	local ActionParams = if p1 then p1.actionParams else nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = SduiActionType.OpenSearchResultsTab
		}, p2.appPage)
		
		return
	end
	local SearchType = ActionParams.searchType
	
	if typeof(SearchType) ~= "string" or SearchType == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "searchType",
			name = SduiActionType.OpenSearchResultsTab,
			message = `Invalid or missing searchType: {tostring(SearchType)}`
		}, p2.appPage)
		
		return
	end
	if SearchTypes[SearchType] == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "searchType",
			name = SduiActionType.OpenSearchResultsTab,
			message = `Unknown searchType: {SearchType}`
		}, p2.appPage)
		
		return
	end
	local SourceEvent = ActionParams.sourceEvent
	local SeeAll = nil
	
	if SourceEvent == nil then
		SeeAll = SearchSourceEvent.SeeAll
	else
		if typeof(SourceEvent) ~= "string" or SearchSourceEvent[SourceEvent] == nil then
			p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				propName = "sourceEvent",
				name = SduiActionType.OpenSearchResultsTab,
				message = `Unknown sourceEvent: {tostring(SourceEvent)}`
			}, p2.appPage)
			
			return
		end
		SeeAll = SearchSourceEvent[SourceEvent]
	end
	SearchPageTabSwitchBridgeModule.switchTab(SearchType, SeeAll)
end