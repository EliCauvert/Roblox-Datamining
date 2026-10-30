local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local SduiPageAnalytics = SduiSharedUtilitiesModule.SduiPageAnalytics
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), SduiPageAnalytics (copy), SduiLoadTimer (copy), GetSduiApiStoreFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.LoadMoreFromApi
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local ConfigKey = ActionParams.configKey
	
	if typeof(ConfigKey) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "configKey",
			name = SduiActionType.LoadMoreFromApi,
			message = `Invalid or missing configKey: {ConfigKey}`
		}, p2.appPage)
		
		return
	end
	local SurfaceKey = ActionParams.surfaceKey
	
	if typeof(SurfaceKey) == "string" then
		SduiPageAnalytics.sendLoadMoreEvent(SurfaceKey)
		local LoadTimer = SduiLoadTimer.createLoadTimer(SurfaceKey)
		LoadTimer.start("loadMore")
		GetSduiApiStoreFunction().loadMoreFromApi({ configKey = ConfigKey, loadTimer = LoadTimer }):finally(function()
			-- upvalues: LoadTimer (copy)
			LoadTimer.logRefreshComplete()
		end)
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "surfaceKey",
			name = SduiActionType.LoadMoreFromApi,
			message = `Invalid or missing surfaceKey: {SurfaceKey}`
		}, p2.appPage)
	end
end