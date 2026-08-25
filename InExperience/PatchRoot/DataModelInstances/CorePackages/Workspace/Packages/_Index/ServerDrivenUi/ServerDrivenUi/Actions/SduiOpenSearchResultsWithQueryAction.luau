local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local openSearchResultsWithQueryBridge = require(parent.ServerDrivenUi).OpenSearchResultsWithQueryBridge
local openSearchResultsWithQueryParamsModule = require(serverDrivenUi.Actions.openSearchResultsWithQueryParams)

local function _(p0, p1, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p0.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.OpenSearchResultsWithQuery,
		message = p1,
		propName = p2
	}, p0.appPage)
end

return function(p3, _, p4, _)
	-- upvalues: openSearchResultsWithQueryParamsModule (ref), sduiErrorType (ref), sduiActionType (ref), openSearchResultsWithQueryBridge (ref)
	local var3 = openSearchResultsWithQueryParamsModule.resolveSearchQuery(p3)
	
	if var3 == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Invalid or missing searchQuery",
			propName = "searchQuery",
			name = sduiActionType.OpenSearchResultsWithQuery
		}, p4.appPage)
		
		return
	end
	local var4 = openSearchResultsWithQueryParamsModule.resolveSearchType(p3)
	
	if var4 == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Invalid, unknown, or unsupported searchType",
			propName = "searchType",
			name = sduiActionType.OpenSearchResultsWithQuery
		}, p4.appPage)
		
		return
	end
	openSearchResultsWithQueryBridge.run(var3, var4)
end