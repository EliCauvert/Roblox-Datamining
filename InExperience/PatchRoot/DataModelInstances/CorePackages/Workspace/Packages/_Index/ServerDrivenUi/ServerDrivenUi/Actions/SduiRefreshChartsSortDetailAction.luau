local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local chartsModule = require(parent.Charts)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local refreshChartsSortDetailGenre = chartsModule.refreshChartsSortDetailGenre

local function _(p0, p1, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p0.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.RefreshChartsSortDetail,
		message = p1,
		propName = p2
	}, p0.appPage)
end

return function(p3, _, p4)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sduiLoadTimer (ref), refreshChartsSortDetailGenre (ref)
	local var3 = if p3 then p3.actionParams else nil
	
	if var3 == nil then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			propName = nil,
			name = sduiActionType.RefreshChartsSortDetail
		}, p4.appPage)
		
		return
	end
	assert(var3, "actionParams must exist")
	local configKey = p4.configKey
	
	if typeof(configKey) ~= "string" or configKey == "" then
		configKey = var3.configKey
	end
	if typeof(configKey) ~= "string" or configKey == "" then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "configKey",
			name = sduiActionType.RefreshChartsSortDetail,
			message = `Invalid or missing configKey: {configKey}`
		}, p4.appPage)
		
		return
	end
	local selectedOption = var3.selectedOption
	
	if typeof(selectedOption) ~= "string" or selectedOption == "" then
		p4.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "selectedOption",
			name = sduiActionType.RefreshChartsSortDetail,
			message = `Invalid or missing selectedOption: {selectedOption}`
		}, p4.appPage)
		
		return
	end
	local chartsSortDetail = sduiLoadTimer.createLoadTimer("ChartsSortDetail")
	chartsSortDetail.start("refresh")
	local var5 = refreshChartsSortDetailGenre({
		configKey = configKey,
		selectedGenre = selectedOption,
		loadTimer = chartsSortDetail
	})
	
	if var5 then
		var5:finally(function()
			-- upvalues: chartsSortDetail (ref)
			chartsSortDetail.logRefreshComplete()
		end)
		
		return var5
	end
	return nil
end