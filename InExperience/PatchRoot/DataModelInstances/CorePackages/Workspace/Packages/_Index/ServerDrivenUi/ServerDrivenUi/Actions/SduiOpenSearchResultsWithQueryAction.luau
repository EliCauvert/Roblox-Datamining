local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local openSearchResultsWithQueryBridge = require(parent.ServerDrivenUi).OpenSearchResultsWithQueryBridge
local openSearchResultsWithQueryParamsModule = require(serverDrivenUi.Actions.openSearchResultsWithQueryParams)

local function _(p1, p2, p3)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.OpenSearchResultsWithQuery,
		message = p2,
		propName = p3
	}, p1.appPage)
end

return function(p1, _, p2, _)
	-- upvalues: openSearchResultsWithQueryParamsModule (ref), sduiErrorType (ref), sduiActionType (ref), openSearchResultsWithQueryBridge (ref)
	local var1 = openSearchResultsWithQueryParamsModule.resolveSearchQuery(p1)
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Invalid or missing searchQuery",
			propName = "searchQuery",
			name = sduiActionType.OpenSearchResultsWithQuery
		}, p2.appPage)
		
		return
	end
	local var2 = openSearchResultsWithQueryParamsModule.resolveSearchType(p1)
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Invalid, unknown, or unsupported searchType",
			propName = "searchType",
			name = sduiActionType.OpenSearchResultsWithQuery
		}, p2.appPage)
		
		return
	end
	openSearchResultsWithQueryBridge.run(var1, var2)
end