local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local OpenSearchResultsWithQueryBridge = require(Parent.ServerDrivenUi).OpenSearchResultsWithQueryBridge
local OpenSearchResultsWithQueryParamsModule = require(ServerDrivenUi.Actions.openSearchResultsWithQueryParams)

local function _(p1, Message, PropName)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy)
	p1.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
		name = SduiActionType.OpenSearchResultsWithQuery,
		message = Message,
		propName = PropName
	}, p1.appPage)
end

return function(p1, _, p2, _)
	-- upvalues: OpenSearchResultsWithQueryParamsModule (copy), SduiErrorType (copy), SduiActionType (copy), OpenSearchResultsWithQueryBridge (copy)
	local ResolveSearchQueryResult = OpenSearchResultsWithQueryParamsModule.resolveSearchQuery(p1)
	
	if ResolveSearchQueryResult == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Invalid or missing searchQuery",
			propName = "searchQuery",
			name = SduiActionType.OpenSearchResultsWithQuery
		}, p2.appPage)
		
		return
	end
	local ResolveSearchTypeResult = OpenSearchResultsWithQueryParamsModule.resolveSearchType(p1)
	
	if ResolveSearchTypeResult == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Invalid, unknown, or unsupported searchType",
			propName = "searchType",
			name = SduiActionType.OpenSearchResultsWithQuery
		}, p2.appPage)
		
		return
	else
		OpenSearchResultsWithQueryBridge.run(ResolveSearchQueryResult, ResolveSearchTypeResult)
	end
end