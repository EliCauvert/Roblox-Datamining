local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local chartsModule = require(parent.Charts)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local refreshChartsSortDetailGenre = chartsModule.refreshChartsSortDetailGenre

local function _(p1, p2, p3)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.RefreshChartsSortDetail,
		message = p2,
		propName = p3
	}, p1.appPage)
end

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sduiLoadTimer (ref), refreshChartsSortDetailGenre (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = sduiActionType.RefreshChartsSortDetail
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local configKey = p2.configKey
	
	if typeof(configKey) ~= "string" or configKey == "" then
		configKey = var1.configKey
	end
	if typeof(configKey) ~= "string" or configKey == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "configKey",
			name = sduiActionType.RefreshChartsSortDetail,
			message = `Invalid or missing configKey: {configKey}`
		}, p2.appPage)
		
		return
	end
	local selectedOption = var1.selectedOption
	
	if typeof(selectedOption) ~= "string" or selectedOption == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "selectedOption",
			name = sduiActionType.RefreshChartsSortDetail,
			message = `Invalid or missing selectedOption: {selectedOption}`
		}, p2.appPage)
		
		return
	end
	local chartsSortDetail = sduiLoadTimer.createLoadTimer("ChartsSortDetail")
	chartsSortDetail.start("refresh")
	local var2 = refreshChartsSortDetailGenre({
		configKey = configKey,
		selectedGenre = selectedOption,
		loadTimer = chartsSortDetail
	})
	
	if var2 then
		var2:finally(function()
			-- upvalues: chartsSortDetail (ref)
			chartsSortDetail.logRefreshComplete()
		end)
		
		return var2
	end
	return nil
end