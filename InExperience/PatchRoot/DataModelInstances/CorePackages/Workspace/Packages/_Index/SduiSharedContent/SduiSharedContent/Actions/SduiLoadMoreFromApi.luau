local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local sduiPageAnalytics = sduiSharedUtilitiesModule.SduiPageAnalytics
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sduiPageAnalytics (ref), sduiLoadTimer (ref), getSduiApiStore (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.LoadMoreFromApi
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local configKey = var1.configKey
	
	if typeof(configKey) ~= "string" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "configKey",
			name = sduiActionType.LoadMoreFromApi,
			message = `Invalid or missing configKey: {configKey}`
		}, p2.appPage)
		
		return
	end
	local surfaceKey = var1.surfaceKey
	
	if typeof(surfaceKey) == "string" then
		sduiPageAnalytics.sendLoadMoreEvent(surfaceKey)
		local var2 = sduiLoadTimer.createLoadTimer(surfaceKey)
		var2.start("loadMore")
		getSduiApiStore().loadMoreFromApi({ configKey = configKey, loadTimer = var2 }):finally(function()
			-- upvalues: var2 (ref)
			var2.logRefreshComplete()
		end)
		
		return
	end
	p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		propName = "surfaceKey",
		name = sduiActionType.LoadMoreFromApi,
		message = `Invalid or missing surfaceKey: {surfaceKey}`
	}, p2.appPage)
end