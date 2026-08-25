local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local sduiPageAnalytics = sduiSharedUtilitiesModule.SduiPageAnalytics
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport

return function(p0, _, p1)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sduiPageAnalytics (ref), sduiLoadTimer (ref), getSduiApiStore (ref), fFlagSduiChartsSupport (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.LoadMoreFromApi
		}, p1.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	local configKey = var2.configKey
	
	if typeof(configKey) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "configKey",
			name = sduiActionType.LoadMoreFromApi,
			message = `Invalid or missing configKey: {configKey}`
		}, p1.appPage)
		
		return
	end
	local surfaceKey = var2.surfaceKey
	
	if typeof(surfaceKey) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "surfaceKey",
			name = sduiActionType.LoadMoreFromApi,
			message = `Invalid or missing surfaceKey: {surfaceKey}`
		}, p1.appPage)
		
		return
	end
	sduiPageAnalytics.sendLoadMoreEvent(surfaceKey)
	local var3 = sduiLoadTimer.createLoadTimer(surfaceKey)
	var3.start("loadMore")
	local var4 = getSduiApiStore().loadMoreFromApi({ configKey = configKey, loadTimer = var3 })
	
	if fFlagSduiChartsSupport then
		var4:finally(function()
			-- upvalues: var3 (ref)
			var3.logRefreshComplete()
		end)
	end
end