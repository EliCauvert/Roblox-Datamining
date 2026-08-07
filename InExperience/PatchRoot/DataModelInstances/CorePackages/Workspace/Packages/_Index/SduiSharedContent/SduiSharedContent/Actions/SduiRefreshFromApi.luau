local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p0, _, p1) --[[ line: 17 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sduiLoadTimer (ref), getSduiApiStore (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.RefreshFromApi
		}, p1.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	local configKey = var2.configKey
	
	if typeof(configKey) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "configKey",
			name = sduiActionType.RefreshFromApi,
			message = `Invalid or missing configKey: {configKey}`
		}, p1.appPage)
		
		return
	end
	local surfaceKey = var2.surfaceKey
	
	if typeof(surfaceKey) == "string" then
		local var3 = sduiLoadTimer.createLoadTimer(surfaceKey)
		var3.start("refresh")
		
		return getSduiApiStore().refreshFromApi({ configKey = configKey, loadTimer = var3 }):finally(function() --[[ line: 59 ]]
			-- upvalues: var3 (ref)
			var3.logRefreshComplete()
		end)
	end
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		propName = "surfaceKey",
		name = sduiActionType.RefreshFromApi,
		message = `Invalid or missing surfaceKey: {surfaceKey}`
	}, p1.appPage)
end